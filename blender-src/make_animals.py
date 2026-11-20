# Harbor City zoo animals (v0.42). Original procedural models, no outside assets.
# Run from the repo root:  Blender -b --factory-startup -P blender-src/make_animals.py
# Optional: HARBOR_ANIMAL_RENDER=<dir> renders a preview of each animal.
# Bodies are metaballs (smooth, organic shapes) converted to meshes; markings (zebra stripes,
# giraffe patches, fawn spots, raccoon mask and tail rings) are painted per face by rules.
# Each file holds these nodes, with pivots where they bend, for the game's walk animation:
#   Body; Head (neck base, turns on y); Tail (tail base); LegFL, LegBL, LegFR, LegBR (hips, swing on x).
# Facing +Y in Blender = -Z in Godot. Feet at z=0.
import bpy, bmesh, math, os
from mathutils import Vector, noise
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
OUT = ROOT / "game" / "models" / "animals"
OUT.mkdir(parents=True, exist_ok=True)
RENDER = os.environ.get("HARBOR_ANIMAL_RENDER", "")

def lin(c):
    c = c / 255.0
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4

def mat(name, hexcol, rough=0.85):
    m = bpy.data.materials.get(name) or bpy.data.materials.new(name)
    m.use_nodes = True
    b = m.node_tree.nodes["Principled BSDF"]
    b.inputs["Base Color"].default_value = (*[lin(int(hexcol[i:i + 2], 16)) for i in (0, 2, 4)], 1)
    b.inputs["Roughness"].default_value = rough
    m.diffuse_color = (*[lin(int(hexcol[i:i + 2], 16)) for i in (0, 2, 4)], 1)
    if "Specular IOR Level" in b.inputs:
        b.inputs["Specular IOR Level"].default_value = 0.25
    return m

def clear():
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    for mb in list(bpy.data.metaballs):
        bpy.data.metaballs.remove(mb)
    for me in list(bpy.data.meshes):
        if me.users == 0:
            bpy.data.meshes.remove(me)

def select_only(objs):
    for o in bpy.context.scene.objects:
        o.select_set(o in objs)
    bpy.context.view_layer.objects.active = objs[0]

K = 1.0   # metaball radius -> visible radius (calibrated below)

def blob(name, balls, res, scale=(1, 1, 1)):
    # Metaball balls [(co, visible radius)] merged into one smooth mesh.
    mb = bpy.data.metaballs.new(name + "_mb")
    mb.resolution = res
    mb.render_resolution = res
    mb.threshold = 0.6
    o = bpy.data.objects.new(name + "_mbo", mb)
    bpy.context.scene.collection.objects.link(o)
    for co, r in balls:
        e = mb.elements.new()
        e.co = co
        e.radius = r / K
        e.stiffness = 2.0
    o.scale = scale
    select_only([o])
    bpy.ops.object.convert(target="MESH")
    m = bpy.context.active_object
    select_only([m])
    bpy.ops.object.transform_apply(location=True, rotation=True, scale=True)
    for p in m.data.polygons:
        p.use_smooth = True
    m.name = name
    m.data.name = name
    return m

def cone(base, tip, r):
    base, tip = Vector(base), Vector(tip)
    d = tip - base
    bpy.ops.mesh.primitive_cone_add(vertices=10, radius1=r, radius2=0.0, depth=d.length, location=(base + tip) / 2)
    o = bpy.context.active_object
    o.rotation_mode = "QUATERNION"
    o.rotation_quaternion = Vector((0, 0, 1)).rotation_difference(d.normalized())
    bpy.ops.object.transform_apply(rotation=True)
    for p in o.data.polygons:
        p.use_smooth = True
    return o

def calibrate():
    global K
    clear()
    o = blob("cal", [((0, 0, 0), 1.0)], 0.05)
    K = o.dimensions.x / 2.0
    clear()

def sphere(c, r, sc=(1, 1, 1)):
    bpy.ops.mesh.primitive_uv_sphere_add(segments=12, ring_count=8, radius=r, location=c)
    o = bpy.context.active_object
    o.scale = sc
    bpy.ops.object.transform_apply(scale=True)
    for p in o.data.polygons:
        p.use_smooth = True
    return o

def rod(a, b, r):
    a, b = Vector(a), Vector(b)
    d = b - a
    bpy.ops.mesh.primitive_cylinder_add(vertices=8, radius=r, depth=d.length, location=(a + b) / 2)
    o = bpy.context.active_object
    o.rotation_mode = "QUATERNION"
    o.rotation_quaternion = Vector((0, 0, 1)).rotation_difference(d.normalized())
    bpy.ops.object.transform_apply(rotation=True)
    for p in o.data.polygons:
        p.use_smooth = True
    return o

def join(objs, name):
    objs = [o for o in objs if o is not None]
    select_only(objs)
    if len(objs) > 1:
        bpy.ops.object.join()
    o = bpy.context.active_object
    o.name = name
    o.data.name = name
    return o

def paint(o, slots, rule):
    # slots: material list; rule(world centre, normal, object name) -> slot index.
    o.data.materials.clear()
    for m in slots:
        o.data.materials.append(m)
    for p in o.data.polygons:
        p.material_index = rule(Vector(p.center), Vector(p.normal), o.name)

def pivot(o, at):
    bpy.context.scene.cursor.location = at
    select_only([o])
    bpy.ops.object.origin_set(type="ORIGIN_CURSOR")

def decimate(o, ratio):
    if ratio >= 1.0:
        return
    md = o.modifiers.new("dec", "DECIMATE")
    md.ratio = ratio
    select_only([o])
    bpy.ops.object.modifier_apply(modifier=md.name)

# Species: W width, H body depth, L length, leg (hip height), neck length, neck tilt from vertical
# (radians), head radius, snout length factor, ears, tail kind, colours and markings.
SPECIES = {
    "zebra": dict(W=0.6, H=0.72, L=1.55, leg=0.9, neck=0.62, tilt=0.75, head=0.2, snout=1.6, ears=0.13, tail="tuft",
                  fur="f4f4f2", pat="17171b", belly="f4f4f2", dark="17171b", mark="stripes", mane=True),
    "giraffe": dict(W=0.78, H=0.95, L=1.85, leg=1.9, neck=2.2, tilt=0.32, head=0.24, snout=1.5, ears=0.12, tail="tuft",
                    fur="efdcae", pat="c06f2c", belly="efdcae", dark="3a2a1e", mark="patches", mane=True, ossicones=True),
    "polarbear": dict(W=1.05, H=1.0, L=2.1, leg=0.72, neck=0.42, tilt=1.15, head=0.36, snout=1.1, ears=0.1, tail="puff",
                      fur="f2eee2", pat="e4dece", belly="ebe5d6", dark="222226", mark="none"),
    "arcticfox": dict(W=0.32, H=0.34, L=0.78, leg=0.3, neck=0.2, tilt=0.9, head=0.15, snout=1.4, ears=0.11, tail="bushy",
                      fur="f7f9fb", pat="e4eaf0", belly="ffffff", dark="2a2a2e", mark="none"),
    "deer": dict(W=0.5, H=0.6, L=1.3, leg=0.85, neck=0.6, tilt=0.55, head=0.17, snout=1.5, ears=0.13, tail="flag",
                 fur="b06a36", pat="f6efe0", belly="f0e6d2", dark="2a2a2a", mark="spots", antlers=True),
    "rabbit": dict(W=0.3, H=0.3, L=0.46, leg=0.1, neck=0.06, tilt=0.6, head=0.13, snout=0.9, ears=0.3, tail="puff",
                   fur="a08670", pat="f2b8c6", belly="ece4d8", dark="3a2a1e", mark="none", hop=True),
    "moose": dict(W=0.9, H=1.05, L=2.1, leg=1.25, neck=0.55, tilt=0.95, head=0.3, snout=2.0, ears=0.15, tail="stub",
                  fur="4a3122", pat="7a6450", belly="5a4030", dark="231610", mark="legs", palms=True, bell=True),
    "raccoon": dict(W=0.36, H=0.32, L=0.66, leg=0.22, neck=0.08, tilt=0.8, head=0.16, snout=1.2, ears=0.08, tail="ringed",
                    fur="8c8c90", pat="1d1d20", belly="dcdcd4", dark="1d1d20", mark="mask"),
    "beaver": dict(W=0.46, H=0.4, L=0.8, leg=0.12, neck=0.08, tilt=0.9, head=0.19, snout=1.0, ears=0.05, tail="paddle",
                   fur="6b4426", pat="2e2620", belly="8a6040", dark="2a1a10", mark="none", teeth=True),
}

def build(kind):
    clear()
    S = SPECIES[kind]
    W, H, L, leg = S["W"], S["H"], S["L"], S["leg"]
    zc = leg + H * 0.45
    res = max(0.012, H * 0.07)
    M = [mat("Fur_" + kind, S["fur"]), mat("Pattern_" + kind, S["pat"]), mat("Belly_" + kind, S["belly"]),
         mat("Dark_" + kind, S["dark"], 0.5), mat("Eye_any", "0b0b0e", 0.15), mat("Horn_" + kind, "d8c4a0", 0.6)]
    FUR, PAT, BELLY, DARK, EYE, HORN = range(6)

    # ---- body: chest, belly and haunches as one smooth mass (a little deeper at the chest)
    balls = []
    n = 9
    for k in range(n):
        t = k / (n - 1)
        y = -L / 2 + H * 0.42 + t * (L - H * 0.84)
        r = H * 0.43 * (0.9 + 0.1 * math.sin(t * math.pi) + 0.1 * t)
        balls.append(((0, y, zc + 0.04 * H * math.sin(t * math.pi)), r))
    if S.get("hop"):
        balls.append(((0, -L * 0.25, zc + H * 0.05), H * 0.6))
    body = blob("Body", balls, res, (W / H, 1, 1))

    # ---- head and neck: a chain from the shoulders to the skull, then muzzle
    base = Vector((0, L / 2 - H * 0.4, zc + H * 0.25))
    tilt = S["tilt"]
    nd = Vector((0, math.sin(tilt), math.cos(tilt)))
    nl = S["neck"]
    hr = S["head"]
    balls = []
    steps = max(3, int(nl / (H * 0.12)) + 2)
    for k in range(steps):
        t = k / (steps - 1)
        r = (H * 0.27) * (1 - t) + hr * 0.55 * t
        balls.append((tuple(base + nd * nl * t), r))
    top = base + nd * nl
    fwd = Vector((0, 1, -0.35)).normalized()
    skull = top + Vector((0, hr * 0.25, hr * 0.15))
    balls.append((tuple(skull), hr))
    sn = S["snout"]
    for k in range(4):
        t = (k + 1) / 4
        balls.append((tuple(skull + fwd * hr * sn * t), hr * (0.78 - 0.38 * t)))
    if S.get("bell"):
        balls.append((tuple(skull + Vector((0, hr * 0.3, -hr * 1.3))), hr * 0.35))
    head_parts = [blob("Head", balls, res * 0.8)]
    muzzle = skull + fwd * hr * sn
    # ears, eyes, nose, horns
    er = S["ears"]
    eyes = []
    for s in (-1, 1):
        eb = skull + Vector((s * hr * 0.42, -hr * 0.3, hr * 0.7))
        if kind == "rabbit":
            head_parts.append(sphere(eb + Vector((s * er * 0.1, -er * 0.15, er * 0.75)), er * 0.85, (0.3, 0.16, 1.0)))
        elif kind in ("polarbear", "raccoon", "beaver"):
            head_parts.append(sphere(eb, er * 0.55, (1.0, 0.5, 0.9)))
        else:
            head_parts.append(cone(eb, eb + Vector((s * er * 0.35, -er * 0.25, er)), er * 0.38))
        ec = skull + Vector((s * hr * 0.66, hr * 0.56, hr * 0.28))
        eyes.append(ec)
        head_parts.append(sphere(ec, hr * 0.15))
        if S.get("ossicones"):
            head_parts.append(rod(skull + Vector((s * hr * 0.3, -hr * 0.1, hr * 0.7)), skull + Vector((s * hr * 0.38, -hr * 0.2, hr * 1.5)), hr * 0.11))
            head_parts.append(sphere(skull + Vector((s * hr * 0.38, -hr * 0.2, hr * 1.55)), hr * 0.16))
        if S.get("antlers"):
            b0 = skull + Vector((s * hr * 0.35, -hr * 0.1, hr * 0.8))
            b1 = b0 + Vector((s * hr * 0.9, -hr * 0.4, hr * 1.8))
            b2 = b1 + Vector((s * hr * 0.5, hr * 0.5, hr * 1.4))
            head_parts += [rod(b0, b1, hr * 0.08), rod(b1, b2, hr * 0.06), rod(b1, b1 + Vector((s * hr * 0.1, hr * 0.9, hr * 0.9)), hr * 0.05),
                           rod(b0 + (b1 - b0) * 0.5, b0 + (b1 - b0) * 0.5 + Vector((0, hr * 0.8, hr * 0.6)), hr * 0.05)]
        if S.get("palms"):
            b0 = skull + Vector((s * hr * 0.5, -hr * 0.2, hr * 0.7))
            head_parts.append(rod(b0, b0 + Vector((s * hr * 0.9, 0, hr * 0.2)), hr * 0.12))
            palm = sphere(b0 + Vector((s * hr * 1.9, -hr * 0.1, hr * 0.7)), hr * 1.0, (1.2, 0.75, 0.22))
            palm.rotation_euler = (0, s * -0.5, 0)
            select_only([palm])
            bpy.ops.object.transform_apply(rotation=True)
            head_parts.append(palm)
            for k in range(4):
                head_parts.append(rod(b0 + Vector((s * hr * (1.3 + k * 0.35), -hr * 0.1, hr * (1.2 + 0.1 * k))), b0 + Vector((s * hr * (1.4 + k * 0.4), -hr * 0.1, hr * (1.75 + 0.1 * k))), hr * 0.06))
    head_parts.append(sphere(muzzle + Vector((0, hr * 0.1, hr * 0.05)), hr * 0.2, (1.2, 0.8, 0.8)))
    if S.get("teeth"):
        head_parts.append(sphere(muzzle + Vector((0, hr * 0.05, -hr * 0.3)), hr * 0.14, (1.2, 0.4, 1.4)))
    if S.get("mane"):
        for k in range(10):
            t = k / 9
            p = base + nd * nl * (0.05 + 0.95 * t) + Vector((0, -H * 0.12, H * 0.22 * (1 - t) + hr * 0.4 * t))
            head_parts.append(sphere(p, H * 0.11 * (1 - 0.3 * t), (0.35, 1.2, 1.0)))
    head = join(head_parts, "Head")
    eyes_y = skull.y + hr * 0.42

    # ---- legs: thigh into shin into hoof or paw
    legs = []
    for nm, sx, sy in (("LegFL", -1, 1), ("LegBL", -1, -1), ("LegFR", 1, 1), ("LegBR", 1, -1)):
        hip = Vector((sx * W * 0.3, sy * (L / 2 - H * 0.42), leg + H * 0.12))
        lr = max(0.035, W * 0.12) if kind not in ("polarbear", "beaver", "rabbit", "raccoon") else W * 0.15
        if kind == "giraffe":
            lr = 0.07
        balls = []
        steps = max(4, int(leg / (lr * 0.9)) + 2)
        for k in range(steps):
            t = k / (steps - 1)
            r = lr * (2.1 - 1.2 * min(1, t * 1.6)) if t < 0.5 else lr * (0.95 - 0.15 * t)
            if kind in ("polarbear", "beaver", "rabbit", "raccoon"):
                r = lr * (1.6 - 0.5 * t)
            z = hip.z - (hip.z - lr * 0.6) * t
            balls.append(((hip.x, hip.y + (0.02 if sy > 0 else -0.04) * math.sin(t * math.pi) * leg, z), r))
        balls.append(((hip.x, hip.y + lr * 0.4, lr * 0.55), lr * (1.05 if kind not in ("polarbear",) else 1.5)))
        lg = blob(nm, balls, res * 0.7)
        legs.append((lg, hip))

    # ---- tail
    tail_base = Vector((0, -L / 2 + H * 0.05, zc + H * 0.25))
    tk = S["tail"]
    tparts = []
    if tk == "tuft":
        tparts.append(rod(tail_base, tail_base + Vector((0, -0.08, -H * 0.8)), H * 0.035))
        tparts.append(sphere(tail_base + Vector((0, -0.09, -H * 0.85)), H * 0.07, (1, 1, 1.8)))
    elif tk == "bushy":
        tparts.append(blob("TailB", [((0, tail_base.y - H * 0.4 * k, tail_base.z - H * 0.25 * k + H * 0.1 * k * k), H * (0.18 + 0.1 * k)) for k in range(4)], res * 0.7))
    elif tk == "ringed":
        tparts.append(blob("TailB", [((0, tail_base.y - H * 0.35 * k, tail_base.z - H * 0.2 * k), H * 0.2) for k in range(6)], res * 0.7))
    elif tk == "puff":
        tparts.append(sphere(tail_base + Vector((0, -H * 0.05, 0)), H * 0.16))
    elif tk == "flag":
        tparts.append(sphere(tail_base + Vector((0, -H * 0.05, -H * 0.05)), H * 0.14, (0.8, 0.6, 1.4)))
    elif tk == "stub":
        tparts.append(sphere(tail_base, H * 0.08))
    elif tk == "paddle":
        tparts.append(sphere(tail_base + Vector((0, -H * 0.9, -H * 0.55)), H * 0.55, (0.6, 1.1, 0.12)))
    tail = join(tparts, "Tail")

    # ---- markings
    mark = S["mark"]
    def rule(c, nrm, name):
        if name == "Head":
            for ec in eyes:
                if (c - ec).length < hr * 0.16:
                    return EYE
            if (c - (muzzle + Vector((0, hr * 0.1, hr * 0.05)))).length < hr * 0.26:
                return DARK
            if S.get("teeth") and c.z < muzzle.z - hr * 0.15 and c.y > muzzle.y - hr * 0.2:
                return HORN
            if (S.get("antlers") or S.get("palms")) and c.z > skull.z + hr * 0.75 and abs(c.x) > hr * 0.25:
                return HORN
            if S.get("ossicones") and c.z > skull.z + hr * 1.4:
                return DARK
            if kind == "rabbit" and c.z > skull.z + hr * 0.8 and nrm.y > 0.3:
                return PAT
            if mark == "mask" and c.y > skull.y - hr * 0.1 and abs(c.z - (skull.z + hr * 0.25)) < hr * 0.3 and c.y < muzzle.y - hr * 0.3:
                return PAT
            if mark == "mask" and c.y > muzzle.y - hr * 0.5:
                return BELLY
        if mark == "stripes":
            if name.startswith("Leg"):
                if c.z < 0.1:
                    return DARK
                return PAT if math.sin(c.z * 26.0) > 0.25 else FUR
            if name == "Head" and c.z > base.z + nl * 0.95 + hr * 0.6 and abs(c.x) < 0.04:
                return PAT
            if name == "Head":
                if c.y > muzzle.y - hr * 0.35:
                    return DARK
                return PAT if math.sin(c.z * 24.0 + c.y * 4.0) > 0.25 else FUR
            if name == "Body":
                if c.z < zc - H * 0.32:
                    return FUR
                wav = math.sin(c.y * 15.0 + math.sin(c.z * 7.0) * 1.6 + (2.5 if c.y < -L * 0.2 else 0) * (c.z - zc))
                return PAT if wav > 0.2 else FUR
            if name == "Tail":
                return DARK if c.z < tail_base.z - H * 0.6 else FUR
        if mark == "patches":
            if name.startswith("Leg") and c.z < 0.12:
                return DARK
            if name == "Tail":
                return DARK if c.z < tail_base.z - H * 0.6 else FUR
            if name.startswith("Leg") and c.z < leg * 0.45:
                return FUR
            if name == "Head" and (c.z > base.z + nl + hr * 0.2 or c.y > skull.y):
                return FUR if c.z < base.z + nl + hr * 1.4 else DARK
            d = noise.voronoi(c * 3.4, distance_metric="DISTANCE")[0]
            return FUR if (d[1] - d[0]) < 0.14 else PAT
        if mark == "spots":
            if name.startswith("Leg") and c.z < 0.08:
                return DARK
            if name == "Body" and c.z < zc - H * 0.25:
                return BELLY
            if name == "Body" and c.z > zc + H * 0.15:
                d = noise.voronoi(c * 9.0, distance_metric="DISTANCE")[0]
                return PAT if d[0] < 0.16 else FUR
            if name == "Tail":
                return BELLY if nrm.y < -0.3 else FUR
        if mark == "legs" and name.startswith("Leg"):
            return DARK if c.z < 0.1 else (PAT if c.z < leg * 0.6 else FUR)
        if mark == "mask":
            if name == "Tail":
                return PAT if math.sin((tail_base.y - c.y) * 26.0) > 0.0 else FUR
            if name.startswith("Leg") and c.z < leg * 0.5:
                return PAT
        if name.startswith("Leg") and c.z < 0.06 and kind in ("polarbear", "arcticfox"):
            return DARK
        if name == "Body" and c.z < zc - H * 0.3:
            return BELLY
        if kind == "beaver" and name == "Tail":
            return PAT
        if kind == "arcticfox" and name == "Tail" and c.y < tail_base.y - H * 1.0:
            return BELLY
        return FUR
    allparts = [body, head, tail] + [lg for lg, _ in legs]
    budget = {"Body": 1300, "Head": 1500, "Tail": 250}
    for o in allparts:
        cap = budget.get(o.name, 380)
        if len(o.data.polygons) > cap:
            decimate(o, cap / len(o.data.polygons))
        for p in o.data.polygons:
            p.use_smooth = True
        paint(o, M, rule)
    pivot(head, base)
    pivot(tail, tail_base)
    pivot(body, Vector((0, 0, zc)))
    for lg, hip in legs:
        pivot(lg, hip)
    select_only(allparts)
    path = OUT / ("animal_%s.glb" % kind)
    bpy.ops.export_scene.gltf(filepath=str(path), export_format="GLB", use_selection=True, export_apply=True, export_yup=True)
    tris = sum(len(p.vertices) - 2 for o in allparts for p in o.data.polygons)
    print("HARBOR_ANIMAL %s %d tris %d bytes" % (kind, tris, path.stat().st_size))
    if RENDER:
        render(kind, L + leg)

def render(kind, size):
    sc = bpy.context.scene
    cam = bpy.data.objects.new("cam", bpy.data.cameras.new("cam"))
    sc.collection.objects.link(cam)
    sc.camera = cam
    sun = bpy.data.objects.new("sun", bpy.data.lights.new("sun", "SUN"))
    sc.collection.objects.link(sun)
    sun.rotation_euler = (0.7, 0.2, 0.9)
    sc.render.engine = "BLENDER_WORKBENCH"
    sc.display.shading.color_type = "MATERIAL"
    sc.display.shading.light = "STUDIO"
    sc.render.resolution_x, sc.render.resolution_y = 420, 340
    target = Vector((0, 0, size * 0.4))
    cam.location = target + Vector((size * 1.5, size * 1.3, size * 0.5))
    cam.rotation_mode = "QUATERNION"
    cam.rotation_quaternion = (target - cam.location).to_track_quat("-Z", "Y")
    sc.render.filepath = os.path.join(RENDER, "a_%s.png" % kind)
    bpy.ops.render.render(write_still=True)
    bpy.data.objects.remove(cam, do_unlink=True)
    bpy.data.objects.remove(sun, do_unlink=True)

calibrate()
for kind in SPECIES:
    try:
        build(kind)
    except Exception:
        import traceback
        print("HARBOR_ANIMAL ERROR %s\n%s" % (kind, traceback.format_exc()))
print("HARBOR_ANIMAL DONE")

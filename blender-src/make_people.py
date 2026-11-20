# Harbor City people generator (v0.22, more detail in v0.37). Original procedural low-poly characters, no outside assets.
# Run from the repo root:  blender --background --factory-startup --python blender-src/make_people.py
# Writes game/models/person_0..3.glb: 0 short hair, 1 long hair, 2 bun + ponytail, 3 curly.
# Node tree (the game animates these):
#   Body (hips pivot), Head (neck pivot),
#   ArmL/ArmR (shoulder pivots) each with a ForeArmL/ForeArmR child (elbow pivot),
#   LegL/LegR (hip pivots) each with a ShinL/ShinR child (knee pivot).
# Recoloured per character: Shirt, Pants, Skin, Hair, Shoes, Eye. Fixed: EyeWhite, Mouth, Sole, Belt.
# Feet at y=0, top of head ~1.65 m, hips at 0.86 m, facing -Z in Godot (+Y in Blender).
import bpy, bmesh, math, os, random
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
OUT = ROOT / "game" / "models"
OUT.mkdir(parents=True, exist_ok=True)

def lin(c):
    c = c / 255.0
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4

MATS = {}
def mat(name, hexcol, rough=0.7):
    if name in MATS:
        return MATS[name]
    m = bpy.data.materials.new(name)
    m.use_nodes = True
    b = m.node_tree.nodes["Principled BSDF"]
    b.inputs["Base Color"].default_value = tuple(lin(int(hexcol[i:i + 2], 16)) for i in (0, 2, 4)) + (1,)
    b.inputs["Roughness"].default_value = rough
    m.diffuse_color = tuple(lin(int(hexcol[i:i + 2], 16)) for i in (0, 2, 4)) + (1,)
    MATS[name] = m
    return m

def _done(o, m, smooth=True):
    o.data.materials.append(m)
    for p in o.data.polygons:
        p.use_smooth = smooth
    return o

def ball(r, loc, m, scale=(1, 1, 1), seg=12, rings=8, rot=(0, 0, 0)):
    bpy.ops.mesh.primitive_uv_sphere_add(segments=seg, ring_count=rings, radius=r, location=loc, rotation=rot)
    o = bpy.context.active_object
    o.scale = scale
    bpy.ops.object.transform_apply(rotation=True, scale=True)
    return _done(o, m)

def tube(r1, r2, z0, z1, x, y, m, verts=12, sy=1.0, caps=True):
    # Tapered cylinder from z0 (radius r1) to z1 (radius r2), squashed front-to-back by sy.
    bpy.ops.mesh.primitive_cone_add(vertices=verts, radius1=r1, radius2=r2, depth=abs(z1 - z0), location=(x, y, (z0 + z1) / 2),
                                    end_fill_type="NGON" if caps else "NOTHING")
    o = bpy.context.active_object
    if z1 < z0:
        o.rotation_euler = (math.pi, 0, 0)
    o.scale = (1, sy, 1)
    bpy.ops.object.transform_apply(rotation=True, scale=True)
    return _done(o, m)

def bar(r, length, loc, m, axis="X", verts=10):
    # Horizontal capsule-ish bar (cylinder with ball ends) along X.
    rot = (0, math.pi / 2, 0) if axis == "X" else (math.pi / 2, 0, 0)
    bpy.ops.mesh.primitive_cylinder_add(vertices=verts, radius=r, depth=length, location=loc, rotation=rot)
    o = bpy.context.active_object
    bpy.ops.object.transform_apply(rotation=True)
    return _done(o, m)

def ring(r, minor, z, m, sy=1.0, x=0.0):
    bpy.ops.mesh.primitive_torus_add(major_radius=r, minor_radius=minor, major_segments=12, minor_segments=4, location=(x, 0, z))
    o = bpy.context.active_object
    o.scale = (1, sy, 1)
    bpy.ops.object.transform_apply(scale=True)
    return _done(o, m)

def rbox(size, loc, m, bevel=0.03, rot=(0, 0, 0)):
    bpy.ops.mesh.primitive_cube_add(size=1, location=loc, rotation=rot)
    o = bpy.context.active_object
    o.scale = size
    bpy.ops.object.transform_apply(rotation=True, scale=True)
    mod = o.modifiers.new("Bevel", "BEVEL")
    mod.width = bevel
    mod.segments = 1
    bpy.ops.object.modifier_apply(modifier=mod.name)
    return _done(o, m)

def cut_below(o, fn):
    # Delete vertices where fn(co) is True (used to shape hair caps).
    bm = bmesh.new()
    bm.from_mesh(o.data)
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if fn(v.co)], context="VERTS")
    bm.to_mesh(o.data)
    bm.free()
    o.data.update()
    return o

def group(name, parts, pivot):
    for o in bpy.context.view_layer.objects:
        o.select_set(False)
    for o in parts:
        o.select_set(True)
    bpy.context.view_layer.objects.active = parts[0]
    if len(parts) > 1:
        bpy.ops.object.join()
    o = bpy.context.active_object
    o.name = name
    o.data.name = name
    bpy.context.scene.cursor.location = pivot
    bpy.ops.object.origin_set(type="ORIGIN_CURSOR")
    return o

def parent(child, par):
    child.parent = par
    child.matrix_parent_inverse = par.matrix_world.inverted()

SHIRT = mat("Shirt", "f2b24a")
PANTS = mat("Pants", "263d54")
SKIN = mat("Skin", "c68a60", 0.6)
HAIR = mat("Hair", "3b2a20", 0.8)
SHOES = mat("Shoes", "2b2b2b", 0.5)
EYE = mat("Eye", "1c1c22", 0.2)
WHITE = mat("EyeWhite", "f4f1ec", 0.3)
MOUTH = mat("Mouth", "9a4d47", 0.6)
SOLE = mat("Sole", "eceae4", 0.6)
BELT = mat("Belt", "3a2a1e", 0.5)
# v0.37 detail materials (fixed colours, not recoloured by the game).
PUPIL = mat("Pupil", "0c0c10", 0.15)
SHINE = mat("Shine", "ffffff", 0.1)
BUCKLE = mat("Buckle", "c9c2b0", 0.3)

HIP = 0.86
KNEE = 0.47
SH = 1.36
NECK = 1.40
HEAD = 1.535  # head centre

# v0.37: same Harbor City people, more detail. Rounder head with a real face (irises with a
# highlight, eyelids, shaped brows, lips, nose bridge, chin), fuller hair, a shirt with chest,
# shoulders, hem and cuffs, a belt buckle, hands with fingers and a thumb, and sneakers with a
# rounded toe, sole stripe and laces. Node names, pivots and sizes are unchanged, so animation,
# hats and gear still fit.
def head_parts(style):
    p = []
    # Skull, jaw and chin, cheeks.
    p.append(ball(0.112, (0, 0.0, HEAD + 0.012), SKIN, (0.9, 1.0, 1.06), 16, 12))
    p.append(ball(0.088, (0, 0.014, HEAD - 0.042), SKIN, (0.92, 0.95, 0.9), 14, 8))
    p.append(ball(0.026, (0, 0.066, HEAD - 0.084), SKIN, (1.2, 0.8, 0.7), 8, 6))
    # Nose: a soft bridge and a rounded tip.
    p.append(ball(0.011, (0, 0.1, HEAD + 0.0), SKIN, (0.8, 0.8, 1.4), 6, 4))
    p.append(ball(0.016, (0, 0.105, HEAD - 0.02), SKIN, (1.0, 0.9, 0.85), 8, 6))
    for s in (-1, 1):
        # Ears with an inner fold.
        p.append(ball(0.027, (s * 0.1, -0.005, HEAD - 0.005), SKIN, (0.45, 0.85, 1.3), 8, 6))
        # Eyes: white, coloured iris, dark pupil, a highlight, and an upper lid.
        p.append(ball(0.02, (s * 0.038, 0.096, HEAD + 0.02), WHITE, (1.1, 0.5, 0.85), 10, 6))
        p.append(ball(0.0115, (s * 0.038, 0.105, HEAD + 0.019), EYE, (1, 0.35, 1.05), 8, 6))
        p.append(ball(0.006, (s * 0.038, 0.1095, HEAD + 0.019), PUPIL, (1, 0.35, 1), 6, 4))
        p.append(ball(0.003, (s * 0.034, 0.111, HEAD + 0.024), SHINE, (1, 0.5, 1), 6, 4))
        p.append(ball(0.02, (s * 0.038, 0.09, HEAD + 0.034), SKIN, (1.05, 0.5, 0.3), 8, 4))
        # Eyebrows: an inner and outer piece for a gentle arch.
        p.append(rbox((0.024, 0.012, 0.01), (s * 0.028, 0.1, HEAD + 0.052), HAIR, 0.004, (0, s * -0.05, 0)))
        p.append(rbox((0.024, 0.012, 0.009), (s * 0.05, 0.096, HEAD + 0.05), HAIR, 0.004, (0, s * 0.3, 0)))
    # Lips.
    p.append(ball(0.017, (0, 0.093, HEAD - 0.05), MOUTH, (1.3, 0.35, 0.28), 10, 6))
    p.append(ball(0.015, (0, 0.09, HEAD - 0.058), MOUTH, (1.15, 0.38, 0.32), 10, 6))
    # Neck.
    p.append(tube(0.046, 0.042, NECK - 0.04, HEAD - 0.06, 0, -0.01, SKIN, 10, 1.0, False))
    # Hair.
    def cap(r, back_cut, front_cut, sc=(0.95, 1.04, 1.04)):
        h = ball(r, (0, -0.008, HEAD + 0.02), HAIR, sc, 16, 10)
        def low(co):
            t = max(0.0, min(1.0, (co.y + 0.12) / 0.24))
            return co.z < HEAD + back_cut + (front_cut - back_cut) * t
        return cut_below(h, low)
    if style == 0:
        p.append(cap(0.124, -0.06, 0.055))
        # Textured top: a side-swept fringe and a few tufts for volume.
        p.append(ball(0.05, (0.03, 0.07, HEAD + 0.085), HAIR, (1.4, 0.7, 0.45), 14, 8))
        for (x, y, z) in ((-0.04, 0.03, 0.115), (0.03, 0.0, 0.125), (-0.01, -0.05, 0.12), (0.06, 0.04, 0.1), (-0.07, -0.02, 0.1)):
            p.append(ball(0.038, (x, y, HEAD + z), HAIR, (1.2, 1.0, 0.6), 10, 6))
    elif style == 1:
        p.append(cap(0.126, -0.16, 0.05))
        # Long hair falls down the back in layers, with strands framing the face.
        p.append(tube(0.108, 0.088, HEAD - 0.01, HEAD - 0.24, 0, -0.035, HAIR, 16, 0.55))
        p.append(tube(0.09, 0.07, HEAD - 0.2, HEAD - 0.3, 0, -0.045, HAIR, 14, 0.5))
        for s in (-1, 1):
            p.append(tube(0.036, 0.028, HEAD + 0.035, HEAD - 0.2, s * 0.096, 0.012, HAIR, 10, 0.8))
        p.append(ball(0.045, (-0.035, 0.075, HEAD + 0.08), HAIR, (1.5, 0.6, 0.45), 12, 6))
    elif style == 2:
        p.append(cap(0.124, -0.08, 0.05))
        p.append(ball(0.058, (0, -0.075, HEAD + 0.1), HAIR, (1, 1, 0.9), 14, 8))  # bun
        p.append(ring(0.03, 0.01, HEAD + 0.06, BELT, 1.0, 0.0))  # hair tie under the bun
        p.append(tube(0.034, 0.012, HEAD + 0.06, HEAD - 0.18, 0, -0.13, HAIR, 10))  # ponytail
    else:
        random.seed(3)
        p.append(cap(0.122, -0.05, 0.05, (0.98, 1.02, 1.02)))
        for i in range(34):
            a = random.uniform(0, math.tau)
            e = random.uniform(-0.15, 1.25)
            if math.sin(a) > 0.55 and e < 0.6:
                continue  # keep the face clear
            r = 0.127
            x = math.cos(a) * math.cos(e) * r
            y = math.sin(a) * math.cos(e) * r - 0.01
            z = HEAD + 0.03 + math.sin(e) * r
            p.append(ball(0.042, (x, y, z), HAIR, (1, 1, 1), 7, 4))
    return p

def hand(hx, s, elbow):
    # Palm faces the body; four slightly curled fingers and a thumb at the front.
    wrist = elbow - 0.24
    parts = [rbox((0.032, 0.066, 0.06), (hx, 0.004, wrist - 0.04), SKIN, 0.014)]
    for k, fy in enumerate((-0.022, -0.007, 0.008, 0.023)):
        ln = (0.045, 0.052, 0.05, 0.04)[k]
        z0 = wrist - 0.068
        parts.append(tube(0.0085, 0.0072, z0, z0 - ln, hx - s * 0.002, fy + 0.004, SKIN, 5))
    parts.append(tube(0.01, 0.008, wrist - 0.035, wrist - 0.075, hx - s * 0.008, 0.04, SKIN, 6))
    parts.append(ball(0.009, (hx - s * 0.01, 0.043, wrist - 0.076), SKIN, (1, 1, 1), 6, 4))
    return parts

def shoe(x):
    # Sneaker: rounded body and toe, heel, white sole with a front bumper, a side stripe and laces.
    p = [rbox((0.098, 0.19, 0.07), (x, 0.03, 0.068), SHOES, 0.03),
         ball(0.05, (x, 0.115, 0.052), SHOES, (1, 0.95, 0.62), 12, 8),
         ball(0.048, (x, -0.055, 0.07), SHOES, (1, 0.8, 0.9), 10, 6),
         rbox((0.108, 0.27, 0.026), (x, 0.045, 0.014), SOLE, 0.012),
         ball(0.05, (x, 0.13, 0.025), SOLE, (1.05, 0.9, 0.42), 10, 6)]
    for s in (-1, 1):
        p.append(rbox((0.004, 0.12, 0.016), (x + s * 0.05, 0.03, 0.055), SOLE, 0.003, (0.25, 0, 0)))
    for k in range(3):
        p.append(rbox((0.05, 0.008, 0.006), (x, 0.06 + 0.022 * k, 0.103 - 0.008 * k), SOLE, 0.002))
    return p

def build(style):
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    out = []
    # Legs: thigh in the Leg node, shin + shoe in the Shin child (knee pivot).
    for side, x in (("L", -0.095), ("R", 0.095)):
        thigh = group("Leg" + side, [tube(0.084, 0.064, HIP + 0.02, KNEE - 0.01, x, 0, PANTS, 12),
                                      ball(0.064, (x, 0.006, KNEE), PANTS, (1, 1.05, 1), 10, 6)], (x, 0, HIP))
        shin = group("Shin" + side, [tube(0.062, 0.052, KNEE, 0.13, x, 0, PANTS, 12),
                                      ring(0.055, 0.013, 0.135, PANTS, 1.0, x)] + shoe(x), (x, 0, KNEE))
        parent(shin, thigh)
        out += [thigh, shin]
    # Body: pelvis, belt and buckle, waist, chest and shoulders, shirt hem and collar.
    body = [tube(0.155, 0.15, HIP - 0.05, HIP + 0.08, 0, 0, PANTS, 14, 0.72),
            tube(0.153, 0.153, HIP + 0.06, HIP + 0.1, 0, 0, BELT, 14, 0.74, False),
            rbox((0.05, 0.012, 0.034), (0, 0.113, HIP + 0.08), BUCKLE, 0.006),
            ring(0.142, 0.014, HIP + 0.115, SHIRT, 0.68),
            tube(0.138, 0.162, HIP + 0.1, SH - 0.14, 0, 0, SHIRT, 14, 0.66),
            ball(0.165, (0, -0.005, SH - 0.13), SHIRT, (0.98, 0.62, 0.52), 14, 8),
            bar(0.062, 0.32, (0, -0.005, SH - 0.04), SHIRT, "X", 12),
            ring(0.054, 0.017, NECK - 0.03, SHIRT, 0.9)]
    out.append(group("Body", body, (0, 0, HIP)))
    out.append(group("Head", head_parts(style), (0, 0, NECK)))
    # Arms: rounded shoulder, sleeve with a cuff, upper arm (Arm node); forearm and hand (ForeArm child).
    elbow = SH - 0.29
    for side, s in (("L", -1), ("R", 1)):
        x = s * 0.2
        upper = group("Arm" + side, [ball(0.068, (x, 0, SH - 0.035), SHIRT, (1, 1, 1), 12, 6),
                                      tube(0.068, 0.06, SH - 0.03, SH - 0.17, x + s * 0.008, 0, SHIRT, 12, 1.0, False),
                                      ring(0.058, 0.01, SH - 0.168, SHIRT, 1.0, x + s * 0.009),
                                      tube(0.047, 0.042, SH - 0.16, elbow, x + s * 0.012, 0, SKIN, 10, 1.0, False),
                                      ball(0.042, (x + s * 0.012, 0, elbow), SKIN, (1, 1, 1), 10, 6)], (x, 0, SH - 0.03))
        hx = x + s * 0.014
        fore = group("ForeArm" + side, [tube(0.041, 0.033, elbow, elbow - 0.24, hx, 0, SKIN, 10, 1.0, False)] + hand(hx, s, elbow), (hx, 0, elbow))
        parent(fore, upper)
        out += [upper, fore]
    for o in bpy.context.view_layer.objects:
        o.select_set(o in out)
    path = OUT / ("person_%d.glb" % style)
    bpy.ops.export_scene.gltf(filepath=str(path), export_format="GLB", use_selection=True, export_apply=True, export_yup=True)
    tris = sum(len(p.vertices) - 2 for o in out for p in o.data.polygons)
    print("HARBOR_PEOPLE exported %s %d bytes %d tris" % (path.name, path.stat().st_size, tris))
    if os.environ.get("HARBOR_PEOPLE_RENDER"):
        render(style)

def render(style):
    sc = bpy.context.scene
    cam = bpy.data.objects.new("cam", bpy.data.cameras.new("cam"))
    sc.collection.objects.link(cam)
    sc.camera = cam
    sun = bpy.data.objects.new("sun", bpy.data.lights.new("sun", "SUN"))
    sc.collection.objects.link(sun)
    sun.rotation_euler = (0.7, 0.2, 0.6)
    sc.render.engine = "BLENDER_WORKBENCH"
    sc.display.shading.color_type = "MATERIAL"
    sc.display.shading.light = "STUDIO"
    sc.render.resolution_x, sc.render.resolution_y = 360, 520
    d = os.environ["HARBOR_PEOPLE_RENDER"]
    for name, loc, rot, lens in (("full", (1.3, 2.6, 0.95), (math.radians(88), 0, math.radians(153)), 50),
                                 ("face", (0.18, 0.55, 1.55), (math.radians(90), 0, math.radians(162)), 60)):
        cam.location = loc
        cam.rotation_euler = rot
        cam.data.lens = lens
        sc.render.filepath = os.path.join(d, "p%d_%s.png" % (style, name))
        bpy.ops.render.render(write_still=True)
    bpy.data.objects.remove(cam, do_unlink=True)
    bpy.data.objects.remove(sun, do_unlink=True)

try:
    for style in range(4):
        build(style)
    print("HARBOR_PEOPLE DONE")
except Exception:
    import traceback
    print("HARBOR_PEOPLE ERROR\n" + traceback.format_exc())

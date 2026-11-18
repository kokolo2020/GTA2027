# Harbor City people generator (v0.22). Original procedural low-poly characters, no outside assets.
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

HIP = 0.86
KNEE = 0.47
SH = 1.36
NECK = 1.40
HEAD = 1.535  # head centre

def head_parts(style):
    p = []
    # Skull, cheeks/jaw and chin give a face shape instead of a ball.
    p.append(ball(0.112, (0, 0.0, HEAD + 0.01), SKIN, (0.9, 1.0, 1.06), 14, 10))
    p.append(ball(0.09, (0, 0.012, HEAD - 0.04), SKIN, (0.92, 0.95, 0.9), 12, 8))
    # Nose, ears.
    p.append(ball(0.016, (0, 0.104, HEAD - 0.01), SKIN, (0.8, 0.9, 1.35), 8, 6))
    for s in (-1, 1):
        p.append(ball(0.026, (s * 0.1, -0.005, HEAD - 0.005), SKIN, (0.45, 0.85, 1.25), 8, 6))
        # Eyes: white + dark pupil, eyebrows.
        p.append(ball(0.018, (s * 0.038, 0.098, HEAD + 0.02), WHITE, (1.1, 0.5, 0.8), 10, 6))
        p.append(ball(0.0095, (s * 0.038, 0.1065, HEAD + 0.019), EYE, (1, 0.4, 1.05), 8, 6))
        p.append(rbox((0.042, 0.012, 0.011), (s * 0.039, 0.098, HEAD + 0.05), HAIR, 0.004, (0, s * 0.12, 0)))
    # Mouth.
    p.append(ball(0.019, (0, 0.093, HEAD - 0.055), MOUTH, (1.4, 0.35, 0.3), 10, 6))
    # Neck.
    p.append(tube(0.045, 0.042, NECK - 0.04, HEAD - 0.06, 0, -0.01, SKIN, 10))
    # Hair.
    def cap(r, back_cut, front_cut, sc=(0.95, 1.04, 1.04)):
        h = ball(r, (0, -0.008, HEAD + 0.02), HAIR, sc, 14, 10)
        def low(co):
            t = max(0.0, min(1.0, (co.y + 0.12) / 0.24))
            return co.z < HEAD + back_cut + (front_cut - back_cut) * t
        return cut_below(h, low)
    if style == 0:
        p.append(cap(0.122, -0.06, 0.055))
        p.append(ball(0.05, (0.03, 0.07, HEAD + 0.085), HAIR, (1.4, 0.7, 0.45), 12, 8))  # side-swept fringe
    elif style == 1:
        p.append(cap(0.124, -0.16, 0.05))
        p.append(tube(0.105, 0.085, HEAD - 0.02, HEAD - 0.22, 0, -0.035, HAIR, 12, 0.55))
        for s in (-1, 1):
            p.append(tube(0.035, 0.03, HEAD + 0.03, HEAD - 0.17, s * 0.095, 0.0, HAIR, 8, 0.8))
    elif style == 2:
        p.append(cap(0.122, -0.08, 0.05))
        p.append(ball(0.055, (0, -0.075, HEAD + 0.1), HAIR, (1, 1, 0.9), 12, 8))  # bun
        p.append(tube(0.032, 0.012, HEAD + 0.06, HEAD - 0.16, 0, -0.13, HAIR, 8))  # ponytail
    else:
        random.seed(3)
        p.append(cap(0.12, -0.05, 0.05, (0.98, 1.02, 1.02)))
        for i in range(26):
            a = random.uniform(0, math.tau)
            e = random.uniform(-0.15, 1.2)
            if math.sin(a) > 0.55 and e < 0.6:
                continue  # keep the face clear
            r = 0.125
            x = math.cos(a) * math.cos(e) * r
            y = math.sin(a) * math.cos(e) * r - 0.01
            z = HEAD + 0.03 + math.sin(e) * r
            p.append(ball(0.042, (x, y, z), HAIR, (1, 1, 1), 6, 4))
    return p

def build(style):
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    out = []
    # Legs: thigh in the Leg node, shin + shoe in the Shin child (knee pivot).
    for side, x in (("L", -0.095), ("R", 0.095)):
        thigh = group("Leg" + side, [tube(0.082, 0.064, HIP + 0.02, KNEE - 0.01, x, 0, PANTS, 10),
                                      ball(0.064, (x, 0.005, KNEE), PANTS, (1, 1.05, 1), 8, 6)], (x, 0, HIP))
        shin = group("Shin" + side, [tube(0.062, 0.05, KNEE, 0.12, x, 0, PANTS, 10),
                                      ring(0.052, 0.012, 0.13, PANTS, 1.0, x),
                                      rbox((0.1, 0.2, 0.075), (x, 0.035, 0.065), SHOES, 0.03),
                                      ball(0.052, (x, 0.12, 0.05), SHOES, (1, 0.9, 0.6), 10, 6),
                                      rbox((0.108, 0.27, 0.025), (x, 0.045, 0.013), SOLE, 0.01)], (x, 0, KNEE))
        parent(shin, thigh)
        out += [thigh, shin]
    # Body: pelvis, belt, waist-to-chest torso, shoulder line, collar.
    body = [tube(0.155, 0.15, HIP - 0.05, HIP + 0.08, 0, 0, PANTS, 12, 0.72),
            tube(0.152, 0.152, HIP + 0.06, HIP + 0.1, 0, 0, BELT, 12, 0.74),
            tube(0.14, 0.17, HIP + 0.09, SH - 0.1, 0, 0, SHIRT, 14, 0.66),
            ball(0.165, (0, -0.005, SH - 0.12), SHIRT, (0.98, 0.6, 0.5), 12, 8),
            bar(0.06, 0.33, (0, -0.005, SH - 0.035), SHIRT, "X", 12),
            ring(0.052, 0.016, NECK - 0.03, SHIRT, 0.9)]
    out.append(group("Body", body, (0, 0, HIP)))
    out.append(group("Head", head_parts(style), (0, 0, NECK)))
    # Arms: shoulder + sleeve + upper arm (Arm node), forearm + hand (ForeArm child at the elbow).
    elbow = SH - 0.29
    for side, s in (("L", -1), ("R", 1)):
        x = s * 0.2
        upper = group("Arm" + side, [ball(0.064, (x, 0, SH - 0.035), SHIRT, (1, 1, 1), 10, 6),
                                      tube(0.066, 0.058, SH - 0.03, SH - 0.17, x + s * 0.008, 0, SHIRT, 12),
                                      tube(0.047, 0.042, SH - 0.16, elbow, x + s * 0.012, 0, SKIN, 10),
                                      ball(0.042, (x + s * 0.012, 0, elbow), SKIN, (1, 1, 1), 10, 6)], (x, 0, SH - 0.03))
        hx = x + s * 0.014
        fore = group("ForeArm" + side, [tube(0.041, 0.034, elbow, elbow - 0.24, hx, 0, SKIN, 10),
                                         rbox((0.035, 0.07, 0.085), (hx, 0.004, elbow - 0.285), SKIN, 0.015),
                                         ball(0.016, (hx - s * 0.006, 0.04, elbow - 0.27), SKIN, (1, 1, 1.6), 6, 4)], (hx, 0, elbow))
        parent(fore, upper)
        out += [upper, fore]
    for o in bpy.context.view_layer.objects:
        o.select_set(o in out)
    path = OUT / ("person_%d.glb" % style)
    bpy.ops.export_scene.gltf(filepath=str(path), export_format="GLB", use_selection=True, export_apply=True, export_yup=True)
    tris = sum(len(p.vertices) - 2 for o in out for p in o.data.polygons)
    print("HARBOR_PEOPLE exported %s %d bytes %d tris" % (path.name, path.stat().st_size, tris))

try:
    for style in range(4):
        build(style)
    print("HARBOR_PEOPLE DONE")
except Exception:
    import traceback
    print("HARBOR_PEOPLE ERROR\n" + traceback.format_exc())

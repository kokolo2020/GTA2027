# Harbor City people generator (v0.14). Original procedural low-poly characters, no outside assets.
# Run from the repo root:  blender --background --python blender-src/make_people.py
# Writes game/models/person_0.glb (short hair) and person_1.glb (long hair).
# Each file has separate nodes so the game can animate them:
#   Body (hips pivot), Head, ArmL, ArmR (shoulder pivots), LegL, LegR (hip pivots).
# Materials named Shirt, Pants, Skin, Hair, Shoes, Eye are recoloured per character in the game.
# Feet at y=0, total height ~1.64 m, facing -Z in Godot (+Y in Blender).
import bpy, bmesh, math, os
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

SHIRT = mat("Shirt", "f2b24a")
PANTS = mat("Pants", "263d54")
SKIN = mat("Skin", "c68a60")
HAIR = mat("Hair", "3b2a20")
SHOES = mat("Shoes", "2b2b2b", 0.5)
EYE = mat("Eye", "1c1c22", 0.3)

def _done(o, m, smooth):
    o.data.materials.append(m)
    if smooth:
        for p in o.data.polygons:
            p.use_smooth = True
    return o

def ball(r, loc, m, scale=(1, 1, 1), seg=12, rings=8):
    bpy.ops.mesh.primitive_uv_sphere_add(segments=seg, ring_count=rings, radius=r, location=loc)
    o = bpy.context.active_object
    o.scale = scale
    bpy.ops.object.transform_apply(scale=True)
    return _done(o, m, True)

def tube(r1, r2, z0, z1, x, y, m, verts=10, sy=1.0):
    # Tapered cylinder from z0 (radius r1) to z1 (radius r2).
    bpy.ops.mesh.primitive_cone_add(vertices=verts, radius1=r1, radius2=r2, depth=abs(z1 - z0), location=(x, y, (z0 + z1) / 2))
    o = bpy.context.active_object
    if z1 < z0:
        o.rotation_euler = (math.pi, 0, 0)
    o.scale = (1, sy, 1)
    bpy.ops.object.transform_apply(rotation=True, scale=True)
    return _done(o, m, True)

def rbox(size, loc, m, bevel=0.03):
    bpy.ops.mesh.primitive_cube_add(size=1, location=loc)
    o = bpy.context.active_object
    o.scale = size
    bpy.ops.object.transform_apply(scale=True)
    mod = o.modifiers.new("Bevel", "BEVEL")
    mod.width = bevel
    mod.segments = 2
    bpy.ops.object.modifier_apply(modifier=mod.name)
    return _done(o, m, True)

def trim_hair(o, cz, front_cut, back_cut):
    # Remove the lower part of a hair sphere: higher cut over the face, lower at the back.
    bm = bmesh.new()
    bm.from_mesh(o.data)
    kill = []
    for v in bm.verts:
        t = max(0.0, min(1.0, (v.co.y + 0.14) / 0.28))  # 0 at back (-Y), 1 at front (+Y)
        cut = cz + back_cut + (front_cut - back_cut) * t
        if v.co.z < cut:
            kill.append(v)
    bmesh.ops.delete(bm, geom=kill, context="VERTS")
    bm.to_mesh(o.data)
    bm.free()
    o.data.update()

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

def build(long_hair):
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    hip_z = 0.86
    sh_z = 1.33
    head_z = 1.49
    out = []
    # Legs: thigh + shin in pants, rounded shoe pointing forward (+Y).
    for name, x in (("LegL", -0.1), ("LegR", 0.1)):
        p = [tube(0.085, 0.07, hip_z, 0.45, x, 0, PANTS),
             tube(0.07, 0.058, 0.47, 0.09, x, 0, PANTS),
             rbox((0.11, 0.24, 0.09), (x, 0.04, 0.055), SHOES, 0.035)]
        out.append(group(name, p, (x, 0, hip_z)))
    # Body: hips/belt, chest that widens to the shoulders, neck.
    body = [tube(0.17, 0.16, hip_z - 0.04, hip_z + 0.1, 0, 0, PANTS, 12, 0.72),
            tube(0.15, 0.19, hip_z + 0.08, sh_z - 0.02, 0, 0, SHIRT, 12, 0.66),
            ball(0.19, (0, 0, sh_z - 0.04), SHIRT, (1.0, 0.64, 0.36)),
            tube(0.052, 0.05, sh_z, head_z - 0.08, 0, 0, SKIN, 8)]
    out.append(group("Body", body, (0, 0, hip_z)))
    # Head: skull, nose, ears, eyes, hair.
    head = [ball(0.14, (0, 0.005, head_z), SKIN, (0.92, 1.0, 1.06), 14, 10),
            ball(0.026, (0, 0.138, head_z - 0.012), SKIN, (0.8, 1.0, 1.2), 8, 6),
            ball(0.032, (-0.128, 0, head_z), SKIN, (0.5, 0.9, 1.2), 8, 6),
            ball(0.032, (0.128, 0, head_z), SKIN, (0.5, 0.9, 1.2), 8, 6),
            ball(0.02, (-0.05, 0.124, head_z + 0.018), EYE, (1, 0.6, 1.2), 8, 6),
            ball(0.02, (0.05, 0.124, head_z + 0.018), EYE, (1, 0.6, 1.2), 8, 6)]
    hair = ball(0.151, (0, -0.008, head_z + 0.02), HAIR, (0.95, 1.02, 1.05), 14, 10)
    trim_hair(hair, -0.02, 0.07, -0.06 if not long_hair else -0.2)
    head.append(hair)
    if long_hair:
        head.append(rbox((0.26, 0.08, 0.28), (0, -0.11, head_z - 0.14), HAIR, 0.03))
    out.append(group("Head", head, (0, 0, sh_z)))
    # Arms: sleeve, forearm, hand. Pivot at the shoulder.
    for name, side in (("ArmL", -1), ("ArmR", 1)):
        x = side * 0.22
        p = [ball(0.062, (x, 0, sh_z - 0.03), SHIRT, (1, 1, 0.9), 10, 7),
             tube(0.064, 0.055, sh_z - 0.02, sh_z - 0.27, x, 0, SHIRT, 10),
             tube(0.046, 0.04, sh_z - 0.25, sh_z - 0.52, x + side * 0.005, 0, SKIN, 8),
             ball(0.048, (x + side * 0.006, 0.005, sh_z - 0.56), SKIN, (0.8, 0.9, 1.15), 8, 6)]
        out.append(group(name, p, (x, 0, sh_z - 0.02)))
    for o in bpy.context.view_layer.objects:
        o.select_set(o in out)
    path = OUT / ("person_%d.glb" % (1 if long_hair else 0))
    bpy.ops.export_scene.gltf(filepath=str(path), export_format="GLB", use_selection=True, export_apply=True, export_yup=True)
    tris = sum(len(p.vertices) - 2 for o in out for p in o.data.polygons)
    print("HARBOR_PEOPLE exported %s %d bytes %d tris" % (path.name, path.stat().st_size, tris))

build(False)
build(True)

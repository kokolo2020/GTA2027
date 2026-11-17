# Harbor Dome generator (v0.18). Original procedural low-poly models, no outside assets.
# Run from the repo root:  blender --background --factory-startup --python blender-src/make_hub.py
# Each model is ONE joined mesh with its origin at the ground centre. Fronts face -Y in Blender (+Z in Godot).
import bpy, bmesh, math, os
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_src = (ROOT / "blender-src/make_downtown.py").read_text()
exec(_src.split("# ---------- towers ----------")[0])   # helpers + materials from the downtown generator

PURPLE = mat("HubPurple", "7b5bd6", 0.6)
TEAL = mat("HubTeal", "22b5c9", 0.5)
CREAM = mat("HubCream", "f3ead6", 0.8)
FELT = mat("TableFelt", "2f7d5a", 0.9)
BOARDW = mat("BoardLine", "f4f1e8", 0.6)
CUSH = [mat("CushionCoral", "e8685a", 0.9), mat("CushionMint", "52c79a", 0.9), mat("CushionGold", "f2c94c", 0.9)]
DOMEG = mat("DomeGlass", "a9dcef", 0.05, 0.1)
SCREEN = mat("RobotScreen", "1d2b36", 0.3, 0.0, 0.4)
EYE = mat("RobotEye", "5ce6ed", 0.3, 0.0, 3.0)

def dome_shell():
    # Glass hemisphere (radius 46, height 32) with steel ribs and an entrance cut out on the -Y side.
    R, H = 46.0, 32.0
    bpy.ops.mesh.primitive_uv_sphere_add(segments=32, ring_count=12, radius=1.0, location=(0, 0, 0))
    o = bpy.context.active_object
    bm = bmesh.new()
    bm.from_mesh(o.data)
    kill = [v for v in bm.verts if v.co.z < -0.01]
    bmesh.ops.delete(bm, geom=kill, context="VERTS")
    # Entrance: remove glass faces low on the -Y side.
    gone = [f for f in bm.faces if f.calc_center_median().y < -0.82 and f.calc_center_median().z < 0.45 and abs(f.calc_center_median().x) < 0.32]
    bmesh.ops.delete(bm, geom=gone, context="FACES")
    for v in bm.verts:
        v.co.x *= R
        v.co.y *= R
        v.co.z *= H
    bm.to_mesh(o.data)
    bm.free()
    for p in o.data.polygons:
        p.use_smooth = True
    finish(o, DOMEG)
    # Ribs (meridians) and two rings.
    for k in range(16):
        a = 2 * math.pi * k / 16
        if abs(math.sin(a) + 1.0) < 0.05:
            continue
        for s in range(10):
            t1, t2 = s / 10 * (math.pi / 2), (s + 1) / 10 * (math.pi / 2)
            p1 = (math.cos(a) * R * math.cos(t1), math.sin(a) * R * math.cos(t1), H * math.sin(t1))
            p2 = (math.cos(a) * R * math.cos(t2), math.sin(a) * R * math.cos(t2), H * math.sin(t2))
            mid = [(p1[i] + p2[i]) / 2 for i in range(3)]
            L = math.dist(p1, p2) + 0.2
            bpy.ops.mesh.primitive_cube_add(size=1, location=mid)
            r = bpy.context.active_object
            r.scale = (0.5, 0.5, L)
            d = [p2[i] - p1[i] for i in range(3)]
            r.rotation_mode = "QUATERNION"
            from mathutils import Vector
            r.rotation_quaternion = Vector((0, 0, 1)).rotation_difference(Vector(d))
            bpy.ops.object.transform_apply(rotation=True, scale=True)
            finish(r, STEEL)
    for (z, rad) in ((0.4, R), (H * 0.62, R * math.cos(math.asin(0.62)))):
        bpy.ops.mesh.primitive_torus_add(major_radius=rad, minor_radius=0.45, major_segments=48, minor_segments=6, location=(0, 0, z))
        finish(bpy.context.active_object, STEEL)
    # Entrance frame and sign board.
    for x in (-9.5, 9.5):
        block((1.6, 2.2, 12), (x, -R + 1.0, 6), STEEL)
    block((21, 2.4, 1.6), (0, -R + 1.0, 12.4), PURPLE)
    block((16, 0.4, 3.2), (0, -R - 0.3, 15.0), TEAL)
    export("dome_shell")

def game_table():
    cyl(1.15, 0.12, (0, 0, 0.78), FELT, verts=20)
    cyl(1.22, 0.06, (0, 0, 0.71), WOOD, verts=20)
    cyl(0.12, 0.7, (0, 0, 0.36), DARK, verts=8)
    cyl(0.6, 0.06, (0, 0, 0.03), DARK, verts=12)
    for k in (-1, 1):
        block((1.3, 0.06, 0.02), (0, k * 0.22, 0.85), BOARDW)
        block((0.06, 1.3, 0.02), (k * 0.22, 0, 0.85), BOARDW)
    export("game_table")

def chair():
    block((0.6, 0.6, 0.1), (0, 0, 0.46), CUSH[0])
    block((0.6, 0.1, 0.6), (0, 0.27, 0.8), CUSH[0])
    for x in (-0.25, 0.25):
        for y in (-0.25, 0.25):
            cyl(0.03, 0.44, (x, y, 0.22), STEEL, verts=6)
    export("chair")

def sofa():
    block((2.4, 0.9, 0.42), (0, 0, 0.21), CUSH[1], 0.08)
    block((2.4, 0.25, 0.75), (0, 0.38, 0.6), CUSH[1], 0.08)
    for x in (-1.15, 1.15):
        block((0.25, 0.9, 0.62), (x, 0, 0.31), CUSH[1], 0.08)
    export("sofa")

def beanbag():
    ico(0.55, (0, 0, 0.32), CUSH[2], 2, 1.0, 1.0, 0.6)
    export("beanbag")

def stage():
    cyl(7.5, 0.9, (0, 0, 0.45), PURPLE, verts=28)
    cyl(7.7, 0.12, (0, 0, 0.92), CREAM, verts=28)
    for k in range(9):
        a = math.pi * (0.1 + 0.8 * k / 8)
        block((1.6, 0.4, 7.5), (math.cos(a) * 7.0, math.sin(a) * 7.0, 4.6), TEAL if k % 2 else PURPLE)
    block((13, 0.5, 2.2), (0, 6.6, 8.8), PURPLE)
    block((11, 0.2, 1.4), (0, 6.3, 8.8), CREAM)
    for x in (-5.5, 5.5):
        cyl(0.15, 7.5, (x, -5.0, 4.2), STEEL, verts=6)
        block((0.7, 0.5, 0.5), (x, -4.8, 7.8), LAMPGLOW)
    cyl(0.04, 1.4, (0, -1.2, 1.6), STEEL, verts=6)
    ico(0.1, (0, -1.2, 2.35), DARK, 1)
    export("stage")

def robot():
    # Friendly robot comedian; stands at the origin, faces -Y (the audience).
    block((0.9, 0.6, 1.0), (0, 0, 1.25), CREAM, 0.15)
    block((0.95, 0.65, 0.25), (0, 0, 0.72), PURPLE, 0.06)
    cyl(0.18, 0.6, (-0.25, 0, 0.32), DARK, verts=8)
    cyl(0.18, 0.6, (0.25, 0, 0.32), DARK, verts=8)
    block((0.3, 0.42, 0.12), (-0.25, -0.05, 0.06), DARK)
    block((0.3, 0.42, 0.12), (0.25, -0.05, 0.06), DARK)
    for x in (-0.6, 0.6):
        cyl(0.09, 0.8, (x, 0, 1.25), STEEL, verts=6)
        ico(0.14, (x, -0.05, 0.8), DARK, 1)
    cyl(0.1, 0.2, (0, 0, 1.85), STEEL, verts=6)
    block((0.95, 0.7, 0.65), (0, 0, 2.25), CREAM, 0.12)
    block((0.78, 0.06, 0.48), (0, -0.34, 2.25), SCREEN)
    for x in (-0.18, 0.18):
        block((0.14, 0.04, 0.14), (x, -0.38, 2.32), EYE)
    block((0.34, 0.04, 0.06), (0, -0.38, 2.1), EYE)
    cyl(0.02, 0.35, (0.3, 0, 2.7), STEEL, verts=6)
    ico(0.07, (0.3, 0, 2.9), mat("AntennaTip", "ff6fb0", 0.3, 0.0, 2.0), 1)
    export("robot")

def counter():
    block((6, 1.2, 1.1), (0, 0, 0.55), TEAL, 0.05)
    block((6.2, 1.4, 0.08), (0, 0, 1.12), CREAM)
    block((6, 0.3, 2.6), (0, 1.6, 1.3), PURPLE)
    for x in (-2, 0, 2):
        cyl(0.18, 0.5, (x, 0, 1.4), mat("Cup%d" % (x + 2), ["e8685a", "f2c94c", "5ce6ed"][x // 2 + 1], 0.5), verts=8)
    export("hub_counter")

try:
    dome_shell(); game_table(); chair(); sofa(); beanbag(); stage(); robot(); counter()
    print("HARBOR_HUB DONE")
except Exception:
    import traceback
    print("HARBOR_HUB ERROR\n" + traceback.format_exc())

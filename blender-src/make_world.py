# Harbor City world-model generator (v0.8.0). Run inside Blender (Scripting > Python Console):
#   exec(open('/path/to/GTA2027/blender-src/make_world.py').read())
# Original low-poly buildings, landscape props and airfield pieces -> game/models/*.glb
import bpy, math, os, traceback
from pathlib import Path

PROJECT_ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1] if "__file__" in globals() else bpy.path.abspath("//"))).resolve()
_src = (PROJECT_ROOT / "blender-src/make_models.py").read_text()
exec(_src.split("CAR_STYLES = [")[0])   # helpers: mat, block, cyl, cone, export, CUR, log

_orig_export = export
def export(name):
    # Bake bevels and join into one mesh so each building costs a handful of draw calls on the phone.
    for o in CUR:
        bpy.context.view_layer.objects.active = o
        for mod in list(o.modifiers):
            bpy.ops.object.modifier_apply(modifier=mod.name)
    if len(CUR) > 1:
        for o in bpy.context.view_layer.objects:
            o.select_set(False)
        for o in CUR:
            o.select_set(True)
        bpy.context.view_layer.objects.active = CUR[0]
        keep = CUR[0]
        bpy.ops.object.join()
        CUR[:] = [keep]
    _orig_export(name)

def ico(r, loc, m, sub=1, sx=1.0, sy=1.0, sz=1.0):
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=sub, radius=r, location=loc)
    o = bpy.context.active_object
    for v in o.data.vertices:
        v.co.x *= sx
        v.co.y *= sy
        v.co.z *= sz
    return finish(o, m)

def squash(o, sx=1.0, sy=1.0, sz=1.0):
    for v in o.data.vertices:
        v.co.x *= sx
        v.co.y *= sy
        v.co.z *= sz

GLASSW = mat("WinGlass", "345361", 0.15, 0.2)
TRIM = mat("Trim", "f2e6d2", 0.8)
CONC = mat("Concrete", "9a9d98", 0.9)
DOORM = mat("Door", "5a4634", 0.8)
METAL = mat("Metal", "8d979e", 0.5, 0.5)
DARKM = mat("DarkRubber", "1b232b", 0.8)

PALETTE = ["dba88e", "e2c994", "a6bcc2", "b3a2ad"]
HEIGHTS = [4.0, 6.2, 8.4, 10.6]

def build_building(i):
    h = HEIGHTS[i]
    wall = mat("Wall%d" % i, PALETTE[i], 0.85)
    awn = mat("Awn%d" % i, ["c36658", "5b8a6e", "d49a3c", "6a7fb0"][i], 0.8)
    block((11, 10, h), (0, 0, h / 2), wall, 0.12)
    block((11.7, 10.7, 0.4), (0, 0, h + 0.2), TRIM, 0.08)
    block((11.2, 10.2, 0.5), (0, 0, 0.25), CONC, 0.05)
    for cx in (-5.4, 5.4):
        for cy in (-4.9, 4.9):
            block((0.7, 0.7, h), (cx, cy, h / 2), TRIM, 0.05)
    floors = int(h / 2.0)
    for f in range(1, floors + 1):
        zz = f * 1.7 + 0.5
        for col in (-3.2, 0.0, 3.2):
            if f == 1 and col == 0.0:
                continue
            block((1.4, 0.12, 1.1), (col, -5.05, zz), GLASSW, 0.03)
            block((1.6, 0.08, 0.12), (col, -5.08, zz - 0.62), TRIM)
        for col in (-2.5, 2.5):
            block((0.12, 1.2, 1.1), (5.55, col, zz), GLASSW, 0.03)
            block((0.12, 1.2, 1.1), (-5.55, col, zz), GLASSW, 0.03)
    block((1.6, 0.2, 2.3), (0, -5.08, 1.2), DOORM, 0.05)
    block((3.2, 1.4, 0.2), (0, -5.7, 2.55), awn, 0.04)
    block((2.0, 1.6, 0.9), (-3, 1, h + 0.85), METAL, 0.05)
    block((1.2, 1.2, 0.6), (3, -1.5, h + 0.7), METAL, 0.05)
    export("building_%d" % i)

def build_house(i):
    wall = mat("HWall%d" % i, ["efe2c8", "b9c8d4"][i], 0.9)
    roof = mat("HRoof%d" % i, ["b4533f", "6b5a4a"][i], 0.85)
    block((8, 7, 3.2), (0, 0, 1.6), wall, 0.1)
    for sgn in (-1, 1):
        block((8.8, 4.3, 0.35), (0, sgn * 1.75, 3.9), roof, 0.04, rot=(sgn * -0.62, 0, 0))
    block((0.8, 1.0, 1.4), (2.4, 1.5, 4.9), CONC, 0.04)
    block((1.0, 0.12, 2.0), (-1.8, -3.55, 1.0), DOORM, 0.04)
    for x in (0.8, 2.8):
        block((1.2, 0.12, 1.0), (x, -3.55, 1.8), GLASSW, 0.03)
    block((1.2, 0.12, 1.0), (-3.0, -3.55, 1.8), GLASSW, 0.03)
    block((8.4, 0.6, 0.3), (0, -3.9, 0.15), CONC)
    export("house_%d" % i)

def build_warehouse():
    wall = mat("WhWall", "b8bfc2", 0.7, 0.2)
    stripe = mat("WhStripe", "d27a3a", 0.6)
    block((20, 12, 6), (0, 0, 3), wall, 0.1)
    block((20.6, 12.6, 0.4), (0, 0, 6.2), METAL, 0.05)
    for x in range(-9, 10, 3):
        block((0.25, 12.1, 5.9), (x, 0, 3), METAL)
    block((20.2, 0.1, 0.8), (0, -6.05, 4.9), stripe)
    for x in (-6, 0, 6):
        block((4.2, 0.15, 4.0), (x, -6.1, 2.0), DOORM, 0.05)
    for x in (-5, 4):
        cyl(0.6, 0.9, (x, 2, 6.8), METAL, verts=10)
    export("warehouse")

def build_container(i):
    col = ["c4533f", "3f78a8", "d9a43c"][i]
    m = mat("Cont%d" % i, col, 0.6, 0.2)
    block((6, 2.4, 2.6), (0, 0, 1.3), m, 0.05)
    for x in range(-2, 3):
        block((0.2, 2.5, 2.5), (x * 1.1, 0, 1.3), METAL)
    block((0.15, 2.5, 2.7), (3.05, 0, 1.3), METAL)
    export("container_%d" % i)

def build_hangar():
    shell = mat("HangarShell", "c9d0d4", 0.5, 0.3)
    door = mat("HangarDoor", "47586a", 0.6)
    bpy.ops.mesh.primitive_cylinder_add(vertices=24, radius=1.0, depth=22, location=(0, 0, 0), rotation=(math.pi / 2, 0, 0))
    o = bpy.context.active_object
    squash(o, 12.0, 9.0, 1.0)
    finish(o, shell)
    block((24, 22, 1), (0, 0, -0.5), CONC)
    block((17, 0.3, 7.2), (0, -11.05, 3.6), door, 0.05)
    for z in (2.0, 4.0, 6.0):
        block((17.2, 0.1, 0.12), (0, -11.25, z), METAL)
    block((12, 0.3, 1.0), (0, -11.2, 8.2), mat("HangarBand", "d2503a", 0.6))
    export("hangar")

def build_tower():
    base = mat("TwrBase", "d8dcd8", 0.8)
    stripe = mat("TwrStripe", "d2503a", 0.6)
    block((7, 7, 6), (0, 0, 3), base, 0.1)
    cyl(1.8, 12, (0, 0, 12), base, verts=12)
    for z in (8, 12, 16):
        cyl(1.85, 0.8, (0, 0, z), stripe, verts=12)
    cyl(3.6, 3.2, (0, 0, 19.6), GLASSW, verts=12)
    cyl(4.2, 0.5, (0, 0, 21.4), base, verts=12)
    cyl(0.12, 4.0, (0, 0, 23.6), METAL, verts=6)
    ico(0.35, (0, 0, 25.7), mat("TwrBeacon", "ff4d3a", 0.3, 0.0, 3.0), sub=1)
    export("tower")

def build_plane():
    body = mat("PlaneBody", "f0f2f4", 0.4, 0.2)
    accent = mat("PlaneAccent", "2f6fb0", 0.5)
    bpy.ops.mesh.primitive_cylinder_add(vertices=14, radius=1.1, depth=11, location=(0, 0, 2.6), rotation=(math.pi / 2, 0, 0))
    finish(bpy.context.active_object, body)
    cone(1.1, 0.01, 2.4, (0, -6.7, 2.6), body, verts=14)
    bpy.context.active_object.rotation_euler = (math.pi / 2, 0, 0)
    block((14, 1.6, 0.25), (0, 0.4, 2.2), body, 0.04)
    block((5, 1.1, 0.2), (0, 4.6, 2.7), body, 0.04)
    block((0.25, 1.4, 2.6), (0, 4.6, 3.8), accent, 0.04)
    block((2.0, 0.12, 0.6), (0, -3.8, 3.1), GLASSW, 0.03)
    for x in (-2.6, 2.6):
        cyl(0.55, 1.6, (x, -0.6, 2.0), METAL, rot=(math.pi / 2, 0, 0), verts=10)
    for x, y in ((0, -4.5), (-1.1, 0.5), (1.1, 0.5)):
        cyl(0.3, 0.2, (x, y, 0.35), DARKM, rot=(0, math.pi / 2, 0), verts=8)
        block((0.12, 0.12, 1.5), (x, y, 1.15), METAL)
    export("airplane")

def build_crane():
    steel = mat("CraneSteel", "e3a428", 0.5, 0.3)
    for x in (-6, 6):
        for y in (-2.5, 2.5):
            block((0.5, 0.5, 14), (x, y, 7), steel)
    block((13.5, 0.9, 0.9), (0, -2.5, 14.2), steel)
    block((13.5, 0.9, 0.9), (0, 2.5, 14.2), steel)
    block((0.9, 24, 0.9), (-6, 5, 14.7), steel)
    block((0.9, 24, 0.9), (6, 5, 14.7), steel)
    block((12.5, 1.2, 0.5), (0, 0, 15.4), METAL)
    block((1.6, 1.6, 1.4), (0, 0, 14.4), mat("CraneCab", "3a4a58", 0.5))
    export("crane")

def build_pine():
    bark = mat("Bark", "6d4a2a", 0.95)
    leaf = mat("Pine", "2f6b45", 0.9)
    cyl(0.28, 2.0, (0, 0, 1.0), bark, verts=8)
    cone(2.0, 0.05, 2.6, (0, 0, 2.7), leaf, verts=9)
    cone(1.6, 0.05, 2.4, (0, 0, 4.0), leaf, verts=9)
    cone(1.1, 0.05, 2.2, (0, 0, 5.2), leaf, verts=9)
    export("tree_pine")

def build_round_tree():
    bark = mat("Bark", "6d4a2a", 0.95)
    leaf = mat("Leaf", "5a9a55", 0.9)
    leaf2 = mat("Leaf2", "78b45c", 0.9)
    cyl(0.3, 2.6, (0, 0, 1.3), bark, verts=8)
    ico(2.0, (0, 0, 3.9), leaf, sub=1, sz=0.9)
    ico(1.2, (0.9, 0.5, 4.8), leaf2, sub=1)
    ico(1.0, (-0.9, -0.4, 4.4), leaf2, sub=1)
    export("tree_round")

def build_rock():
    stone = mat("Stone", "8a8377", 0.95)
    stone2 = mat("Stone2", "9d968a", 0.95)
    ico(1.3, (0, 0, 0.7), stone, sub=1, sx=1.3, sy=1.0, sz=0.8)
    ico(0.8, (1.1, 0.6, 0.4), stone2, sub=1, sz=0.8)
    export("rock")

def build_lamp():
    glow = mat("LampGlow", "fff0b8", 0.3, 0.0, 3.0)
    pole = mat("LampPole", "3b4650", 0.6, 0.4)
    cyl(0.1, 5.0, (0, 0, 2.5), pole, verts=6)
    block((1.2, 0.12, 0.12), (0.5, 0, 5.0), pole)
    block((0.5, 0.35, 0.18), (1.0, 0, 4.9), glow, 0.03)
    export("lamp")

try:
    log("Blender " + bpy.app.version_string)
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    for i in range(4):
        build_building(i)
    for i in range(2):
        build_house(i)
    build_warehouse()
    for i in range(3):
        build_container(i)
    build_hangar()
    build_tower()
    build_plane()
    build_crane()
    build_pine()
    build_round_tree()
    build_rock()
    build_lamp()
    log("DONE")
except Exception:
    log("ERROR\n" + traceback.format_exc())

# Harbor City Downtown generator (v0.16). Original procedural low-poly models, no outside assets.
# Run from the repo root:  blender --background --factory-startup --python blender-src/make_downtown.py
# Every model is joined into ONE mesh with its origin at the ground centre (the game draws
# repeated models with MultiMesh, which only uses the mesh). Fronts face -Y in Blender = +Z in Godot.
import bpy, bmesh, math, os
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_src = (ROOT / "blender-src/make_models.py").read_text()
exec(_src.split("CAR_STYLES = [")[0])   # helpers: mat, block, cyl, cone, export, CUR, log

_orig_export = export
def export(name):
    for o in CUR:
        bpy.context.view_layer.objects.active = o
        for mod in list(o.modifiers):
            bpy.ops.object.modifier_apply(modifier=mod.name)
    for o in bpy.context.view_layer.objects:
        o.select_set(False)
    for o in CUR:
        o.select_set(True)
    bpy.context.view_layer.objects.active = CUR[0]
    keep = CUR[0]
    if len(CUR) > 1:
        bpy.ops.object.join()
    CUR[:] = [keep]
    bpy.context.scene.cursor.location = (0, 0, 0)
    bpy.ops.object.origin_set(type="ORIGIN_CURSOR")
    tris = sum(len(p.vertices) - 2 for p in keep.data.polygons)
    _orig_export(name)
    print("HARBOR_DT %s %d tris" % (name, tris))

def ico(r, loc, m, sub=1, sx=1.0, sy=1.0, sz=1.0):
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=sub, radius=r, location=loc)
    o = bpy.context.active_object
    for v in o.data.vertices:
        v.co.x *= sx
        v.co.y *= sy
        v.co.z *= sz
    return finish(o, m)

def ring_plate(w, d, z, m, t=0.25, over=0.25):
    block((w + over * 2, d + over * 2, t), (0, 0, z), m)

GLASS_B = mat("GlassBlue", "3d6f8e", 0.12, 0.3)
GLASS_T = mat("GlassTeal", "2f8a8c", 0.12, 0.3)
GLASS_D = mat("GlassDark", "2a3a48", 0.12, 0.3)
GLASS_L = mat("GlassLobby", "8fc3d6", 0.1, 0.2)
STONE = mat("Stone", "e3d7bf", 0.85)
STONE2 = mat("StoneGrey", "b9bcbd", 0.85)
TERRA = mat("Terracotta", "c97b5a", 0.85)
WHITE = mat("WhiteTrim", "f1efe8", 0.7)
GOLD = mat("Gold", "d9b44a", 0.35, 0.6)
STEEL = mat("Steel", "8d979e", 0.45, 0.5)
DARK = mat("DarkMetal", "2b3036", 0.6, 0.3)
CONC = mat("Concrete", "a3a6a3", 0.9)
GRASS = mat("Turf", "4f9a4a", 0.95)
WATER = mat("Water", "3fa7c9", 0.1, 0.0)
WOOD = mat("Wood", "8a6a43", 0.85)
LEAF = mat("PalmLeaf", "3f9a5a", 0.8)
RED = mat("SignalRed", "d33a3a", 0.5)
AWN = [mat("AwnRed", "c8504a", 0.8), mat("AwnGreen", "4f8f6a", 0.8), mat("AwnYellow", "e0a83a", 0.8), mat("AwnBlue", "4a74b0", 0.8)]
LAMPGLOW = mat("Glow", "fff0b8", 0.3, 0.0, 2.5)

def floors(w, d, h, glass, trim, step=3.4, start=4.0):
    z = start
    while z < h - 0.5:
        ring_plate(w, d, z, trim, 0.3, 0.12)
        z += step

def fins(w, d, h, m, n=5, z0=0.0):
    for i in range(n):
        t = -0.5 + (i + 0.5) / n
        for (x, y, sx, sy) in ((t * w, -d / 2 - 0.1, 0.3, 0.3), (t * w, d / 2 + 0.1, 0.3, 0.3),
                               (-w / 2 - 0.1, t * d, 0.3, 0.3), (w / 2 + 0.1, t * d, 0.3, 0.3)):
            block((sx, sy, h - z0), (x, y, z0 + (h - z0) / 2), m)

def lobby(w, d, h=4.0, canopy=AWN[3]):
    block((w - 0.6, d - 0.6, h), (0, 0, h / 2), GLASS_L)
    block((6, 2.2, 0.3), (0, -d / 2 - 1.1, h - 0.6), canopy)

# ---------- towers ----------
def tower_0():
    w, d, h = 16, 16, 46
    lobby(w, d)
    block((w, d, h - 4), (0, 0, 4 + (h - 4) / 2), GLASS_B)
    floors(w, d, h, GLASS_B, WHITE)
    fins(w, d, h, WHITE, 5, 4)
    block((w - 4, d - 4, 4), (0, 0, h + 2), GLASS_B)
    ring_plate(w - 4, d - 4, h + 4, WHITE, 0.4, 0.2)
    cyl(0.25, 10, (2, 2, h + 9), STEEL, verts=6)
    block((3, 3, 1.5), (-3, -2, h + 0.75), STEEL)
    export("tower_0")

def tower_1():
    lobby(18, 18, 4.5, AWN[0])
    tiers = [(18, 4.5, 24), (14, 24, 40), (10, 40, 52)]
    for (s, z0, z1) in tiers:
        block((s, s, z1 - z0), (0, 0, (z0 + z1) / 2), STONE)
        n = 4 if s > 12 else 3
        for i in range(n):
            t = -0.5 + (i + 0.5) / n
            for (x, y, sx, sy) in ((t * s, -s / 2 - 0.05, 1.3, 0.2), (t * s, s / 2 + 0.05, 1.3, 0.2),
                                   (-s / 2 - 0.05, t * s, 0.2, 1.3), (s / 2 + 0.05, t * s, 0.2, 1.3)):
                block((sx, sy, z1 - z0 - 2), (x, y, (z0 + z1) / 2), GLASS_D)
        ring_plate(s, s, z1, GOLD, 0.5, 0.2)
    cone(3.2, 0.2, 12, (0, 0, 58), GOLD, verts=8)
    export("tower_1")

def tower_2():
    w, d, h = 24, 12, 32
    lobby(w, d, 4.0, AWN[2])
    block((w - 0.4, d - 0.4, h - 4), (0, 0, 4 + (h - 4) / 2), GLASS_D)
    z = 4.0
    while z < h:
        block((w, d, 1.4), (0, 0, z + 0.7), STONE2)
        z += 3.2
    block((w + 0.4, d + 0.4, 0.6), (0, 0, h + 0.3), WHITE)
    for x in (-7, 0, 7):
        block((3, 3, 2), (x, 1, h + 1.6), STEEL)
    export("tower_2")

def tower_3():
    w, d, h = 14, 14, 38
    block((w, d, h), (0, 0, h / 2), TERRA)
    block((w - 0.6, d - 0.6, 3.6), (0, 0, 1.8), GLASS_L)
    z = 5.0
    while z < h - 1:
        for x in (-4.2, 0.0, 4.2):
            for y in (-d / 2 - 0.05, d / 2 + 0.05):
                block((2.2, 0.2, 1.6), (x, y, z + 1.0), GLASS_D)
                block((3.0, 1.2, 0.18), (x, y + (-0.6 if y < 0 else 0.6), z), WHITE)
            for y in (-4.2, 4.2):
                block((0.2, 2.2, 1.6), (-w / 2 - 0.05, y, z + 1.0), GLASS_D)
                block((0.2, 2.2, 1.6), (w / 2 + 0.05, y, z + 1.0), GLASS_D)
        z += 3.3
    block((w + 0.6, d + 0.6, 0.5), (0, 0, h + 0.25), WHITE)
    cyl(1.6, 3, (3, 3, h + 2), WOOD, verts=10)
    cone(1.8, 0.4, 1.2, (3, 3, h + 4.1), DARK, verts=10)
    export("tower_3")

def tower_4():
    # Harbor Tower: the tallest landmark, with an observation ring.
    lobby(20, 20, 5.0, AWN[1])
    secs = [(20, 5, 34), (15, 34, 58), (11, 58, 76)]
    for (s, z0, z1) in secs:
        block((s, s, z1 - z0), (0, 0, (z0 + z1) / 2), GLASS_T)
        floors(s, s, z1, GLASS_T, WHITE, 3.6, z0 + 3.6)
        fins(s, s, z1, WHITE, 4, z0)
        ring_plate(s, s, z1, GOLD, 0.6, 0.3)
    cyl(9, 3, (0, 0, 78), GLASS_L, verts=16)
    cyl(9.6, 0.4, (0, 0, 79.7), GOLD, verts=16)
    cone(2.2, 0.15, 18, (0, 0, 89), STEEL, verts=8)
    export("tower_4")

# ---------- low buildings ----------
def shops(i):
    wall = mat("ShopWall%d" % i, ["e9d3b0", "c9d8de"][i], 0.85)
    w, d = 24, 10
    block((w, d, 8), (0, 0, 4), wall)
    for k, x in enumerate((-8, 0, 8)):
        block((6.6, 0.3, 3.0), (x, -d / 2 - 0.05, 1.8), GLASS_L)
        block((7.2, 1.8, 0.25), (x, -d / 2 - 0.9, 3.6), AWN[(k + i) % 4])
        block((6.0, 0.25, 1.0), (x, -d / 2 - 0.1, 4.5), AWN[(k + i + 2) % 4])
        for wx in (-1.6, 1.6):
            block((1.4, 0.2, 1.4), (x + wx, -d / 2 - 0.05, 6.2), GLASS_D)
            block((1.4, 0.2, 1.4), (x + wx, d / 2 + 0.05, 6.2), GLASS_D)
    block((w + 0.5, d + 0.5, 0.4), (0, 0, 8.2), WHITE)
    block((3, 2, 1.2), (6, 1, 9.0), STEEL)
    export("shops_%d" % i)

def garage():
    s = 24
    for z in (0.0, 3.2, 6.4, 9.6, 12.8):
        block((s, s, 0.4), (0, 0, z + 0.2), CONC)
        if z > 0:
            for (x, y, sx, sy) in ((0, -s / 2, s, 0.3), (0, s / 2, s, 0.3), (-s / 2, 0, 0.3, s), (s / 2, 0, 0.3, s)):
                block((sx, sy, 1.0), (x, y, z + 0.9), WHITE)
    for x in (-11.5, 0, 11.5):
        for y in (-11.5, 0, 11.5):
            block((0.7, 0.7, 13), (x, y, 6.5), CONC)
    block((8, 3, 1.5), (0, -s / 2 - 1.5, 14.5), AWN[3])
    block((3.0, 0.4, 2.2), (-8, -s / 2 - 0.1, 1.5), DARK)
    export("garage")

def police():
    w, d = 30, 18
    block((w, d, 8), (0, 0, 4), WHITE)
    block((w + 0.2, d + 0.2, 1.0), (0, 0, 6.2), AWN[3])
    for x in (-10, -5, 5, 10):
        block((3.4, 0.2, 2.0), (x, -d / 2 - 0.05, 3.0), GLASS_D)
    block((5, 0.3, 3.4), (0, -d / 2 - 0.1, 1.7), GLASS_L)
    block((8, 3, 0.3), (0, -d / 2 - 1.5, 3.8), AWN[3])
    for x in (-12.5, -8.5):
        block((3.4, 0.2, 3.2), (x, d / 2 + 0.05, 1.6), STONE2)
    cyl(0.12, 10, (13, -d / 2 - 3, 5), STEEL, verts=6)
    block((1.8, 0.05, 1.1), (13.9, -d / 2 - 3, 9.2), AWN[3])
    block((w + 0.6, d + 0.6, 0.4), (0, 0, 8.2), STONE2)
    export("police")

def mall():
    w, d = 80, 34
    block((w, d, 12), (0, 0, 6), STONE)
    block((22, d + 0.4, 14), (0, 0, 7), GLASS_L)
    block((24, d + 1.0, 0.6), (0, 0, 14.3), WHITE)
    for x in (-28, -14, 14, 28):
        block((10, 0.3, 4), (x, -d / 2 - 0.1, 3), GLASS_D)
        block((11, 2, 0.3), (x, -d / 2 - 1.0, 5.4), AWN[int(abs(x)) % 4])
    block((w + 0.6, d + 0.6, 0.6), (0, 0, 12.3), WHITE)
    for x in (-30, -18, 18, 30):
        block((5, 4, 1.6), (x, 6, 13.4), STEEL)
    export("mall")

def station():
    w, d = 56, 18
    block((w, d, 7), (0, 0, 3.5), STONE)
    bpy.ops.mesh.primitive_cylinder_add(vertices=14, radius=d / 2 + 0.6, depth=w + 1, location=(0, 0, 7), rotation=(0, math.pi / 2, 0))
    o = bpy.context.active_object
    bm = bmesh.new()
    bm.from_mesh(o.data)
    bmesh.ops.delete(bm, geom=[v for v in bm.verts if v.co.x > 0.01], context="VERTS")  # local x = world z after rotation
    bm.to_mesh(o.data)
    bm.free()
    finish(o, GLASS_L)
    for x in range(-24, 25, 8):
        block((0.4, d + 1.4, 0.4), (x, 0, 7.2), WHITE)
    block((14, 0.4, 5), (0, -d / 2 - 0.1, 2.5), GLASS_D)
    cyl(1.6, 0.4, (0, -d / 2 - 0.4, 9.0), WHITE, rot=(math.pi / 2, 0, 0), verts=16)
    # Platforms and tracks behind the hall, with a parked train.
    block((w + 10, 4, 1.0), (0, d / 2 + 2, 0.5), CONC)
    for y in (d / 2 + 6.0, d / 2 + 7.6):
        block((w + 10, 0.2, 0.25), (0, y, 0.15), STEEL)
    for k in range(3):
        x = -18 + k * 18
        block((16.5, 3.0, 3.4), (x, d / 2 + 6.8, 2.1), WHITE)
        block((16.6, 3.05, 1.0), (x, d / 2 + 6.8, 2.8), GLASS_D)
        block((16.6, 3.05, 0.4), (x, d / 2 + 6.8, 1.0), AWN[3])
    export("station")

def stadium():
    rx, ry = 38, 28
    block((56, 36, 0.3), (0, 0, 0.15), GRASS)
    for x in range(-24, 25, 8):
        block((0.25, 34, 0.32), (x, 0, 0.16), WHITE)
    n = 28
    for i in range(n):
        a = 2 * math.pi * i / n
        a2 = 2 * math.pi * (i + 1) / n
        x1, y1 = math.cos(a) * rx, math.sin(a) * ry
        x2, y2 = math.cos(a2) * rx, math.sin(a2) * ry
        cx, cy = (x1 + x2) / 2, (y1 + y2) / 2
        seg = math.hypot(x2 - x1, y2 - y1) + 0.6
        ang = math.atan2(y2 - y1, x2 - x1)
        bpy.ops.mesh.primitive_cube_add(size=1, location=(cx, cy, 6), rotation=(0, 0, ang))
        o = bpy.context.active_object
        for v in o.data.vertices:
            v.co.x *= seg
            v.co.y *= 9.0
            v.co.z *= 12
            if v.co.y > 0:  # inner side (left of the anticlockwise tangent) is lower: makes a sloped bowl
                v.co.z = -6.0 if v.co.z < 0 else -3.5
        finish(o, CONC if i % 2 else STONE2)
        bpy.ops.mesh.primitive_cube_add(size=1, location=(cx * 1.04, cy * 1.04, 12.6), rotation=(0, 0, ang))
        r = bpy.context.active_object
        for v in r.data.vertices:
            v.co.x *= seg
            v.co.y *= 7.0
            v.co.z *= 0.4
        finish(r, WHITE)
    for (x, y) in ((-34, -24), (34, -24), (-34, 24), (34, 24)):
        cyl(0.4, 22, (x, y, 11), STEEL, verts=6)
        block((4, 1.0, 2.2), (x, y, 22), LAMPGLOW)
    export("stadium")

# ---------- street props ----------
def traffic_light():
    cyl(0.14, 5.4, (0, 0, 2.7), DARK, verts=6)
    block((4.2, 0.16, 0.16), (2.1, 0, 5.3), DARK)
    block((0.6, 0.5, 1.6), (3.9, 0, 4.4), DARK)
    block((0.5, 0.45, 1.3), (0, -0.35, 2.8), DARK)
    export("traffic_light")

def bench():
    for y in (-0.15, 0.15):
        block((1.8, 0.12, 0.06), (0, y, 0.45), WOOD)
    block((1.8, 0.06, 0.4), (0, 0.3, 0.75), WOOD)
    for x in (-0.75, 0.75):
        block((0.08, 0.6, 0.45), (x, 0, 0.22), DARK)
    export("bench")

def trash_bin():
    cyl(0.28, 0.9, (0, 0, 0.45), mat("BinGreen", "3f6b52", 0.7), verts=10)
    cyl(0.31, 0.08, (0, 0, 0.92), DARK, verts=10)
    export("bin")

def hydrant():
    cyl(0.16, 0.6, (0, 0, 0.3), RED, verts=8)
    cyl(0.12, 0.2, (0, 0, 0.7), RED, verts=8)
    cyl(0.07, 0.36, (0, 0, 0.38), RED, rot=(0, math.pi / 2, 0), verts=6)
    export("hydrant")

def billboard():
    for x in (-2.5, 2.5):
        cyl(0.18, 6, (x, 0.3, 3), DARK, verts=6)
    block((8.4, 0.4, 3.8), (0, 0, 7.3), WHITE)
    block((8.0, 0.1, 3.4), (0, -0.25, 7.3), mat("BoardFace", "f2f0e8", 0.6))
    export("billboard")

def palm():
    trunk = mat("PalmTrunk", "8a6a43", 0.9)
    x = 0.0
    for k in range(6):
        z = k * 1.1
        x = 0.06 * k * k
        cyl(0.22 - k * 0.015, 1.15, (x, 0, z + 0.55), trunk, rot=(0, 0.08 * k, 0), verts=7)
    top = (x + 0.15, 0, 6.6)
    for k in range(7):
        a = 2 * math.pi * k / 7
        bpy.ops.mesh.primitive_cube_add(size=1, location=(top[0] + math.cos(a) * 1.4, math.sin(a) * 1.4, top[2] - 0.35),
                                        rotation=(0, 0.45, a))
        o = bpy.context.active_object
        for v in o.data.vertices:
            v.co.x *= 3.2
            v.co.y *= 0.7
            v.co.z *= 0.12
        finish(o, LEAF)
    ico(0.45, top, mat("Coconut", "6b4f2a", 0.8), 1)
    export("palm")

def planter():
    block((1.6, 1.6, 0.6), (0, 0, 0.3), CONC)
    ico(0.85, (0, 0, 1.1), mat("Bush", "4f8a4a", 0.9), 1, 1, 1, 0.8)
    export("planter")

def fountain():
    cyl(7, 0.8, (0, 0, 0.4), STONE2, verts=20)
    cyl(6.4, 0.2, (0, 0, 0.72), WATER, verts=20)
    cyl(0.8, 3, (0, 0, 1.5), STONE2, verts=10)
    cyl(2.4, 0.4, (0, 0, 3.0), STONE2, verts=14)
    cyl(2.0, 0.15, (0, 0, 3.22), WATER, verts=14)
    cone(0.6, 0.05, 1.6, (0, 0, 4.0), WATER, verts=8)
    export("fountain")

def kiosk():
    block((2.4, 1.4, 1.1), (0, 0, 0.75), AWN[0])
    block((2.5, 1.5, 0.08), (0, 0, 1.34), WHITE)
    for x in (-0.9, 0.9):
        cyl(0.25, 0.1, (x, 0.75, 0.25), DARK, rot=(math.pi / 2, 0, 0), verts=8)
    cyl(0.05, 2.0, (0, 0, 2.0), STEEL, verts=6)
    cone(1.6, 0.05, 0.6, (0, 0, 3.1), AWN[2], verts=10)
    export("kiosk")

def bus_shelter():
    block((4, 1.6, 0.12), (0, 0, 2.5), WHITE)
    block((4, 0.06, 2.1), (0, 0.75, 1.3), GLASS_L)
    for x in (-1.95, 1.95):
        block((0.08, 1.5, 2.1), (x, 0.0, 1.3), GLASS_L)
        cyl(0.05, 2.5, (x, -0.7, 1.25), STEEL, verts=6)
    block((2.8, 0.4, 0.08), (0, 0.4, 0.5), WOOD)
    export("bus_shelter")

try:
    tower_0(); tower_1(); tower_2(); tower_3(); tower_4()
    shops(0); shops(1); garage(); police(); mall(); station(); stadium()
    traffic_light(); bench(); trash_bin(); hydrant(); billboard(); palm(); planter(); fountain(); kiosk(); bus_shelter()
    print("HARBOR_DT DONE")
except Exception:
    import traceback
    print("HARBOR_DT ERROR\n" + traceback.format_exc())

# Chit Chat Roastery props (v0.57). Original procedural low-poly models, no outside assets.
# Run from the repo root:  blender --background --factory-startup --python blender-src/make_cafe.py
# Origin at ground centre, front faces -Y in Blender (= +Z in Godot).
import bpy, bmesh, math, os
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_src = (ROOT / "blender-src/make_downtown.py").read_text()
exec(_src.split("# ---------- towers ----------")[0])

# --- toy / Roblox-style pass: flat saturated colours, no shine, rounder chunkier edges ---
TOY_COL = {"d9a441": "ffb703", "c9d0d6": "8aa4c8", "1c1b1a": "3d4466", "f3ead6": "ffe9bf", "1f5a3c": "2fb67a",
           "cfc8bb": "7bd3cf", "b9b4aa": "ff8f5c", "ffd596": "ffd43b", "6f9fb4": "5cb8f2", "f2a58e": "ff7d6b", "c79a62": "e0994d"}
_mat_orig = mat
def mat(name, hexcol, rough=0.6, metal=0.0, emit=0.0):
    return _mat_orig(name, TOY_COL.get(hexcol, hexcol), 0.85, 0.0, emit)
_block_orig = block
def block(size, loc, m, bevel=0.0, rot=(0, 0, 0)):
    return _block_orig(size, loc, m, max(bevel * 2.4, 0.07), rot)

BRASS = mat("CafeBrass", "d9a441", 0.3, 0.8)
CHROME = mat("CafeChrome", "c9d0d6", 0.2, 0.9)
BLACK = mat("CafeBlack", "1c1b1a", 0.35, 0.3)
CREAMM = mat("CafeCream", "f3ead6", 0.5)
GREENM = mat("CafeGreen", "1f5a3c", 0.5)
BULB = mat("CafeBulb", "fff1c9", 0.3, 0.0, 3.0)
CRUST = [mat("Crust%d" % i, c, 0.8) for i, c in enumerate(["c98a4b", "e8c27a", "8a5a2b", "d86a6a"])]

def espresso():
    block((1.5, 0.75, 0.62), (0, 0, 0.31), BLACK, 0.04)
    block((1.46, 0.7, 0.5), (0, 0, 0.87), CHROME, 0.07)
    block((1.54, 0.78, 0.07), (0, 0, 1.15), BRASS, 0.02)
    block((1.2, 0.5, 0.1), (0, 0, 1.22), BLACK, 0.03)
    for x in (-0.45, 0.0, 0.45):
        cyl(0.11, 0.1, (x, -0.38, 0.8), BRASS, verts=10)
        cyl(0.06, 0.2, (x, -0.46, 0.8), BLACK, rot=(math.pi/2, 0, 0), verts=8)
        block((0.04, 0.22, 0.04), (x, -0.62, 0.8), BLACK)
        cyl(0.07, 0.11, (x, -0.4, 0.5), CREAMM, verts=10)
        block((0.1, 0.03, 0.03), (x + 0.1, -0.4, 0.52), CREAMM)
    block((0.5, 0.03, 0.16), (0, -0.37, 1.0), BLACK)
    cyl(0.025, 0.4, (0.66, -0.2, 0.85), CHROME, verts=6)
    cyl(0.04, 0.08, (-0.66, -0.2, 0.9), BLACK, verts=8)
    ico(0.1, (0, 0, 1.32), BRASS, 1)
    export("cafe_espresso")

def grinder():
    block((0.4, 0.4, 0.5), (0, 0, 0.25), BLACK, 0.05)
    cyl(0.17, 0.5, (0, 0, 0.75), CHROME, verts=12)
    cone(0.2, 0.1, 0.3, (0, 0, 1.15), BRASS, verts=12)
    cyl(0.1, 0.08, (0, -0.2, 0.3), BRASS, rot=(math.pi/2, 0, 0), verts=10)
    block((0.3, 0.02, 0.12), (0, -0.21, 0.42), CREAMM)
    export("cafe_grinder")

def pastry():
    block((1.6, 0.9, 0.08), (0, 0, 0.04), BRASS, 0.02)
    cyl(0.32, 0.04, (-0.45, 0, 0.12), CREAMM, verts=14)
    cyl(0.32, 0.04, (0.45, 0, 0.12), CREAMM, verts=14)
    cyl(0.04, 0.3, (-0.45, 0, 0.28), BRASS, verts=6)
    cyl(0.24, 0.04, (-0.45, 0, 0.44), CREAMM, verts=14)
    for i in range(6):
        a = i / 6.0 * math.tau
        ico(0.09, (0.45 + math.cos(a) * 0.2, math.sin(a) * 0.2, 0.2), CRUST[i % 4], 1, sz=0.7)
    for i in range(4):
        a = i / 4.0 * math.tau
        ico(0.08, (-0.45 + math.cos(a) * 0.13, math.sin(a) * 0.13, 0.52), CRUST[(i + 1) % 4], 1, sz=0.8)
    for i in range(5):
        block((0.18, 0.1, 0.07), (-0.72 + i * 0.0, -0.3 + i * 0.0, 0.0), CREAMM) if False else None
    ico(0.1, (-0.45, 0, 0.55), CRUST[3], 1)
    export("cafe_pastry")

def pendant():
    SHADE = mat("PendantShade", "b9b4aa", 0.45)
    cyl(0.012, 2.4, (0, 0, 1.8), CHROME, verts=6)
    cone(0.42, 0.1, 0.26, (0, 0, 0.72), SHADE, verts=18)
    cyl(0.43, 0.03, (0, 0, 0.58), CHROME, verts=18)
    ico(0.14, (0, 0, 0.56), BULB, 1)
    export("cafe_pendant")

PEARL = mat("LoungePearl", "cfc8bb", 0.35)
GLOW = mat("LoungeGlow", "ffd596", 0.3, 0.0, 1.3)
SKY = mat("LoungePane", "6f9fb4", 0.1, 0.2)
PEACH = mat("LoungePeach", "f2a58e", 0.7)
SLAT = mat("LoungeSlat", "c79a62", 0.6)

def squash(o, sx=1.0, sy=1.0, sz=1.0):
    for v in o.data.vertices:
        v.co.x *= sx
        v.co.y *= sy
        v.co.z *= sz

def oval_window(x, y, z, w, h, depth=0.1):
    # an oval porthole on the wall plane (facing -Y): pane + white ring frame
    bpy.ops.mesh.primitive_cylinder_add(vertices=24, radius=0.5, depth=depth, location=(x, y, z), rotation=(math.pi / 2, 0, 0))
    o = bpy.context.active_object
    squash(o, w, 1.0, h)
    finish(o, SKY)
    bpy.ops.mesh.primitive_torus_add(major_radius=0.5, minor_radius=0.045, major_segments=24, minor_segments=6, location=(x, y - depth / 2, z), rotation=(math.pi / 2, 0, 0))
    o = bpy.context.active_object
    squash(o, w, 1.0, h)
    finish(o, PEARL)

def pill(x, y, z, w, h):
    block((w, 0.08, h), (x, y, z), GLOW, 0.035)

def table():
    cyl(0.62, 0.07, (0, 0, 0.74), PEARL, verts=24)
    cyl(0.64, 0.025, (0, 0, 0.72), CHROME, verts=24)
    cyl(0.07, 0.7, (0, 0, 0.36), CHROME, verts=10)
    cyl(0.34, 0.03, (0, 0, 0.015), CHROME, verts=20)
    export("cafe_table")

def chair():
    for sx in (-0.19, 0.19):
        for sy in (-0.18, 0.18):
            cyl(0.016, 0.46, (sx, sy, 0.23), CHROME, verts=6)
    cyl(0.25, 0.07, (0, 0, 0.48), PEACH, verts=14)
    cyl(0.26, 0.02, (0, 0, 0.44), CHROME, verts=14)
    for i in range(7):
        x = -0.2 + i * (0.4 / 6.0)
        block((0.04, 0.03, 0.34), (x, 0.24 - abs(x) * 0.25, 0.75), SLAT, 0.01)
    block((0.46, 0.03, 0.03), (0, 0.22, 0.93), CHROME)
    cyl(0.016, 0.42, (-0.22, 0.2, 0.7), CHROME, verts=6)
    cyl(0.016, 0.42, (0.22, 0.2, 0.7), CHROME, verts=6)
    export("cafe_chair")

def booth():
    # curved white bench wrapping round a table at the origin, on the +Y side (-Z in Godot), glowing under the seat
    n = 9
    R = 1.9
    for i in range(n):
        a = math.radians(-62 + i * (124.0 / (n - 1)))
        x, y = math.sin(a) * R, math.cos(a) * R
        rot = (0, 0, -a)
        block((0.74, 0.62, 0.42), (x, y, 0.21), PEARL, 0.06, rot)
        block((0.76, 0.5, 0.1), (x * 0.99, y * 0.99, 0.46), PEACH, 0.04, rot)
        block((0.74, 0.16, 0.8), (math.sin(a) * (R + 0.34), math.cos(a) * (R + 0.34), 0.82), PEARL, 0.06, rot)
        block((0.7, 0.03, 0.05), (math.sin(a) * (R - 0.04), math.cos(a) * (R - 0.04), 0.06), GLOW, 0.01, rot)
    export("cafe_booth")

def partition():
    # a tall white wall panel (front faces -Y = +Z in Godot): oval portholes and glowing pills like the reference
    block((2.5, 0.22, 3.4), (0, 0, 1.7), PEARL, 0.06)
    block((2.7, 0.3, 0.12), (0, 0, 0.06), GLOW, 0.02)
    block((2.7, 0.3, 0.2), (0, 0, 3.44), PEARL, 0.05)
    oval_window(0, -0.12, 2.0, 1.05, 1.45)
    pill(-0.98, -0.12, 1.9, 0.1, 1.2)
    pill(0.98, -0.12, 1.9, 0.1, 1.2)
    pill(0, -0.12, 0.45, 0.9, 0.06)
    export("cafe_partition")

def ringlight():
    # round ceiling canopy: glowing oval ring and a pale disc with a small hub, hung on four cables
    bpy.ops.mesh.primitive_torus_add(major_radius=3.0, minor_radius=0.25, major_segments=32, minor_segments=8, location=(0, 0, 0))
    o = bpy.context.active_object
    squash(o, 1.0, 1.0, 0.6)
    finish(o, PEARL)
    bpy.ops.mesh.primitive_cylinder_add(vertices=32, radius=2.9, depth=0.08, location=(0, 0, -0.04))
    finish(bpy.context.active_object, GLOW)
    cyl(1.1, 0.12, (0, 0, -0.12), PEARL, verts=24)
    cyl(0.55, 0.14, (0, 0, -0.2), CHROME, verts=12)
    for i in range(4):
        a = math.radians(45 + i * 90)
        cyl(0.015, 3.0, (math.cos(a) * 2.7, math.sin(a) * 2.7, 1.5), CHROME, verts=5)
    export("cafe_ringlight")


def alcove():
    # back-bar alcove (5 m wide, 4.4 m tall): pearl frame, glowing arch, two lit shelves with bottles
    block((0.8, 0.55, 4.4), (-2.1, 0, 2.2), PEARL, 0.05)
    block((0.8, 0.55, 4.4), (2.1, 0, 2.2), PEARL, 0.05)
    block((5.0, 0.55, 0.9), (0, 0, 3.95), PEARL, 0.08)
    block((3.4, 0.12, 3.5), (0, 0.2, 1.95), CREAMM, 0.02)
    block((0.07, 0.12, 3.4), (-1.65, 0.1, 1.9), GLOW)
    block((0.07, 0.12, 3.4), (1.65, 0.1, 1.9), GLOW)
    block((3.4, 0.12, 0.07), (0, 0.1, 3.55), GLOW)
    cols = ["8a4b3a", "d9b44a", "3f6f4a", "b0b6bb", "6a3a2a", "caa86a"]
    for lvl, z in enumerate((1.55, 2.5)):
        block((3.3, 0.34, 0.06), (0, 0.0, z), SLAT, 0.01)
        block((3.2, 0.05, 0.05), (0, -0.18, z - 0.06), GLOW)
        for i in range(9):
            x = -1.45 + i * 0.36
            h = 0.3 + ((i * 7 + lvl * 3) % 4) * 0.06
            cyl(0.06, h, (x, 0.0, z + 0.03 + h / 2), mat("Bottle%d" % ((i + lvl * 2) % 6), cols[(i + lvl * 2) % 6], 0.35, 0.1), verts=8)
    export("cafe_alcove")

def wallpanel():
    # tall pearl wall panel with two tall oval windows and glowing pills
    block((2.5, 0.22, 4.4), (0, 0, 2.2), PEARL, 0.05)
    block((2.7, 0.3, 0.14), (0, 0, 0.07), GLOW, 0.02)
    block((2.7, 0.3, 0.22), (0, 0, 4.4), PEARL, 0.05)
    oval_window(-0.58, -0.12, 2.5, 0.85, 2.0)
    oval_window(0.58, -0.12, 2.5, 0.85, 2.0)
    pill(0, -0.12, 2.5, 0.12, 1.5)
    export("cafe_wallpanel")

def fin():
    # low freestanding oval-window screen to close the gaps between bays
    block((1.6, 0.16, 2.2), (0, 0, 1.1), PEARL, 0.05)
    oval_window(0, -0.09, 1.4, 0.8, 1.1)
    pill(0, -0.09, 0.3, 0.8, 0.05)
    export("cafe_fin")

try:
    espresso(); grinder(); pastry(); pendant(); table(); chair(); booth(); partition(); ringlight(); fin(); alcove(); wallpanel()
    print("HARBOR_CAFE DONE")
except Exception:
    import traceback
    print("HARBOR_CAFE ERROR\n" + traceback.format_exc())

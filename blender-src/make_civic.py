# Harbor City Civic Center generator (v0.19). Original procedural low-poly models, no outside assets.
# Run from the repo root:  blender --background --factory-startup --python blender-src/make_civic.py
# Each model is ONE joined mesh, origin at the ground centre, front facing -Y in Blender (+Z in Godot).
import bpy, math, os
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_src = (ROOT / "blender-src/make_downtown.py").read_text()
exec(_src.split("# ---------- towers ----------")[0])

HOSP = mat("HospitalWall", "f4f6f7", 0.8)
HRED = mat("HospitalRed", "d33a3a", 0.6)
BRICK = mat("SchoolBrick", "c4703f", 0.9)
SCHOOLY = mat("SchoolYellow", "f2c94c", 0.8)
HOTELW = mat("HotelWall", "f6e3c2", 0.85)
HOTELB = mat("HotelBlue", "3f7fb0", 0.6)

def windows_row(w, y, z, n, m, sx=1.6, sz=1.3):
    for i in range(n):
        x = -w / 2 + (i + 0.5) * w / n
        block((sx, 0.2, sz), (x, y, z), m)

def hospital():
    w, d, h = 30, 22, 12
    block((w, d, h), (0, 0, h / 2), HOSP)
    block((w + 0.4, d + 0.4, 0.5), (0, 0, h + 0.25), STONE2)
    for z in (4.5, 8.0, 11.0):
        windows_row(w - 4, -d / 2 - 0.05, z - 1.0, 9, GLASS_B)
        windows_row(w - 4, d / 2 + 0.05, z - 1.0, 9, GLASS_B)
    block((8, 0.3, 3.4), (0, -d / 2 - 0.1, 1.7), GLASS_L)
    block((12, 4, 0.35), (0, -d / 2 - 2.0, 3.8), HRED)
    for x in (-5.5, 5.5):
        cyl(0.18, 3.6, (x, -d / 2 - 3.6, 1.8), STEEL, verts=6)
    # Red crosses on the front and on the roof sign.
    for (x, z) in ((-10, 9), (10, 9)):
        block((2.6, 0.25, 0.8), (x, -d / 2 - 0.2, z), HRED)
        block((0.8, 0.25, 2.6), (x, -d / 2 - 0.2, z), HRED)
    block((5, 0.5, 5), (0, -6, h + 2.8), HOSP)
    block((3.4, 0.6, 1.0), (0, -6.3, h + 2.8), HRED)
    block((1.0, 0.6, 3.4), (0, -6.3, h + 2.8), HRED)
    # Rooftop helipad.
    cyl(5.5, 0.2, (0, 4, h + 0.6), DARK, verts=24)
    block((0.6, 0.05, 3.2), (-1.0, 4, h + 0.72), CREAM if "CREAM" in globals() else WHITE)
    block((0.6, 0.05, 3.2), (1.0, 4, h + 0.72), WHITE)
    block((2.0, 0.05, 0.6), (0, 4, h + 0.72), WHITE)
    # Ambulance bay on the side.
    block((8, 7, 4.2), (w / 2 + 4, 2, 2.1), STONE2)
    block((6.6, 0.2, 3.4), (w / 2 + 4, -1.6, 1.7), DARK)
    export("hospital")

def school():
    w, d, h = 30, 14, 9
    block((w, d, h), (0, 0, h / 2), BRICK)
    block((w + 0.5, d + 0.5, 0.6), (0, 0, h + 0.3), WHITE)
    for z in (2.6, 6.4):
        windows_row(w - 6, -d / 2 - 0.05, z, 8, GLASS_D, 2.0, 1.6)
        windows_row(w - 6, d / 2 + 0.05, z, 8, GLASS_D, 2.0, 1.6)
    # Entrance with steps and a canopy.
    block((7, 0.3, 3.2), (0, -d / 2 - 0.1, 1.6), GLASS_L)
    for k in range(3):
        block((9 - k, 1.2, 0.2), (0, -d / 2 - 1.8 + k * 0.4, 0.1 + k * 0.2), CONC)
    block((9, 3, 0.4), (0, -d / 2 - 1.5, 3.6), SCHOOLY)
    # Clock tower.
    block((4, 4, 6), (0, 0, h + 3), BRICK)
    cyl(1.3, 0.3, (0, -2.05, h + 4), WHITE, rot=(math.pi / 2, 0, 0), verts=16)
    block((0.15, 0.1, 0.9), (0, -2.25, h + 4.2), DARK)
    block((0.7, 0.1, 0.15), (0.3, -2.25, h + 4.0), DARK)
    cone(3.2, 0.2, 2.6, (0, 0, h + 7.3), HRED, verts=4)
    # Flagpole.
    cyl(0.08, 9, (w / 2 - 2, -d / 2 - 4, 4.5), STEEL, verts=6)
    block((2.2, 0.06, 1.3), (w / 2 - 0.85, -d / 2 - 4, 8.2), HOTELB)
    export("school")

def hotel():
    w, d, h = 30, 16, 14
    block((w, d, h), (0, 0, h / 2), HOTELW)
    block((w + 0.6, d + 0.6, 0.5), (0, 0, h + 0.25), HOTELB)
    for f in range(4):
        z = 3.2 + f * 3.2
        for i in range(6):
            x = -w / 2 + (i + 0.5) * w / 6
            block((3.2, 0.2, 1.8), (x, -d / 2 - 0.05, z + 0.4), GLASS_B)
            block((3.8, 1.3, 0.15), (x, -d / 2 - 0.65, z - 0.5), WHITE)
            block((3.8, 0.06, 0.8), (x, -d / 2 - 1.28, z - 0.05), STEEL)
    block((10, 0.3, 3.0), (0, -d / 2 - 0.1, 1.5), GLASS_L)
    block((12, 3.5, 0.4), (0, -d / 2 - 1.8, 3.2), HOTELB)
    # Rooftop sign frame (the name is a label in the game).
    for x in (-8, 8):
        cyl(0.15, 3, (x, -2, h + 1.5), STEEL, verts=6)
    block((20, 0.4, 2.6), (0, -2, h + 3.6), HOTELB)
    export("hotel")

MARBLE = mat("BankMarble", "ece6d8", 0.6)
GOLDT = mat("BankGold", "d9b44a", 0.35, 0.6)
FIRERED = mat("FireRed", "c8382f", 0.7)
LIBTEAL = mat("LibraryTeal", "2f8a8c", 0.6)

def bank():
    w, d, h = 28, 18, 11
    block((w, d, h), (0, 0, h / 2), MARBLE)
    block((w + 2, d + 4, 1.0), (0, -1, 0.5), STONE2)
    for k in range(3):
        block((w - 4 - k * 2, 1.2, 0.3), (0, -d / 2 - 1.8 - k * 0.6 + 1.2, 0.15 + k * 0.3), STONE2)
    for i in range(6):
        x = -w / 2 + 3 + i * (w - 6) / 5
        cyl(0.7, h - 1.5, (x, -d / 2 - 1.6, (h - 1.5) / 2 + 1.0), MARBLE, verts=12)
    block((w, 4, 1.0), (0, -d / 2 - 1.2, h + 0.4), MARBLE)
    for k in range(4):
        block((w - 2 - k * 6.5, 4, 0.7), (0, -d / 2 - 1.2, h + 1.25 + k * 0.7), MARBLE)
    block((6, 0.3, 4.2), (0, -d / 2 - 0.1, 3.1), DARK)
    block((10, 0.3, 1.2), (0, -d / 2 - 3.4, h - 0.6), GOLDT)
    export("bank")

def fire_station():
    w, d, h = 24, 14, 8
    block((w, d, h), (0, 0, h / 2), FIRERED)
    block((w + 0.4, d + 0.4, 0.5), (0, 0, h + 0.25), STONE2)
    for x in (-7.5, 0, 7.5):
        block((6, 0.3, 5), (x, -d / 2 - 0.1, 2.5), mat("GarageDoor", "e8e6dd", 0.7))
        for z in (1.2, 2.4, 3.6):
            block((6, 0.35, 0.08), (x, -d / 2 - 0.12, z), STONE2)
    block((4, 4, 14), (w / 2 + 2, 2, 7), FIRERED)
    block((4.6, 4.6, 0.6), (w / 2 + 2, 2, 14.3), STONE2)
    # Fire truck parked out front.
    block((2.4, 7, 2.0), (-7.5, -d / 2 - 5, 1.4), FIRERED)
    block((2.4, 2.4, 1.2), (-7.5, -d / 2 - 7.6, 3.0), FIRERED)
    block((2.42, 0.1, 0.8), (-7.5, -d / 2 - 8.82, 3.0), GLASS_D)
    block((0.4, 6, 0.2), (-7.5, -d / 2 - 4.2, 2.6), STEEL)
    for y in (-d / 2 - 2.8, -d / 2 - 7.4):
        for x in (-8.7, -6.3):
            cyl(0.5, 0.4, (x, y, 0.5), DARK, rot=(0, math.pi / 2, 0), verts=10)
    export("fire_station")

def library():
    w, d, h = 30, 16, 10
    block((w, d, h), (0, 0, h / 2), CREAM if "CREAM" in globals() else WHITE)
    block((w - 2, 0.3, h - 2), (0, -d / 2 - 0.05, h / 2), GLASS_B)
    for i in range(7):
        x = -w / 2 + 2 + i * (w - 4) / 6
        block((0.5, 0.6, h), (x, -d / 2 - 0.2, h / 2), LIBTEAL)
    block((w + 2, d + 2, 0.8), (0, 0, h + 0.4), LIBTEAL)
    # A giant open book on the roof.
    for side in (-1, 1):
        bpy.ops.mesh.primitive_cube_add(size=1, location=(side * 2.2, -2, h + 2.2), rotation=(0, side * 0.35, 0))
        o = bpy.context.active_object
        o.scale = (4.2, 3.0, 0.25)
        bpy.ops.object.transform_apply(rotation=True, scale=True)
        finish(o, WHITE)
    block((0.3, 3.0, 0.6), (0, -2, h + 1.5), LIBTEAL)
    export("library")

try:
    hospital(); school(); hotel(); bank(); fire_station(); library()
    print("HARBOR_CIVIC DONE")
except Exception:
    import traceback
    print("HARBOR_CIVIC ERROR\n" + traceback.format_exc())

# Harbor Raceway generator (v0.21). Original procedural low-poly models, no outside assets.
# Run from the repo root:  blender --background --factory-startup --python blender-src/make_raceway.py
# Each model is ONE joined mesh, origin at the ground centre, front facing -Y in Blender (+Z in Godot).
import bpy, math, os, random
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_src = (ROOT / "blender-src/make_downtown.py").read_text()
exec(_src.split("# ---------- towers ----------")[0])

PITW = mat("PitWhite", "eef0f1", 0.7)
PITO = mat("PitOrange", "ff7a1a", 0.6)
PITG = mat("PitGarage", "3a4048", 0.8)
INNER = mat("GarageInside", "1c2026", 0.9)
SEAT = mat("SeatBlue", "2f5fa8", 0.7)
ROOF = mat("StandRoof", "dfe3e6", 0.5, 0.2)
LIGHT_R = mat("StartRed", "ff2a2a", 0.3, 0.0, 3.0)
CROWD = [mat("CrowdRed", "d33a3a", 0.9), mat("CrowdWhite", "eef1f2", 0.9), mat("CrowdYellow", "f2d046", 0.9), mat("CrowdBlue", "2f5fd0", 0.9), mat("CrowdGreen", "52c79a", 0.9)]

def pit_building():
    # 150 m long pit building: 15 garages on the front (-Y, facing the pit lane), hospitality floor above,
    # roof terrace, and a race control tower at the +X end.
    w, d, h = 150, 14, 10
    block((w, d, h), (0, 0, h / 2), PITW)
    n = 15
    for i in range(n):
        x = -w / 2 + (i + 0.5) * w / n
        block((7.6, 0.3, 4.6), (x, -d / 2 - 0.05, 2.3), INNER)
        block((7.8, 0.35, 0.35), (x, -d / 2 - 0.1, 4.75), PITO)
        block((1.6, 0.36, 1.0), (x, -d / 2 - 0.12, 5.6), PITG)
    block((w, 0.3, 2.6), (0, -d / 2 - 0.05, 7.4), GLASS_B)
    block((w + 0.6, 3.0, 0.3), (0, -d / 2 - 1.2, 6.0), PITG)
    block((w + 0.6, 0.12, 1.0), (0, -d / 2 - 2.6, 6.65), STEEL)
    block((w + 1.0, d + 1.0, 0.6), (0, 0, h + 0.3), PITG)
    block((w, 0.12, 1.0), (0, -d / 2 + 0.2, h + 1.1), STEEL)
    for i in range(10):
        x = -w / 2 + 8 + i * (w - 16) / 9
        block((5, 3, 0.2), (x, 0, h + 3.0), ROOF)
        for dx in (-2.2, 2.2):
            cyl(0.08, 2.4, (x + dx, 0, h + 1.8), STEEL, verts=6)
    # Race control tower.
    tx = w / 2 - 6
    block((10, 10, 22), (tx, 0, 11), PITW)
    block((12, 12, 4), (tx, 0, 24), GLASS_D)
    block((13, 13, 0.6), (tx, 0, 26.3), PITO)
    cyl(0.1, 6, (tx + 3, 2, 29.6), STEEL, verts=6)
    export("pit_building")

def grandstand():
    # 100 m covered grandstand: 9 tiers rising to the back (+Y), seated crowd, cantilever roof.
    w, tiers = 100, 9
    random.seed(21)
    for k in range(tiers):
        y = -6 + k * 1.4
        z = 0.6 + k * 0.9
        block((w, 1.4, z * 2), (0, y, z), CONC)
        block((w, 0.5, 0.35), (0, y - 0.2, z * 2 + 0.17), SEAT)
        x = -w / 2 + 0.7
        while x < w / 2 - 0.5:
            if random.random() < 0.72:
                block((0.5, 0.45, 0.75), (x, y + 0.1, z * 2 + 0.55), CROWD[random.randrange(len(CROWD))])
            x += 1.0
    back = -6 + tiers * 1.4
    block((w, 0.6, 18), (0, back, 9), CONC)
    for i in range(9):
        x = -w / 2 + 2 + i * (w - 4) / 8
        block((0.6, 0.6, 18), (x, back - 0.4, 9), STEEL)
        block((0.5, 14, 0.6), (x, back - 7, 17.6), STEEL, 0.0, (math.radians(-8), 0, 0))
    block((w + 2, 16, 0.4), (0, back - 7.2, 18.1), ROOF, 0.0, (math.radians(-8), 0, 0))
    block((w, 0.2, 1.2), (0, -6.8, 1.0), PITO)
    export("grandstand")

def start_gantry():
    # Start light gantry spanning 24 m (along X), lights facing -Y (towards the grid).
    for x in (-12, 12):
        block((0.8, 0.8, 8.5), (x, 0, 4.25), PITG)
    block((24.8, 1.2, 1.6), (0, 0, 7.6), PITG)
    block((24.6, 0.3, 0.8), (0, -0.7, 8.8), PITO)
    for i in range(5):
        x = -4 + i * 2
        block((1.4, 0.4, 1.4), (x, -0.75, 7.5), DARK)
        cyl(0.42, 0.2, (x, -0.98, 7.75), LIGHT_R, rot=(math.pi / 2, 0, 0), verts=12)
        cyl(0.42, 0.2, (x, -0.98, 7.25), LIGHT_R, rot=(math.pi / 2, 0, 0), verts=12)
    export("start_gantry")

def footbridge():
    # Spectator footbridge spanning 54 m over the track (along X), deck at 7 m.
    for x in (-26, 26):
        block((5, 6, 7), (x, 0, 3.5), CONC)
        for k in range(6):
            block((5, 1.0, 0.25), (x + (3 if x > 0 else -3), -2.5 + k * 1.0, 0.6 + k * 1.1), CONC)
    block((54, 4, 0.8), (0, 0, 7.4), PITW)
    block((54, 0.15, 1.1), (0, -2, 8.35), STEEL)
    block((54, 0.15, 1.1), (0, 2, 8.35), STEEL)
    block((40, 0.3, 2.2), (0, -2.15, 6.2), PITO)
    export("footbridge")

try:
    pit_building(); grandstand(); start_gantry(); footbridge()
    print("HARBOR_RACEWAY DONE")
except Exception:
    import traceback
    print("HARBOR_RACEWAY ERROR\n" + traceback.format_exc())

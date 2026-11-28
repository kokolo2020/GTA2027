# Bonkers City bosses (v0.77.1): smoother, more detailed boss parts made in Blender. Original procedural models.
# Run from the repo root:  blender --background --factory-startup --python blender-src/make_bosses.py
# Every part is its own .glb (boss_<name>.glb) with its pivot at the origin; boss_models.gd assembles and animates them.
# Coordinates in this file are GODOT style (x right, y up, z forward); B() converts to Blender.
import bpy, bmesh, math, os, random, traceback
from pathlib import Path
from mathutils import Vector

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_src = (ROOT / "blender-src/make_downtown.py").read_text()
exec(_src.split("# ---------- towers ----------")[0])

def B(p):
    return Vector((p[0], -p[2], p[1]))

def smooth(o):
    for p in o.data.polygons:
        p.use_smooth = True

def M(name, hexcol, rough=0.7, emit=0.0):
    return mat(name, hexcol, rough, 0.0, emit)

def blob(c, r, m, s=(1, 1, 1), sub=2, jit=0.0, seed=1, flat=False):
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=sub, radius=r, location=B(c))
    o = bpy.context.active_object
    rng = random.Random(seed)
    for v in o.data.vertices:
        co = v.co.copy()
        k = 1.0 + (rng.uniform(-jit, jit) if jit else 0.0)
        v.co = Vector((co.x * s[0] * k, co.y * s[2] * k, co.z * s[1] * k))
    if not flat:
        smooth(o)
    return finish(o, m)

def limb(p0, p1, r0, r1, m, verts=8, flat=False):
    a, b = B(p0), B(p1)
    d = b - a
    bpy.ops.mesh.primitive_cone_add(vertices=verts, radius1=r0, radius2=r1, depth=max(d.length, 0.001), location=(a + b) / 2)
    o = bpy.context.active_object
    o.rotation_euler = d.to_track_quat("Z", "Y").to_euler()
    if not flat:
        smooth(o)
    return finish(o, m)

def ring(c, R, r, m, rx=0.0, rz=0.0, segs=28, rsegs=8):
    bpy.ops.mesh.primitive_torus_add(major_radius=R, minor_radius=r, major_segments=segs, minor_segments=rsegs, location=B(c))
    o = bpy.context.active_object
    o.rotation_euler = (rx, 0.0, rz)
    smooth(o)
    return finish(o, m)

def slab(size, c, m, rot=(0, 0, 0), bevel=0.02):
    # size is (width x, height y, depth z) in Godot axes
    return block((size[0], size[2], size[1]), B(c), m, bevel, rot)

def poly(pts, m, faces=None):
    vs = [tuple(B(p)) for p in pts]
    if faces is None:
        faces = [list(range(len(vs)))]
    n = len(vs)
    allf = [list(f) for f in faces] + [[i + n for i in reversed(f)] for f in faces]
    me = bpy.data.meshes.new("poly")
    me.from_pydata(vs + vs, [], allf)
    me.update()
    o = bpy.data.objects.new("poly", me)
    bpy.context.collection.objects.link(o)
    return finish(o, m)

# ---------------- the Ember Dragon (Paris) ----------------
RED = M("DrRed", "c4302b", 0.55)
RED2 = M("DrRed2", "9c1f24", 0.6)
DARK = M("DrDark", "5e0f1e", 0.6)
BELLY = M("DrBelly", "f2b84a", 0.6)
BONE = M("DrBone", "f4ead0", 0.5)
FIRE = M("DrFire", "ff7a1a", 0.4, 3.0)
EYEY = M("DrEye", "ffe14a", 0.3, 3.0)
MEMB = M("DrMemb", "c8325a", 0.6)
MEMB2 = M("DrMemb2", "ea6a88", 0.6)

def dragon_body():
    blob((0, 1.05, 0), 0.5, RED, (0.9, 0.8, 1.5), sub=3)
    blob((0, 0.86, 0.12), 0.46, BELLY, (0.74, 0.55, 1.4), sub=2)
    for k in range(7):
        z = 0.7 - 0.2 * k
        slab((0.5, 0.03, 0.05), (0, 0.6, z), DARK)
    blob((0, 1.2, 0.62), 0.42, RED, sub=2)
    # curved neck up to the head
    for i in range(7):
        t = i / 6.0
        y = 1.3 + 0.8 * t
        z = 0.62 + 0.72 * t * t + 0.1 * t
        rad = 0.42 - 0.2 * t
        blob((0, y, z), rad, RED, sub=2)
        blob((0, y - rad * 0.55, z + rad * 0.45), rad * 0.55, BELLY, (0.8, 0.5, 0.7), sub=1)
        limb((0, y + rad * 0.8, z - 0.05), (0, y + rad * 0.8 + 0.3 - 0.1 * t, z - 0.1 - 0.12), 0.08, 0.0, BONE, verts=6)
    # spine spikes along the back and the hips
    for k in range(7):
        z = 0.55 - 0.3 * k
        limb((0, 1.45, z), (0, 1.8 - 0.04 * k, z - 0.18), 0.09, 0.0, BONE, verts=6)
    # haunches and shoulders
    for sx in (-1, 1):
        blob((sx * 0.46, 0.95, -0.4), 0.4, RED2, (0.8, 1.0, 1.1), sub=2)
        blob((sx * 0.44, 1.05, 0.56), 0.36, RED2, (0.8, 1.0, 1.0), sub=2)
        for z in (0.55, -0.4):
            limb((sx * 0.46, 0.85, z), (sx * 0.46, 0.25, z + 0.1), 0.3, 0.19, RED, verts=10)
            blob((sx * 0.46, 0.42, z + 0.12), 0.24, RED2, sub=2)
            blob((sx * 0.46, 0.1, z + 0.18), 0.25, DARK, (1.0, 0.45, 1.55), sub=2)
            for dx in (-0.11, 0.0, 0.11):
                limb((sx * 0.46 + dx, 0.08, z + 0.34), (sx * 0.46 + dx * 1.3, 0.05, z + 0.6), 0.05, 0.0, BONE, verts=6)
    export("boss_dragon_body")

def dragon_head():
    blob((0, 0, 0), 0.27, RED, (0.95, 0.82, 1.3), sub=3)
    blob((0, -0.03, 0.36), 0.17, RED, (0.9, 0.7, 1.5), sub=2)
    for sx in (-1, 1):
        blob((sx * 0.06, 0.0, 0.62), 0.035, DARK, sub=1)
        blob((sx * 0.14, 0.11, 0.17), 0.085, DARK, (1.2, 0.6, 1.7), sub=1)
        blob((sx * 0.15, 0.07, 0.2), 0.055, EYEY, sub=1)
        blob((sx * 0.15, 0.07, 0.25), 0.02, M("DrPupil", "1a0a0a", 0.4), (0.5, 1.6, 0.5), sub=1)
        # swept-back horns in two curved pieces
        limb((sx * 0.12, 0.18, -0.1), (sx * 0.2, 0.46, -0.36), 0.075, 0.05, BONE, verts=7)
        limb((sx * 0.2, 0.46, -0.36), (sx * 0.3, 0.66, -0.7), 0.05, 0.0, BONE, verts=7)
        # cheek spikes
        limb((sx * 0.2, -0.03, -0.05), (sx * 0.42, -0.08, -0.3), 0.05, 0.0, BONE, verts=6)
        limb((sx * 0.18, 0.04, -0.1), (sx * 0.34, 0.2, -0.28), 0.04, 0.0, BONE, verts=6)
        for k in range(5):
            limb((sx * 0.1, -0.1, 0.18 + 0.09 * k), (sx * 0.1, -0.2, 0.2 + 0.09 * k), 0.022, 0.0, BONE, verts=5)
    limb((0, 0.14, 0.05), (0, 0.3, -0.25), 0.06, 0.0, BONE, verts=6)
    blob((0, -0.1, 0.4), 0.1, FIRE, (0.9, 0.5, 1.3), sub=1)
    export("boss_dragon_head")

def dragon_jaw():
    # pivot at the jaw hinge; the head puts it at (0,-0.12,0.05)
    blob((0, -0.02, 0.28), 0.12, DARK, (1.0, 0.45, 2.1), sub=2)
    blob((0, 0.0, 0.3), 0.07, FIRE, (0.9, 0.3, 2.0), sub=1)
    for sx in (-1, 1):
        for k in range(4):
            limb((sx * 0.09, 0.0, 0.14 + 0.1 * k), (sx * 0.09, 0.11, 0.15 + 0.1 * k), 0.022, 0.0, BONE, verts=5)
    limb((0, -0.04, 0.5), (0, -0.14, 0.52), 0.05, 0.0, DARK, verts=6)
    export("boss_dragon_jaw")

def dragon_wing(sx, name):
    S = (0, 0, 0)
    E = (sx * 1.0, 0.45, -0.05)
    W = (sx * 2.3, 0.15, -0.1)
    T1 = (sx * 2.65, -0.15, -1.5)
    T2 = (sx * 1.95, -0.2, -1.95)
    T3 = (sx * 1.2, -0.2, -1.75)
    A = (sx * 0.25, -0.08, -1.05)
    limb(S, E, 0.11, 0.075, DARK, verts=8)
    limb(E, W, 0.075, 0.05, DARK, verts=8)
    limb(W, (sx * 2.6, -0.05, 0.12), 0.05, 0.0, BONE, verts=6)
    limb(W, (sx * 2.45, 0.35, 0.05), 0.04, 0.0, BONE, verts=6)
    for t in (T1, T2, T3):
        limb(W, t, 0.045, 0.012, DARK, verts=6)
    limb(S, A, 0.05, 0.02, DARK, verts=6)
    poly([S, E, W, T3, A], MEMB, faces=[[0, 1, 2, 3, 4]])
    poly([W, T1, T2], MEMB2)
    poly([W, T2, T3], MEMB)
    # scalloped trailing edge: little pale claws at the finger tips
    for t in (T1, T2, T3):
        limb(t, (t[0] + sx * 0.05, t[1] - 0.05, t[2] - 0.18), 0.03, 0.0, BONE, verts=5)
    export(name)

def dragon_tail():
    limb((0, 0, 0.25), (0, 0, -0.25), 0.3, 0.27, RED, verts=10)
    blob((0, 0, -0.25), 0.27, RED, sub=2)
    blob((0, -0.18, 0.0), 0.2, BELLY, (0.8, 0.5, 1.6), sub=1)
    limb((0, 0.26, 0.05), (0, 0.55, -0.12), 0.08, 0.0, BONE, verts=6)
    export("boss_dragon_tail")

def dragon_tailtip():
    blob((0, 0, 0.1), 0.2, RED, (0.8, 0.8, 1.6), sub=2)
    limb((0, 0, -0.1), (0, 0, -0.75), 0.18, 0.0, DARK, verts=8)
    for sx in (-1, 1):
        limb((0, 0, -0.1), (sx * 0.35, 0.05, -0.55), 0.09, 0.0, BONE, verts=6)
    limb((0, 0.1, 0.0), (0, 0.4, -0.3), 0.07, 0.0, BONE, verts=6)
    export("boss_dragon_tailtip")

# ---------------- the Neon Serpent (Tokyo) ----------------
PUR = M("SeBody", "3a1766", 0.5)
PUR2 = M("SeBand", "8a2cb0", 0.5)
NEON = M("SeNeon", "ff5ad0", 0.4, 2.6)
CYAN = M("SeCyan", "3af0ff", 0.4, 3.0)
PALE = M("SeFang", "f6f2e6", 0.4)

def serpent_head():
    blob((0, 0, 0.05), 0.3, PUR, (0.9, 0.7, 1.4), sub=3)
    blob((0, -0.03, 0.34), 0.18, PUR, (0.9, 0.65, 1.4), sub=2)
    # hood behind the head: dark inside, glowing rim, eye-spot markings
    blob((0, -0.06, -0.3), 0.55, NEON, (1.55, 1.42, 0.17), sub=3)
    blob((0, -0.06, -0.19), 0.42, PUR, (1.45, 1.32, 0.15), sub=3)
    for sx in (-1, 1):
        blob((sx * 0.36, -0.1, -0.1), 0.11, CYAN, (1.0, 1.25, 0.25), sub=1)
        blob((sx * 0.36, -0.1, -0.08), 0.05, M("SePupil", "12061f", 0.4), (1.0, 1.3, 0.3), sub=1)
        blob((sx * 0.16, 0.1, 0.27), 0.065, CYAN, sub=1)
        blob((sx * 0.16, 0.1, 0.32), 0.022, M("SePupil", "12061f", 0.4), (0.5, 1.6, 0.5), sub=1)
        limb((sx * 0.09, -0.12, 0.42), (sx * 0.09, -0.44, 0.52), 0.045, 0.0, PALE, verts=6)
    for k in range(11):
        a = math.radians(-70 + 18 * k)
        limb((math.sin(a) * 0.78, math.cos(a) * 0.72 - 0.08, -0.3), (math.sin(a) * 0.95, math.cos(a) * 0.92 - 0.08, -0.34), 0.05, 0.0, NEON, verts=5)
    limb((0, -0.17, 0.5), (0, -0.17, 0.95), 0.016, 0.012, M("SeTongue", "ff2a4a", 0.4, 1.5), verts=5)
    for sx in (-1, 1):
        limb((0, -0.17, 0.95), (sx * 0.1, -0.17, 1.12), 0.012, 0.0, M("SeTongue", "ff2a4a", 0.4, 1.5), verts=4)
    export("boss_serpent_head")

def serpent_seg(band, name):
    blob((0, 0, 0), 0.31, PUR2 if band else PUR, sub=2)
    if band:
        blob((0, 0, 0.27), 0.07, NEON, (1.0, 1.4, 0.5), sub=1)
        ring((0, 0, 0), 0.31, 0.03, NEON, rx=math.pi / 2)
    else:
        for sx in (-1, 1):
            blob((sx * 0.2, 0.0, 0.2), 0.06, PUR2, sub=1)
    export(name)

def serpent_coil():
    ring((0, 0.28, 0), 1.0, 0.5, PUR, segs=36, rsegs=14)
    ring((0, 0.66, 0), 0.78, 0.3, PUR2, segs=32, rsegs=12)
    for k in range(24):
        ca = k * math.tau / 24
        blob((math.cos(ca) * 1.0, 0.72, math.sin(ca) * 1.0), 0.11, PUR2, (1.0, 0.5, 1.0), sub=1)
    for k in range(12):
        ca = k * math.tau / 12 + 0.1
        blob((math.cos(ca) * 0.75, 0.97, math.sin(ca) * 0.75), 0.075, NEON, sub=1)
    limb((0, 0.42, -0.95), (0, 0.18, -2.1), 0.26, 0.0, PUR, verts=10)
    limb((0, 0.2, -2.0), (0, 0.12, -2.45), 0.05, 0.0, NEON, verts=6)
    export("boss_serpent_coil")

# ---------------- the Stone Titan (New York) ----------------
ROCK = M("GoRock", "7d7d86", 0.9)
ROCK2 = M("GoRock2", "5c5c66", 0.9)
MOSS = M("GoMoss", "55873f", 0.9)
LAVA = M("GoLava", "ffb02a", 0.4, 3.0)

def golem_torso():
    blob((0, 0.95, 0), 0.55, ROCK2, (1.0, 0.55, 0.75), sub=2, jit=0.12, seed=3, flat=True)
    blob((0, 1.45, 0), 0.75, ROCK2, (1.0, 0.85, 0.72), sub=2, jit=0.12, seed=4, flat=True)
    blob((0, 1.55, 0.34), 0.5, ROCK, (1.15, 0.85, 0.55), sub=2, jit=0.1, seed=5, flat=True)
    blob((0, 1.45, 0.64), 0.16, LAVA, (1.0, 1.3, 0.8), sub=1, flat=True)
    for k in range(5):
        kk = float(k)
        slab((0.05, 0.4, 0.03), (-0.45 + 0.22 * kk, 1.15 + 0.18 * math.sin(kk * 1.7), 0.52), LAVA, rot=(0, 0.5 - 0.3 * kk, 0), bevel=0.0)
    slab((0.5, 0.05, 0.03), (0, 0.92, 0.42), LAVA, bevel=0.0)
    for sx in (-1, 1):
        blob((sx * 0.86, 1.85, 0), 0.44, ROCK, (1.0, 0.8, 1.0), sub=2, jit=0.14, seed=7 + sx, flat=True)
        blob((sx * 0.92, 2.05, -0.05), 0.22, MOSS, (1.2, 0.5, 1.2), sub=1, jit=0.1, flat=True)
        for k in range(3):
            limb((sx * (0.6 + 0.3 * k), 2.05, -0.1), (sx * (0.62 + 0.3 * k), 2.45 - 0.1 * k, -0.15), 0.1, 0.0, ROCK2, verts=5, flat=True)
        blob((sx * 0.4, 0.22, 0.1), 0.35, ROCK2, (1.0, 0.5, 1.3), sub=1, jit=0.1, seed=9, flat=True)
    for k in range(5):
        limb((-0.6 + 0.3 * k, 1.9, -0.45), (-0.6 + 0.3 * k, 2.5 + 0.12 * (k % 2), -0.8), 0.14, 0.0, ROCK2, verts=5, flat=True)
    blob((0.4, 1.9, 0.3), 0.15, MOSS, (1.2, 0.4, 1.0), sub=1, flat=True)
    export("boss_golem_torso")

def golem_head():
    blob((0, 0, 0), 0.3, ROCK, (1.0, 0.9, 0.95), sub=2, jit=0.1, seed=11, flat=True)
    slab((0.58, 0.1, 0.2), (0, 0.14, 0.2), ROCK2, bevel=0.03)
    blob((0, -0.2, 0.12), 0.2, ROCK2, (1.0, 0.5, 1.0), sub=1, jit=0.1, flat=True)
    blob((0, -0.02, 0.28), 0.07, ROCK, (0.8, 1.2, 1.0), sub=1, flat=True)
    for sx in (-1, 1):
        blob((sx * 0.13, 0.04, 0.27), 0.065, LAVA, sub=1, flat=True)
    for k in range(5):
        ca = k * math.tau / 5
        limb((math.cos(ca) * 0.16, 0.28, math.sin(ca) * 0.12), (math.cos(ca) * 0.2, 0.7 + 0.1 * (k % 2), math.sin(ca) * 0.14), 0.075, 0.0, LAVA, verts=5, flat=True)
    export("boss_golem_head")

def golem_arm(sx, name):
    limb((0, 0, 0), (0, -0.9, 0.04), 0.23, 0.2, ROCK2, verts=7, flat=True)
    blob((0, -0.9, 0.05), 0.29, ROCK, sub=2, jit=0.14, seed=21, flat=True)
    blob((0, -1.42, 0.1), 0.4, ROCK, (1.0, 1.1, 1.0), sub=2, jit=0.14, seed=22, flat=True)
    for k in range(4):
        blob((-0.24 + 0.16 * k, -1.7, 0.32), 0.12, ROCK2, sub=1, jit=0.1, seed=30 + k, flat=True)
    slab((0.05, 0.32, 0.03), (sx * 0.1, -1.35, 0.46), LAVA, rot=(0, 0.4, 0), bevel=0.0)
    for k in range(2):
        limb((sx * 0.12, -1.1 - 0.2 * k, 0.0), (sx * 0.3, -0.95 - 0.2 * k, 0.1), 0.06, 0.0, LAVA, verts=5, flat=True)
    export(name)

def golem_leg():
    blob((0, 0.58, 0), 0.42, ROCK2, (0.78, 1.3, 0.78), sub=2, jit=0.1, seed=41, flat=True)
    blob((0, 0.98, 0.1), 0.3, ROCK, sub=1, jit=0.12, seed=42, flat=True)
    blob((0, 0.1, 0.16), 0.36, ROCK, (0.95, 0.42, 1.35), sub=2, jit=0.08, seed=43, flat=True)
    for dx in (-0.16, 0.0, 0.16):
        blob((dx, 0.08, 0.5), 0.1, ROCK2, sub=1, flat=True)
    blob((0.12, 0.8, 0.28), 0.1, MOSS, (1.3, 0.4, 1.0), sub=1, flat=True)
    export("boss_golem_leg")

# ---------------- the River Kraken (Bangkok) ----------------
TEAL = M("KrTeal", "126060", 0.5)
TEAL2 = M("KrTeal2", "1f9c88", 0.5)
KFIN = M("KrFin", "3affc0", 0.4, 2.4)
KEYE = M("KrEye", "f0fff4", 0.3, 2.2)

def kraken_head():
    blob((0, 1.5, 0), 0.78, TEAL, (1.0, 1.15, 1.0), sub=3)
    blob((0, 1.78, -0.12), 0.55, TEAL2, (1.0, 0.9, 1.0), sub=3)
    for k in range(6):
        limb((0, 2.25 - 0.2 * k, -0.12 - 0.13 * k), (0, 2.7 - 0.2 * k, -0.45 - 0.14 * k), 0.12, 0.0, KFIN, verts=6)
    rng = random.Random(5)
    for k in range(16):
        a = rng.uniform(0, math.tau)
        e = rng.uniform(0.2, 1.1)
        blob((math.cos(a) * math.sin(e) * 0.74, 1.5 + math.cos(e) * 0.88, math.sin(a) * math.sin(e) * 0.74 - 0.05), 0.05, KFIN, sub=1)
    for sx in (-1, 1):
        blob((sx * 0.34, 1.42, 0.6), 0.19, KEYE, sub=2)
        blob((sx * 0.34, 1.42, 0.77), 0.09, M("KrPupil", "0a1414", 0.4), (0.5, 1.4, 0.5), sub=1)
        blob((sx * 0.34, 1.62, 0.56), 0.15, TEAL, (1.4, 0.5, 1.0), sub=1)
        limb((sx * 0.15, 0.88, 0.7), (sx * 0.24, 0.5, 0.9), 0.06, 0.0, BONE, verts=6)
        for k in range(4):
            blob((sx * (0.7), 1.3 + 0.18 * k, 0.1 - 0.12 * k), 0.07, BONE, sub=1)
    blob((0, 0.98, 0.55), 0.27, M("KrMouth", "0b2b2b", 0.6), (1.25, 0.7, 0.9), sub=2)
    limb((0, 0.95, 0.66), (0, 0.72, 0.8), 0.1, 0.0, BONE, verts=6)
    export("boss_kraken_head")

def kraken_tent(light, name):
    blob((0, 0, 0), 0.3, TEAL2 if light else TEAL, sub=2)
    blob((0, -0.22, 0), 0.085, BONE, (1.0, 0.5, 1.0), sub=1)
    if light:
        blob((0, 0.12, 0.2), 0.05, KFIN, sub=1)
    export(name)

def kraken_tentacle():
    # grows along +z (outward), curls up at the tip, suckers underneath; 2.4 long
    pts = []
    n = 12
    for i in range(n + 1):
        t = i / n
        pts.append((0.0, 0.08 * math.sin(t * 3.0) + 0.55 * t ** 3, 2.4 * t))
    for i in range(n):
        t0, t1 = i / n, (i + 1) / n
        r0 = 0.3 * (1 - t0) + 0.04
        r1 = 0.3 * (1 - t1) + 0.04
        limb(pts[i], pts[i + 1], r0, r1, TEAL if i % 2 == 0 else TEAL2, verts=10)
        blob(pts[i + 1], r1, TEAL if i % 2 == 0 else TEAL2, sub=1)
        if i < n - 2:
            blob((0, pts[i + 1][1] - r1 * 0.85, pts[i + 1][2]), r1 * 0.32, BONE, (1.0, 0.5, 1.0), sub=1)
            for sx in (-1, 1):
                blob((sx * r1 * 0.55, pts[i + 1][1] - r1 * 0.7, pts[i + 1][2]), r1 * 0.2, BONE, (1.0, 0.5, 1.0), sub=1)
    blob(pts[-1], 0.07, KFIN, sub=1)
    export("boss_kraken_tentacle")

# ---------------- THE WORLD EATER (the Ultimate boss) ----------------
SHELL = M("UlShell", "1b1425", 0.4)
SHELL2 = M("UlShell2", "2c2140", 0.4)
VIOLET = M("UlViolet", "7a3aff", 0.3, 3.0)
CORE = M("UlCore", "efe2ff", 0.3, 2.4)

ASKIN = M("UlAlienSkin", "7f9c92", 0.45)
ASKIN2 = M("UlAlienSkin2", "566f69", 0.5)
AEYE = M("UlAlienEye", "05060a", 0.08)
AGLOW = M("UlAlienGlow", "5dffb0", 0.3, 3.2)

def ultimate_shell():
    # v0.78: THE WORLD EATER is a giant alien overlord: tall skull, huge black almond eyes, ribbed body, glowing heart.
    blob((0, 3.7, -0.15), 1.1, ASKIN, (1.0, 1.4, 1.05), sub=3)                 # tall cranium
    blob((0, 3.0, 0.45), 0.62, ASKIN, (0.75, 0.95, 0.75), sub=3)               # narrow cheeks and chin
    blob((0, 2.55, 0.5), 0.3, ASKIN2, (0.9, 0.8, 0.8), sub=2)
    for sx in (-1, 1):
        blob((sx * 0.55, 3.2, 0.78), 0.44, AEYE, (1.05, 0.5, 0.32), sub=3)     # the almond eyes
        blob((sx * 0.86, 3.08, 0.66), 0.27, AEYE, (1.0, 0.45, 0.35), sub=2)    # slanting down and out
        blob((sx * 0.5, 3.22, 0.97), 0.075, AGLOW, sub=1)                       # a green glint in each eye
        blob((sx * 0.1, 2.88, 0.97), 0.03, AEYE, sub=1)                         # nose slits
        blob((sx * 0.52, 3.52, 0.62), 0.28, ASKIN2, (1.2, 0.3, 0.5), sub=2)    # heavy brow
    slab((0.34, 0.03, 0.04), (0, 2.62, 0.92), AEYE)                            # a thin mouth
    for k in range(5):                                                          # ridges over the skull
        blob((0, 4.55 - 0.18 * k, -0.45 - 0.05 * k), 0.16, ASKIN2, (1.4, 0.5, 0.9), sub=1)
    limb((0, 2.4, 0.15), (0, 1.9, 0.0), 0.2, 0.32, ASKIN2, verts=10)          # the neck
    blob((0, 1.35, 0), 0.85, ASKIN, (0.95, 1.15, 0.7), sub=3)                  # chest
    for k in range(5):                                                          # ribs
        ring((0, 1.75 - 0.2 * k, 0.0), 0.7 - 0.05 * k, 0.045, ASKIN2, rx=math.pi / 2, segs=24, rsegs=6)
    blob((0, 1.35, 0.45), 0.3, AGLOW, (1.0, 1.0, 0.6), sub=2)                   # the glowing heart
    ring((0, 1.35, 0.5), 0.34, 0.035, VIOLET, rx=math.pi / 2)
    limb((0, 0.1, 0), (0, 0.85, 0), 0.04, 0.55, ASKIN2, verts=12)              # tapers to a point below
    for sx in (-1, 1):                                                          # shoulder pads where the four arms start
        blob((sx * 0.95, 1.9, 0.0), 0.32, ASKIN2, (1.0, 0.8, 1.0), sub=2)
    export("boss_ultimate_shell")

def ultimate_claw():
    blob((0, 0, 0), 0.26, ASKIN2, (1.0, 0.8, 1.1), sub=2)
    for k, ang in enumerate((-0.55, 0.0, 0.55)):
        x1, z1 = math.sin(ang) * 0.35, 0.2 + math.cos(ang) * 0.45
        x2, z2 = math.sin(ang) * 0.6, 0.55 + math.cos(ang) * 0.6
        limb((math.sin(ang) * 0.1, 0.0, 0.1), (x1, 0.04, z1), 0.07, 0.05, ASKIN, verts=6)
        limb((x1, 0.04, z1), (x2, -0.08, z2), 0.05, 0.0, AGLOW, verts=6)
    limb((0.0, 0.05, 0.1), (0.0, 0.2, -0.3), 0.05, 0.0, ASKIN, verts=6)
    export("boss_ultimate_claw")

def ultimate_neck():
    blob((0, 0, 0), 0.3, SHELL, sub=2)
    ring((0, 0, 0), 0.3, 0.03, VIOLET, rx=math.pi / 2)
    export("boss_ultimate_neck")

# ---------------- v0.78: the boss lairs: tall themed trees and rocks ----------------
LT = {
    "ember": (M("LtEmberTr", "2b1b18", 0.9), M("LtEmberLf", "e8541a", 0.6, 0.7), M("LtEmberGl", "ffd23a", 0.3, 2.0), 13.0),
    "sakura": (M("LtSakuraTr", "3b2a4a", 0.8), M("LtSakuraLf", "ff8ad8", 0.6, 0.9), M("LtSakuraGl", "ffffff", 0.3, 2.0), 12.0),
    "crystal": (M("LtCrystalTr", "4a4a54", 0.8), M("LtCrystalLf", "e8b030", 0.3, 0.8), M("LtCrystalGl", "fff1b0", 0.3, 3.0), 14.5),
    "mangrove": (M("LtMangTr", "17433f", 0.8), M("LtMangLf", "23b890", 0.6, 0.5), M("LtMangGl", "b8fff0", 0.3, 3.0), 15.0),
}

def lair_tree(kind, name, seed):
    TR, LF, GL, H = LT[kind]
    rng = random.Random(seed)
    pts = [(0.0, 0.0, 0.0)]
    x = z = 0.0
    lean = (rng.uniform(-0.35, 0.35), rng.uniform(-0.35, 0.35))
    for i in range(1, 6):
        x += rng.uniform(-0.5, 0.5) + lean[0]
        z += rng.uniform(-0.5, 0.5) + lean[1]
        pts.append((x, H * i / 5.0, z))
    for i in range(5):
        r0 = 0.8 * (1 - i / 5.0) + 0.16
        r1 = 0.8 * (1 - (i + 1) / 5.0) + 0.16
        limb(pts[i], pts[i + 1], r0, r1, TR, verts=9)
    for k in range(6):                                  # root flare
        a = k * math.tau / 6 + rng.uniform(-0.2, 0.2)
        limb((0, 1.0, 0), (math.cos(a) * 1.9, 0.0, math.sin(a) * 1.9), 0.38, 0.08, TR, verts=6)
    def foliage(end, k):
        ex, ey, ez = end
        if kind == "ember":
            blob((ex, ey + 0.4, ez), rng.uniform(0.9, 1.4), LF, (1.0, 0.8, 1.0), sub=2, jit=0.28, seed=seed + k, flat=True)
            for j in range(3):
                blob((ex + rng.uniform(-0.8, 0.8), ey - rng.uniform(0.2, 1.0), ez + rng.uniform(-0.8, 0.8)), 0.14, GL, sub=1)
        elif kind == "sakura":
            for j in range(3):
                blob((ex + rng.uniform(-0.9, 0.9), ey + rng.uniform(0.0, 0.8), ez + rng.uniform(-0.9, 0.9)), rng.uniform(1.0, 1.6), LF, (1.0, 0.75, 1.0), sub=2, jit=0.1, seed=seed + k * 3 + j)
            for j in range(3):
                blob((ex + rng.uniform(-1.4, 1.4), ey + rng.uniform(-0.6, 1.2), ez + rng.uniform(-1.4, 1.4)), 0.12, GL, sub=1)
        elif kind == "crystal":
            for j in range(4):
                a = j * math.tau / 4 + rng.uniform(-0.3, 0.3)
                limb((ex, ey, ez), (ex + math.cos(a) * 0.7, ey + rng.uniform(1.8, 3.2), ez + math.sin(a) * 0.7), 0.3, 0.0, LF, verts=5, flat=True)
            blob((ex, ey, ez), 0.22, GL, sub=1)
        else:
            for j in range(6):
                a = j * math.tau / 6 + rng.uniform(-0.2, 0.2)
                limb((ex, ey, ez), (ex + math.cos(a) * 2.8, ey - rng.uniform(0.2, 1.4), ez + math.sin(a) * 2.8), 0.22, 0.02, LF, verts=5)
            blob((ex, ey, ez), 0.32, GL, sub=1)
    for k in range(6):                                  # branches, shorter towards the top
        t = 0.32 + 0.11 * k
        f = t * 5.0
        i = min(int(f), 4)
        u = f - i
        a0, a1 = pts[i], pts[i + 1]
        st = tuple(a0[c] + (a1[c] - a0[c]) * u for c in range(3))
        a = k * 2.4 + rng.uniform(-0.3, 0.3)
        L = rng.uniform(2.6, 4.2) * (1.2 - 0.75 * t)
        en = (st[0] + math.cos(a) * L, st[1] + rng.uniform(1.0, 2.2), st[2] + math.sin(a) * L)
        limb(st, en, 0.26 * (1 - t) + 0.07, 0.05, TR, verts=6)
        foliage(en, k)
    foliage((pts[-1][0], pts[-1][1] + 0.6, pts[-1][2]), 9)
    if kind == "mangrove":                              # arching aerial roots
        for k in range(4):
            a = k * math.tau / 4 + 0.4
            mid = (math.cos(a) * 1.6, 2.4, math.sin(a) * 1.6)
            limb((0, 3.4, 0), mid, 0.2, 0.14, TR, verts=6)
            limb(mid, (math.cos(a) * 3.0, 0.0, math.sin(a) * 3.0), 0.14, 0.06, TR, verts=6)
    export(name)

ROCKC = M("LtRock", "241c1e", 0.9)
ROCKV = M("LtRockVein", "ff5a1a", 0.4, 2.6)

def lair_rock():
    blob((0, 0.7, 0), 1.2, ROCKC, (1.1, 0.8, 0.9), sub=2, jit=0.3, seed=4, flat=True)
    blob((1.2, 0.5, 0.5), 0.8, ROCKC, (1.0, 0.8, 1.0), sub=2, jit=0.3, seed=5, flat=True)
    blob((-0.9, 0.4, -0.7), 0.7, ROCKC, (1.0, 0.7, 1.0), sub=2, jit=0.3, seed=6, flat=True)
    slab((0.9, 0.05, 0.08), (0.1, 1.2, 0.95), ROCKV, rot=(0.0, 0.0, 0.4))
    slab((0.6, 0.05, 0.08), (1.3, 0.8, 1.0), ROCKV, rot=(0.0, 0.0, -0.5))
    export("boss_lair_rock")

JOBS = [
    ("dragon_body", dragon_body), ("dragon_head", dragon_head), ("dragon_jaw", dragon_jaw),
    ("dragon_wing_r", lambda: dragon_wing(1, "boss_dragon_wing_r")), ("dragon_wing_l", lambda: dragon_wing(-1, "boss_dragon_wing_l")),
    ("dragon_tail", dragon_tail), ("dragon_tailtip", dragon_tailtip),
    ("serpent_head", serpent_head), ("serpent_segA", lambda: serpent_seg(False, "boss_serpent_segA")),
    ("serpent_segB", lambda: serpent_seg(True, "boss_serpent_segB")), ("serpent_coil", serpent_coil),
    ("golem_torso", golem_torso), ("golem_head", golem_head),
    ("golem_arm_r", lambda: golem_arm(1, "boss_golem_arm_r")), ("golem_arm_l", lambda: golem_arm(-1, "boss_golem_arm_l")),
    ("golem_leg", golem_leg),
    ("kraken_head", kraken_head), ("kraken_tentacle", kraken_tentacle), ("kraken_tentA", lambda: kraken_tent(False, "boss_kraken_tentA")),
    ("kraken_tentB", lambda: kraken_tent(True, "boss_kraken_tentB")),
    ("ultimate_shell", ultimate_shell), ("ultimate_neck", ultimate_neck), ("ultimate_claw", ultimate_claw),
    ("lair_tree_ember", lambda: lair_tree("ember", "boss_lair_tree_ember", 3)), ("lair_tree_sakura", lambda: lair_tree("sakura", "boss_lair_tree_sakura", 5)),
    ("lair_tree_crystal", lambda: lair_tree("crystal", "boss_lair_tree_crystal", 7)), ("lair_tree_mangrove", lambda: lair_tree("mangrove", "boss_lair_tree_mangrove", 9)),
    ("lair_rock", lair_rock),
]
ok = 0
for name, fn in JOBS:
    try:
        CUR.clear()
        fn()
        ok += 1
    except Exception:
        print("HARBOR_BOSS ERROR " + name + "\n" + traceback.format_exc())
        for o in list(CUR):
            try:
                bpy.data.objects.remove(o, do_unlink=True)
            except Exception:
                pass
        CUR.clear()
print("HARBOR_BOSS DONE %d/%d" % (ok, len(JOBS)))

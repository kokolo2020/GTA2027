# Harbor City wardrobe pieces (v0.40). Original procedural models, no outside assets.
# Run from the repo root:  Blender -b --factory-startup -P blender-src/make_wear.py
# Optional: HARBOR_WEAR_RENDER=<dir> renders a preview of every outfit on a body.
# Writes game/models/wear/*.glb. Each file holds objects named after the body node they ride on
# (Head, Body, ArmL/ArmR, ForeArmL/ForeArmR, LegL/LegR, ShinL/ShinR), each with that node's pivot,
# so the game parents them to the body's nodes and they follow the animation.
# Materials the game recolours: Cloth (the item colour), Trim (a darker shade of it), Hair, Stubble.
# Everything else (Zip, Button, Gold, Frame, Lens, Sole, Lace, Strap, Leather, Shine) keeps its colour.
import bpy, math, os, random
from mathutils import Vector
from pathlib import Path

os.environ["HARBOR_PEOPLE_LIB"] = "1"
_here = Path(__file__).resolve().parent
exec(open(_here / "make_people.py").read())

WOUT = ROOT / "game" / "models" / "wear"
WOUT.mkdir(parents=True, exist_ok=True)
CLOTH = mat("Cloth", "4f7fbf", 0.8)
TRIM = mat("Trim", "2f4f7f", 0.8)
STUB = mat("Stubble", "6a4a3a", 0.9)
ZIP = mat("Zip", "c9ccd2", 0.25)
BUTTON = mat("Button", "e9e4d8", 0.4)
GOLD = mat("Gold", "e8b84a", 0.2)
SILVER = mat("Silver", "d8dde3", 0.2)
FRAME = mat("Frame", "1b1d22", 0.3)
LENS = mat("Lens", "2a3440", 0.05)
CLEAR = mat("ClearLens", "cfe8f5", 0.05)
LEATHER = mat("Leather", "5a3a24", 0.5)
STRAP = mat("Strap", "2a2a2e", 0.6)
LACE = mat("Lace", "f4f1ec", 0.6)
GLOW = mat("GlowSole", "4fe3ff", 0.3)

ELBOW = SH - 0.29
WRIST = ELBOW - 0.22

def torus_at(r, minor, loc, rot, m):
    bpy.ops.mesh.primitive_torus_add(major_radius=r, minor_radius=minor, major_segments=14, minor_segments=5, location=loc, rotation=rot)
    o = bpy.context.active_object
    bpy.ops.object.transform_apply(rotation=True)
    return _done(o, m)

def disc_at(r, depth, loc, rot, m):
    bpy.ops.mesh.primitive_cylinder_add(vertices=14, radius=r, depth=depth, location=loc, rotation=rot)
    o = bpy.context.active_object
    bpy.ops.object.transform_apply(rotation=True)
    return _done(o, m)

def strip(a, b, w, t, m):
    # A flat band from point a to point b (a strap).
    a, b = Vector(a), Vector(b)
    d = b - a
    bpy.ops.mesh.primitive_cube_add(size=1, location=(a + b) / 2)
    o = bpy.context.active_object
    o.scale = (w, t, d.length)
    o.rotation_mode = "QUATERNION"
    o.rotation_quaternion = Vector((0, 0, 1)).rotation_difference(d.normalized())
    bpy.ops.object.transform_apply(rotation=True, scale=True)
    return _done(o, m)

def cut(o, fn):
    return cut_below(o, fn)

def export_piece(name, parts_by_node, render_with=None):
    # parts_by_node: {node: [objects]}; each node's parts become one object with that node's pivot.
    pivots = {"Head": (0, 0, NECK), "Body": (0, 0, HIP)}
    for side, s in (("L", -1), ("R", 1)):
        x = s * 0.2
        pivots["Arm" + side] = (x, 0, SH - 0.03)
        pivots["ForeArm" + side] = (x + s * 0.014, 0, ELBOW)
        pivots["Leg" + side] = (s * 0.095, 0, HIP)
        pivots["Shin" + side] = (s * 0.095, 0, KNEE)
    out = []
    for node, parts in parts_by_node.items():
        parts = [p for p in parts if p is not None]
        if not parts:
            continue
        out.append(group(node, parts, pivots[node]))
    for o in bpy.context.scene.objects:
        if o is not None:
            o.select_set(o in out)
    path = WOUT / (name + ".glb")
    bpy.ops.export_scene.gltf(filepath=str(path), export_format="GLB", use_selection=True, export_apply=True, export_yup=True)
    tris = sum(len(p.vertices) - 2 for o in out for p in o.data.polygons)
    print("HARBOR_WEAR %s %d tris %d bytes" % (name, tris, path.stat().st_size))
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)

# ---------------- hair ----------------
def hair_new(style):
    # Styles 0-3 are the classic Harbor City cuts; 4-9 are new.
    if style < 4:
        return hair_parts(style)
    p = []
    def cap(r, back_cut, front_cut, sc=(0.95, 1.04, 1.04), m=HAIR):
        h = ball(r, (0, -0.008, HEAD + 0.02), m, sc, 16, 10)
        def low(co):
            t = max(0.0, min(1.0, (co.y + 0.12) / 0.24))
            return co.z < HEAD + back_cut + (front_cut - back_cut) * t
        return cut(h, low)
    if style == 4:      # buzz cut
        p.append(cap(0.117, -0.05, 0.06, (0.93, 1.0, 1.02)))
    elif style == 5:    # afro
        h = ball(0.165, (0, -0.012, HEAD + 0.045), HAIR, (1.0, 1.0, 0.95), 18, 12)
        cut(h, lambda co: (co.y > 0.035 and co.z < HEAD + 0.075) or co.z < HEAD - 0.07)
        p.append(h)
        random.seed(5)
        for i in range(26):
            a = random.uniform(0, math.tau)
            e = random.uniform(0.0, 1.3)
            if math.sin(a) > 0.3 and e < 0.55:
                continue
            r = 0.16
            p.append(ball(0.05, (math.cos(a) * math.cos(e) * r, math.sin(a) * math.cos(e) * r - 0.012, HEAD + 0.05 + math.sin(e) * r * 0.9), HAIR, (1, 1, 1), 8, 5))
    elif style == 6:    # two long braids
        p.append(cap(0.122, -0.07, 0.055))
        p.append(ball(0.045, (0.0, 0.07, HEAD + 0.085), HAIR, (1.6, 0.55, 0.4), 12, 6))
        for s in (-1, 1):
            for k in range(9):
                z = HEAD - 0.02 - k * 0.032
                p.append(ball(0.026 - k * 0.0012, (s * (0.085 + k * 0.004), -0.045 + k * 0.004, z), HAIR, (1, 1, 1.15), 8, 6))
            p.append(ring(0.016, 0.006, HEAD - 0.31, BUTTON, 1.0, s * 0.12))
    elif style == 7:    # mohawk
        p.append(cap(0.116, -0.04, 0.05, (0.92, 1.0, 1.0)))
        for k in range(8):
            y = 0.085 - k * 0.026
            z = HEAD + 0.12 + 0.025 * math.sin(k / 7 * math.pi)
            p.append(ball(0.035, (0, y, z), HAIR, (0.45, 1.0, 1.6), 10, 6))
    elif style == 8:    # slicked side part
        p.append(cap(0.125, -0.06, 0.06))
        p.append(ball(0.07, (0.035, 0.03, HEAD + 0.1), HAIR, (1.3, 1.25, 0.55), 14, 8))
        p.append(ball(0.05, (-0.055, 0.0, HEAD + 0.095), HAIR, (0.9, 1.4, 0.5), 12, 6))
    else:               # bob
        h = ball(0.132, (0, -0.012, HEAD + 0.02), HAIR, (1.0, 1.05, 1.05), 18, 12)
        cut(h, lambda co: co.z < HEAD - 0.085 or (co.y > 0.055 and co.z < HEAD + 0.06 and abs(co.x) < 0.085))
        p.append(h)
        p.append(ball(0.06, (0.0, 0.085, HEAD + 0.085), HAIR, (1.65, 0.55, 0.42), 14, 6))
    return p

def beard(style):
    p = []
    if style in (2, 3, 4):   # moustache (also part of the full beard and goatee)
        for s in (-1, 1):
            p.append(ball(0.016, (s * 0.017, 0.1, HEAD - 0.036), HAIR, (1.25, 0.55, 0.5), 8, 6, (0, s * 0.35, 0)))
    if style == 1:           # stubble: a thin shade over the jaw
        h = ball(0.094, (0, 0.016, HEAD - 0.045), STUB, (0.94, 0.97, 0.92), 16, 10)
        cut(h, lambda co: co.z > HEAD - 0.025 or co.y < -0.02 or (abs(co.x) < 0.03 and co.y > 0.06 and co.z > HEAD - 0.072))
        p.append(h)
    if style == 3:           # full beard
        h = ball(0.097, (0, 0.016, HEAD - 0.05), HAIR, (0.97, 1.0, 0.95), 16, 10)
        cut(h, lambda co: co.z > HEAD - 0.012 or co.y < -0.035 or (abs(co.x) < 0.032 and co.y > 0.06 and co.z > HEAD - 0.074))
        p.append(h)
        p.append(ball(0.04, (0, 0.07, HEAD - 0.105), HAIR, (1.3, 0.9, 0.9), 10, 6))
    if style == 4:           # goatee
        p.append(ball(0.026, (0, 0.085, HEAD - 0.09), HAIR, (1.1, 0.7, 1.1), 10, 6))
    return p

# ---------------- clothes ----------------
def sleeves_long(parts, r_up=0.076, r_low=0.05, m=None, cuff=True):
    m = m or CLOTH
    for side, s in (("L", -1), ("R", 1)):
        x = s * 0.2
        hx = x + s * 0.014
        parts["Arm" + side] = parts.get("Arm" + side, []) + [
            ball(r_up + 0.004, (x, 0, SH - 0.035), m, (1, 1, 1), 12, 6),
            tube(r_up, r_up - 0.016, SH - 0.03, ELBOW + 0.01, x + s * 0.01, 0, m, 12, 1.0, False),
            ball(r_up - 0.018, (x + s * 0.012, 0, ELBOW), m, (1, 1, 1), 10, 6)]
        fore = [tube(r_low, r_low - 0.008, ELBOW, WRIST + 0.005, hx, 0, m, 12, 1.0, False)]
        if cuff:
            fore.append(ring(r_low - 0.006, 0.009, WRIST + 0.01, TRIM, 1.0, hx))
        parts["ForeArm" + side] = parts.get("ForeArm" + side, []) + fore
    return parts

def torso(r0, r1, z0, z1, sy, m=None, open_front=0.0):
    t = tube(r0, r1, z0, z1, 0, 0, m or CLOTH, 16, sy, False)
    if open_front > 0:
        cut(t, lambda co: co.y > 0.04 and abs(co.x) < open_front)
    return t

def top(kind):
    P = {"Body": []}
    B = P["Body"]
    if kind == "hoodie":
        B += [torso(0.156, 0.18, HIP + 0.0, SH - 0.12, 0.72),
              ball(0.181, (0, -0.005, SH - 0.13), CLOTH, (0.98, 0.66, 0.52), 14, 8),
              bar(0.077, 0.34, (0, -0.005, SH - 0.04), CLOTH, "X", 12),
              ring(0.15, 0.018, HIP + 0.01, TRIM, 0.73),
              rbox((0.2, 0.03, 0.12), (0, 0.118, HIP + 0.1), TRIM, 0.02)]
        hood = ball(0.12, (0, -0.075, NECK + 0.035), CLOTH, (1.0, 0.75, 0.75), 14, 8)
        cut(hood, lambda co: co.y > -0.02 and co.z > NECK - 0.01)
        B.append(hood)
        for s in (-1, 1):
            B.append(tube(0.006, 0.006, NECK - 0.02, NECK - 0.17, s * 0.035, 0.112, LACE, 6))
        sleeves_long(P, 0.08, 0.053)
    elif kind in ("denim", "leather"):
        lm = CLOTH
        B += [torso(0.155, 0.178, HIP - 0.02, SH - 0.12, 0.7, lm, 0.045),
              ball(0.179, (0, -0.012, SH - 0.13), lm, (0.98, 0.64, 0.52), 14, 8),
              bar(0.075, 0.34, (0, -0.005, SH - 0.04), lm, "X", 12)]
        cut(B[1], lambda co: co.y > 0.05 and abs(co.x) < 0.045)
        for s in (-1, 1):
            # Collar / lapels and front edges.
            B.append(rbox((0.06, 0.02, 0.1), (s * 0.06, 0.098, NECK - 0.07), TRIM, 0.01, (0.35, 0, s * 0.45)))
            B.append(rbox((0.012, 0.012, SH - 0.14 - HIP), (s * 0.05, 0.121, (SH - 0.14 + HIP) / 2), TRIM, 0.004))
            if kind == "denim":
                B.append(rbox((0.07, 0.012, 0.05), (s * 0.085, 0.125, SH - 0.2), TRIM, 0.006))
                B.append(ball(0.007, (s * 0.085, 0.133, SH - 0.19), BUTTON, (1, 0.5, 1), 6, 4))
        if kind == "leather":
            B.append(rbox((0.008, 0.01, 0.34), (0.03, 0.128, HIP + 0.24), ZIP, 0.003, (0, 0.25, 0)))
        sleeves_long(P, 0.079, 0.052)
    elif kind == "sweater":
        B += [torso(0.152, 0.174, HIP + 0.0, SH - 0.12, 0.7),
              ball(0.177, (0, -0.005, SH - 0.13), CLOTH, (0.98, 0.64, 0.52), 14, 8),
              bar(0.074, 0.33, (0, -0.005, SH - 0.04), CLOTH, "X", 12),
              ring(0.148, 0.02, HIP + 0.012, TRIM, 0.72),
              ring(0.06, 0.02, NECK - 0.03, TRIM, 0.9),
              tube(0.166, 0.17, SH - 0.27, SH - 0.22, 0, 0, TRIM, 16, 0.7, False)]
        sleeves_long(P, 0.078, 0.051)
    elif kind == "suit":
        B += [torso(0.152, 0.18, HIP - 0.13, SH - 0.12, 0.7, CLOTH, 0.05),
              ball(0.18, (0, -0.012, SH - 0.13), CLOTH, (0.98, 0.64, 0.52), 14, 8),
              bar(0.076, 0.35, (0, -0.005, SH - 0.04), CLOTH, "X", 12)]
        cut(B[1], lambda co: co.y > 0.05 and abs(co.x) < 0.05)
        B.append(rbox((0.08, 0.02, 0.32), (0, 0.107, HIP + 0.3), BUTTON, 0.01))   # shirt front
        B.append(rbox((0.03, 0.012, 0.2), (0, 0.118, HIP + 0.32), TRIM, 0.006, (0, 0, 0)))  # tie
        B.append(rbox((0.035, 0.014, 0.025), (0, 0.118, NECK - 0.05), TRIM, 0.006))
        for s in (-1, 1):
            B.append(rbox((0.045, 0.016, 0.16), (s * 0.06, 0.112, SH - 0.17), CLOTH, 0.008, (0.15, 0, s * 0.35)))
        B.append(ball(0.008, (0.04, 0.128, HIP + 0.12), BUTTON, (1, 0.5, 1), 6, 4))
        sleeves_long(P, 0.077, 0.051)
    elif kind == "polo":
        for s in (-1, 1):
            B.append(rbox((0.06, 0.018, 0.04), (s * 0.04, 0.085, NECK - 0.035), TRIM, 0.008, (0.5, 0, s * 0.4)))
        B.append(rbox((0.03, 0.01, 0.1), (0, 0.118, NECK - 0.1), TRIM, 0.004))
        for k in range(2):
            B.append(ball(0.006, (0, 0.124, NECK - 0.08 - k * 0.04), BUTTON, (1, 0.5, 1), 6, 4))
    elif kind == "puffer":
        B += [torso(0.17, 0.19, HIP - 0.02, SH - 0.12, 0.74),
              ball(0.19, (0, -0.005, SH - 0.13), CLOTH, (0.98, 0.68, 0.55), 14, 8),
              bar(0.085, 0.35, (0, -0.005, SH - 0.04), CLOTH, "X", 12),
              tube(0.07, 0.068, NECK - 0.06, NECK + 0.03, 0, 0, CLOTH, 14, 0.95, False),
              rbox((0.008, 0.01, 0.44), (0, 0.142, HIP + 0.24), ZIP, 0.003)]
        for k in range(4):
            B.append(ring(0.175 + k * 0.004, 0.012, HIP + 0.06 + k * 0.1, TRIM, 0.74))
        sleeves_long(P, 0.088, 0.058)
    elif kind == "dress":
        skirt = tube(0.162, 0.27, HIP + 0.06, KNEE - 0.04, 0, 0, CLOTH, 18, 0.8, False)
        B += [skirt, ring(0.165, 0.012, HIP + 0.065, TRIM, 0.78), ring(0.265, 0.01, KNEE - 0.035, TRIM, 0.8)]
    elif kind == "jersey":
        B += [rbox((0.12, 0.01, 0.1), (0, 0.118, SH - 0.27), TRIM, 0.01)]
        for s in (-1, 1):
            B.append(rbox((0.012, 0.004, 0.28), (s * 0.13, 0.095, HIP + 0.25), TRIM, 0.003, (0, 0, s * 0.08)))
    return P

def bottom(kind):
    P = {}
    if kind == "shorts":
        for side, s in (("L", -1), ("R", 1)):
            P["Leg" + side] = [tube(0.09, 0.08, HIP - 0.02, KNEE + 0.06, s * 0.095, 0, CLOTH, 12, 1.0, False),
                               ring(0.078, 0.01, KNEE + 0.065, TRIM, 1.0, s * 0.095)]
    elif kind == "skirt":
        P["Body"] = [tube(0.164, 0.25, HIP + 0.07, HIP - 0.33, 0, 0, CLOTH, 18, 0.8, False),
                     ring(0.162, 0.014, HIP + 0.075, TRIM, 0.78)]
    elif kind == "cargo":
        for side, s in (("L", -1), ("R", 1)):
            P["Leg" + side] = [rbox((0.03, 0.09, 0.12), (s * 0.18, 0.0, KNEE + 0.17), TRIM, 0.015),
                               rbox((0.032, 0.092, 0.025), (s * 0.18, 0.0, KNEE + 0.24), CLOTH, 0.008)]
    elif kind == "joggers":
        for side, s in (("L", -1), ("R", 1)):
            P["Shin" + side] = [ring(0.052, 0.016, 0.15, TRIM, 1.0, s * 0.095),
                                rbox((0.008, 0.012, 0.3), (s * 0.155, 0.0, 0.32), LACE, 0.003)]
            P["Leg" + side] = [rbox((0.008, 0.012, 0.36), (s * 0.172, 0.0, KNEE + 0.2), LACE, 0.003)]
    return P

def shoes(kind):
    P = {}
    for side, s in (("L", -1), ("R", 1)):
        x = s * 0.095
        if kind == "boots":
            P["Shin" + side] = [tube(0.066, 0.064, 0.28, 0.06, x, 0.0, CLOTH, 12),
                                rbox((0.106, 0.2, 0.08), (x, 0.03, 0.07), CLOTH, 0.03),
                                ball(0.054, (x, 0.118, 0.055), CLOTH, (1, 0.95, 0.65), 12, 8),
                                rbox((0.112, 0.28, 0.03), (x, 0.045, 0.012), STRAP, 0.01),
                                ring(0.066, 0.008, 0.27, TRIM, 1.0, x)]
        elif kind == "hightops":
            P["Shin" + side] = [tube(0.064, 0.062, 0.21, 0.07, x, 0.0, CLOTH, 12),
                                rbox((0.104, 0.196, 0.075), (x, 0.03, 0.068), CLOTH, 0.03),
                                ball(0.052, (x, 0.117, 0.053), CLOTH, (1, 0.95, 0.63), 12, 8),
                                rbox((0.112, 0.28, 0.03), (x, 0.045, 0.013), LACE, 0.012),
                                ring(0.065, 0.009, 0.205, TRIM, 1.0, x)]
            for k in range(4):
                P["Shin" + side].append(rbox((0.05, 0.008, 0.006), (x, 0.06 + 0.02 * k, 0.11 - 0.006 * k + (0.06 if k == 0 else 0)), LACE, 0.002))
        elif kind == "glow":
            P["Shin" + side] = [rbox((0.102, 0.194, 0.072), (x, 0.03, 0.068), CLOTH, 0.03),
                                ball(0.052, (x, 0.117, 0.053), CLOTH, (1, 0.95, 0.63), 12, 8),
                                rbox((0.114, 0.284, 0.03), (x, 0.045, 0.014), GLOW, 0.012)]
        elif kind == "loafers":
            P["Shin" + side] = [rbox((0.1, 0.2, 0.06), (x, 0.035, 0.058), CLOTH, 0.028),
                                ball(0.05, (x, 0.12, 0.048), CLOTH, (1, 0.95, 0.55), 12, 8),
                                rbox((0.108, 0.27, 0.022), (x, 0.045, 0.011), LEATHER, 0.01),
                                rbox((0.06, 0.02, 0.012), (x, 0.09, 0.09), TRIM, 0.004)]
    return P

def acc(kind):
    P = {}
    if kind in ("glasses", "sunglasses"):
        lens = CLEAR if kind == "glasses" else LENS
        H = []
        for s in (-1, 1):
            H.append(torus_at(0.022, 0.0035, (s * 0.038, 0.118, HEAD + 0.02), (math.pi / 2, 0, 0), FRAME))
            H.append(disc_at(0.021, 0.003, (s * 0.038, 0.118, HEAD + 0.02), (math.pi / 2, 0, 0), lens))
            H.append(bar(0.003, 0.11, (s * 0.062, 0.065, HEAD + 0.024), FRAME, "Y", 6))
        H.append(bar(0.003, 0.03, (0, 0.12, HEAD + 0.028), FRAME, "X", 6))
        P["Head"] = H
    elif kind == "watch":
        P["ForeArmL"] = [ring(0.037, 0.008, WRIST + 0.03, STRAP, 1.0, -0.214),
                         ball(0.02, (-0.252, 0.0, WRIST + 0.03), SILVER, (0.35, 1, 1), 10, 6)]
    elif kind == "backpack":
        P["Body"] = [rbox((0.25, 0.11, 0.3), (0, -0.165, SH - 0.3), CLOTH, 0.04),
                     rbox((0.19, 0.04, 0.12), (0, -0.23, SH - 0.38), TRIM, 0.02)]
        for s in (-1, 1):
            st = rbox((0.03, 0.02, 0.36), (s * 0.09, 0.0, SH - 0.2), TRIM, 0.006)
            P["Body"].append(st)
            P["Body"].append(bar(0.012, 0.22, (s * 0.09, -0.02, SH - 0.05), TRIM, "Y", 6))
    elif kind == "chain":
        c = ring(0.075, 0.006, NECK - 0.07, GOLD, 0.75)
        P["Body"] = [c, ball(0.016, (0, 0.105, NECK - 0.13), GOLD, (1, 0.5, 1.2), 8, 6)]
    elif kind == "earrings":
        P["Head"] = [torus_at(0.012, 0.0028, (s * 0.104, -0.005, HEAD - 0.045), (0, math.pi / 2, 0), GOLD) for s in (-1, 1)]
    elif kind == "scarf":
        P["Body"] = [ring(0.07, 0.03, NECK - 0.045, CLOTH, 0.95),
                     rbox((0.06, 0.03, 0.22), (0.05, 0.1, NECK - 0.17), CLOTH, 0.012, (0.1, 0, 0.12)),
                     rbox((0.062, 0.031, 0.02), (0.06, 0.104, NECK - 0.28), TRIM, 0.006, (0.1, 0, 0.12))]
    elif kind == "bag":
        P["Body"] = [strip((-0.13, 0.112, SH - 0.06), (0.16, 0.122, HIP + 0.05), 0.035, 0.012, STRAP),
                     strip((-0.13, -0.11, SH - 0.06), (0.16, -0.12, HIP + 0.05), 0.035, 0.012, STRAP),
                     rbox((0.06, 0.2, 0.15), (0.185, 0.02, HIP + 0.0), CLOTH, 0.02),
                     rbox((0.064, 0.204, 0.05), (0.185, 0.02, HIP + 0.05), TRIM, 0.01)]
    return P

for o in list(bpy.data.objects):
    bpy.data.objects.remove(o, do_unlink=True)
for style in range(10):
    export_piece("hair_%d" % style, {"Head": hair_new(style)})
for style in range(1, 5):
    export_piece("beard_%d" % style, {"Head": beard(style)})
for kind in ("hoodie", "denim", "leather", "sweater", "suit", "polo", "puffer", "dress", "jersey"):
    export_piece("top_" + kind, top(kind))
for kind in ("shorts", "skirt", "cargo", "joggers"):
    export_piece("bottom_" + kind, bottom(kind))
for kind in ("boots", "hightops", "glow", "loafers"):
    export_piece("shoes_" + kind, shoes(kind))
for kind in ("glasses", "sunglasses", "watch", "backpack", "chain", "earrings", "scarf", "bag"):
    export_piece("acc_" + kind, acc(kind))
print("HARBOR_WEAR DONE")

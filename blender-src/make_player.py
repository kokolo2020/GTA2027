# Harbor City playable-character generator (v0.29.2). Original procedural character, no outside assets.
# Run from the repo root:  blender --background --factory-startup --python blender-src/make_player.py
# Writes game/models/player.glb. Only the player uses it; person_0..3.glb (the pedestrians) are untouched.
#
# Same node names and pivots as make_people.py, so every animation, emote, sit pose and hat keeps working:
#   Body (hips pivot) with Head (neck pivot) and ArmL/ArmR (shoulder pivots) as children, so a leaning torso
#   carries them; each arm has a ForeArmL/ForeArmR child (elbow pivot).
#   LegL/LegR (hip pivots) each with a ShinL/ShinR child (knee pivot).
# Recoloured at runtime: Shirt, Pants, Skin, Hair, Shoes, Eye. Fixed: EyeWhite, Mouth, Sole, Belt, Buckle.
# Pivots, in metres with the feet at 0: hips 0.86, knees 0.47, shoulders 1.33, neck 1.40, elbows 1.07.
# Head centre ~1.565 (1.535 + HEAD_LIFT); main.gd moves the hats up the same 0.03.
#
# Shapes are lofted: smooth elliptical cross-sections along a profile (torso with chest, waist and hip,
# arms and legs that bulge and taper, a proper neck, shoes with a toe box), not cones and cubes.
import bpy, bmesh, math, os
from pathlib import Path
from mathutils import Vector

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
OUT = ROOT / "game" / "models"
OUT.mkdir(parents=True, exist_ok=True)

def lin(c):
    c = c / 255.0
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4

MATS = {}
def mat(name, hexcol, rough=0.7, metal=0.0):
    if name in MATS:
        return MATS[name]
    m = bpy.data.materials.new(name)
    m.use_nodes = True
    b = m.node_tree.nodes["Principled BSDF"]
    b.inputs["Base Color"].default_value = tuple(lin(int(hexcol[i:i + 2], 16)) for i in (0, 2, 4)) + (1,)
    b.inputs["Roughness"].default_value = rough
    b.inputs["Metallic"].default_value = metal
    MATS[name] = m
    return m

SHIRT = mat("Shirt", "f2b24a", 0.85)
PANTS = mat("Pants", "263d54", 0.8)
SKIN = mat("Skin", "c68a60", 0.55)
HAIR = mat("Hair", "3b2a20", 0.6)
SHOES = mat("Shoes", "2b2b2b", 0.45)
EYE = mat("Eye", "1c1c22", 0.2)
WHITE = mat("EyeWhite", "f4f1ec", 0.3)
MOUTH = mat("Mouth", "9a4d47", 0.6)
SOLE = mat("Sole", "eceae4", 0.6)
BELT = mat("Belt", "3a2a1e", 0.5)
BUCKLE = mat("Buckle", "c9c9c2", 0.3, 0.8)

HIP = 0.86
KNEE = 0.47
SH = 1.36
NECK = 1.40
HEAD = 1.535
HEAD_LIFT = 0.03   # head sits a little higher on a longer neck; the hat code adds the same 0.03
ELBOW = 1.07
ARM_X = 0.206
LEG_X = 0.098
SEG = 20          # sides around every lofted part
HEAD_SCALE = 0.94 # head size, about the neck pivot

def _finish(o, m, smooth=True):
    o.data.materials.append(m)
    for p in o.data.polygons:
        p.use_smooth = smooth
    return o

def _catmull(a, b, c, d, t):
    return 0.5 * ((2 * b) + (-a + c) * t + (2 * a - 5 * b + 4 * c - d) * t * t + (-a + 3 * b - 3 * c + d) * t ** 3)

def _resample(secs, steps):
    # secs: list of (t, rx, ry, cx, cy). Smooth Catmull-Rom between them, `steps` rings per gap.
    if steps <= 1 or len(secs) < 3:
        return secs
    out = []
    n = len(secs)
    for i in range(n - 1):
        p0, p1, p2, p3 = secs[max(i - 1, 0)], secs[i], secs[i + 1], secs[min(i + 2, n - 1)]
        for k in range(steps):
            t = k / steps
            out.append(tuple(_catmull(p0[j], p1[j], p2[j], p3[j], t) for j in range(5)))
    out.append(secs[-1])
    return out

def loft(secs, m, axis="z", steps=3, caps=(True, True), seg=SEG, name="part"):
    # Each section: (t along the axis, half-width, half-depth, centre x, centre of the other axis).
    secs = _resample([tuple(s) + (0.0,) * (5 - len(s)) for s in secs], steps)
    bm = bmesh.new()
    rings = []
    for (t, rx, ry, cx, cy) in secs:
        ring = []
        for k in range(seg):
            a = math.tau * k / seg
            u, v = cx + rx * math.cos(a), cy + ry * math.sin(a)
            co = (u, v, t) if axis == "z" else (u, t, v)
            ring.append(bm.verts.new(co))
        rings.append(ring)
    for i in range(len(rings) - 1):
        for k in range(seg):
            k2 = (k + 1) % seg
            bm.faces.new((rings[i][k], rings[i][k2], rings[i + 1][k2], rings[i + 1][k]))
    if caps[0]:
        bm.faces.new(rings[0])
    if caps[1]:
        bm.faces.new(list(reversed(rings[-1])))
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces[:])
    me = bpy.data.meshes.new(name)
    bm.to_mesh(me)
    bm.free()
    o = bpy.data.objects.new(name, me)
    bpy.context.scene.collection.objects.link(o)
    return _finish(o, m)

def _prim(o, m, smooth=True):
    return _finish(o, m, smooth)

def ball(r, loc, m, scale=(1, 1, 1), seg=14, rings=10, rot=(0, 0, 0)):
    bpy.ops.mesh.primitive_uv_sphere_add(segments=seg, ring_count=rings, radius=r, location=loc, rotation=rot)
    o = bpy.context.active_object
    o.scale = scale
    bpy.ops.object.transform_apply(rotation=True, scale=True)
    return _prim(o, m)

def rbox(size, loc, m, bevel=0.03, rot=(0, 0, 0)):
    bpy.ops.mesh.primitive_cube_add(size=1, location=loc, rotation=rot)
    o = bpy.context.active_object
    o.scale = size
    bpy.ops.object.transform_apply(rotation=True, scale=True)
    mod = o.modifiers.new("Bevel", "BEVEL")
    mod.width = bevel
    mod.segments = 2
    bpy.ops.object.modifier_apply(modifier=mod.name)
    return _prim(o, m)

def cut_below(o, fn):
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

def scale_baked(o, k):
    # Uniform scale about the object's pivot, baked into the mesh.
    for q in bpy.context.view_layer.objects:
        q.select_set(False)
    o.select_set(True)
    bpy.context.view_layer.objects.active = o
    o.scale = (k, k, k)
    bpy.ops.object.transform_apply(location=False, rotation=False, scale=True)
    return o

# ---------- head (kept very close to the existing face so hats and looks carry over) ----------
def head_parts():
    H = HEAD + HEAD_LIFT
    p = []
    p.append(ball(0.112, (0, 0.0, H + 0.01), SKIN, (0.9, 1.0, 1.06), 18, 12))
    p.append(ball(0.09, (0, 0.014, H - 0.045), SKIN, (0.9, 0.95, 0.9), 16, 10))   # jaw and chin
    p.append(ball(0.016, (0, 0.104, H - 0.012), SKIN, (0.8, 0.9, 1.35), 10, 8))   # nose
    for s in (-1, 1):
        p.append(ball(0.026, (s * 0.1, -0.005, H - 0.005), SKIN, (0.45, 0.85, 1.25), 10, 8))  # ears
        p.append(ball(0.018, (s * 0.038, 0.098, H + 0.02), WHITE, (1.1, 0.5, 0.8), 12, 8))
        p.append(ball(0.0095, (s * 0.038, 0.1065, H + 0.019), EYE, (1, 0.4, 1.05), 10, 8))
        p.append(rbox((0.042, 0.012, 0.011), (s * 0.039, 0.098, H + 0.05), HAIR, 0.004, (0, s * 0.12, 0)))
    p.append(ball(0.019, (0, 0.093, H - 0.055), MOUTH, (1.4, 0.35, 0.3), 12, 8))
    # Neck: wider at the base where it meets the shoulders (trapezius slope), narrower under the jaw.
    p.append(loft([(NECK - 0.07, 0.066, 0.06, 0, -0.004), (NECK - 0.02, 0.052, 0.052, 0, -0.002),
                   (NECK + 0.04, 0.046, 0.048, 0, 0.004), (H - 0.06, 0.044, 0.048, 0, 0.008)], SKIN, "z", 2, name="neck"))
    # Short hair with a side-swept fringe (same shape as person_0).
    h = ball(0.122, (0, -0.008, H + 0.02), HAIR, (0.95, 1.04, 1.04), 18, 12)
    def low(co):
        t = max(0.0, min(1.0, (co.y + 0.12) / 0.24))
        return co.z < H - 0.06 + (0.055 + 0.06) * t
    p.append(cut_below(h, low))
    p.append(ball(0.05, (0.03, 0.07, H + 0.085), HAIR, (1.4, 0.7, 0.45), 14, 10))
    return p

def build():
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    out = []

    # Legs: thigh in the Leg node (hip pivot); calf, shoe and sole in the Shin child (knee pivot).
    for side, sx in (("L", -1), ("R", 1)):
        x = sx * LEG_X
        thigh = group("Leg" + side, [
            loft([(HIP + 0.04, 0.096, 0.105, x, 0.0), (0.78, 0.092, 0.1, x, 0.004), (0.62, 0.079, 0.084, x, 0.004),
                  (KNEE + 0.02, 0.064, 0.067, x, 0.0)], PANTS, "z", 2, name="thigh"),
            ball(0.064, (x, 0.004, KNEE), PANTS, (1, 1.04, 1), 14, 10)], (x, 0, HIP))
        shin = group("Shin" + side, [
            loft([(KNEE, 0.064, 0.067, x, 0.0), (0.38, 0.064, 0.072, x, -0.01), (0.26, 0.055, 0.059, x, -0.006),
                  (0.15, 0.05, 0.053, x, 0.0), (0.105, 0.055, 0.058, x, 0.0)], PANTS, "z", 2, name="calf"),
            # Shoe: heel, instep and a rounded toe box, built along the foot (y).
            loft([(-0.078, 0.038, 0.036, x, 0.066), (-0.04, 0.049, 0.05, x, 0.073), (0.03, 0.054, 0.052, x, 0.07),
                  (0.1, 0.05, 0.042, x, 0.056), (0.16, 0.041, 0.032, x, 0.044), (0.205, 0.026, 0.023, x, 0.034)],
                 SHOES, "y", 2, seg=16, name="shoe"),
            loft([(-0.085, 0.041, 0.011, x, 0.011), (0.0, 0.055, 0.012, x, 0.011), (0.12, 0.052, 0.011, x, 0.011),
                  (0.21, 0.03, 0.01, x, 0.011)], SOLE, "y", 1, seg=16, name="sole")], (x, 0, KNEE))
        parent(shin, thigh)
        out += [thigh, shin]

    # Body: pelvis (pants), belt with buckle, shirt with hem, chest, shoulder line and collar.
    body = [
        loft([(0.79, 0.15, 0.1, 0, 0), (0.86, 0.168, 0.108, 0, 0), (0.93, 0.17, 0.108, 0, 0), (1.0, 0.152, 0.099, 0, 0)],
             PANTS, "z", 2, name="pelvis"),
        loft([(0.985, 0.158, 0.105, 0, 0), (1.012, 0.158, 0.105, 0, 0)], BELT, "z", 1, name="belt"),
        rbox((0.042, 0.012, 0.03), (0, 0.108, 0.999), BUCKLE, 0.004),
        loft([(0.955, 0.162, 0.108, 0, 0), (1.02, 0.153, 0.101, 0, 0), (1.12, 0.164, 0.105, 0, -0.002),
              (1.22, 0.18, 0.114, 0, -0.004), (1.285, 0.184, 0.105, 0, -0.004), (1.325, 0.152, 0.088, 0, -0.002),
              (1.352, 0.09, 0.068, 0, 0.0)], SHIRT, "z", 2, name="shirt"),
        loft([(1.344, 0.082, 0.066, 0, 0.0), (1.366, 0.074, 0.06, 0, 0.0)], SHIRT, "z", 1, caps=(False, False), name="collar"),
    ]
    body_o = group("Body", body, (0, 0, HIP))
    out.append(body_o)

    # The head and both arms hang off Body, so leaning the torso carries them with it (legs stay on the hips).
    head = group("Head", head_parts(), (0, 0, NECK))
    scale_baked(head, HEAD_SCALE)
    parent(head, body_o)
    out.append(head)

    # Arms: deltoid, short sleeve and upper arm in the Arm node (shoulder pivot); forearm and hand in the ForeArm child.
    for side, s in (("L", -1), ("R", 1)):
        x = s * ARM_X
        upper = group("Arm" + side, [
            loft([(1.345, 0.04, 0.05, x - s * 0.03, 0), (1.322, 0.058, 0.062, x - s * 0.01, 0), (1.29, 0.066, 0.066, x, 0),
                  (1.23, 0.065, 0.066, x, 0), (1.17, 0.062, 0.062, x, 0)], SHIRT, "z", 2, name="sleeve"),
            loft([(1.18, 0.054, 0.054, x, 0), (1.12, 0.05, 0.05, x, 0), (ELBOW, 0.044, 0.044, x, 0)],
                 SKIN, "z", 2, name="upperarm"),
            ball(0.044, (x, 0.0, ELBOW), SKIN, (1, 1, 1), 12, 8)], (x, 0, SH - 0.03))
        hx = x
        fore = group("ForeArm" + side, [
            loft([(ELBOW, 0.044, 0.044, hx, 0), (1.0, 0.046, 0.042, hx, 0), (0.92, 0.037, 0.035, hx, 0),
                  (0.845, 0.028, 0.026, hx, 0)], SKIN, "z", 2, name="forearm"),
            # Hand: flat palm, slightly curled fingers and a thumb on the inner side.
            loft([(0.85, 0.029, 0.02, hx, 0), (0.805, 0.037, 0.022, hx, 0.002), (0.755, 0.034, 0.02, hx, 0.004),
                  (0.715, 0.03, 0.017, hx, 0.008), (0.688, 0.021, 0.012, hx, 0.012)], SKIN, "z", 3, seg=16, name="hand"),
            ball(0.014, (hx - s * 0.034, 0.016, 0.795), SKIN, (1, 1.2, 2.3), 10, 8, (0, s * 0.35, 0))], (hx, 0, ELBOW))
        parent(fore, upper)
        parent(upper, body_o)
        out += [upper, fore]

    for o in bpy.context.view_layer.objects:
        o.select_set(o in out)
    path = OUT / "player.glb"
    bpy.ops.export_scene.gltf(filepath=str(path), export_format="GLB", use_selection=True, export_apply=True, export_yup=True)
    tris = sum(len(p.vertices) - 2 for o in out for p in o.data.polygons)
    print("HARBOR_PLAYER exported %s %d bytes %d tris" % (path.name, path.stat().st_size, tris))

try:
    build()
    print("HARBOR_PLAYER DONE")
except Exception:
    import traceback
    print("HARBOR_PLAYER ERROR\n" + traceback.format_exc())
    raise SystemExit(1)

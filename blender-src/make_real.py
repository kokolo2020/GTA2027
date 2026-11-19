# Harbor City "real look" generator (v0.30 phase 2). Original procedural models, no outside assets.
# Run from the repo root:
#   /Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python blender-src/make_real.py
# Writes smooth, rounded replacements for the old blocky models: tree_round, tree_pine, palm,
# car_0..car_4, plus new bus and sky-train cars (bus, sky_car, sky_car_end).
# Every model is joined into ONE mesh with its origin at the ground (cars: body centre, as before),
# fronts face +Y in Blender = -Z in Godot. Material names match what the game recolours and lights.
import bpy, bmesh, math, os, random
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_src = (ROOT / "blender-src/make_models.py").read_text()
exec(_src.split("CAR_STYLES = [")[0])   # helpers: mat, block, cyl, cone, finish, export, CUR, log

_orig_export = export
SMOOTH_ANGLE = math.radians(38)

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
    try:
        bpy.ops.object.shade_smooth_by_angle(angle=SMOOTH_ANGLE)
    except Exception:
        bpy.ops.object.shade_smooth()
    tris = sum(len(p.vertices) - 2 for p in keep.data.polygons)
    _orig_export(name)
    print("HARBOR_REAL %s %d tris" % (name, tris))

def ico(r, loc, m, sub=1, sx=1.0, sy=1.0, sz=1.0, jitter=0.0, seed=0):
    bpy.ops.mesh.primitive_ico_sphere_add(subdivisions=sub, radius=r, location=loc)
    o = bpy.context.active_object
    rnd = random.Random(seed)
    for v in o.data.vertices:
        n = v.co.normalized()
        k = 1.0 + rnd.uniform(-jitter, jitter)
        v.co = n * r * k
        v.co.x *= sx
        v.co.y *= sy
        v.co.z *= sz
    return finish(o, m)

def prism(profile, width, m, x=0.0, bevel=0.0, segs=2, top_scale=1.0, split_z=None):
    # Side profile [(y, z), ...] extruded across the car (x). Optional tumblehome: vertices above
    # split_z are pulled in by top_scale.
    me = bpy.data.meshes.new("prism")
    bm = bmesh.new()
    left = [bm.verts.new((x - width / 2, y, z)) for (y, z) in profile]
    right = [bm.verts.new((x + width / 2, y, z)) for (y, z) in profile]
    n = len(profile)
    bm.faces.new(list(reversed(left)))
    bm.faces.new(right)
    for i in range(n):
        j = (i + 1) % n
        bm.faces.new((left[i], left[j], right[j], right[i]))
    if split_z is not None and top_scale != 1.0:
        for v in bm.verts:
            if v.co.z > split_z:
                v.co.x = x + (v.co.x - x) * top_scale
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces)
    bm.to_mesh(me)
    bm.free()
    o = bpy.data.objects.new("prism", me)
    bpy.context.collection.objects.link(o)
    bpy.context.view_layer.objects.active = o
    if bevel > 0:
        mod = o.modifiers.new("Bevel", "BEVEL")
        mod.width = bevel
        mod.segments = segs
        mod.limit_method = "ANGLE"
        mod.angle_limit = math.radians(25)
    return finish(o, m)

# ---------------------------------------------------------------- trees
BARK = mat("Bark", "6d4a2a", 0.95)
LEAF = mat("Leaf", "5a9a55", 0.9)
LEAF2 = mat("Leaf2", "78b45c", 0.9)
PINE = mat("Pine", "2f6b45", 0.9)

def branch(base, tip, r0, r1, m, verts=7):
    bx, by, bz = base
    tx, ty, tz = tip
    dx, dy, dz = tx - bx, ty - by, tz - bz
    L = math.sqrt(dx * dx + dy * dy + dz * dz)
    bpy.ops.mesh.primitive_cone_add(vertices=verts, radius1=r0, radius2=r1, depth=L,
                                    location=((bx + tx) / 2, (by + ty) / 2, (bz + tz) / 2))
    o = bpy.context.active_object
    o.rotation_mode = "QUATERNION"
    from mathutils import Vector
    o.rotation_quaternion = Vector((0, 0, 1)).rotation_difference(Vector((dx, dy, dz)).normalized())
    return finish(o, m)

def round_tree():
    # A broadleaf street tree: tapered trunk, a few branches and a lumpy, smooth crown of leaf clusters.
    rnd = random.Random(7)
    branch((0, 0, 0), (0.05, 0.0, 3.4), 0.24, 0.13, BARK, 9)
    for k in range(4):
        a = k * math.pi / 2 + 0.4
        branch((0.03, 0, 2.6 + 0.2 * k), (math.cos(a) * 1.0, math.sin(a) * 1.0, 3.9 + 0.25 * k), 0.09, 0.04, BARK, 6)
    clusters = [(0, 0, 5.0, 1.75), (0.9, 0.3, 4.4, 1.25), (-0.9, -0.2, 4.5, 1.3), (0.2, 1.0, 4.6, 1.2),
                (-0.3, -1.0, 4.3, 1.2), (0.4, -0.3, 5.9, 1.25), (-0.5, 0.5, 5.6, 1.15)]
    for i, (x, y, z, r) in enumerate(clusters):
        ico(r, (x, y, z), LEAF if i % 3 else LEAF2, 3 if i == 0 else 2, 1.0, 1.0, 0.86, 0.1, seed=i + 1)
    export("tree_round")

def pine_tree():
    branch((0, 0, 0), (0, 0, 2.2), 0.2, 0.14, BARK, 8)
    tiers = [(1.9, 2.2, 1.8), (1.55, 1.9, 3.2), (1.2, 1.6, 4.5), (0.8, 1.4, 5.7), (0.42, 1.2, 6.8)]
    for i, (r, h, z) in enumerate(tiers):
        bpy.ops.mesh.primitive_cone_add(vertices=12, radius1=r, radius2=0.05, depth=h, location=(0, 0, z))
        o = bpy.context.active_object
        rnd = random.Random(30 + i)
        for v in o.data.vertices:
            if v.co.z < -h / 2 + 0.01:
                # Ragged lower edge: alternate needle tips in and out, drooping slightly.
                ang = math.atan2(v.co.y, v.co.x)
                k = 1.0 + 0.16 * math.cos(ang * 6 + i) + rnd.uniform(-0.05, 0.05)
                v.co.x *= k
                v.co.y *= k
                v.co.z -= 0.12 * k
        finish(o, PINE)
    export("tree_pine")

def palm_tree():
    trunk = mat("PalmTrunk", "8a6a43", 0.9)
    leaf = mat("PalmLeaf", "3f9a5a", 0.85)
    # Smooth, gently curved trunk with ring bulges.
    pts = []
    for k in range(9):
        t = k / 8.0
        pts.append((0.55 * t * t, 0.0, 6.6 * t))
    for k in range(8):
        r0 = 0.24 - 0.012 * k
        branch(pts[k], pts[k + 1], r0, r0 - 0.02, trunk, 10)
    top = pts[-1]
    # Fronds: drooping strips with a zigzag leaflet edge.
    for k in range(9):
        a = 2 * math.pi * k / 9 + 0.2
        me = bpy.data.meshes.new("frond")
        bm = bmesh.new()
        segs = 7
        L = 3.0 + 0.3 * (k % 3)
        prev = None
        for s in range(segs + 1):
            t = s / segs
            d = L * t
            droop = -1.6 * t * t + 0.6 * t
            w = 0.55 * math.sin(math.pi * min(1.0, t * 1.15)) + 0.05
            cx = top[0] + math.cos(a) * d
            cy = top[1] + math.sin(a) * d
            cz = top[2] + droop
            px, py = -math.sin(a), math.cos(a)
            zig = 0.12 if s % 2 else -0.04
            vl = bm.verts.new((cx + px * (w + zig), cy + py * (w + zig), cz - 0.12 * w))
            vc = bm.verts.new((cx, cy, cz + 0.06))
            vr = bm.verts.new((cx - px * (w + zig), cy - py * (w + zig), cz - 0.12 * w))
            if prev:
                bm.faces.new((prev[0], prev[1], vc, vl))
                bm.faces.new((prev[1], prev[2], vr, vc))
            prev = (vl, vc, vr)
        bm.to_mesh(me)
        bm.free()
        o = bpy.data.objects.new("frond", me)
        bpy.context.collection.objects.link(o)
        mod = o.modifiers.new("Solid", "SOLIDIFY")
        mod.thickness = 0.03
        finish(o, leaf)
    for k in range(3):
        a = k * 2.1
        ico(0.2, (top[0] + math.cos(a) * 0.22, math.sin(a) * 0.22, top[2] - 0.25), mat("Coconut", "6b4f2a", 0.8), 1)
    export("palm")

# ---------------------------------------------------------------- cars
BODY = mat("Body", "d0d0d0", 0.35, 0.35)
CABIN = mat("Cabin", "444444", 0.45)
GLASS = mat("Glass", "1c2a36", 0.06, 0.6)
DARK = mat("Dark", "1b232b", 0.8)
TYRE = DARK
CHROME = mat("Chrome", "c9d1d8", 0.25, 0.9)
LIGHT = mat("Light", "fff0b8", 0.3, 0.0, 2.5)
TAIL = mat("Tail", "e96963", 0.4, 0.0, 1.5)
JET = mat("Jet", "5ff3ff", 0.3, 0.0, 3.0)
HOVER_LIFT = 0.28

# belt = top of the lower body, roof = top of the glass, hood/deck = how far the glass reaches.
CARS = [
    dict(name="car_0", belt=0.36, roof=0.95, front=0.55, back=-0.95, wind=0.55, rear=0.45, wheel=0.36, kind="sedan"),
    dict(name="car_1", belt=0.38, roof=1.02, front=0.65, back=-1.45, wind=0.6, rear=0.12, wheel=0.35, kind="wagon"),
    dict(name="car_2", belt=0.5, roof=1.2, front=0.75, back=-1.5, wind=0.4, rear=0.08, wheel=0.44, kind="suv"),
    dict(name="car_3", belt=0.3, roof=0.78, front=0.3, back=-0.85, wind=0.75, rear=0.6, wheel=0.36, kind="coupe"),
    dict(name="car_4", belt=0.24, roof=0.66, front=0.15, back=-0.7, wind=0.85, rear=0.75, wheel=0.37, kind="super"),
]

def build_car(p):
    W, L = 1.8, 3.5
    hl = L / 2
    zb = -0.36
    belt = p["belt"]
    # Lower body: rounded nose and tail, hood falling slightly to the front.
    nose_drop = 0.12 if p["kind"] != "suv" else 0.04
    lower = [(hl - 0.05, zb + 0.1), (hl, zb + 0.32), (hl - 0.12, belt - nose_drop), (p["front"] + 0.1, belt),
             (p["back"] - 0.05, belt), (-hl + 0.1, belt - 0.04), (-hl, zb + 0.3), (-hl + 0.08, zb + 0.06),
             (-hl + 0.35, zb), (hl - 0.35, zb)]
    prism(lower, W, BODY, bevel=0.07, segs=3)
    # Glass house: windshield and rear window slope in, sides lean in (tumblehome).
    top_f = p["front"] - p["wind"]
    top_b = p["back"] + p["rear"]
    glass = [(p["front"], belt - 0.02), (top_f, p["roof"]), (top_b, p["roof"]), (p["back"], belt - 0.02)]
    prism(glass, W * 0.9, GLASS, bevel=0.05, segs=2, top_scale=0.86, split_z=belt + 0.1)
    # Roof skin (body colour) and pillars.
    roof = [(top_f + 0.04, p["roof"] - 0.02), (top_f - 0.02, p["roof"] + 0.05), (top_b + 0.02, p["roof"] + 0.05), (top_b - 0.04, p["roof"] - 0.02)]
    prism(roof, W * 0.79, BODY, bevel=0.03, segs=2)
    mid = (p["front"] + p["back"]) / 2
    for sx in (-1, 1):
        # B pillar and window sill trim.
        block((0.04, 0.1, p["roof"] - belt), (sx * (W * 0.9 / 2 * 0.93 + 0.005), mid, (p["roof"] + belt) / 2), CABIN)
        block((0.03, abs(p["front"] - p["back"]), 0.04), (sx * (W * 0.45 + 0.01), mid, belt), CHROME if p["kind"] in ("sedan", "wagon") else DARK)
        # Mirrors.
        block((0.16, 0.08, 0.1), (sx * (W / 2 + 0.06), p["front"] - 0.1, belt + 0.12), BODY, 0.03)
        # Door seams and handles.
        block((0.012, 0.012, belt - zb - 0.12), (sx * (W / 2 + 0.002), mid + 0.05, (belt + zb) / 2 + 0.02), DARK)
        block((0.02, 0.16, 0.035), (sx * (W / 2 + 0.01), mid + 0.4, belt - 0.12), CHROME)
    # Lights, grille, bumpers.
    for sx in (-1, 1):
        prism([(hl + 0.005, zb + 0.32), (hl - 0.06, belt - nose_drop - 0.02), (hl - 0.06, belt - nose_drop - 0.12), (hl + 0.005, zb + 0.26)],
              0.42, LIGHT, x=sx * 0.6)
        block((0.46, 0.04, 0.13), (sx * 0.58, -hl - 0.005, belt - 0.12), TAIL, 0.02)
    block((0.75, 0.04, 0.14), (0, hl + 0.01, zb + 0.24), DARK, 0.02)
    block((W * 0.92, 0.1, 0.12), (0, hl - 0.02, zb + 0.08), DARK, 0.04)
    block((W * 0.92, 0.1, 0.12), (0, -hl + 0.02, zb + 0.08), DARK, 0.04)
    # v0.34 hover cars: no wheels. Four glowing hover jets under the body and a neon skirt strip;
    # the whole car is lifted (HOVER_LIFT) so it floats above the road.
    for sx in (-1, 1):
        for sy in (-1, 1):
            x = sx * (W / 2 - 0.3)
            y = sy * 1.05
            cyl(0.3, 0.12, (x, y, zb - 0.02), DARK, verts=18)
            cyl(0.24, 0.05, (x, y, zb - 0.09), JET, verts=18)
    for sx in (-1, 1):
        block((0.025, L * 0.78, 0.04), (sx * (W / 2 + 0.005), 0, zb + 0.1), JET)
    if p["kind"] == "suv":
        for sx in (-1, 1):
            block((0.05, abs(p["front"] - p["back"]) * 0.9, 0.05), (sx * 0.55, mid, p["roof"] + 0.12), DARK)
        for k in (-1, 0, 1):
            block((1.15, 0.05, 0.05), (0, mid + k * 0.5, p["roof"] + 0.12), DARK)
        block((1.2, 0.1, 0.35), (0, hl + 0.1, zb + 0.15), DARK, 0.04)
    if p["kind"] == "coupe":
        block((W * 0.86, 0.26, 0.05), (0, -hl + 0.2, belt + 0.1), BODY, 0.02)
    if p["kind"] == "super":
        for sx in (-1, 1):
            block((0.06, 0.1, 0.28), (sx * 0.6, -hl + 0.3, belt + 0.12), DARK)
        block((W * 0.98, 0.42, 0.06), (0, -hl + 0.3, belt + 0.28), DARK, 0.02)
        block((0.32, L * 0.8, 0.012), (0, 0, belt + 0.002), DARK)
    for o in CUR:
        o.location.z += HOVER_LIFT
    export(p["name"])

# ---------------------------------------------------------------- bus and sky train
def build_bus():
    blue = mat("BusBlue", "2f7fb8", 0.35, 0.3)
    white = mat("BusWhite", "f4f7fa", 0.4)
    win = mat("WinGlass", "1d3442", 0.08, 0.6)
    L, W, H = 11.4, 2.55, 2.95
    # Body (Godot: bus.position y is ground; model sits on the ground).
    prism([(L / 2, 0.45), (L / 2 + 0.05, 2.6), (L / 2 - 0.25, H + 0.35), (-L / 2 + 0.15, H + 0.35), (-L / 2, 3.0), (-L / 2, 0.45)],
          W, blue, bevel=0.12, segs=3)
    block((W + 0.02, L - 0.4, 0.5), (0, 0, 0.75), white, 0.05)
    # Window band and windshield.
    block((W + 0.04, L - 2.0, 1.15), (0, -0.4, 2.2), win, 0.05)
    prism([(L / 2 + 0.07, 1.35), (L / 2 + 0.07, 2.9), (L / 2 - 0.12, 3.15), (L / 2 - 0.2, 1.35)], W * 0.92, win)
    block((W * 0.9, 0.06, 0.32), (0, L / 2 + 0.04, 3.05), mat("BusSign", "ffb84a", 0.3, 0.0, 1.5))
    # Doors (right side), roof unit, lights.
    for y in (L / 2 - 1.3, 0.2):
        block((0.05, 1.2, 2.2), (W / 2 + 0.03, y, 1.55), win)
    block((W * 0.7, 2.6, 0.35), (0, -1.5, H + 0.5), white, 0.08)
    for sx in (-1, 1):
        block((0.42, 0.06, 0.2), (sx * 0.85, L / 2 + 0.06, 0.95), LIGHT, 0.03)
        block((0.3, 0.06, 0.4), (sx * 0.95, -L / 2 - 0.02, 1.1), TAIL, 0.03)
        block((0.12, 0.3, 0.25), (sx * (W / 2 + 0.1), L / 2 - 0.3, 2.6), DARK, 0.03)
    for y in (L / 2 - 2.3, -L / 2 + 2.4):
        for sx in (-1, 1):
            cyl(0.5, 0.32, (sx * (W / 2 - 0.15), y, 0.5), TYRE, rot=(0, math.pi / 2, 0), verts=18)
            cyl(0.3, 0.33, (sx * (W / 2 - 0.14), y, 0.5), CHROME, rot=(0, math.pi / 2, 0), verts=12)
    export("bus")

def sky_car(end):
    body = mat("SkyBody", "f3f5f2", 0.3, 0.25)
    stripe = mat("SkyStripe", "17a2b8", 0.35, 0.3)
    win = mat("SkyWindow", "1d2e3a", 0.08, 0.6)
    under = mat("SkyUnder", "2a3036", 0.7)
    head = mat("SkyHead", "fff6d8", 0.3, 0.0, 2.0)
    L = 13.0
    hl = L / 2
    # Rounded tube-like body; the end car gets a sloped, rounded nose at +Y (Godot -Z).
    if end:
        prof = [(hl + 1.3, 0.55), (hl + 1.35, 1.4), (hl + 0.6, 2.95), (hl - 0.3, 3.3), (-hl, 3.3), (-hl, 0.55)]
    else:
        prof = [(hl, 0.55), (hl, 3.3), (-hl, 3.3), (-hl, 0.55)]
    prism(prof, 2.9, body, bevel=0.35, segs=4, top_scale=0.9, split_z=2.4)
    block((2.94, L - 0.3, 0.32), (0, 0, 0.82), stripe, 0.05)
    block((2.96, L - 1.6, 0.95), (0, 0, 2.15), win, 0.08)
    if end:
        prism([(hl + 1.0, 1.95), (hl + 0.55, 2.95), (hl + 0.2, 3.05), (hl + 0.45, 1.95)], 2.3, win)
        for sx in (-1, 1):
            block((0.42, 0.06, 0.16), (sx * 0.8, hl + 1.33, 1.2), head, 0.03)
        block((2.5, 0.3, 0.3), (0, hl + 1.1, 0.75), stripe, 0.08)
    for y in (-hl + 2.4, hl - 2.4):
        block((2.2, 2.4, 0.5), (0, y, 0.3), under, 0.06)
    for sx in (-1, 1):
        for y in (-3.2, 3.2):
            block((0.04, 1.4, 2.0), (sx * 1.47, y, 1.6), win)
    export("sky_car_end" if end else "sky_car")

# ---------------------------------------------------------------- v0.34.9 futuristic airliner
# Same frame as the old airplane.glb (nose towards -Y, fuselage centre about 2.6 m up, about 15 m
# long before the game scales it x3), so the airport code places it unchanged.
def loft(sections, m, verts=24):
    # sections: [(y, radius_x, radius_z, z_centre)], a smooth closed tube with capped ends.
    me = bpy.data.meshes.new("loft")
    bm = bmesh.new()
    rings = []
    for (y, rx, rz, zc) in sections:
        ring = []
        for k in range(verts):
            a = 2 * math.pi * k / verts
            ring.append(bm.verts.new((math.cos(a) * rx, y, zc + math.sin(a) * rz)))
        rings.append(ring)
    for i in range(len(rings) - 1):
        for k in range(verts):
            a, b = rings[i][k], rings[i][(k + 1) % verts]
            c, d = rings[i + 1][(k + 1) % verts], rings[i + 1][k]
            bm.faces.new((a, b, c, d))
    bm.faces.new(list(reversed(rings[0])))
    bm.faces.new(rings[-1])
    bm.normal_update()
    bm.to_mesh(me)
    bm.free()
    o = bpy.data.objects.new("loft", me)
    bpy.context.collection.objects.link(o)
    return finish(o, m)

def slab(root, tip, m, sign=1.0):
    # A swept, tapering wing panel. root/tip: (x, y_front, y_back, z, thickness)
    me = bpy.data.meshes.new("slab")
    bm = bmesh.new()
    pts = []
    for (x, yf, yb, z, t) in (root, tip):
        pts.append([bm.verts.new((x * sign, yf, z - t / 2)), bm.verts.new((x * sign, yb, z - t / 2)),
                    bm.verts.new((x * sign, yb, z + t / 2)), bm.verts.new((x * sign, yf + (yb - yf) * 0.25, z + t / 2 + t * 0.4))])
    r, tp = pts
    for k in range(4):
        bm.faces.new((r[k], r[(k + 1) % 4], tp[(k + 1) % 4], tp[k]))
    bm.faces.new(list(reversed(r)))
    bm.faces.new(tp)
    bm.normal_update()
    bm.to_mesh(me)
    bm.free()
    o = bpy.data.objects.new("slab", me)
    bpy.context.collection.objects.link(o)
    return finish(o, m)

def build_jet():
    body = mat("PlaneBody", "f4f7fa", 0.25, 0.25)
    livery = mat("PlaneAccent", "1b8fd6", 0.3, 0.3)
    glass = mat("PlaneGlass", "142433", 0.08, 0.6)
    nacelle = mat("PlaneNacelle", "c9d1d8", 0.25, 0.8)
    jet = mat("Jet", "5ff3ff", 0.3, 0.0, 3.0)
    dark = mat("Dark", "1b232b", 0.8)
    zc = 2.7
    # Fuselage: rounded nose, long cabin, tail sweeping up to a slim cone.
    loft([(-7.6, 0.05, 0.05, zc - 0.25), (-7.4, 0.42, 0.38, zc - 0.2), (-7.0, 0.78, 0.72, zc - 0.12),
          (-6.3, 1.02, 0.98, zc - 0.04), (-5.4, 1.15, 1.12, zc), (4.2, 1.15, 1.12, zc),
          (5.6, 1.0, 0.92, zc + 0.18), (6.9, 0.7, 0.58, zc + 0.45), (8.0, 0.32, 0.26, zc + 0.72),
          (8.5, 0.06, 0.06, zc + 0.82)], body, verts=28)
    # Wraparound cockpit glass and a dark window band on each side.
    loft([(-7.15, 0.62, 0.3, zc + 0.42), (-6.75, 0.9, 0.4, zc + 0.5), (-6.35, 0.96, 0.3, zc + 0.56)], glass, verts=20)
    for sx in (-1, 1):
        block((0.04, 9.4, 0.26), (sx * 1.13, -0.6, zc + 0.32), glass)
        # Livery: a sweeping stripe low on the fuselage.
        block((0.04, 11.0, 0.16), (sx * 1.12, 0.4, zc - 0.32), livery)
    # Swept wings with upturned winglets.
    for sg in (-1.0, 1.0):
        slab((1.0, -1.6, 2.6, zc - 0.55, 0.36), (8.6, 2.4, 3.7, zc - 0.05, 0.12), body, sg)
        slab((8.5, 2.45, 3.7, zc - 0.05, 0.1), (8.95, 3.2, 3.9, zc + 1.0, 0.06), livery, sg)
        # Horizontal stabilisers.
        slab((0.4, 6.4, 7.8, zc + 0.6, 0.18), (3.4, 7.9, 8.6, zc + 0.75, 0.08), body, sg)
        # Engine nacelle under each wing: pylon, smooth pod, glowing intake and exhaust.
        x = sg * 3.4
        block((0.18, 1.6, 0.6), (x, 0.4, zc - 0.85), body)
        loft([(-1.1, 0.5, 0.5, zc - 1.35), (-0.9, 0.66, 0.66, zc - 1.35), (0.6, 0.66, 0.66, zc - 1.35),
              (1.4, 0.48, 0.48, zc - 1.35), (1.7, 0.3, 0.3, zc - 1.35)], nacelle, verts=20)
        for k in range(1):
            pass
        bpy.ops.mesh.primitive_torus_add(major_radius=0.56, minor_radius=0.07, location=(x, -1.12, zc - 1.35), rotation=(math.pi / 2, 0, 0))
        finish(bpy.context.active_object, jet)
        cyl(0.3, 0.06, (x, 1.72, zc - 1.35), jet, rot=(math.pi / 2, 0, 0), verts=14)
        CUR[-3].location.x = x
        CUR[-4].location.x = x
    # Swept fin with a livery tip.
    slab((0.0, 5.4, 8.2, zc + 1.0, 0.22), (0.0, 7.6, 8.8, zc + 3.6, 0.1), body)
    CUR[-1].rotation_euler = (0, math.pi / 2, 0)
    # (the fin slab is built flat, then stood up)
    fin = CUR[-1]
    for v in fin.data.vertices:
        v.co.x, v.co.z = v.co.z - (zc + 1.0), v.co.x
    fin.rotation_euler = (0, 0, 0)
    for v in fin.data.vertices:
        x0 = v.co.x
        v.co.x = 0.0 + (v.co.z if False else 0.0) + (x0 * 0.0)
    # Simpler: rebuild the fin as a swept block stack.
    bpy.data.objects.remove(fin, do_unlink=True)
    CUR.pop()
    me = bpy.data.meshes.new("fin")
    bm = bmesh.new()
    t0, t1 = 0.14, 0.06
    rb = [(5.4, zc + 0.9), (8.3, zc + 0.9)]
    tp = [(7.5, zc + 4.0), (8.9, zc + 4.0)]
    vs = []
    for (y, z), t in ((rb[0], t0), (rb[1], t0), (tp[1], t1), (tp[0], t1)):
        vs.append((bm.verts.new((-t, y, z)), bm.verts.new((t, y, z))))
    L = [v[0] for v in vs]
    R = [v[1] for v in vs]
    bm.faces.new(L)
    bm.faces.new(list(reversed(R)))
    for k in range(4):
        bm.faces.new((L[k], L[(k + 1) % 4], R[(k + 1) % 4], R[k]))
    bm.normal_update()
    bm.to_mesh(me)
    bm.free()
    o = bpy.data.objects.new("fin", me)
    bpy.context.collection.objects.link(o)
    finish(o, body)
    block((0.3, 1.4, 0.5), (0, 8.25, zc + 3.85), livery, 0.05)
    # Slim landing gear.
    for (x, y) in ((0.0, -5.6), (-1.4, 0.9), (1.4, 0.9)):
        block((0.14, 0.14, 1.9), (x, y, 1.15), nacelle)
        for dx in (-0.22, 0.22):
            cyl(0.34, 0.2, (x + dx, y, 0.36), dark, rot=(0, math.pi / 2, 0), verts=14)
    export("airplane")

try:
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    if os.environ.get("HARBOR_JET_ONLY", "") != "":
        build_jet()
        print("HARBOR_REAL DONE")
        raise SystemExit
    only_cars = os.environ.get("HARBOR_CARS_ONLY", "") != ""
    if not only_cars:
        round_tree(); pine_tree(); palm_tree()
    for p in CARS:
        build_car(p)
    if not only_cars:
        build_bus(); sky_car(False); sky_car(True)
    print("HARBOR_REAL DONE")
except Exception:
    import traceback
    print("HARBOR_REAL ERROR\n" + traceback.format_exc())

# Harbor City v0.57 flying car concepts for high-level players (Lv 20 / 30 / 40).
# Run from the repo root:
#   /Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python blender-src/make_flycars.py
# Writes reports/flycars/flycar_a|b|c.glb (concepts, not wired into the game yet) and 3/4 + side renders.
# Reuses the hover car helpers (shell, smooth_profile, canopy, ring_thruster, pod, faceted ...).
import bpy, bmesh, math, os
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_hc = (ROOT / "blender-src/make_hovercars.py").read_text()
exec(_hc.split("def car_aero")[0])

OUT = str(ROOT / "reports/flycars")
os.makedirs(OUT, exist_ok=True)
SEAT = mat("Seat", "e8e4dc", 0.6)
PINK = mat("Neon", "ff5ad8", 0.3, 0.0, 3.0)


def _fix(o):
    me = o.data
    bm = bmesh.new()
    bm.from_mesh(me)
    bmesh.ops.recalc_face_normals(bm, faces=bm.faces)
    bm.to_mesh(me)
    bm.free()

def _apply(o, mod):
    bpy.ops.object.select_all(action="DESELECT")
    bpy.context.view_layer.objects.active = o
    o.select_set(True)
    bpy.ops.object.modifier_apply(modifier=mod.name)

def polish(o, bevel=0.03, seg=3, sub=0):
    # Real Blender modifiers: crisp bevelled panel edges (and optional subdivision smoothing).
    try:
        _fix(o)
        if bevel > 0:
            m = o.modifiers.new("bv", "BEVEL")
            m.width = bevel
            m.segments = seg
            m.limit_method = "ANGLE"
            m.angle_limit = math.radians(30)
            _apply(o, m)
        if sub > 0:
            m = o.modifiers.new("ss", "SUBSURF")
            m.levels = sub
            _apply(o, m)
        for p in o.data.polygons:
            p.use_smooth = True
    except Exception as ex:
        print("polish failed", o.name, ex)

def cut(o, boxes):
    # Boolean-difference box cutters out of o: real openings and door seams.
    for (loc, size) in boxes:
        try:
            bpy.ops.mesh.primitive_cube_add(size=1.0, location=loc)
            c = bpy.context.active_object
            c.scale = size
            _fix(o)
            m = o.modifiers.new("bc", "BOOLEAN")
            m.operation = "DIFFERENCE"
            m.solver = "EXACT"
            m.object = c
            _apply(o, m)
            bpy.data.objects.remove(c, do_unlink=True)
        except Exception as ex:
            print("cut failed", o.name, ex)

def polish_all(names, **kw):
    for o in list(bpy.data.objects):
        if o.type == "MESH" and o.name.split(".")[0] in names:
            polish(o, **kw)

def seams(o, sx, y0, y1, z0, z1):
    # Door outline grooves on a side wall at x = sx (cut slightly into the body).
    t = 0.012
    d = 0.05
    cut(o, [((sx, y0, (z0 + z1) / 2), (d, t, z1 - z0)), ((sx, y1, (z0 + z1) / 2), (d, t, z1 - z0)),
            ((sx, (y0 + y1) / 2, z1), (d, y1 - y0, t))])

def ellk(yc, L, hw, zb, zt, n=2.3, cnt=9, tk=0.0, tpow=0.5):
    # Elliptical plan-form keys: a smooth teardrop/lens from nose (yc+L) to tail (yc-L).
    out = []
    for i in range(cnt):
        u = -1.0 + 2.0 * i / (cnt - 1)
        f = max(1.0 - u * u, 0.0) ** 0.5
        out.append((yc - u * L, max(hw * f, 0.03), zb + (1 - f ** tpow) * (zt - zb) * 0.0 + (1 - f) * 0.06, zt * f ** 0.3 + zb * (1 - f ** 0.3), n, tk))
    return out

def swoosh(x, pts, m, th=0.05, st=5):
    # A curved crescent fin in the y-z plane: pts [(y, z_bottom, z_top)], smooth, thin in x.
    prof = [(y, th, zb, zt, 2.6) for (y, zb, zt) in pts]
    o = shell(smooth_profile(prof, st), m, 20, "swoosh")
    o.location.x = x
    return o

def wing_plate(zc, keys, m, tip_y=None, tip_len=0.7, th=0.05):
    prof = [(y, hw, zc - th, zc + th, 2.4) for (y, hw) in keys]
    shell(smooth_profile(prof, 5), m, 28, "wing")
    if tip_y is not None:
        wx = max(k[1] for k in keys)
        for sx in (-1, 1):
            bpy.ops.mesh.primitive_uv_sphere_add(radius=0.07, location=(sx * (wx - 0.06), tip_y, zc), segments=14, ring_count=8)
            o = bpy.context.active_object
            o.scale = (0.7, tip_len * 4.5, 0.5)
            finish(o, JET)

def ribs(keys, ys, m=None, r=0.026):
    # Metal arch ribs that hug the glass canopy: a bevelled curve that follows the same cross-section
    # formula as the glass shell (including its tumblehome), converted to a real mesh.
    m = m or CHROME
    pts = smooth_profile(keys, 8)
    for y in ys:
        k = min(pts, key=lambda p: abs(p[0] - y))
        hw, zb, zt, n, tk = k[1], k[2], k[3], k[4], k[5]
        zc, hz = (zb + zt) / 2.0, max((zt - zb) / 2.0, 0.005)
        cd = bpy.data.curves.new("rib", "CURVE")
        cd.dimensions = "3D"
        cd.bevel_depth = r
        cd.bevel_resolution = 2
        cd.use_fill_caps = True
        sp = cd.splines.new("POLY")
        cnt = 40
        sp.points.add(cnt - 1)
        for i in range(cnt):
            a = -0.35 + (math.pi + 0.7) * i / (cnt - 1)
            cx, sz = sup(a, n)
            w = max(hw, 0.005) * (1.0 - tk * max(sz, 0.0) ** 1.5)
            sp.points[i].co = (cx * w * 1.012, y, zc + sz * hz * 1.012, 1.0)
        o = bpy.data.objects.new("rib", cd)
        bpy.context.collection.objects.link(o)
        bpy.ops.object.select_all(action="DESELECT")
        bpy.context.view_layer.objects.active = o
        o.select_set(True)
        bpy.ops.object.convert(target="MESH")
        finish(bpy.context.view_layer.objects.active, m)

def trim_rods(hw, y0, y1, z, m=None, r=0.014):
    for sx in (-1, 1):
        cyl(r, (y1 - y0) * 0.8, (sx * hw * 0.93, (y0 + y1) / 2.0, z), m or CHROME, rot=(math.pi / 2, 0, 0), verts=10)

def blade(y, hw, z, s=1.0, m=None):
    # A curved dark bumper blade across the nose (s=1) or tail (s=-1).
    shell(smooth_profile([(y + s * 0.1, hw * 0.45, z - 0.03, z + 0.03, 3.0), (y, hw * 0.8, z - 0.04, z + 0.04, 3.0),
                          (y - s * 0.1, hw * 0.65, z - 0.03, z + 0.03, 3.0)], 4), m or DARK, 28, "blade")

def fly_a():
    # Lv 20 "Silver Coupe": a rounded teardrop coupe with a panoramic ribbed dome, plump fenders over
    # glowing thrusters, chrome trim, bumper blades and short swept wings.
    keys = [(2.05, 0.4, ZB + 0.2, ZB + 0.42, 2.2, 0.1), (1.7, 0.8, ZB + 0.06, ZB + 0.66, 2.3, 0.2), (1.0, 0.98, ZB, ZB + 0.84, 2.2, 0.22),
            (0.0, 1.03, ZB - 0.02, ZB + 0.9, 2.2, 0.25), (-1.0, 0.98, ZB, ZB + 0.84, 2.2, 0.24), (-1.65, 0.8, ZB + 0.06, ZB + 0.66, 2.3, 0.2),
            (-2.05, 0.42, ZB + 0.18, ZB + 0.44, 2.2, 0.1)]
    shell(smooth_profile(keys, 6), BODY, 48, "body")
    can = [(1.2, 0.5, 0.34, 0.38, 2.2, 0.2), (0.75, 0.8, 0.34, 1.0, 2.1, 0.3), (-0.1, 0.9, 0.34, 1.26, 2.1, 0.32),
           (-0.95, 0.8, 0.34, 1.02, 2.1, 0.3), (-1.55, 0.54, 0.34, 0.6, 2.1, 0.25)]
    canopy(can)
    ribs(can, [0.55, -0.1, -0.75])
    for sx in (-1, 1):
        for sy in (-1, 1):
            shell(smooth_profile([(sy * 1.15 + 0.7, 0.3, ZB + 0.12, ZB + 0.34, 2.2), (sy * 1.15 + 0.3, 0.9, ZB - 0.06, ZB + 0.6, 2.2),
                                  (sy * 1.15 - 0.3, 0.9, ZB - 0.06, ZB + 0.6, 2.2), (sy * 1.15 - 0.7, 0.3, ZB + 0.12, ZB + 0.34, 2.2)], 5), BODY, 32, "fender").location.x = sx * 0.55
            ring_thruster((sx * 0.9, sy * 1.15, ZB - 0.02), 0.36, CHROME)
        block((0.34, 0.5, 0.55), (sx * 0.32, 0.0, ZB + 0.55), SEAT, 0.12)
        block((0.34, 0.5, 0.55), (sx * 0.32, -0.8, ZB + 0.55), SEAT, 0.12)
        cyl(0.12, 0.04, (sx * 0.38, 2.03, ZB + 0.3), LIGHT, rot=(math.pi / 2, 0, 0), verts=24)
        cyl(0.12, 0.04, (sx * 0.38, -2.03, ZB + 0.3), TAIL, rot=(math.pi / 2, 0, 0), verts=24)
    trim_rods(1.0, -1.4, 1.4, ZB + 0.34)
    blade(2.12, 1.0, ZB + 0.12, 1.0)
    blade(-2.12, 1.0, ZB + 0.12, -1.0)
    wing_plate(ZB + 0.4, [(0.2, 1.0), (-0.2, 1.5), (-0.7, 1.9), (-1.1, 1.95), (-1.4, 1.5), (-1.6, 0.9)], BODY, -1.0, 0.4, 0.05)
    swoosh(0.0, [(-0.9, ZB + 0.72, ZB + 0.85), (-1.4, ZB + 0.72, ZB + 1.25), (-1.9, ZB + 0.74, ZB + 1.5), (-2.25, ZB + 0.8, ZB + 1.45), (-2.3, ZB + 0.8, ZB + 1.0)], CABIN, 0.04)

def fly_b():
    # Lv 30 "Panoramic Shuttle": a long smooth shuttle with a huge glass dome and three metal ribs,
    # a lens deck, a curved front blade, big rear ring thrusters and a ribbon that sweeps up behind.
    deck = [(2.2, 0.3, ZB + 0.08, ZB + 0.3, 2.1, 0.1), (1.6, 0.86, ZB, ZB + 0.46, 2.1, 0.1), (0.4, 1.1, ZB - 0.02, ZB + 0.5, 2.1, 0.1),
            (-0.8, 1.1, ZB - 0.02, ZB + 0.5, 2.1, 0.1), (-1.7, 0.84, ZB + 0.02, ZB + 0.44, 2.1, 0.1), (-2.2, 0.3, ZB + 0.1, ZB + 0.3, 2.1, 0.1)]
    shell(smooth_profile(deck, 6), BODY, 48, "deck")
    dome = [(1.8, 0.3, ZB + 0.34, ZB + 0.42, 2.0), (1.1, 0.78, ZB + 0.34, ZB + 1.05, 2.0), (0.2, 0.95, ZB + 0.34, ZB + 1.55, 2.0),
            (-0.7, 0.9, ZB + 0.34, ZB + 1.4, 2.0), (-1.5, 0.6, ZB + 0.34, ZB + 0.8, 2.0), (-1.8, 0.25, ZB + 0.34, ZB + 0.45, 2.0)]
    shell(smooth_profile(dome, 6), GLASS, 48, "dome")
    ribs(dome, [1.0, 0.25, -0.55])
    for sx in (-1, 1):
        for yy in (0.4, -0.7):
            block((0.4, 0.5, 0.18), (sx * 0.34, yy, ZB + 0.42), SEAT, 0.08)
            block((0.4, 0.14, 0.6), (sx * 0.34, yy - 0.3, ZB + 0.68), SEAT, 0.08)
        for sy in (-1, 1):
            ring_thruster((sx * 0.7, sy * 1.15, ZB - 0.04), 0.3, CHROME)
        bpy.ops.mesh.primitive_torus_add(major_radius=0.3, minor_radius=0.05, major_segments=32, minor_segments=8,
                                         location=(sx * 0.5, -2.0, ZB + 0.26), rotation=(math.pi / 2, 0, 0))
        finish(bpy.context.active_object, DARK)
        cyl(0.28, 0.04, (sx * 0.5, -2.0, ZB + 0.26), JET, rot=(math.pi / 2, 0, 0), verts=24)
    trim_rods(1.1, -1.5, 1.5, ZB + 0.3)
    blade(2.15, 1.1, ZB + 0.14, 1.0)
    blade(-2.0, 1.1, ZB + 0.2, -1.0)
    rib = [(-1.5 - 0.24 * i, 0.3 - 0.015 * i, ZB + 0.42 + 0.018 * i * i, ZB + 0.5 + 0.018 * i * i, 2.6) for i in range(0, 8)]
    shell(smooth_profile(rib, 3), BODY, 20, "ribbon")

def fly_c():
    # Lv 40 "Nadera Racer": a long rounded saloon. One panoramic dome with ribs, a chrome flank line,
    # a light-bar nose, red tail slits, bumper blades and a neon underline.
    keys = [(2.3, 0.4, ZB + 0.06, ZB + 0.26, 2.2, 0.1), (1.7, 0.84, ZB, ZB + 0.44, 2.3, 0.14), (0.6, 1.02, ZB - 0.02, ZB + 0.58, 2.3, 0.18),
            (-0.8, 1.04, ZB - 0.02, ZB + 0.6, 2.3, 0.18), (-1.7, 0.86, ZB, ZB + 0.46, 2.3, 0.14), (-2.3, 0.4, ZB + 0.06, ZB + 0.28, 2.2, 0.1)]
    shell(smooth_profile(keys, 6), BODY, 48, "body")
    can = [(1.5, 0.45, 0.14, 0.18, 2.2, 0.2), (0.8, 0.8, 0.14, 0.78, 2.1, 0.3), (-0.1, 0.88, 0.14, 1.0, 2.1, 0.3),
           (-1.0, 0.8, 0.14, 0.78, 2.1, 0.3), (-1.7, 0.5, 0.14, 0.34, 2.1, 0.25)]
    canopy(can)
    ribs(can, [0.8, -0.1, -1.0])
    for sx in (-1, 1):
        for sy in (-1, 1):
            ring_thruster((sx * 0.8, sy * 1.2, ZB - 0.04), 0.3, CHROME)
        block((0.34, 0.45, 0.5), (sx * 0.32, -0.25, ZB + 0.4), SEAT, 0.12)
        block((0.04, 0.3, 0.04), (sx * 0.3, -2.3, ZB + 0.2), TAIL, 0.01)
        block((0.025, 2.6, 0.03), (sx * 1.03, 0.0, ZB + 0.26), PINK)
    trim_rods(1.03, -1.8, 1.8, ZB + 0.22)
    blade(2.28, 1.0, ZB + 0.1, 1.0)
    blade(-2.28, 1.0, ZB + 0.12, -1.0)
    block((1.0, 0.05, 0.05), (0, 2.3, ZB + 0.18), LIGHT, 0.01)
    for sx in (-1, 1):
        swoosh(sx * 0.8, [(-1.1, ZB + 0.45, ZB + 0.5), (-1.6, ZB + 0.45, ZB + 0.85), (-2.0, ZB + 0.45, ZB + 1.0), (-2.15, ZB + 0.45, ZB + 0.7)], BODY, 0.03)

CARS = [("flycar_a", fly_a, "c8d0da", 0.2, 0.9), ("flycar_b", fly_b, "3fcf9e", 0.2, 0.4), ("flycar_c", fly_c, "7a3fd4", 0.2, 0.4)]

def render(name, color, rough, metal, out_dir):
    scene = bpy.context.scene
    ids = [e.identifier for e in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items]
    scene.render.engine = "BLENDER_EEVEE_NEXT" if "BLENDER_EEVEE_NEXT" in ids else "BLENDER_EEVEE"
    scene.render.resolution_x = 1280
    scene.render.resolution_y = 720
    bpy.ops.import_scene.gltf(filepath=os.path.join(OUT, name + ".glb"))
    objs = list(bpy.context.selected_objects)
    r, g, b = [lin(int(color[i:i + 2], 16)) for i in (0, 2, 4)]
    for o in objs:
        o.location.z += 0.55
        for slot in o.material_slots:
            if slot.material and slot.material.name.startswith("Body"):
                bs = slot.material.node_tree.nodes.get("Principled BSDF")
                if bs:
                    bs.inputs["Base Color"].default_value = (r, g, b, 1)
                    bs.inputs["Roughness"].default_value = rough
                    bs.inputs["Metallic"].default_value = metal
                    for kn in ("Coat Weight", "Clearcoat"):
                        if kn in bs.inputs:
                            bs.inputs[kn].default_value = 1.0
    extra = []
    bpy.ops.mesh.primitive_plane_add(size=60, location=(0, 0, -0.35))
    floor = bpy.context.active_object
    fm = bpy.data.materials.new("floor")
    fm.use_nodes = True
    fb = fm.node_tree.nodes["Principled BSDF"]
    fb.inputs["Base Color"].default_value = (0.33, 0.36, 0.4, 1)
    fb.inputs["Roughness"].default_value = 0.22
    fb.inputs["Metallic"].default_value = 0.2
    floor.data.materials.append(fm)
    extra.append(floor)
    tgt = bpy.data.objects.new("tgt", None)
    tgt.location = (0, 0, 0.45)
    scene.collection.objects.link(tgt)
    extra.append(tgt)
    cam = bpy.data.objects.new("cam", bpy.data.cameras.new("cam"))
    cam.data.lens = 42
    scene.collection.objects.link(cam)
    tc = cam.constraints.new("TRACK_TO")
    tc.target = tgt
    tc.track_axis = "TRACK_NEGATIVE_Z"
    tc.up_axis = "UP_Y"
    scene.camera = cam
    extra.append(cam)
    def lamp(kind, loc, energy, col, size=4.0):
        ld = bpy.data.lights.new("l", kind)
        ld.energy = energy
        ld.color = col
        if kind == "AREA":
            ld.size = size
        lo = bpy.data.objects.new("l", ld)
        lo.location = loc
        scene.collection.objects.link(lo)
        lt = lo.constraints.new("TRACK_TO")
        lt.target = tgt
        lt.track_axis = "TRACK_NEGATIVE_Z"
        lt.up_axis = "UP_Y"
        extra.append(lo)
    lamp("AREA", (4, 5, 6), 650, (1, 0.97, 0.94), 9)
    lamp("AREA", (-6, -3, 4), 380, (0.7, 0.8, 1.0), 9)
    lamp("POINT", (0, 0, -0.1), 260, (0.2, 0.95, 0.95))
    if scene.world is None:
        scene.world = bpy.data.worlds.new("w")
    scene.world.use_nodes = True
    bg = scene.world.node_tree.nodes.get("Background")
    if bg:
        bg.inputs["Color"].default_value = (0.3, 0.33, 0.38, 1)
        bg.inputs["Strength"].default_value = 1.0
    for tag, pos in (("3q", (6.2, 6.0, 2.3)), ("side", (9.5, 0.0, 0.9)), ("rear", (-5.5, -6.5, 2.0))):
        cam.location = pos
        scene.render.filepath = os.path.join(out_dir, "%s_%s.png" % (name, tag))
        bpy.ops.render.render(write_still=True)
    for o in objs + extra:
        bpy.data.objects.remove(o, do_unlink=True)

INTERIOR = mat("Interior", "2a2f38", 0.7)
PARTS = {"Body": "Bodywork", "Cabin": "Bodywork", "Dark": "Trim", "Chrome": "Trim", "Glass": "Glazing", "Light": "Lights",
         "Tail": "Lights", "Jet": "Lights", "Neon": "Lights", "Seat": "Interior", "Interior": "Interior"}

def add_interior(y_dash, y_wheel, zf):
    # Dashboard, steering wheel and floor pan so the cabin is not empty.
    block((1.3, 0.3, 0.18), (0, y_dash, zf + 0.2), INTERIOR, 0.07)
    block((1.3, 2.4, 0.04), (0, -0.1, zf), INTERIOR, 0.01)
    bpy.ops.mesh.primitive_torus_add(major_radius=0.14, minor_radius=0.018, major_segments=24, minor_segments=8,
                                     location=(-0.32, y_wheel, zf + 0.36), rotation=(math.radians(60), 0, 0))
    finish(bpy.context.active_object, INTERIOR)

def build_blend():
    scene = bpy.context.scene
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    cars = [("Coupe_Lv20", fly_a, "8f9aac", 0.3, 0.25, -4.8, (0.6, 0.4, ZB + 0.3)),
            ("Shuttle_Lv30", fly_b, "3fcf9e", 0.2, 0.4, 0.0, (0.85, 0.6, ZB + 0.3)),
            ("Racer_Lv40", fly_c, "7a3fd4", 0.2, 0.4, 4.8, (0.7, 0.5, ZB + 0.18))]
    for name, fn, col, rough, metal, ox, it in cars:
        before = set(bpy.data.objects)
        fn()
        add_interior(*it)
        new = [o for o in bpy.data.objects if o not in before]
        cc = bpy.data.collections.new("FlyCar_" + name)
        scene.collection.children.link(cc)
        root = bpy.data.objects.new(name + "_ROOT", None)
        cc.objects.link(root)
        root.location = (ox, 0, 0.6)
        subs, mats, count = {}, {}, {}
        for o in new:
            for c in list(o.users_collection):
                c.objects.unlink(o)
            mn = o.material_slots[0].material.name.split(".")[0] if o.material_slots and o.material_slots[0].material else "Body"
            part = PARTS.get(mn, "Misc")
            if part not in subs:
                subs[part] = bpy.data.collections.new("%s_%s" % (name, part))
                cc.children.link(subs[part])
            subs[part].objects.link(o)
            o.parent = root
            for slot in o.material_slots:
                m = slot.material
                key = m.name.split(".")[0]
                if key not in mats:
                    mats[key] = m.copy()
                    mats[key].name = name + "_" + key
                slot.material = mats[key]
            count[part] = count.get(part, 0) + 1
            o.name = "%s_%s_%02d" % (name, part, count[part])
            if o.type == "MESH":
                for p in o.data.polygons:
                    p.use_smooth = True
        gm = mats.get("Glass")
        if gm:
            gb = gm.node_tree.nodes.get("Principled BSDF")
            if gb and "Alpha" in gb.inputs:
                gb.inputs["Alpha"].default_value = 0.3
            try:
                gm.surface_render_method = "BLENDED"
            except Exception:
                pass
            try:
                gm.blend_method = "BLEND"
            except Exception:
                pass
        bm_ = mats.get("Body")
        if bm_:
            r, g, b = [lin(int(col[i:i + 2], 16)) for i in (0, 2, 4)]
            bs = bm_.node_tree.nodes.get("Principled BSDF")
            bs.inputs["Base Color"].default_value = (r, g, b, 1)
            bs.inputs["Roughness"].default_value = rough
            bs.inputs["Metallic"].default_value = metal
            for kn in ("Coat Weight", "Clearcoat"):
                if kn in bs.inputs:
                    bs.inputs[kn].default_value = 1.0
        print("BLEND_CAR", name, {k: v for k, v in count.items()})
    # Studio: floor, soft lights, camera (kept in the file so the preview is reproducible).
    st = bpy.data.collections.new("Studio")
    scene.collection.children.link(st)
    bpy.ops.mesh.primitive_plane_add(size=80, location=(0, 0, -0.0))
    fl = bpy.context.active_object
    fm = bpy.data.materials.new("StudioFloor")
    fm.use_nodes = True
    fb = fm.node_tree.nodes["Principled BSDF"]
    fb.inputs["Base Color"].default_value = (0.33, 0.36, 0.4, 1)
    fb.inputs["Roughness"].default_value = 0.22
    fl.data.materials.append(fm)
    fl.name = "StudioFloor"
    for c in list(fl.users_collection):
        c.objects.unlink(fl)
    st.objects.link(fl)
    tgt = bpy.data.objects.new("StudioTarget", None)
    tgt.location = (0, 0, 0.9)
    st.objects.link(tgt)
    def lamp(kind, loc, energy, colr, size=9.0):
        ld = bpy.data.lights.new("l", kind)
        ld.energy = energy
        ld.color = colr
        if kind == "AREA":
            ld.size = size
        lo = bpy.data.objects.new("StudioLight", ld)
        lo.location = loc
        st.objects.link(lo)
        tc = lo.constraints.new("TRACK_TO")
        tc.target = tgt
        tc.track_axis = "TRACK_NEGATIVE_Z"
        tc.up_axis = "UP_Y"
    lamp("AREA", (6, 8, 9), 1000, (1, 0.97, 0.94))
    lamp("AREA", (-9, -4, 6), 550, (0.7, 0.8, 1.0))
    for ox in (-4.8, 0.0, 4.8):
        lamp("POINT", (ox, 0, 0.35), 150, (0.2, 0.95, 0.95), 1.0)
    cam = bpy.data.objects.new("StudioCamera", bpy.data.cameras.new("cam"))
    cam.data.lens = 40
    st.objects.link(cam)
    tc = cam.constraints.new("TRACK_TO")
    tc.target = tgt
    tc.track_axis = "TRACK_NEGATIVE_Z"
    tc.up_axis = "UP_Y"
    scene.camera = cam
    ids = [e.identifier for e in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items]
    scene.render.engine = "BLENDER_EEVEE_NEXT" if "BLENDER_EEVEE_NEXT" in ids else "BLENDER_EEVEE"
    scene.render.resolution_x = 1600
    scene.render.resolution_y = 900
    if scene.world is None:
        scene.world = bpy.data.worlds.new("w")
    scene.world.use_nodes = True
    bgn = scene.world.node_tree.nodes.get("Background")
    bgn.inputs["Color"].default_value = (0.3, 0.33, 0.38, 1)
    views = [("overview", (-4.0, 13.0, 4.6), (0, 0, 0.8), 36), ("coupe", (-9.5, 5.0, 2.8), (-4.8, 0, 1.0), 40),
             ("shuttle", (-4.6, 6.2, 2.6), (0, 0, 1.0), 40), ("racer", (0.0, 5.6, 2.6), (4.8, 0, 1.0), 40)]
    for tag, pos, tg, lens in views:
        cam.location = pos
        tgt.location = tg
        cam.data.lens = lens
        scene.render.filepath = os.path.join(OUT, "blend_%s.png" % tag)
        bpy.ops.render.render(write_still=True)
    bpy.ops.wm.save_as_mainfile(filepath=os.path.join(OUT, "harbor_flycars.blend"))
    print("BLEND_SAVED")

try:
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    for name, fn, col, rough, metal in CARS:
        fn()
        export(name)
    for name, fn, col, rough, metal in CARS:
        render(name, col, rough, metal, OUT)
    build_blend()
    print("HARBOR_FLYCARS DONE")
except Exception:
    import traceback
    print("HARBOR_FLYCARS ERROR\n" + traceback.format_exc())

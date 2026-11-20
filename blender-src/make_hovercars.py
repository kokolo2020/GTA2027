# Harbor City v0.45 hover cars. Original procedural designs, no outside assets.
# Run from the repo root:
#   /Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python blender-src/make_hovercars.py
# Optional: HARBOR_CAR_RENDER=<dir> also renders a 3/4 preview of each car.
# Replaces car_0..car_4 (same names, same frame as before: origin at the body centre, front +Y in
# Blender = -Z in Godot, about 1.9 x 3.9 m). Material names match what the game recolours and
# lights: Body (paint), Cabin (second colour), Glass, Light, Tail, Jet (hover glow), Dark, Chrome.
import bpy, bmesh, math, os
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
_real = (ROOT / "blender-src/make_real.py").read_text()
exec(_real.split("# belt = top of the lower body")[0])   # helpers (mat, block, cyl, export, slab...) and materials
exec("def loft(" + _real.split("def loft(")[1].split("def build_jet")[0])   # loft and slab

HOVER = 0.28          # lift, the same as the old hover cars (HOVER_LIFT)

def sup(a, n):
    # Superellipse helper: n = 2 is an ellipse, bigger n is squarer.
    c, s = math.cos(a), math.sin(a)
    return (math.copysign(abs(c) ** (2.0 / n), c), math.copysign(abs(s) ** (2.0 / n), s))

def shell(sections, m, verts=28, name="shell"):
    # sections: [(y, half_width, z_bottom, z_top, squareness[, roof_narrowing])]: a smooth closed body,
    # capped. roof_narrowing (0..1) pulls the upper half in (tumblehome), so sides lean in like a real car.
    me = bpy.data.meshes.new(name)
    bm = bmesh.new()
    rings = []
    for sec in sections:
        y, hw, zb, zt, n = sec[:5]
        tk = sec[5] if len(sec) > 5 else 0.0
        zc = (zb + zt) / 2.0
        hz = max((zt - zb) / 2.0, 0.005)
        ring = []
        for k in range(verts):
            a = 2 * math.pi * k / verts
            cx, sz = sup(a, n)
            w = max(hw, 0.005) * (1.0 - tk * max(sz, 0.0) ** 1.5)
            ring.append(bm.verts.new((cx * w, y, zc + sz * hz)))
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
    o = bpy.data.objects.new(name, me)
    bpy.context.collection.objects.link(o)
    return finish(o, m)

def smooth_profile(keys, steps=4):
    # keys: [(y, hw, zb, zt, n, tk)] -> Catmull-Rom smoothed list with `steps` samples between keys.
    keys = [tuple(k) + (0.0,) * (6 - len(k)) for k in keys]
    out = []
    for i in range(len(keys) - 1):
        p0 = keys[max(i - 1, 0)]
        p1 = keys[i]
        p2 = keys[i + 1]
        p3 = keys[min(i + 2, len(keys) - 1)]
        for s in range(steps):
            t = s / steps
            t2, t3 = t * t, t * t * t
            out.append(tuple(0.5 * ((2 * p1[j]) + (-p0[j] + p2[j]) * t + (2 * p0[j] - 5 * p1[j] + 4 * p2[j] - p3[j]) * t2
                                    + (-p0[j] + 3 * p1[j] - 3 * p2[j] + p3[j]) * t3) for j in range(6)))
    out.append(keys[-1])
    return out

def ring_thruster(loc, r, m_frame, tilt=0.0):
    # A hover thruster: a dark ring with a glowing disc inside, facing down.
    bpy.ops.mesh.primitive_torus_add(major_radius=r, minor_radius=r * 0.22, major_segments=24, minor_segments=8,
                                     location=loc, rotation=(tilt, 0, 0))
    finish(bpy.context.active_object, m_frame)
    cyl(r * 0.82, 0.03, (loc[0], loc[1], loc[2] - 0.02), JET, verts=20)

def light_bar(y, z, w, m, h=0.05, d=0.05):
    block((w, d, h), (0, y, z), m, 0.015)

def nacelle(x, y0, y1, zc, r, m):
    # A long side pod with a glowing strip underneath and a thruster ring at the back.
    keys = [(y1, 0.02, zc - 0.02, zc + 0.02, 2.0), (y1 - 0.25, r * 0.8, zc - r * 0.75, zc + r * 0.8, 2.4),
            ((y0 + y1) / 2, r, zc - r, zc + r, 2.6), (y0 + 0.2, r * 0.9, zc - r * 0.9, zc + r * 0.9, 2.4),
            (y0, r * 0.75, zc - r * 0.75, zc + r * 0.75, 2.2)]
    o = shell(smooth_profile(keys, 3), m, 20, "nacelle")
    o.location.x = x
    block((r * 0.9, (y1 - y0) * 0.75, 0.03), (x, (y0 + y1) / 2, zc - r * 0.98), JET)
    bpy.ops.mesh.primitive_torus_add(major_radius=r * 0.7, minor_radius=r * 0.12, major_segments=20, minor_segments=6,
                                     location=(x, y0 - 0.01, zc), rotation=(math.pi / 2, 0, 0))
    finish(bpy.context.active_object, CHROME)
    cyl(r * 0.6, 0.03, (x, y0 - 0.02, zc), JET, rot=(math.pi / 2, 0, 0), verts=18)

# --------------------------------------------------------------- the five cars
# Every body: z = 0 is the body centre in the old frame; the underside sits at ZB.
ZB = -0.36

def pod(x, y, r, zc):
    # A sculpted hover pod (like a wheel arch) with a glowing thruster ring under it.
    shell(smooth_profile([(y + r * 1.5, 0.02, zc - 0.03, zc + 0.03, 2.0), (y + r * 1.1, r * 0.55, zc - r * 0.45, zc + r * 0.5, 3.0),
                          (y, r * 0.62, zc - r * 0.5, zc + r * 0.62, 3.4), (y - r * 1.1, r * 0.55, zc - r * 0.45, zc + r * 0.5, 3.0),
                          (y - r * 1.5, 0.02, zc - 0.03, zc + 0.03, 2.0)], 3), BODY, 20, "pod").location.x = x
    ring_thruster((x, y, zc - r * 0.52), r * 0.62, CHROME)

def canopy(keys):
    # Glass with a thin frame round its base.
    shell(smooth_profile(keys), GLASS, 32, "canopy")
    base = [(k[0], k[1] + 0.025, k[2] - 0.015, k[2] + 0.035, 3.0) for k in keys]
    shell(smooth_profile(base), CABIN, 24, "frame")

def tail_bar(y, z, hw, m, h=0.045):
    block((hw * 2.0, 0.04, h), (0, y, z), m, 0.012)

def end_lights(keys):
    # A light blade across the nose tip and a tail blade across the back, sized to the body there.
    for (k, m, s) in ((keys[0], LIGHT, 1.0), (keys[-1], TAIL, -1.0)):
        y, hw, zb, zt = k[0], k[1], k[2], k[3]
        block((hw * 1.7, 0.05, max((zt - zb) * 0.3, 0.035)), (0, y + s * 0.005, (zb + zt) / 2.0 + (zt - zb) * 0.12), m, 0.012)

def vents(x, y0, y1, z, h, n, m=None):
    # Dark slats on a side panel (x is the outer surface, sign gives the side).
    m = m or DARK
    for k in range(n):
        y = y0 + (y1 - y0) * (k + 0.5) / n
        block((0.03, (abs(y1 - y0) / n) * 0.45, h), (x, y, z), m)

def faceted(keys, m, verts=32, name="facet"):
    # Straight lines between sections and square-ish sections: crisp, angular panels.
    return shell(smooth_profile(keys, 1), m, verts, name)

def glow_skirt(hw, y0, y1, z):
    for sx in (-1, 1):
        block((0.025, y1 - y0, 0.035), (sx * hw, (y0 + y1) / 2, z), JET)

def under_jets(xs, ys, r=0.24):
    for x in xs:
        for y in ys:
            cyl(r, 0.03, (x, y, ZB - 0.035), JET, verts=18)

def roof_cap(glass, m=None, lin=False):
    # A body-colour roof sitting flush on top of a glass house (follows the glass's top edge).
    secs = []
    for g in glass:
        y, hw, zb, zt, n = g[:5]
        tk = g[5] if len(g) > 5 else 0.0
        if zt - zb < 0.2:
            continue
        secs.append((y, hw * (1.0 - tk) * 0.98 + 0.01, zt - 0.07, zt + 0.025, max(n, 4.0)))
    if len(secs) >= 2:
        (faceted if lin else lambda k, mm, v, nm: shell(smooth_profile(k, 3), mm, v, nm))(secs, m or BODY, 24, "roof")

def car_aero():
    # car_0 "Lumen": a retro-future hatchback. Rounded body, big skirted arches over the hover
    # thrusters, a glass house with slim pillars, cyan ring lamps and a cyan skirt line.
    keys = [(2.0, 0.62, ZB + 0.12, ZB + 0.40, 3.0, 0.15), (1.75, 0.84, ZB + 0.04, ZB + 0.56, 3.6, 0.2), (1.0, 0.88, ZB + 0.02, ZB + 0.62, 3.8, 0.22),
            (-0.8, 0.88, ZB + 0.02, ZB + 0.64, 3.8, 0.22), (-1.7, 0.86, ZB + 0.04, ZB + 0.62, 3.6, 0.2), (-1.98, 0.72, ZB + 0.1, ZB + 0.56, 3.2, 0.15)]
    shell(smooth_profile(keys), BODY, 36, "body")
    end_lights(keys)
    # Arches: swollen fenders front and back that hang down over the thrusters.
    for sy in (-1, 1):
        y = sy * 1.2
        shell(smooth_profile([(y + 0.62, 0.84, ZB + 0.1, ZB + 0.34, 3.0), (y + 0.4, 0.97, ZB - 0.08, ZB + 0.56, 3.4),
                              (y - 0.4, 0.97, ZB - 0.08, ZB + 0.56, 3.4), (y - 0.62, 0.84, ZB + 0.1, ZB + 0.34, 3.0)], 3), BODY, 32, "arch")
        under_jets((-0.6, 0.6), (y,), 0.26)
    # Glass house with pillars and a roof.
    can = [(0.85, 0.6, 0.26, 0.3, 3.0, 0.25), (0.55, 0.72, 0.26, 0.74, 3.4, 0.28), (-0.9, 0.72, 0.26, 0.80, 3.6, 0.28),
           (-1.6, 0.66, 0.26, 0.70, 3.4, 0.26), (-1.85, 0.58, 0.26, 0.42, 3.0, 0.22)]
    shell(smooth_profile(can, 3), GLASS, 32, "glass")
    roof_cap(can[1:-1])
    for sx in (-1, 1):
        for (y, z0, z1) in ((0.6, 0.3, 0.7), (-0.25, 0.3, 0.74), (-1.15, 0.3, 0.68)):
            block((0.05, 0.08, z1 - z0), (sx * 0.6, y, (z0 + z1) / 2), CABIN)
        cyl(0.11, 0.03, (sx * 0.52, -2.0, ZB + 0.38), JET, rot=(math.pi / 2, 0, 0), verts=18)
    glow_skirt(0.89, -1.6, 1.6, ZB + 0.08)
    block((0.8, 0.04, 0.05), (0, 1.985, ZB + 0.18), JET, 0.01)

def car_glide():
    # car_1 "Solar Cab": a wedge-nosed city cab. Low sloping bonnet, a tall glass cabin and two big
    # rounded thruster pods at the back with glowing exhausts.
    keys = [(2.0, 0.84, ZB + 0.12, ZB + 0.32, 6.0, 0.1), (1.5, 0.90, ZB + 0.04, ZB + 0.48, 6.0, 0.15), (0.6, 0.90, ZB + 0.02, ZB + 0.58, 6.0, 0.18),
            (-0.7, 0.86, ZB + 0.02, ZB + 0.6, 6.0, 0.18), (-1.4, 0.70, ZB + 0.06, ZB + 0.56, 5.0, 0.15)]
    faceted(keys, BODY, 32, "body")
    end_lights(keys[:1] + [keys[0]])
    faceted([(0.85, 0.58, 0.22, 0.26, 5.0, 0.2), (0.45, 0.76, 0.22, 0.72, 5.0, 0.25), (-0.9, 0.74, 0.22, 0.80, 5.0, 0.25),
             (-1.3, 0.6, 0.22, 0.58, 4.0, 0.2)], GLASS, 32, "glass")
    roof_cap([(0.45, 0.76, 0.22, 0.72, 5.0, 0.25), (-0.9, 0.74, 0.22, 0.80, 5.0, 0.25)], None, True)
    for sx in (-1, 1):
        o = shell(smooth_profile([(-0.35, 0.05, ZB + 0.15, ZB + 0.2, 2.0), (-0.6, 0.3, ZB - 0.02, ZB + 0.62, 4.0),
                                  (-1.7, 0.32, ZB - 0.02, ZB + 0.66, 4.4), (-2.02, 0.28, ZB + 0.02, ZB + 0.6, 4.0)], 3), BODY, 28, "pod")
        o.location.x = sx * 0.72
        vents(sx * 1.045, -1.2, -1.85, ZB + 0.34, 0.26, 5)
        block((0.36, 0.04, 0.42), (sx * 0.72, -2.03, ZB + 0.3), TAIL, 0.04)
        cyl(0.13, 0.03, (sx * 0.72, -2.06, ZB + 0.3), JET, rot=(math.pi / 2, 0, 0), verts=18)
        block((0.02, 0.5, 0.05), (sx * 0.86, -0.3, ZB + 0.3), CABIN)
    block((1.4, 0.06, 0.12), (0, 1.99, ZB + 0.1), DARK, 0.02)
    block((1.2, 0.05, 0.05), (0, 2.0, ZB + 0.26), LIGHT, 0.01)
    glow_skirt(0.91, -0.3, 1.6, ZB + 0.06)
    under_jets((-0.6, 0.6), (1.1, -1.3))

def car_atlas():
    # car_2 "Interceptor": a tough angular cruiser with two-tone ends, chrome guard rails front and
    # back, side vents and a light bar on the roof.
    keys = [(2.0, 0.86, ZB + 0.08, ZB + 0.36, 8.0, 0.1), (1.55, 0.94, ZB + 0.02, ZB + 0.56, 8.0, 0.14), (0.7, 0.95, ZB, ZB + 0.66, 8.0, 0.18),
            (-1.2, 0.95, ZB, ZB + 0.68, 8.0, 0.18), (-1.8, 0.92, ZB + 0.04, ZB + 0.64, 8.0, 0.16), (-2.0, 0.84, ZB + 0.1, ZB + 0.56, 7.0, 0.12)]
    faceted(keys, BODY, 32, "body")
    end_lights(keys)
    faceted([(2.02, 0.86, ZB + 0.06, ZB + 0.38, 8.0, 0.1), (1.45, 0.95, ZB + 0.0, ZB + 0.5, 8.0, 0.12), (1.3, 0.94, ZB + 0.0, ZB + 0.3, 8.0, 0.1)], CABIN, 32, "nose")
    faceted([(0.95, 0.66, 0.28, 0.32, 5.0, 0.2), (0.5, 0.80, 0.28, 0.82, 5.0, 0.25), (-1.0, 0.80, 0.28, 0.88, 5.0, 0.25),
             (-1.55, 0.7, 0.28, 0.62, 4.5, 0.22)], GLASS, 32, "glass")
    roof_cap([(0.5, 0.80, 0.28, 0.82, 5.0, 0.25), (-1.0, 0.80, 0.28, 0.88, 5.0, 0.25)], None, True)
    block((0.9, 0.22, 0.08), (0, -0.25, 0.92), DARK, 0.03)
    block((0.36, 0.18, 0.07), (-0.24, -0.25, 0.98), TAIL)
    block((0.36, 0.18, 0.07), (0.24, -0.25, 0.98), mat("Beacon", "4f8dff", 0.3, 0.0, 3.0))
    for z in (ZB + 0.1, ZB + 0.24):
        block((1.5, 0.05, 0.05), (0, 2.12, z), CHROME, 0.02)
        block((1.5, 0.05, 0.05), (0, -2.12, z), CHROME, 0.02)
    for sx in (-1, 1):
        block((0.05, 0.05, 0.2), (sx * 0.72, 2.08, ZB + 0.17), CHROME)
        block((0.05, 0.05, 0.2), (sx * 0.72, -2.08, ZB + 0.17), CHROME)
        vents(sx * 0.955, -1.0, -1.7, ZB + 0.38, 0.22, 6)
        vents(sx * 0.955, 1.0, 1.4, ZB + 0.3, 0.14, 3)
    glow_skirt(0.96, -1.8, 1.8, ZB + 0.05)
    under_jets((-0.6, 0.6), (1.2, -1.2), 0.26)

def car_vela():
    # car_3 "Vela": a long faceted wedge racer. A blade nose with a full-width light bar, a long
    # wraparound windscreen, side intakes with slats and a glowing tail strip.
    keys = [(2.05, 0.74, ZB + 0.04, ZB + 0.16, 7.0, 0.1), (1.6, 0.92, ZB, ZB + 0.3, 8.0, 0.15), (0.6, 0.96, ZB, ZB + 0.38, 8.0, 0.18),
            (-1.2, 0.97, ZB, ZB + 0.44, 8.0, 0.2), (-1.92, 0.93, ZB + 0.03, ZB + 0.46, 8.0, 0.18), (-2.02, 0.86, ZB + 0.08, ZB + 0.42, 7.0, 0.15)]
    faceted(keys, BODY, 32, "body")
    end_lights(keys)
    block((1.6, 0.05, 0.035), (0, 1.9, ZB + 0.2), LIGHT, 0.01)
    faceted([(1.0, 0.56, -0.02, 0.0, 6.0, 0.1), (0.5, 0.74, -0.02, 0.30, 5.0, 0.3), (-0.6, 0.76, -0.02, 0.38, 5.0, 0.3),
             (-1.45, 0.66, -0.02, 0.26, 5.0, 0.25), (-1.8, 0.56, 0.0, 0.04, 5.0, 0.2)], GLASS, 32, "glass")
    faceted([(-0.2, 0.5, 0.34, 0.38, 5.0), (-1.3, 0.5, 0.26, 0.3, 5.0)], CABIN, 24, "roof")
    for sx in (-1, 1):
        block((0.08, 0.5, 0.2), (sx * 0.95, -1.25, ZB + 0.24), DARK, 0.02)
        vents(sx * 0.995, -1.0, -1.5, ZB + 0.24, 0.14, 4, CHROME)
        block((0.025, 1.8, 0.03), (sx * 0.975, 0.3, ZB + 0.30), JET)
    block((1.5, 0.04, 0.04), (0, -2.03, ZB + 0.3), JET, 0.01)
    glow_skirt(0.97, -1.9, 1.9, ZB + 0.03)
    under_jets((-0.6, 0.6), (1.2, -1.2))

def car_nova():
    # car_4 "Arc": the hypercar. A low platform with sharp front and rear blades and one great roof
    # arch sweeping from nose to tail over a bubble of glass.
    keys = [(2.05, 0.6, ZB + 0.05, ZB + 0.14, 4.0, 0.1), (1.6, 0.95, ZB, ZB + 0.24, 6.0, 0.15), (0.0, 0.98, ZB, ZB + 0.26, 6.0, 0.15),
            (-1.6, 0.98, ZB, ZB + 0.28, 6.0, 0.15), (-2.02, 0.8, ZB + 0.04, ZB + 0.26, 5.0, 0.12)]
    faceted(keys, BODY, 32, "deck")
    end_lights(keys)
    # The arch: a thin ribbon following a curve over the cabin.
    arch = []
    for k in range(13):
        y = 2.0 - 4.0 * k / 12.0
        t = (2.0 - y) / 4.0
        zt = ZB + 0.3 + math.sin(min(max((t - 0.04) / 0.92, 0.0), 1.0) * math.pi) ** 0.8 * 1.05
        hw = 0.26 + 0.06 * math.sin(t * math.pi)
        arch.append((y, hw, zt - 0.06, zt, 4.0))
    shell(smooth_profile(arch, 2), BODY, 24, "arch")
    shell(smooth_profile([(1.55, 0.3, ZB + 0.2, ZB + 0.26, 2.4), (0.8, 0.80, ZB + 0.2, ZB + 0.78, 2.6, 0.2), (-0.4, 0.84, ZB + 0.2, ZB + 1.02, 2.6, 0.25),
                          (-1.45, 0.74, ZB + 0.2, ZB + 0.74, 2.6, 0.2), (-1.9, 0.3, ZB + 0.22, ZB + 0.28, 2.4)], 3), GLASS, 32, "glass")
    # Side blades (front and rear quarters) in the second colour.
    for sx in (-1, 1):
        for (y0, y1, z0, z1) in ((1.7, 1.0, ZB + 0.08, ZB + 0.42), (-1.05, -1.9, ZB + 0.08, ZB + 0.5)):
            slab((0.0, y0, y1, z0, 0.05), (0.0, y0 - 0.25 if y0 > 0 else y0 - 0.1, y1 + 0.1 if y0 > 0 else y1 + 0.25, z1, 0.04), CABIN).location.x = sx * 0.99
        block((0.34, 0.4, 0.55), (sx * 0.34, -0.25, ZB + 0.5), mat("Seat", "e8e4dc", 0.6), 0.06)
    block((1.7, 0.04, 0.03), (0, 2.03, ZB + 0.08), JET, 0.01)
    block((1.5, 0.04, 0.04), (0, -2.03, ZB + 0.15), JET, 0.01)
    glow_skirt(0.99, -1.9, 1.9, ZB + 0.02)
    under_jets((-0.6, 0.6), (1.2, -1.2), 0.26)

BUILDERS = [("car_0", car_aero), ("car_1", car_glide), ("car_2", car_atlas), ("car_3", car_vela), ("car_4", car_nova)]

def render(name, out_dir):
    scene = bpy.context.scene
    scene.render.engine = "BLENDER_EEVEE_NEXT" if "BLENDER_EEVEE_NEXT" in [e.identifier for e in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items] else "BLENDER_EEVEE"
    scene.render.resolution_x = 900
    scene.render.resolution_y = 600
    bpy.ops.import_scene.gltf(filepath=str(ROOT / "game/models" / (name + ".glb")))
    objs = list(bpy.context.selected_objects)
    for o in objs:
        for slot in o.material_slots:
            if slot.material and slot.material.name.startswith("Body"):
                b = slot.material.node_tree.nodes.get("Principled BSDF")
                if b:
                    b.inputs["Base Color"].default_value = (0.05, 0.25, 0.65, 1)
    cam = bpy.data.objects.new("cam", bpy.data.cameras.new("cam"))
    scene.collection.objects.link(cam)
    cam.location = (5.0, 5.6, 2.4)
    cam.rotation_euler = (math.radians(72), 0, math.radians(138))
    scene.camera = cam
    sun = bpy.data.objects.new("sun", bpy.data.lights.new("sun", "SUN"))
    sun.data.energy = 3.0
    sun.rotation_euler = (math.radians(40), 0, math.radians(30))
    scene.collection.objects.link(sun)
    if scene.world is None:
        scene.world = bpy.data.worlds.new("w")
    scene.world.color = (0.55, 0.65, 0.75)
    scene.render.filepath = os.path.join(out_dir, name + ".png")
    bpy.ops.render.render(write_still=True)
    for o in objs + [cam, sun]:
        bpy.data.objects.remove(o, do_unlink=True)

try:
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    for name, fn in BUILDERS:
        fn()
        for o in CUR:
            o.location.z += HOVER
        export(name)
    out = os.environ.get("HARBOR_CAR_RENDER", "")
    if out:
        os.makedirs(out, exist_ok=True)
        for name, _ in BUILDERS:
            render(name, out)
    print("HARBOR_HOVERCARS DONE")
except Exception:
    import traceback
    print("HARBOR_HOVERCARS ERROR\n" + traceback.format_exc())

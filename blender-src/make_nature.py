# Harbor City nature generator (v0.39): more natural trees and plants for the Biosphere.
# Run headless:  Blender -b -P blender-src/make_nature.py
# Optional: HARBOR_NATURE_RENDER=<dir> renders a preview of each model there.
# Everything is procedural and original: branching trunks grown from a seed, crowns built from
# many lumpy leaf clumps in several shades (lighter on top, darker underneath), layered conifers,
# an umbrella acacia, ferns, grass tufts and reeds. Each model is ONE mesh with a few materials, so
# the game can draw hundreds of them as a MultiMesh.
import bpy, bmesh, math, os, random
from mathutils import Vector, Matrix, noise
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1])).resolve()
OUT = str(ROOT / "game" / "models")
RENDER = os.environ.get("HARBOR_NATURE_RENDER", "")

def lin(c):
    c = c / 255.0
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4

def card_mat(kind):
    # Leaf cards: the game swaps this for an alpha-cut material with tex/leaf_<kind>.png.
    name = "LeafCard_" + kind
    m = bpy.data.materials.get(name)
    if m:
        return m
    m = bpy.data.materials.new(name)
    m.use_nodes = True
    nt = m.node_tree
    b = nt.nodes["Principled BSDF"]
    tex = nt.nodes.new("ShaderNodeTexImage")
    tex.image = bpy.data.images.load(str(ROOT / "game" / "models" / "tex" / ("leaf_%s.png" % kind)))
    nt.links.new(tex.outputs["Color"], b.inputs["Base Color"])
    nt.links.new(tex.outputs["Alpha"], b.inputs["Alpha"])
    b.inputs["Roughness"].default_value = 0.9
    m.use_backface_culling = False
    return m

def mat(name, hexcol, rough=0.85, double=False):
    m = bpy.data.materials.get(name) or bpy.data.materials.new(name)
    m.use_nodes = True
    b = m.node_tree.nodes["Principled BSDF"]
    b.inputs["Base Color"].default_value = (*[lin(int(hexcol[i:i + 2], 16)) for i in (0, 2, 4)], 1)
    b.inputs["Roughness"].default_value = rough
    if "Specular IOR Level" in b.inputs:
        b.inputs["Specular IOR Level"].default_value = 0.2
    m.use_backface_culling = not double
    return m

class Builder:
    """Collects geometry into one bmesh, with a material index per face."""
    def __init__(self, mats):
        self.bm = bmesh.new()
        self.mats = mats
        self.uv = self.bm.loops.layers.uv.new("UVMap")
        self.custom = {}

    def card(self, c, size, normal, mi, spin, light_n):
        # A square leaf card centred on c facing `normal`; its shading normal points out of the crown.
        a = normal.orthogonal().normalized()
        a = (Matrix.Rotation(spin, 3, normal) @ a).normalized()
        b = normal.cross(a).normalized()
        h = size / 2
        vs = [self.bm.verts.new(c + (a * x + b * y) * h) for (x, y) in ((-1, -1), (1, -1), (1, 1), (-1, 1))]
        f = self.bm.faces.new(vs)
        f.material_index = mi
        f.smooth = True
        for loop, uv in zip(f.loops, ((0, 0), (1, 0), (1, 1), (0, 1))):
            loop[self.uv].uv = uv
        for v in vs:
            self.custom[v] = light_n

    def tube(self, pts, radii, sides, mi):
        # A tapered tube along pts (a branch).
        rings = []
        for i, p in enumerate(pts):
            d = (pts[min(i + 1, len(pts) - 1)] - pts[max(i - 1, 0)]).normalized()
            a = d.orthogonal().normalized()
            b = d.cross(a).normalized()
            ring = []
            for k in range(sides):
                t = 2 * math.pi * k / sides
                ring.append(self.bm.verts.new(p + (a * math.cos(t) + b * math.sin(t)) * radii[i]))
            rings.append(ring)
        for i in range(len(rings) - 1):
            for k in range(sides):
                f = self.bm.faces.new((rings[i][k], rings[i][(k + 1) % sides], rings[i + 1][(k + 1) % sides], rings[i + 1][k]))
                f.material_index = mi
                f.smooth = True
        tip = self.bm.verts.new(pts[-1] + (pts[-1] - pts[-2]).normalized() * radii[-1])
        for k in range(sides):
            f = self.bm.faces.new((rings[-1][k], rings[-1][(k + 1) % sides], tip))
            f.material_index = mi
            f.smooth = True

    def blob(self, c, r, mi, squash=0.78, lump=0.28, subdiv=2, seed=0.0):
        # A lumpy leaf clump: an icosphere pushed in and out by noise.
        res = bmesh.ops.create_icosphere(self.bm, subdivisions=subdiv, radius=r)
        for v in res["verts"]:
            n = v.co.normalized()
            k = 1.0 + lump * noise.noise(n * 1.7 + Vector((seed, seed * 0.7, seed * 1.3)))
            v.co = Vector((v.co.x * k, v.co.y * k, v.co.z * k * squash)) + c
        for f in {f for v in res["verts"] for f in v.link_faces}:
            f.material_index = mi
            f.smooth = True

    def cone(self, c, r, h, mi, segs=10, jag=0.18, droop=0.0, seed=0.0):
        # A ragged cone (a conifer tier): the rim zig-zags and droops.
        top = self.bm.verts.new(c + Vector((0, 0, h)))
        rim = []
        for k in range(segs * 2):
            t = 2 * math.pi * k / (segs * 2)
            rr = r * (1.0 if k % 2 == 0 else 0.78) * (1.0 + jag * noise.noise(Vector((math.cos(t) * 2 + seed, math.sin(t) * 2, seed))))
            rim.append(self.bm.verts.new(c + Vector((math.cos(t) * rr, math.sin(t) * rr, -droop * (1.0 if k % 2 == 0 else 0.4)))))
        under = self.bm.verts.new(c + Vector((0, 0, h * 0.25)))
        for k in range(len(rim)):
            for tri in ((rim[k], rim[(k + 1) % len(rim)], top), (rim[(k + 1) % len(rim)], rim[k], under)):
                f = self.bm.faces.new(tri)
                f.material_index = mi
                f.smooth = True

    def strip(self, pts, widths, normal_hint, mi):
        # A flat tapered strip along pts (a blade of grass, a fern frond), double-sided material.
        left, right = [], []
        for i, p in enumerate(pts):
            d = (pts[min(i + 1, len(pts) - 1)] - pts[max(i - 1, 0)]).normalized()
            s = d.cross(normal_hint).normalized()
            left.append(self.bm.verts.new(p + s * widths[i] / 2))
            right.append(self.bm.verts.new(p - s * widths[i] / 2))
        for i in range(len(pts) - 1):
            f = self.bm.faces.new((left[i], right[i], right[i + 1], left[i + 1]))
            f.material_index = mi
            f.smooth = True

    def export(self, name):
        me = bpy.data.meshes.new(name)
        self.bm.normal_update()
        self.bm.verts.index_update()
        custom = {v.index: n for v, n in self.custom.items()}
        self.bm.to_mesh(me)
        self.bm.free()
        if custom:
            normals = [Vector(v.normal) for v in me.vertices]
            for k, n in custom.items():
                normals[k] = n
            me.normals_split_custom_set_from_vertices(normals)
        o = bpy.data.objects.new(name, me)
        bpy.context.scene.collection.objects.link(o)
        for m in self.mats:
            me.materials.append(m)
        for ob in bpy.context.scene.objects:
            if ob is not None:
                ob.select_set(False)
        o.select_set(True)
        bpy.context.view_layer.objects.active = o
        path = os.path.join(OUT, name + ".glb")
        bpy.ops.export_scene.gltf(filepath=path, export_format="GLB", use_selection=True, export_apply=True, export_yup=True)
        tris = sum(len(p.vertices) - 2 for p in me.polygons)
        print("NATURE exported %s: %d tris, %d bytes" % (name, tris, os.path.getsize(path)))
        if RENDER:
            preview(o, name)
        bpy.data.objects.remove(o, do_unlink=True)

def rnd_dir(rng):
    v = Vector((rng.uniform(-1, 1), rng.uniform(-1, 1), rng.uniform(-1, 1)))
    return v.normalized() if v.length > 0.01 else Vector((1, 0, 0))

def grow(B, rng, start, d, length, radius, depth, tips, bark, opts):
    # One branch as a gently bending tube, then its side branches; leaf clumps gather at the tips.
    segs = 4 if depth > 0 else 3
    pts, radii = [start], [radius]
    p = start
    for i in range(segs):
        d = (d + rnd_dir(rng) * opts["bend"] + Vector((0, 0, opts["up"]))).normalized()
        p = p + d * (length / segs)
        pts.append(p)
        radii.append(radius * (1.0 - 0.6 * (i + 1) / segs))
    B.tube(pts, radii, 7 if depth >= opts["depth"] else 5, bark)
    if depth == 0:
        tips.append((p, d, length))
        return
    kids = opts["kids"] if depth == opts["depth"] else opts["kids2"]
    for k in range(kids):
        t = rng.uniform(opts["from"] if depth == opts["depth"] else 0.35, 0.95)
        i = min(int(t * segs), segs - 1)
        f = t * segs - i
        cp = pts[i].lerp(pts[i + 1], f)
        cr = radii[i] + (radii[i + 1] - radii[i]) * f
        ang = 2 * math.pi * (k / kids) + rng.uniform(-0.5, 0.5)
        side = Vector((math.cos(ang), math.sin(ang), 0))
        cd = (d * (1.0 - opts["spread"]) + side * opts["spread"] + Vector((0, 0, opts["lift"]))).normalized()
        grow(B, rng, cp, cd, length * opts["shrink"] * rng.uniform(0.8, 1.1), cr * 0.75, depth - 1, tips, bark, opts)
    if depth < opts["depth"]:
        tips.append((p, d, length))

def broadleaf(name, seed, leaves, bark_hex="5a4030", height=6.0, crown=2.6, opts=None, clump=1.0, flat=1.0, kind="green"):
    # A deciduous tree: trunk, limbs and twigs, a darker leafy core round each twig tip, and crossed
    # leaf cards (textured clusters of leaves) all round it, lit as one rounded crown.
    rng = random.Random(seed)
    mats = [mat("Bark_" + bark_hex, bark_hex)] + [mat("Leaf_%s" % h, h, 0.9) for h in leaves[:2]] + [card_mat(kind)]
    B = Builder(mats)
    o = {"bend": 0.25, "up": 0.18, "kids": 5, "kids2": 3, "from": 0.45, "spread": 0.62, "lift": 0.28, "shrink": 0.6, "depth": 2}
    if opts:
        o.update(opts)
    tips = []
    trunk_h = height * 0.45
    grow(B, rng, Vector((0, 0, -0.2)), Vector((0, 0, 1)), trunk_h * 1.3, height * 0.05, o["depth"], tips, 0, o)
    # Root flare.
    for k in range(5):
        a = 2 * math.pi * k / 5 + rng.uniform(-0.3, 0.3)
        B.tube([Vector((0, 0, 0.5)), Vector((math.cos(a) * 0.35, math.sin(a) * 0.35, 0.1)), Vector((math.cos(a) * 0.6, math.sin(a) * 0.6, -0.1))], [height * 0.028, height * 0.018, 0.02], 5, 0)
    centre = Vector((0, 0, 0))
    for t in tips:
        centre += t[0]
    centre /= len(tips)
    for (p, d, L) in tips:
        r = crown * 0.3 * clump * rng.uniform(0.85, 1.15)
        c = p + d * r * 0.25
        B.blob(c, r * 0.36, 1, squash=0.8 * flat, lump=0.35, subdiv=1, seed=rng.uniform(0, 50))
        for k in range(7):
            q = c + rnd_dir(rng) * r * 0.45
            out = (q - centre)
            out.z *= 1.0 / max(flat, 0.3)
            light_n = (out.normalized() * 0.75 + Vector((0, 0, 0.55))).normalized()
            nrm = (rnd_dir(rng) + Vector((0, 0, 0.8 if flat < 1 else 0.3))).normalized()
            B.card(q, r * rng.uniform(1.5, 1.9), nrm, 3, rng.uniform(0, 6.28), light_n)
    B.export(name)

def conifer(name, seed, snow=False, height=8.0):
    rng = random.Random(seed)
    mats = [mat("Bark_4a3426", "4a3426"), mat("Needle_2b5a3c", "2b5a3c", 0.9), mat("Needle_37704a", "37704a", 0.9), mat("Snow_f4f9ff", "f4f9ff", 0.6)]
    B = Builder(mats)
    B.tube([Vector((0, 0, -0.2)), Vector((0, 0, height * 0.5)), Vector((0, 0, height * 0.97))], [height * 0.03, height * 0.018, 0.03], 7, 0)
    tiers = 8
    for k in range(tiers):
        f = k / (tiers - 1)
        z = height * (0.16 + 0.74 * f)
        r = height * 0.3 * (1.0 - f * 0.85) + 0.2
        B.cone(Vector((rng.uniform(-0.05, 0.05), rng.uniform(-0.05, 0.05), z)), r, height * 0.2, 1 + (k % 2), segs=9, droop=r * 0.28, seed=rng.uniform(0, 40))
        if snow:
            B.cone(Vector((0, 0, z + height * 0.07)), r * 0.72, height * 0.12, 3, segs=9, jag=0.25, droop=r * 0.18, seed=rng.uniform(0, 40))
    B.export(name)

def acacia(name, seed):
    # Savanna acacia: a trunk that forks into upswept limbs under a wide, flat crown.
    rng = random.Random(seed)
    mats = [mat("Bark_6b4a30", "6b4a30"), mat("Leaf_5f7f2e", "4f6a26", 0.9), mat("Leaf_7a9a3a", "5f7a2e", 0.9), card_mat("acacia")]
    B = Builder(mats)
    B.tube([Vector((0, 0, -0.2)), Vector((0.1, 0, 1.2)), Vector((0, 0.1, 2.2))], [0.22, 0.17, 0.14], 7, 0)
    for k in range(4):
        a = 2 * math.pi * k / 4 + rng.uniform(-0.3, 0.3)
        e = Vector((math.cos(a) * 2.2, math.sin(a) * 2.2, 4.4))
        B.tube([Vector((0, 0, 2.1)), Vector((math.cos(a) * 0.9, math.sin(a) * 0.9, 3.3)), e], [0.12, 0.08, 0.04], 5, 0)
    for k in range(22):
        a = rng.uniform(0, 2 * math.pi)
        r = math.sqrt(rng.random()) * 3.4
        c = Vector((math.cos(a) * r, math.sin(a) * r, 4.6 + rng.uniform(-0.15, 0.25)))
        B.blob(c, rng.uniform(0.6, 0.9), 1 + (k % 2), squash=0.3, seed=rng.uniform(0, 40), subdiv=1)
        for j in range(3):
            q = c + rnd_dir(rng) * 0.5
            q.z = c.z + rng.uniform(0.0, 0.3)
            B.card(q, rng.uniform(1.6, 2.2), (Vector((0, 0, 1)) + rnd_dir(rng) * 0.35).normalized(), 3, rng.uniform(0, 6.28), (Vector((math.cos(a), math.sin(a), 0)) * 0.5 + Vector((0, 0, 1))).normalized())
    B.export(name)

def bush(name, seed, leaves, flowers=None):
    rng = random.Random(seed)
    mats = [mat("Bark_5a4030", "5a4030")] + [mat("Leaf_%s" % h, h, 0.9) for h in leaves] + ([mat("Flower_%s" % h, h, 0.6) for h in flowers] if flowers else [])
    B = Builder(mats)
    for k in range(7):
        a = rng.uniform(0, 2 * math.pi)
        r = rng.uniform(0, 0.45)
        c = Vector((math.cos(a) * r, math.sin(a) * r, rng.uniform(0.35, 0.65)))
        B.blob(c, rng.uniform(0.35, 0.5), 1 + rng.randrange(len(leaves)), squash=0.8, seed=rng.uniform(0, 40))
    if flowers:
        for k in range(16):
            a = rng.uniform(0, 2 * math.pi)
            r = rng.uniform(0.3, 0.6)
            B.blob(Vector((math.cos(a) * r, math.sin(a) * r, rng.uniform(0.5, 0.95))), 0.07, 1 + len(leaves) + rng.randrange(len(flowers)), squash=1.0, lump=0.1, subdiv=1)
    B.export(name)

def fern(name, seed):
    # Arching fronds with zig-zag leaflet edges.
    rng = random.Random(seed)
    mats = [mat("Frond_3f8a45", "3f8a45", 0.85, double=True), mat("Frond_5aa04a", "5aa04a", 0.85, double=True)]
    B = Builder(mats)
    for k in range(9):
        a = 2 * math.pi * k / 9 + rng.uniform(-0.2, 0.2)
        L = rng.uniform(0.7, 1.0)
        pts, wid = [], []
        for i in range(9):
            t = i / 8
            pts.append(Vector((math.cos(a) * L * t, math.sin(a) * L * t, 0.05 + L * (0.75 * t - 0.65 * t * t))))
            wid.append((0.28 if i % 2 else 0.16) * math.sin(math.pi * min(t * 1.1, 1.0)) + 0.01)
        B.strip(pts, wid, Vector((0, 0, 1)), k % 2)
    B.export(name)

def grass(name, seed, cols, blades=16, h=0.55):
    rng = random.Random(seed)
    mats = [mat("Grass_%s" % c, c, 0.9, double=True) for c in cols]
    B = Builder(mats)
    for k in range(blades):
        a = rng.uniform(0, 2 * math.pi)
        base = Vector((math.cos(a) * rng.uniform(0, 0.12), math.sin(a) * rng.uniform(0, 0.12), 0))
        lean = Vector((math.cos(a), math.sin(a), 0)) * rng.uniform(0.1, 0.3)
        hh = h * rng.uniform(0.6, 1.2)
        pts = [base + lean * (t * t) + Vector((0, 0, hh * t)) for t in (0, 0.33, 0.66, 1.0)]
        B.strip(pts, [0.05, 0.04, 0.025, 0.004], Vector((-math.sin(a), math.cos(a), 0)).cross(Vector((0, 0, 1))), k % len(cols))
    B.export(name)

def reeds(name, seed):
    rng = random.Random(seed)
    mats = [mat("Reed_7a8a3a", "7a8a3a", 0.9, double=True), mat("Cattail_5a3a22", "5a3a22", 0.9)]
    B = Builder(mats)
    for k in range(14):
        a = rng.uniform(0, 2 * math.pi)
        base = Vector((math.cos(a) * rng.uniform(0, 0.3), math.sin(a) * rng.uniform(0, 0.3), 0))
        hh = rng.uniform(1.0, 1.6)
        lean = Vector((math.cos(a), math.sin(a), 0)) * 0.15
        B.strip([base + lean * t * t + Vector((0, 0, hh * t)) for t in (0, 0.5, 1.0)], [0.06, 0.04, 0.005], Vector((-math.sin(a), math.cos(a), 0)).cross(Vector((0, 0, 1))), 0)
        if k % 3 == 0:
            B.tube([base + lean * 0.7 + Vector((0, 0, hh * 0.75)), base + lean * 0.8 + Vector((0, 0, hh * 0.92))], [0.04, 0.04], 6, 1)
    B.export(name)

def preview(o, name):
    scn = bpy.context.scene
    scn.render.engine = "BLENDER_EEVEE_NEXT" if "BLENDER_EEVEE_NEXT" in [e.identifier for e in bpy.types.RenderSettings.bl_rna.properties["engine"].enum_items] else "BLENDER_EEVEE"
    scn.render.resolution_x = 360
    scn.render.resolution_y = 360
    dims = max(o.dimensions)
    cam = bpy.data.objects.get("PrevCam")
    if cam is None:
        cam = bpy.data.objects.new("PrevCam", bpy.data.cameras.new("PrevCam"))
        scn.collection.objects.link(cam)
        sun = bpy.data.objects.new("PrevSun", bpy.data.lights.new("PrevSun", "SUN"))
        sun.data.energy = 3.0
        sun.rotation_euler = (0.8, 0.2, 0.6)
        scn.collection.objects.link(sun)
        scn.world = scn.world or bpy.data.worlds.new("W")
        scn.world.use_nodes = True
        scn.world.node_tree.nodes["Background"].inputs[0].default_value = (0.6, 0.75, 0.9, 1)
    cam.location = (dims * 1.6, -dims * 1.6, dims * 0.75)
    cam.rotation_euler = (math.radians(75), 0, math.radians(45))
    scn.camera = cam
    scn.render.filepath = os.path.join(RENDER, name + ".png")
    bpy.ops.render.render(write_still=True)

for o in list(bpy.data.objects):
    bpy.data.objects.remove(o, do_unlink=True)

GREEN = ["1e3e20", "26482a"]
broadleaf("nature_oak", 11, GREEN, height=6.5, crown=2.8)
broadleaf("nature_oak2", 23, ["2a5a34", "3a7040", "52904a", "6fa858"], height=5.5, crown=2.4, opts={"spread": 0.7, "kids": 6})
broadleaf("nature_maple", 31, ["4a2416", "5a2a18"], bark_hex="4e3524", height=6.5, crown=3.0, kind="maple")
broadleaf("nature_maple2", 47, ["4a2416", "5a2a18"], bark_hex="4e3524", height=6.0, crown=2.8, opts={"kids": 6, "spread": 0.7}, kind="maple")
broadleaf("nature_cherry", 53, ["4a5a32", "56663a"], bark_hex="3e2a24", height=5.0, crown=3.0, opts={"spread": 0.78, "lift": 0.12, "up": 0.08}, clump=0.9, flat=0.85, kind="cherry")
broadleaf("nature_cherry2", 61, ["4a5a32", "56663a"], bark_hex="3e2a24", height=4.6, crown=2.8, opts={"spread": 0.8, "lift": 0.1, "up": 0.06, "kids": 6}, clump=0.9, flat=0.85, kind="cherry")
broadleaf("nature_giant", 71, ["4a2416", "5a2a18"], bark_hex="4a3222", height=15.0, crown=7.0, opts={"kids": 7, "kids2": 3, "depth": 2, "shrink": 0.62}, clump=1.05, kind="maple")
conifer("nature_pine", 81, snow=False)
conifer("nature_pine_snow", 83, snow=True)
acacia("nature_acacia", 91)
bush("nature_bush", 101, ["2f6a35", "3f8040", "56984a"])
bush("nature_bush_dry", 103, ["7a8a3a", "9aa04a", "b8a85a"])
bush("nature_bush_flower", 107, ["2f6a35", "3f8040"], ["ff7ab8", "ffffff", "ffd23f", "c254ff"])
bush("nature_bush_snow", 109, ["5f7f6a", "e9f1f7"])
fern("nature_fern", 111)
grass("nature_grass", 121, ["4f8a3a", "6aa04a", "88b858"])
grass("nature_grass_dry", 123, ["b8a14a", "c9b25a", "a08a3a"], blades=18, h=0.7)
reeds("nature_reeds", 131)
print("NATURE done")

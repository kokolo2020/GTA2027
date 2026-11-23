# Harbor City: convert the five rounded hover vehicles (rev2) into the game's car slots.
# Run: /Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python blender-src/convert_new_cars.py
# Source: ~/hover-vehicle-study/rev2/exports/*.glb   Output: game/models/car_0..4.glb
# car frame: front = +Y in Blender (-Z in Godot), origin at hull underside, about 1.6 x 4.2 m.
import bpy, math, os
from mathutils import Matrix

SRC = "/Users/koko/hover-vehicle-study/rev2/exports/"
DST = "/Users/koko/GTA2027/game/models/"
SLOTS = [(0, "silver-hover-coupe"), (1, "solar-taxi"), (2, "police-interceptor"), (3, "panoramic-shuttle"), (4, "violet-racer")]
SKIP = ["logotype", "identification", "lettering", "fleet number", "checker", "radial grille", "turbine blade", "payment light", "brightwork", "rim", "emergency lamp"]
INTERIOR = ["seat", "headrest", "dashboard", "steering", "floor", "ceiling"]
BUDGET = 9000
# target material -> (base colour, metallic, roughness, emission colour or None)
TARGET = {
    "Body": ((0.63, 0.63, 0.63), 0.35, 0.3, None), "Cabin": ((0.058, 0.058, 0.058), 0.2, 0.4, None),
    "Glass": ((0.017, 0.037, 0.065), 0.4, 0.12, None), "Light": ((1, 0.87, 0.48), 0.0, 0.3, (1, 0.87, 0.48)),
    "Tail": ((0.81, 0.14, 0.12), 0.0, 0.3, (1, 0.17, 0.15)), "Seat": ((0.8, 0.78, 0.72), 0.0, 0.6, None),
    "Jet": ((0.11, 0.9, 1), 0.0, 0.3, (0.11, 0.9, 1)), "Dark": ((0.011, 0.017, 0.024), 0.3, 0.4, None),
    "Chrome": ((0.58, 0.64, 0.69), 0.9, 0.2, None), "Beacon": ((0.08, 0.27, 1), 0.0, 0.3, (0.08, 0.27, 1)),
}

def classify(n):
    n = n.lower()
    if "glaz" in n or "glass" in n: return "Glass"
    if "chrome" in n or "alloy" in n: return "Chrome"
    if "lamp" in n or "headlamp" in n: return "Light"
    if "red" in n or "amber" in n or "running" in n: return "Tail"
    if "blue" in n: return "Beacon"
    if "cyan" in n or "thruster" in n: return "Jet"
    if "ivory" in n or "upholstery" in n or "decal / ceramic" in n or "white" in n and "decal" in n: return "Seat"
    if any(k in n for k in ("carbon", "rubber", "ink", "charcoal", "hood", "graphite", "accents", "inset")): return "Dark"
    return "Body"

def make_mat(name, spec):
    c, me, ro, em = spec
    m = bpy.data.materials.new(name)
    m.use_nodes = True
    p = m.node_tree.nodes["Principled BSDF"]
    p.inputs["Base Color"].default_value = (*c, 1)
    p.inputs["Metallic"].default_value = me
    p.inputs["Roughness"].default_value = ro
    if em:
        p.inputs["Emission Color"].default_value = (*em, 1)
        p.inputs["Emission Strength"].default_value = 1.0
    return m

def tris(o):
    me = o.data
    me.calc_loop_triangles()
    return len(me.loop_triangles)

for idx, src in SLOTS:
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    for blk in (bpy.data.meshes, bpy.data.materials, bpy.data.images, bpy.data.curves):
        for b in list(blk):
            blk.remove(b)
    bpy.ops.import_scene.gltf(filepath=SRC + src + ".glb")
    meshes = [o for o in bpy.context.scene.objects if o.type == "MESH"]
    keep = []
    for o in meshes:
        nm = o.name.lower()
        if any(k in nm for k in SKIP) or (idx != 3 and any(k in nm for k in INTERIOR)):
            bpy.data.objects.remove(o, do_unlink=True)
        else:
            keep.append(o)
    # Body colour of this model (first Body-class material), kept as the default paint.
    body_col = None
    for o in keep:
        for s in o.material_slots:
            if s.material and classify(s.material.name) == "Body" and body_col is None:
                body_col = tuple(s.material.node_tree.nodes["Principled BSDF"].inputs["Base Color"].default_value)[:3]
    mats = {}
    for k, spec in TARGET.items():
        c = spec[0]
        if k == "Body" and body_col:
            c = body_col
        mats[k] = make_mat(k, (c, spec[1], spec[2], spec[3]))
    if idx == 3:
        gm = mats["Glass"]
        gm.node_tree.nodes["Principled BSDF"].inputs["Alpha"].default_value = 0.3
        gm.blend_method = "BLEND" if hasattr(gm, "blend_method") else None
    # Bake each object's world transform into its mesh, then fit to the car frame.
    xs, zs = [], []
    for o in keep:
        o.data = o.data.copy()
        o.data.transform(o.matrix_world)
        o.parent = None
        o.matrix_world = Matrix.Identity(4)
    rot = Matrix.Rotation(math.radians(-90), 4, "Z")
    sc = Matrix.Diagonal((0.74, 0.78 if idx == 0 else 0.62, 0.70, 1.0))
    for o in keep:
        o.data.transform(sc @ rot)
    # hull underside to z = 0 (lowest point of the body shell, not the thrusters)
    low = 0.29 * 0.70
    for o in keep:
        o.data.transform(Matrix.Translation((0, 0, -low)))
    # Materials.
    for o in keep:
        slots = [classify(s.material.name) if s.material else "Body" for s in o.material_slots] or ["Body"]
        o.data.materials.clear()
        for k in slots:
            o.data.materials.append(mats[k])
    # Simplify.
    total = sum(tris(o) for o in keep)
    ratio = min(1.0, BUDGET / max(total, 1))
    for o in keep:
        if tris(o) > 250 and ratio < 1.0:
            bpy.context.view_layer.objects.active = o
            m = o.modifiers.new("dec", "DECIMATE")
            m.ratio = max(0.04, ratio)
            m.use_collapse_triangulate = True
            bpy.ops.object.select_all(action="DESELECT")
            o.select_set(True)
            bpy.ops.object.modifier_apply(modifier=m.name)
    # One mesh, one draw call per material.
    bpy.ops.object.select_all(action="DESELECT")
    for o in keep:
        o.select_set(True)
    bpy.context.view_layer.objects.active = keep[0]
    bpy.ops.object.join()
    body = bpy.context.view_layer.objects.active
    body.name = "body"
    for p in body.data.polygons:
        p.use_smooth = True
    n_after = tris(body)
    bb = [body.matrix_world @ v.co for v in body.data.vertices]
    print("CONVERT car_%d %s tris %d -> %d  x[%.2f,%.2f] y[%.2f,%.2f] z[%.2f,%.2f]" % (
        idx, src, total, n_after, min(v.x for v in bb), max(v.x for v in bb), min(v.y for v in bb), max(v.y for v in bb), min(v.z for v in bb), max(v.z for v in bb)))
    bpy.ops.object.select_all(action="DESELECT")
    body.select_set(True)
    bpy.ops.export_scene.gltf(filepath=DST + "car_%d.glb" % idx, export_format="GLB", use_selection=True, export_apply=True,
                              export_yup=True, export_image_format="NONE")
print("CONVERT_DONE")

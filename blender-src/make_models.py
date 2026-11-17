# Harbor City model generator. Run inside Blender (Scripting > Python Console):
#   exec(open('/path/to/GTA2027/blender-src/make_models.py').read())
# Writes original low-poly .glb models into game/models. All shapes are procedural and original.
import bpy, math, os, traceback
from pathlib import Path

ROOT = Path(os.environ.get("HARBOR_PROJECT_ROOT", Path(__file__).resolve().parents[1] if "__file__" in globals() else bpy.path.abspath("//"))).resolve()
OUT = str(ROOT / "game" / "models")
LOG = str(ROOT / "blender-src" / "blender-log.txt")
os.makedirs(OUT, exist_ok=True)
open(LOG, "w").write("start\n")

def log(msg):
    with open(LOG, "a") as f:
        f.write(str(msg) + "\n")

def lin(c):
    c = c / 255.0
    return c / 12.92 if c <= 0.04045 else ((c + 0.055) / 1.055) ** 2.4

MATS = {}
def mat(name, hexcol, rough=0.6, metal=0.0, emit=0.0):
    if name in MATS:
        return MATS[name]
    m = bpy.data.materials.new(name)
    m.use_nodes = True
    b = m.node_tree.nodes["Principled BSDF"]
    r, g, bl = [lin(int(hexcol[i:i + 2], 16)) for i in (0, 2, 4)]
    b.inputs["Base Color"].default_value = (r, g, bl, 1)
    b.inputs["Roughness"].default_value = rough
    b.inputs["Metallic"].default_value = metal
    if emit > 0:
        for key in ("Emission Color", "Emission"):
            if key in b.inputs:
                b.inputs[key].default_value = (r, g, bl, 1)
                break
        if "Emission Strength" in b.inputs:
            b.inputs["Emission Strength"].default_value = emit
    MATS[name] = m
    return m

CUR = []

def finish(o, m):
    o.data.materials.append(m)
    CUR.append(o)
    return o

def block(size, loc, m, bevel=0.0, rot=(0, 0, 0)):
    bpy.ops.mesh.primitive_cube_add(size=1, location=loc, rotation=rot)
    o = bpy.context.active_object
    for v in o.data.vertices:
        v.co.x *= size[0]
        v.co.y *= size[1]
        v.co.z *= size[2]
    if bevel > 0:
        mod = o.modifiers.new("Bevel", "BEVEL")
        mod.width = min(bevel, min(size) / 2.6)
        mod.segments = 2
    return finish(o, m)

def cyl(radius, depth, loc, m, rot=(0, 0, 0), verts=14):
    bpy.ops.mesh.primitive_cylinder_add(vertices=verts, radius=radius, depth=depth, location=loc, rotation=rot)
    return finish(bpy.context.active_object, m)

def cone(r1, r2, depth, loc, m, verts=14):
    bpy.ops.mesh.primitive_cone_add(vertices=verts, radius1=r1, radius2=r2, depth=depth, location=loc)
    return finish(bpy.context.active_object, m)

def export(name):
    for o in bpy.context.view_layer.objects:
        o.select_set(False)
    for o in CUR:
        o.select_set(True)
    bpy.context.view_layer.objects.active = CUR[0]
    path = os.path.join(OUT, name + ".glb")
    bpy.ops.export_scene.gltf(filepath=path, export_format="GLB", use_selection=True, export_apply=True, export_yup=True)
    log("exported %s %d bytes, %d parts" % (name, os.path.getsize(path), len(CUR)))
    for o in list(CUR):
        bpy.data.objects.remove(o, do_unlink=True)
    CUR.clear()
    for me in list(bpy.data.meshes):
        if me.users == 0:
            bpy.data.meshes.remove(me)

BODY = mat("Body", "d0d0d0", 0.45)
CABIN = mat("Cabin", "444444", 0.5)
GLASS = mat("Glass", "233648", 0.12, 0.2)
DARK = mat("Dark", "1b232b", 0.8)
CHROME = mat("Chrome", "c9d1d8", 0.3, 0.8)
LIGHT = mat("Light", "fff0b8", 0.3, 0.0, 2.5)
TAIL = mat("Tail", "e96963", 0.4, 0.0, 1.5)

CAR_STYLES = [
    dict(name="car_0", body_h=0.65, cabin_h=0.55, cabin_len=1.7, cabin_off=-0.2, wheel_r=0.36, spoiler=0, rack=False, bar=False, stripe=False, chrome=False),
    dict(name="car_1", body_h=0.7, cabin_h=0.66, cabin_len=1.95, cabin_off=-0.1, wheel_r=0.34, spoiler=0, rack=False, bar=False, stripe=False, chrome=True),
    dict(name="car_2", body_h=0.78, cabin_h=0.64, cabin_len=2.1, cabin_off=-0.3, wheel_r=0.44, spoiler=0, rack=True, bar=True, stripe=False, chrome=False),
    dict(name="car_3", body_h=0.6, cabin_h=0.46, cabin_len=1.45, cabin_off=-0.25, wheel_r=0.36, spoiler=1, rack=False, bar=False, stripe=False, chrome=False),
    dict(name="car_4", body_h=0.55, cabin_h=0.42, cabin_len=1.35, cabin_off=-0.3, wheel_r=0.37, spoiler=2, rack=False, bar=False, stripe=True, chrome=False),
]

def build_car(p):
    W, L = 1.8, 3.4
    bh, ch, cl, co = p["body_h"], p["cabin_h"], p["cabin_len"], p["cabin_off"]
    block((W, L, bh), (0, 0, 0), BODY, 0.14)
    cz = bh / 2 + ch / 2 - 0.05
    block((W * 0.84, cl, ch), (0, co, cz), GLASS, 0.12)
    roof_z = cz + ch / 2 + 0.01
    block((W * 0.8, cl * 0.92, 0.09), (0, co, roof_z), CABIN, 0.03)
    for sx in (-1, 1):
        for sy in (-1, 1):
            block((0.09, 0.11, ch), (sx * W * 0.42, co + sy * cl * 0.48, cz), CABIN)
        block((0.18, 0.12, 0.1), (sx * (W / 2 + 0.06), co + cl / 2 + 0.05, bh / 2 + 0.02), BODY)
    bumper = CHROME if p["chrome"] else DARK
    block((W * 0.98, 0.2, 0.22), (0, L / 2, -0.12), bumper, 0.05)
    block((W * 0.98, 0.2, 0.22), (0, -L / 2, -0.12), bumper, 0.05)
    for sx in (-1, 1):
        block((0.42, 0.08, 0.2), (sx * 0.58, L / 2 + 0.02, 0.05), LIGHT, 0.03)
        block((0.42, 0.08, 0.16), (sx * 0.58, -L / 2 - 0.02, 0.05), TAIL, 0.03)
    wz = -0.22
    for sx in (-1, 1):
        for sy in (-1, 1):
            cyl(p["wheel_r"], 0.3, (sx * (W / 2 - 0.1), sy * 1.05, wz), DARK, rot=(0, math.pi / 2, 0))
            cyl(p["wheel_r"] * 0.55, 0.32, (sx * (W / 2 - 0.1), sy * 1.05, wz), CHROME, rot=(0, math.pi / 2, 0), verts=10)
    if p["stripe"]:
        block((0.35, 1.2, 0.03), (0, 1.0, bh / 2 + 0.01), DARK)
        block((0.35, 0.9, 0.03), (0, -1.2, bh / 2 + 0.01), DARK)
        for sx in (-1, 1):
            block((0.08, 2.0, 0.12), (sx * (W / 2 + 0.02), 0, -bh / 2 + 0.05), DARK, 0.02)
    if p["rack"]:
        for sx in (-1, 1):
            block((0.06, cl * 0.9, 0.06), (sx * 0.5, co, roof_z + 0.09), DARK)
        for k in (-1, 0, 1):
            block((1.1, 0.06, 0.06), (0, co + k * cl * 0.38, roof_z + 0.09), DARK)
    if p["bar"]:
        block((1.2, 0.12, 0.5), (0, L / 2 + 0.14, -0.05), DARK, 0.04)
    if p["spoiler"] == 1:
        block((W * 0.9, 0.3, 0.06), (0, -L / 2 + 0.22, bh / 2 + 0.1), BODY, 0.02)
    if p["spoiler"] == 2:
        for sx in (-1, 1):
            block((0.08, 0.1, 0.32), (sx * 0.62, -L / 2 + 0.3, bh / 2 + 0.15), DARK)
        block((W * 1.0, 0.45, 0.07), (0, -L / 2 + 0.3, bh / 2 + 0.33), DARK, 0.02)
    export(p["name"])

def build_lighthouse():
    stone = mat("Stone", "8a8377", 0.9)
    white = mat("Tower", "f4f1ea", 0.7)
    red = mat("Red", "d8584e", 0.6)
    lamp = mat("Lamp", "ffd86a", 0.3, 0.0, 3.0)
    cyl(2.0, 0.8, (0, 0, 0.4), stone, verts=16)
    cone(1.7, 1.15, 9.0, (0, 0, 5.3), white, verts=16)
    cone(1.58, 1.54, 1.1, (0, 0, 3.3), red, verts=16)
    cone(1.37, 1.33, 1.1, (0, 0, 6.8), red, verts=16)
    cyl(1.75, 0.25, (0, 0, 9.9), DARK, verts=16)
    cyl(0.85, 1.4, (0, 0, 10.7), lamp, verts=12)
    cone(1.2, 0.05, 1.2, (0, 0, 12.0), red, verts=12)
    block((0.7, 0.2, 1.3), (0, 1.62, 1.5), DARK, 0.05)
    for z in (3.0, 6.2):
        block((0.3, 0.15, 0.5), (0, 1.5 - (z - 3.0) * 0.05, z + 0.9), GLASS, 0.03)
    export("lighthouse")

def build_windmill():
    wall = mat("Wall", "e8e0d0", 0.9)
    wood = mat("Wood", "a8855b", 0.85)
    roof = mat("Roof", "8a6a43", 0.85)
    cone(1.5, 1.0, 5.0, (0, 0, 2.5), wall, verts=12)
    cone(1.3, 0.08, 1.7, (0, 0, 5.8), roof, verts=12)
    block((0.5, 0.7, 0.5), (0, 1.1, 5.0), roof, 0.05)
    block((0.7, 0.2, 1.2), (0, 1.35, 0.6), wood, 0.05)
    for a in (0.0, math.pi / 2):
        block((0.5, 0.08, 3.8), (0, 1.5, 5.0), wood, 0.02, rot=(0, a, 0))
        block((0.9, 0.05, 3.5), (0, 1.58, 5.0), CHROME if False else wall, 0.01, rot=(0, a + 0.0, 0))
    export("windmill")

try:
    log("Blender " + bpy.app.version_string)
    for o in list(bpy.data.objects):
        bpy.data.objects.remove(o, do_unlink=True)
    for p in CAR_STYLES:
        build_car(p)
    build_lighthouse()
    build_windmill()
    log("DONE")
except Exception:
    log("ERROR\n" + traceback.format_exc())

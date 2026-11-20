# Harbor City 0.35.2: natural motion for the animated people.
#
# Kenney's packs only ship idle, run and jump, and their idle stands in a crouch. 0.35.0 faked a walk by
# slowing the run down, which looked stiff and robotic. This script reopens game/models/kperson.glb
# (built by make_kenney_people.py) and replaces Idle, Walk and the gestures with hand-made motion:
#   * Walk: heel strike, knee bend on landing, nearly straight stance leg, heel-off and toe push, a
#     high swing knee, hip sway and drop, counter-twisting shoulders, relaxed swinging arms and a
#     head that stays level. The body height comes from whichever foot is on the ground.
#   * Idle: standing tall, breathing, slow weight shift from foot to foot.
#   * Talk, Wave, Cheer, Sip, Phone, Look and Sit built on that same relaxed stance.
# Run and Jump stay Kenney's. Poses are set as absolute directions in armature space, so the odd rest
# pose of the Kenney skeleton does not matter.
#
# Run:  Blender -b --factory-startup -P blender-src/make_people_motion.py -- <in.glb> <out.glb> [render_dir]
import bpy, sys, math, os
from mathutils import Quaternion, Vector, Matrix

argv = sys.argv[sys.argv.index('--') + 1:]
SRC, OUT = argv[0], argv[1]
RENDER = argv[2] if len(argv) > 2 else ''
TAU = math.tau

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.gltf(filepath=SRC)
sc = bpy.context.scene
sc.render.fps = 24
for o in list(bpy.data.objects):
    if o.type == 'MESH' and o.name != 'Body':
        bpy.data.objects.remove(o, do_unlink=True)
rig = [o for o in bpy.data.objects if o.type == 'ARMATURE'][0]
body = bpy.data.objects['Body']

keep = {}
for a in list(bpy.data.actions):
    base = a.name.split('_')[0]
    if base in ('Run', 'Jump'):
        a.name = base; a.use_fake_user = True; keep[base] = a
    else:
        bpy.data.actions.remove(a)
if rig.animation_data:
    for t in list(rig.animation_data.nla_tracks):
        rig.animation_data.nla_tracks.remove(t)
    rig.animation_data.action = None
else:
    rig.animation_data_create()

B = rig.data.bones
REST = {b.name: b.matrix_local.copy() for b in B}
def rel(n):
    p = B[n].parent
    return REST[p.name].inverted() @ REST[n] if p else REST[n]
def head(n):
    return REST[n].to_translation()

# Armature space: +Z up, -Y forward, +X the character's left.
assert head('Head').z > head('Hips').z and head('LeftToes').y < head('LeftFoot').y and head('LeftUpLeg').x > 0
def rx(a): return Quaternion((1, 0, 0), a)   # + tips the top of a bone forward
def ry(a): return Quaternion((0, 1, 0), a)
def rz(a): return Quaternion((0, 0, 1), a)

SEG = {}
for n, c in [('UpLeg', 'Leg'), ('Leg', 'Foot'), ('Arm', 'ForeArm'), ('ForeArm', 'Hand')]:
    for s in ('Left', 'Right'):
        SEG[s + n] = (head(s + c) - head(s + n))
FOOT_PTS = {s: [head(s + 'HeelRoll'), head(s + 'Toes'), head(s + 'Toes_end'),
                Vector((head(s + 'Toes_end').x, head(s + 'HeelRoll').y, head(s + 'Toes_end').z))]
            for s in ('Left', 'Right')}
GROUND = min(p.z for pts in FOOT_PTS.values() for p in pts)

def aim(n, d):
    return SEG[n].normalized().rotation_difference(d.normalized())

def solve(P):
    """P: pose description -> {bone: armature-space matrix} for the driven bones."""
    M = {}
    def place(n, q):
        par = B[n].parent.name
        pm = M.get(par, REST[par])
        h = (pm @ rel(n)).to_translation()
        M[n] = Matrix.Translation(h) @ (q.to_matrix() @ REST[n].to_3x3()).to_4x4()
    def follow(n):
        par = B[n].parent.name
        M[n] = M.get(par, REST[par]) @ rel(n)
    hq = rz(P['yaw']) @ ry(P['roll']) @ rx(P.get('tilt', 0.0))
    M['Hips'] = Matrix.Translation(head('Hips') + Vector((P.get('sway', 0.0), 0, 0))) @ (hq.to_matrix() @ REST['Hips'].to_3x3()).to_4x4()
    lean = P.get('lean', 0.05)
    place('Spine', rz(P['yaw'] * 0.4) @ rx(lean * 0.6))
    cq = rz(-P['yaw'] * 0.6 + P.get('chest_yaw', 0.0)) @ rx(lean + P.get('breath', 0.0))
    place('Chest', rz(P.get('chest_yaw', 0.0) * 0.5) @ rx(lean * 0.9))
    place('UpperChest', cq)
    hq2 = rz(P.get('head_yaw', 0.0)) @ rx(P.get('head_pitch', 0.0))
    place('Neck', hq2)
    place('Head', hq2)
    for s, sx in (('Left', 1.0), ('Right', -1.0)):
        L = P[s]
        a, k = L['a'], L['k']
        place(s + 'UpLeg', aim(s + 'UpLeg', Vector((sx * 0.045, -math.sin(a), -math.cos(a)))))
        place(s + 'Leg', aim(s + 'Leg', Vector((-sx * 0.02, -math.sin(a - k), -math.cos(a - k)))))
        place(s + 'Foot', rx(-L['g']))
        follow(s + 'Toes')
        place(s + 'Shoulder', cq)
        A = P['arms'][s]
        sw, ab, e = A['s'], A.get('ab', 0.2), A['e']
        up = A.get('dir')
        d1 = up if up is not None else Vector((sx * math.sin(ab), -math.sin(sw) * math.cos(ab), -math.cos(sw) * math.cos(ab)))
        d1 = cq @ d1 if A.get('body', True) else d1
        place(s + 'Arm', aim(s + 'Arm', d1))
        fd = A.get('fdir')
        if fd is None:
            t = sw + e
            fd = Vector((sx * math.sin(ab) * 0.6 - sx * A.get('in', 0.0), -math.sin(t), -math.cos(t)))
            fd = cq @ fd
        place(s + 'ForeArm', aim(s + 'ForeArm', fd))
        follow(s + 'Hand')
    if P.get('ground', True):
        low = 1e9
        for s in ('Left', 'Right'):
            fm = M[s + 'Foot'] @ REST[s + 'Foot'].inverted()
            low = min(low, min((fm @ p).z for p in FOOT_PTS[s]))
        dz = GROUND - low + P.get('lift', 0.0)
    else:
        dz = P.get('dz', 0.0)
    T = Matrix.Translation((0, 0, dz))
    for n in M:
        M[n] = T @ M[n]
    return M

DRIVEN = ['Hips', 'Spine', 'Chest', 'UpperChest', 'Neck', 'Head']
for s in ('Left', 'Right'):
    DRIVEN += [s + n for n in ('UpLeg', 'Leg', 'Foot', 'Toes', 'Shoulder', 'Arm', 'ForeArm', 'Hand')]

def key_pose(M, fr):
    for n in DRIVEN:
        pb = rig.pose.bones[n]
        par = B[n].parent.name
        pm = M.get(par, REST[par])
        basis = rel(n).inverted() @ pm.inverted() @ M[n]
        pb.rotation_mode = 'QUATERNION'
        loc, rot, _ = basis.decompose()
        pb.rotation_quaternion = rot
        pb.keyframe_insert('rotation_quaternion', frame=fr)
        if n == 'Hips':
            pb.location = loc
            pb.keyframe_insert('location', frame=fr)
        else:
            pb.location = (0, 0, 0)

def make(name, frames, fn):
    a = bpy.data.actions.new(name); a.use_fake_user = True
    rig.animation_data.action = a
    for pb in rig.pose.bones:
        pb.matrix_basis = Matrix.Identity(4)
    for fr in range(1, frames + 2):          # last key = first key, so the loop is seamless
        key_pose(solve(fn(((fr - 1) % frames) / frames)), fr)
    # Quaternion keys can flip sign between frames; keep each curve on one hemisphere.
    groups = {}
    for f in a.fcurves:
        if f.data_path.endswith('rotation_quaternion'):
            groups.setdefault(f.data_path, {})[f.array_index] = f
    for g in groups.values():
        n = len(g[0].keyframe_points)
        prev = None
        for i in range(n):
            q = Quaternion([g[j].keyframe_points[i].co[1] for j in range(4)])
            if prev is not None and q.dot(prev) < 0:
                q = -q
                for j in range(4):
                    g[j].keyframe_points[i].co[1] = q[j]
            prev = q
    for f in a.fcurves:
        for kp in f.keyframe_points:
            kp.interpolation = 'LINEAR'
        f.update()
    keep[name] = a
    rig.animation_data.action = None
    return a

def cyc(keys, p):
    """Smooth periodic curve through (phase, value) keys (Catmull-Rom)."""
    n = len(keys)
    p %= 1.0
    for i in range(n):
        p0, v0 = keys[i]
        p1, v1 = keys[(i + 1) % n]
        if p1 <= p0: p1 += 1.0
        q = p if p >= p0 else p + 1.0
        if p0 <= q < p1:
            t = (q - p0) / (p1 - p0)
            vm = keys[(i - 1) % n][1]
            vp = keys[(i + 2) % n][1]
            t2, t3 = t * t, t * t * t
            return 0.5 * ((2 * v0) + (-vm + v1) * t + (2 * vm - 5 * v0 + 4 * v1 - vp) * t2 + (-vm + 3 * v0 - 3 * v1 + vp) * t3)
    return keys[0][1]

# ---------- Walk ----------
HIP = [(0.0, 0.40), (0.15, 0.30), (0.35, 0.05), (0.55, -0.26), (0.65, -0.24), (0.8, 0.18), (0.92, 0.43)]
KNEE = [(0.0, 0.05), (0.12, 0.30), (0.3, 0.12), (0.48, 0.10), (0.6, 0.45), (0.72, 1.05), (0.85, 0.50), (0.95, 0.06)]
TOE = [(0.0, 0.30), (0.08, 0.02), (0.3, 0.0), (0.48, -0.05), (0.6, -0.55), (0.7, -0.30), (0.82, 0.10), (0.94, 0.28)]
def walk(p):
    pl, pr = p, (p + 0.5) % 1.0
    c = math.cos(TAU * p)
    return {
        'Left': {'a': cyc(HIP, pl), 'k': cyc(KNEE, pl), 'g': cyc(TOE, pl)},
        'Right': {'a': cyc(HIP, pr), 'k': cyc(KNEE, pr), 'g': cyc(TOE, pr)},
        'yaw': -0.09 * c, 'roll': -0.045 * math.sin(TAU * p), 'sway': 0.025 * math.sin(TAU * p),
        'lean': 0.07, 'head_pitch': -0.04, 'head_yaw': 0.04 * c,
        'arms': {'Left': {'s': -0.32 * c + 0.03, 'e': 0.28 + 0.22 * max(0.0, -c), 'ab': 0.17},
                 'Right': {'s': 0.32 * c + 0.03, 'e': 0.28 + 0.22 * max(0.0, c), 'ab': 0.17}},
        'lift': 0.0}
make('Walk', 26, walk)

# ---------- Idle: standing tall, breathing, slow weight shift ----------
def stance(p, w=1.0):
    sh = math.sin(TAU * p)
    br = math.sin(TAU * p * 3)
    return {
        'Left': {'a': 0.03 - 0.02 * sh, 'k': 0.05 + 0.04 * max(0.0, -sh), 'g': 0.0},
        'Right': {'a': -0.02 + 0.02 * sh, 'k': 0.05 + 0.04 * max(0.0, sh), 'g': 0.0},
        'yaw': 0.03 * sh * w, 'roll': 0.025 * sh * w, 'sway': 0.035 * sh * w, 'lean': 0.03,
        'breath': 0.018 * br, 'head_pitch': -0.02 + 0.01 * br, 'head_yaw': 0.06 * math.sin(TAU * p * 2 + 1),
        'arms': {'Left': {'s': 0.04, 'e': 0.22 + 0.02 * br, 'ab': 0.15},
                 'Right': {'s': 0.06, 'e': 0.25 + 0.02 * br, 'ab': 0.15}}}
make('Idle', 96, stance)

def gesture(name, frames, fn):
    make(name, frames, lambda p: fn(p, stance(p, 0.5)))

def talk(p, P):
    g1 = max(0.0, math.sin(TAU * p * 4)); g2 = max(0.0, math.sin(TAU * p * 4 + 2.2))
    P['arms']['Right'] = {'s': 0.2, 'e': 0.9 + 0.35 * g1, 'ab': 0.25, 'in': 0.1}
    P['arms']['Left'] = {'s': 0.12, 'e': 0.6 + 0.3 * g2, 'ab': 0.22}
    P['head_yaw'] = 0.25 * math.sin(TAU * p * 2); P['head_pitch'] = 0.06 * math.sin(TAU * p * 6)
    return P
def wave(p, P):
    w = math.sin(TAU * p * 3)
    P['arms']['Right'] = {'s': 0, 'e': 0, 'dir': Vector((-0.75, -0.15, 0.55)), 'fdir': Vector((-0.25 - 0.3 * w, -0.2, 1.0))}
    P['head_yaw'] = -0.15
    return P
def cheer(p, P):
    b = math.sin(TAU * p * 2)
    P['arms']['Right'] = {'s': 0, 'e': 0, 'dir': Vector((-0.45, -0.1, 0.9)), 'fdir': Vector((-0.3 - 0.15 * b, -0.15, 1.0))}
    P['arms']['Left'] = {'s': 0, 'e': 0, 'dir': Vector((0.45, -0.1, 0.9)), 'fdir': Vector((0.3 + 0.15 * b, -0.15, 1.0))}
    P['lift'] = 0.03 * max(0.0, b)
    P['head_pitch'] = 0.12
    return P
def sip(p, P):
    up = cyc([(0.0, 0.0), (0.2, 0.0), (0.35, 1.0), (0.6, 1.0), (0.75, 0.0)], p)
    up = max(0.0, min(1.0, up))
    P['arms']['Right'] = {'s': 0.2 + 0.25 * up, 'e': 1.0 + 1.25 * up, 'ab': 0.25, 'in': 0.25 * up}
    P['head_pitch'] = 0.1 * up
    return P
def phone(p, P):
    P['arms']['Right'] = {'s': 0.25, 'e': 1.35, 'ab': 0.2, 'in': 0.25}
    P['arms']['Left'] = {'s': 0.2, 'e': 1.2, 'ab': 0.2, 'in': 0.2}
    P['head_pitch'] = -0.35 + 0.04 * math.sin(TAU * p)
    return P
def look(p, P):
    P['head_yaw'] = 0.6 * math.sin(TAU * p); P['chest_yaw'] = 0.15 * math.sin(TAU * p)
    return P
gesture('Talk', 60, talk)
gesture('Wave', 40, wave)
gesture('Cheer', 30, cheer)
gesture('Sip', 80, sip)
gesture('Phone', 90, phone)
gesture('Look', 120, look)

def sit(p):
    br = math.sin(TAU * p * 2)
    return {'Left': {'a': 1.5, 'k': 1.45, 'g': 0.0}, 'Right': {'a': 1.45, 'k': 1.35, 'g': 0.0},
            'yaw': 0.0, 'roll': 0.0, 'lean': -0.05, 'breath': 0.015 * br, 'ground': False, 'dz': 0.0,
            'head_yaw': 0.2 * math.sin(TAU * p), 'head_pitch': -0.04,
            'arms': {'Left': {'s': 0.3, 'e': 0.85, 'ab': 0.2, 'in': 0.1}, 'Right': {'s': 0.32, 'e': 0.9, 'ab': 0.2, 'in': 0.1}}}
make('Sit', 120, sit)

# Same game-cost trims as make_kenney_people.py.
for a in keep.values():
    for f in list(a.fcurves):
        dp = f.data_path
        bone = dp.split('"')[1] if '"' in dp else ''
        if dp.endswith('.scale') or any(k in bone for k in ('Index', 'Thumb')):
            a.fcurves.remove(f)

for name, a in keep.items():
    tr = rig.animation_data.nla_tracks.new(); tr.name = name
    tr.strips.new(name, int(a.frame_range[0]), a); tr.mute = True
rig.animation_data.action = None

if RENDER:
    os.makedirs(RENDER, exist_ok=True)
    cam = bpy.data.objects.new('cam', bpy.data.cameras.new('cam'))
    sc.collection.objects.link(cam)
    sc.camera = cam
    sun = bpy.data.objects.new('sun', bpy.data.lights.new('sun', 'SUN'))
    sc.collection.objects.link(sun); sun.rotation_euler = (0.6, 0.2, 0.3)
    sc.render.engine = 'BLENDER_WORKBENCH'
    sc.display.shading.color_type = 'SINGLE'
    sc.render.resolution_x, sc.render.resolution_y = 240, 330
    side = os.environ.get('HC_SIDE') == '1'
    cam.location = (3.4, -0.1, 0.85) if side else (2.6, -2.6, 0.9)
    cam.rotation_euler = (math.radians(88), 0, math.radians(90 if side else 45))
    for name, frs in [('Walk', [1, 4, 7, 10, 13, 16, 19, 22]), ('Idle', [1, 48]), ('Talk', [10]), ('Wave', [8]),
                      ('Cheer', [5]), ('Sip', [40]), ('Phone', [1]), ('Sit', [1]), ('Run', [1, 7])]:
        rig.animation_data.action = keep[name]
        for fr in frs:
            sc.frame_set(fr)
            sc.render.filepath = os.path.join(RENDER, '%s_%03d.png' % (name, fr))
            bpy.ops.render.render(write_still=True)
    rig.animation_data.action = None

bpy.ops.export_scene.gltf(filepath=OUT, export_format='GLB', export_animations=True,
                          export_animation_mode='NLA_TRACKS', export_skins=True,
                          export_image_format='NONE', export_materials='EXPORT',
                          export_force_sampling=True, export_frame_step=1,
                          export_def_bones=True, export_optimize_animation_size=True)
print('MOTION_OK', OUT, sorted(keep))

# Harbor City 0.35: build game/models/kperson.glb from Kenney's CC0 "Animated Characters" packs.
#
# Source packs (CC0, www.kenney.nl): Animated Characters Protagonists / Survivors / Retro.
# They all share one rigged body (characterMedium.fbx) and three animations (idle, run, jump).
# This script:
#   * imports the body and the three animations onto one skeleton,
#   * scales it to Harbor City's person height (1.68 m),
#   * adds extra actions made from those: Walk (a calmer run), Talk, Wave, Cheer, Sip, Phone, Look,
#   * exports one GLB with every action as a named animation.
# Skins (PNG textures) are copied separately into game/models/people/.
#
# Run:  Blender -b --factory-startup -P blender-src/make_kenney_people.py -- <kenney pack dir> <out.glb> [render_dir]
import bpy, sys, math, os
from mathutils import Quaternion, Vector, Matrix

argv = sys.argv[sys.argv.index('--') + 1:]
PACK, OUT = argv[0], argv[1]
RENDER = argv[2] if len(argv) > 2 else ''
TARGET_H = 1.68

bpy.ops.wm.read_factory_settings(use_empty=True)
bpy.ops.import_scene.fbx(filepath=os.path.join(PACK, 'Model/characterMedium.fbx'))
model_rig = [o for o in bpy.data.objects if o.type == 'ARMATURE'][0]
body = [o for o in bpy.data.objects if o.type == 'MESH'][0]
body.name = 'Body'

# The body is skinned to a T-pose skeleton, but the animation files use a skeleton whose rest pose is
# relaxed (arms down). Pose the body's skeleton onto the animation skeleton's rest, bake that shape
# into the mesh, and move the mesh over to the animation skeleton, so the animations play unchanged.
before = set(bpy.data.objects)
bpy.ops.import_scene.fbx(filepath=os.path.join(PACK, 'Animations/idle.fbx'))
rig = [o for o in set(bpy.data.objects) - before if o.type == 'ARMATURE'][0]
for o in set(bpy.data.objects) - before - {rig}:
    bpy.data.objects.remove(o, do_unlink=True)
if rig.animation_data:
    rig.animation_data.action = None
for pb in rig.pose.bones:
    pb.matrix_basis = Matrix.Identity(4)
for a in list(bpy.data.actions):
    bpy.data.actions.remove(a)
rig.name = 'Rig'
bpy.context.view_layer.update()
for pb in model_rig.pose.bones:
    if pb.name not in rig.data.bones:
        continue
    if pb.parent is None or pb.name in ('Hips', 'HipsCtrl'):
        c = pb.constraints.new('COPY_LOCATION'); c.target = rig; c.subtarget = pb.name
    c = pb.constraints.new('DAMPED_TRACK'); c.target = rig; c.subtarget = pb.name; c.head_tail = 1.0
bpy.context.view_layer.update()
bpy.context.view_layer.objects.active = body
for m in body.modifiers:
    if m.type == 'ARMATURE':
        bpy.ops.object.modifier_apply(modifier=m.name)
mw = body.matrix_world.copy()
body.parent = rig
body.matrix_world = mw
md = body.modifiers.new('Armature', 'ARMATURE'); md.object = rig
bpy.data.objects.remove(model_rig, do_unlink=True)

actions = {}
for name in ['idle', 'run', 'jump']:
    before = set(bpy.data.objects)
    before_act = set(bpy.data.actions)
    bpy.ops.import_scene.fbx(filepath=os.path.join(PACK, 'Animations/%s.fbx' % name))
    for a in set(bpy.data.actions) - before_act:
        if a.name.endswith('|' + name.capitalize()):
            a.name = name.capitalize()
            a.use_fake_user = True
            # Drop object-level keys (they would override the rig's scale and add root motion).
            for f in [f for f in a.fcurves if not f.data_path.startswith('pose.bones')]:
                a.fcurves.remove(f)
            actions[a.name] = a
        else:
            bpy.data.actions.remove(a)
    for o in set(bpy.data.objects) - before:
        bpy.data.objects.remove(o, do_unlink=True)
for a in list(bpy.data.actions):
    if a.name not in actions:
        bpy.data.actions.remove(a)

H = max((body.matrix_world @ Vector(c)).z for c in body.bound_box)
s = TARGET_H / H
rig.scale = (s, s, s)
print('SCALE', H, s)

def fc_map(act):
    return {(f.data_path, f.array_index): f for f in act.fcurves}

def sample(f, t):
    return f.evaluate(t)

def new_action(name, src, length, fn):
    """Build an action of `length` frames: for each frame, values = fn(frame, data_path, index, src_value)."""
    a = bpy.data.actions.new(name)
    a.use_fake_user = True
    srcmap = fc_map(src)
    s0, s1 = src.frame_range
    span = s1 - s0
    for (dp, idx), f in srcmap.items():
        nf = a.fcurves.new(dp, index=idx, action_group=f.group.name if f.group else '')
        for fr in range(1, length + 1):
            t = s0 + ((fr - 1) % max(1, int(span))) if span > 0 else s0
            nf.keyframe_points.insert(fr, fn(fr, dp, idx, sample(f, t)), options={'FAST'})
    for f in a.fcurves:
        f.update()
    actions[name] = a
    return a

# ---------- Walk: blend Run toward the first Idle frame (calmer limbs), slowed to 25 frames ----------
idle, run = actions['Idle'], actions['Run']
idle_map = fc_map(idle)
r0, r1 = run.frame_range
walk = bpy.data.actions.new('Walk'); walk.use_fake_user = True
WL = 25
for (dp, idx), f in fc_map(run).items():
    base = idle_map.get((dp, idx))
    nf = walk.fcurves.new(dp, index=idx, action_group=f.group.name if f.group else '')
    for fr in range(1, WL + 1):
        t = r0 + (fr - 1) / (WL - 1) * (r1 - r0)
        v = f.evaluate(t)
        b = base.evaluate(idle.frame_range[0]) if base else v
        k = 0.55
        if dp.endswith('location'):
            k = 0.45
        nf.keyframe_points.insert(fr, b + (v - b) * k, options={'FAST'})
    nf.update()
actions['Walk'] = walk

# ---------- Gestures layered on Idle by rotating arm / head bones about armature-space axes ----------
pbones = rig.pose.bones
REST = {b.name: b.matrix_local.to_quaternion() for b in rig.data.bones}

def local_rot(bone, axis, ang):
    """Rotation about an armature-space axis expressed in the bone's rest frame."""
    r = REST[bone]
    return r.inverted() @ Quaternion(axis, ang) @ r

def layered(name, length, extras):
    """extras: fn(frame) -> {bone: Quaternion in bone-local frame applied after the Idle pose}."""
    a = bpy.data.actions.new(name); a.use_fake_user = True
    i0, i1 = idle.frame_range
    span = i1 - i0
    curves = {}
    for (dp, idx), f in idle_map.items():
        curves[(dp, idx)] = a.fcurves.new(dp, index=idx, action_group=f.group.name if f.group else '')
    for fr in range(1, length + 1):
        t = i0 + ((fr - 1) * 0.5) % span
        ex = extras(fr)
        done = set()
        for (dp, idx), f in idle_map.items():
            bone = dp.split('"')[1] if '"' in dp else ''
            if bone in ex and dp.endswith('rotation_quaternion'):
                if (bone) in done:
                    continue
                done.add(bone)
                q = Quaternion([idle_map[(dp, i)].evaluate(t) for i in range(4)])
                q = (ex[bone] @ q).normalized()
                for i in range(4):
                    curves[(dp, i)].keyframe_points.insert(fr, q[i], options={'FAST'})
            elif not (bone in ex and dp.endswith('rotation_quaternion')):
                curves[(dp, idx)].keyframe_points.insert(fr, f.evaluate(t), options={'FAST'})
    for c in curves.values():
        c.update()
    actions[name] = a

X, Y, Z = Vector((1, 0, 0)), Vector((0, 1, 0)), Vector((0, 0, 1))
def wave(fr):
    w = math.sin(fr / 40 * math.tau * 3)
    return {'RightArm': local_rot('RightArm', Y, -2.3),
            'RightForeArm': local_rot('RightForeArm', Y, -0.6 + 0.45 * w)}
def talk(fr):
    p = fr / 60 * math.tau
    return {'RightForeArm': local_rot('RightForeArm', X, -0.9 - 0.35 * max(0, math.sin(p * 2))),
            'LeftForeArm': local_rot('LeftForeArm', X, -0.5 - 0.3 * max(0, math.sin(p * 2 + 2.2))),
            'Head': local_rot('Head', Z, 0.25 * math.sin(p)) @ local_rot('Head', X, 0.08 * math.sin(p * 3))}
def cheer(fr):
    b = math.sin(fr / 30 * math.tau * 2)
    return {'RightArm': local_rot('RightArm', Y, -2.5 + 0.25 * b),
            'LeftArm': local_rot('LeftArm', Y, 2.5 - 0.25 * b)}
def sip(fr):
    p = (fr % 80) / 80
    up = 1.0 if 0.35 < p < 0.6 else (p - 0.2) / 0.15 if 0.2 < p <= 0.35 else (0.75 - p) / 0.15 if 0.6 <= p < 0.75 else 0.0
    return {'RightForeArm': local_rot('RightForeArm', X, -1.2 - 0.9 * up),
            'Head': local_rot('Head', X, 0.12 * up)}
def phone(fr):
    p = fr / 90 * math.tau
    return {'RightForeArm': local_rot('RightForeArm', X, -1.5),
            'LeftForeArm': local_rot('LeftForeArm', X, -1.3),
            'Head': local_rot('Head', X, -0.35 + 0.05 * math.sin(p))}
def look(fr):
    p = fr / 120 * math.tau
    return {'Head': local_rot('Head', Z, 0.6 * math.sin(p)),
            'Spine': local_rot('Spine', Z, 0.15 * math.sin(p))}

def sit(fr):
    p = fr / 120 * math.tau
    return {'LeftUpLeg': local_rot('LeftUpLeg', X, -1.5), 'RightUpLeg': local_rot('RightUpLeg', X, -1.5),
            'LeftLeg': local_rot('LeftLeg', X, 1.3), 'RightLeg': local_rot('RightLeg', X, 1.3),
            'LeftForeArm': local_rot('LeftForeArm', X, -0.7), 'RightForeArm': local_rot('RightForeArm', X, -0.7),
            'Head': local_rot('Head', Z, 0.2 * math.sin(p))}

layered('Sit', 120, sit)
layered('Wave', 40, wave)
layered('Talk', 60, talk)
layered('Cheer', 30, cheer)
layered('Sip', 80, sip)
layered('Phone', 90, phone)
layered('Look', 120, look)

# Keep the game cheap: fingers stay in their rest pose and bone scale never changes. (Constant
# tracks are dropped again by Godot's importer, which keeps only what really moves.)
trimmed = 0
for a in actions.values():
    for f in list(a.fcurves):
        dp = f.data_path
        bone = dp.split('"')[1] if '"' in dp else ''
        drop = dp.endswith('.scale') or any(k in bone for k in ('Index', 'Thumb'))
        if drop:
            a.fcurves.remove(f)
            trimmed += 1
print('TRIMMED fcurves', trimmed, 'left in Idle', len(actions['Idle'].fcurves))

# One NLA track per action so the glTF exporter writes them all as separate named animations.
rig.animation_data_create()
for name, a in actions.items():
    tr = rig.animation_data.nla_tracks.new()
    tr.name = name
    st = tr.strips.new(name, int(a.frame_range[0]), a)
    tr.mute = True
rig.animation_data.action = None

# One material only (one draw and one skinning pass per person). The game's shader tints the
# shirt / trousers / shoes by where a pixel sits on Kenney's texture layout.
me = body.data
me.materials.clear()
m = bpy.data.materials.new('Skin'); me.materials.append(m)

if RENDER:
    os.makedirs(RENDER, exist_ok=True)
    cam = bpy.data.objects.new('cam', bpy.data.cameras.new('cam'))
    bpy.context.scene.collection.objects.link(cam)
    cam.location = (3.4, -2.4, 0.9); cam.rotation_euler = (math.radians(88), 0, math.radians(55))
    bpy.context.scene.camera = cam
    sun = bpy.data.objects.new('sun', bpy.data.lights.new('sun', 'SUN'))
    bpy.context.scene.collection.objects.link(sun); sun.rotation_euler = (0.6, 0.2, 0.3)
    sc = bpy.context.scene
    sc.render.engine = 'BLENDER_WORKBENCH'
    sc.display.shading.color_type = 'SINGLE'
    sc.render.resolution_x, sc.render.resolution_y = 300, 360
    for name in ['Idle', 'Walk', 'Run', 'Wave', 'Talk', 'Cheer', 'Sip', 'Phone', 'Sit']:
        rig.animation_data.action = actions[name]
        for fr in [1, int(actions[name].frame_range[1] * 0.4) + 1]:
            sc.frame_set(fr)
            sc.render.filepath = os.path.join(RENDER, '%s_%02d.png' % (name, fr))
            bpy.ops.render.render(write_still=True)
    rig.animation_data.action = None

bpy.ops.export_scene.gltf(filepath=OUT, export_format='GLB', export_animations=True,
                          export_animation_mode='NLA_TRACKS', export_skins=True,
                          export_image_format='NONE', export_materials='EXPORT',
                          export_force_sampling=True, export_frame_step=1,
                          export_def_bones=True, export_optimize_animation_size=True)
print('KPERSON_OK', OUT, sorted(actions))

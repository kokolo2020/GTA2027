"""Prepare the isolated trial asset, including sitting and existing game gesture names."""
import bpy, math
from pathlib import Path
from mathutils import Vector, Matrix

OUT=Path(__file__).resolve().parent
bpy.ops.wm.open_mainfile(filepath=str(OUT/'harbor-refined-run.blend'))
rig=bpy.data.objects['Harbor natural rig'];ad=rig.data
names={'Relaxed idle':'Idle','Walk study':'Walk','Refined run':'Run'}
for track in rig.animation_data.nla_tracks:
    track.mute=True
    for strip in track.strips:
        if strip.action.name in names:
            name=names[strip.action.name];strip.action.name=name;track.name=name;strip.name=name
rig.animation_data.action=None

def aim(name,direction):
    bone=ad.bones[name]
    position=(rig.pose.bones[bone.parent.name].matrix @ bone.parent.matrix_local.inverted() @ bone.matrix_local).translation
    rest=(bone.tail_local-bone.head_local).normalized()
    q=rest.rotation_difference(Vector(direction).normalized()) @ bone.matrix_local.to_quaternion()
    rig.pose.bones[name].matrix=Matrix.Translation(position) @ q.to_matrix().to_4x4()
    bpy.context.view_layer.update()

for name in ['Sit','Wave','Talk','Cheer']:
    action=bpy.data.actions.new(name);rig.animation_data.action=action
    for frame in range(1,62):
        t=(frame-1)/60*math.tau
        for pb in rig.pose.bones:
            pb.rotation_mode='XYZ';pb.rotation_euler=(0,0,0);pb.location=(0,0,0)
        bpy.context.view_layer.update()
        if name=='Sit':
            for side,s in [('L',-1),('R',1)]:
                aim('Thigh.'+side,(s*.03,-1,-.03))
                aim('Shin.'+side,(0,.02,-1))
                aim('Foot.'+side,(0,-.144,-.08))
                aim('Arm.'+side,(s*.08,-.35,-1))
                aim('Forearm.'+side,(0,-1,-.15))
        elif name=='Wave':
            aim('Arm.R',(.65,-.08,.75))
            aim('Forearm.R',(.2+.3*math.sin(t*2),-.1,1))
        elif name=='Cheer':
            for side,s in [('L',-1),('R',1)]:
                aim('Arm.'+side,(s*.55,0,.85))
                aim('Forearm.'+side,(s*(.1+.08*math.sin(t*2)),0,1))
        elif name=='Talk':
            aim('Arm.R',(.08,-.2,-1))
            aim('Forearm.R',(.04,-1,.1+.15*math.sin(t*2)))
        for pb in rig.pose.bones:
            pb.keyframe_insert('rotation_euler',frame=frame);pb.keyframe_insert('location',frame=frame)
    track=rig.animation_data.nla_tracks.new();track.name=name
    track.strips.new(name,1,action);track.mute=True;action.use_fake_user=True
rig.animation_data.action=None
bpy.ops.object.select_all(action='DESELECT')
for obj in bpy.data.objects:
    if obj==rig or (obj.type=='MESH' and obj.parent==rig):obj.select_set(True)
bpy.context.view_layer.objects.active=rig
bpy.ops.export_scene.gltf(filepath=str(OUT.parents[1]/'game/models/natural_player_trial.glb'),
    export_format='GLB',use_selection=True,export_animations=True,export_animation_mode='NLA_TRACKS',export_skins=True)
print('GAME_TRIAL_ASSET_READY',flush=True)

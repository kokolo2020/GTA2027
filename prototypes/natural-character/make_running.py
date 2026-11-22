"""Add an isolated running study to the existing prototype; no game integration."""
import bpy, math
from pathlib import Path
from mathutils import Vector, Matrix, Quaternion

OUT=Path(__file__).resolve().parent
bpy.ops.wm.open_mainfile(filepath=str(OUT/'harbor-natural-01.blend'))
rig=bpy.data.objects['Harbor natural rig'];ad=rig.data;sc=bpy.context.scene
for track in rig.animation_data.nla_tracks:track.mute=True
action=bpy.data.actions.new('Run study');rig.animation_data.action=action
count=24

def direction_pose(name,position,end):
    rest=ad.bones[name]
    rd=rest.tail_local-rest.head_local
    rotation=rd.normalized().rotation_difference((end-position).normalized()) @ rest.matrix_local.to_quaternion()
    rig.pose.bones[name].matrix=Matrix.Translation(position) @ rotation.to_matrix().to_4x4()
    bpy.context.view_layer.update()

for frame in range(1,count+2):
    p=(frame-1)/count;ang=p*math.tau
    for pb in rig.pose.bones:
        pb.rotation_mode='XYZ';pb.rotation_euler=(0,0,0);pb.location=(0,0,0)
    hips=rig.pose.bones['Hips'];hips.location.y=-.055-.020*math.cos(2*ang)
    hips.rotation_euler.x=.08;hips.rotation_euler.y=.045*math.sin(ang)
    rig.pose.bones['Spine'].rotation_euler.x=.06
    rig.pose.bones['Chest'].rotation_euler.x=.075
    rig.pose.bones['Chest'].rotation_euler.y=-.075*math.sin(ang)
    rig.pose.bones['Head'].rotation_euler.x=-.09
    for side,off in [('L',0),('R',math.pi)]:
        ph=ang+off
        rig.pose.bones['Arm.'+side].rotation_euler.x=.58*math.cos(ph)
        rig.pose.bones['Forearm.'+side].rotation_euler.x=-.92-.17*math.cos(ph-.35)
        rig.pose.bones['Hand.'+side].rotation_euler.x=-.035+.025*math.sin(ph)
    bpy.context.view_layer.update()
    pelvis=hips.matrix @ ad.bones['Hips'].matrix_local.inverted()
    for side,off in [('L',0),('R',.5)]:
        u=(p+off)%1;s=-1 if side=='L' else 1
        hip=pelvis @ ad.bones['Thigh.'+side].head_local
        if u<.40:
            q=u/.40;fy=-.23+.46*q;lift=0;toe=0
        else:
            q=(u-.40)/.60;fy=.23-.46*q;lift=.27*math.sin(math.pi*q);toe=.18*math.sin(math.pi*q)
        ankle=Vector((s*.103,fy,.15+lift))
        upper=ad.bones['Thigh.'+side].length;lower=ad.bones['Shin.'+side].length
        delta=ankle-hip;length=min(delta.length,upper+lower-.002)
        direction=delta.normalized();ankle=hip+direction*length
        along=(upper*upper-lower*lower+length*length)/(2*length)
        bend=Vector((0,-1,0));bend=(bend-direction*bend.dot(direction)).normalized()
        knee=hip+direction*along+bend*math.sqrt(max(0,upper*upper-along*along))
        direction_pose('Thigh.'+side,hip,knee)
        direction_pose('Shin.'+side,knee,ankle)
        foot=Quaternion((1,0,0),toe) @ Vector((0,-.144,-.08))
        direction_pose('Foot.'+side,ankle,ankle+foot)
    for pb in rig.pose.bones:
        pb.keyframe_insert('rotation_euler',frame=frame);pb.keyframe_insert('location',frame=frame)
action.use_fake_user=True
track=rig.animation_data.nla_tracks.new();track.name=action.name
track.strips.new(action.name,1,action);track.mute=True
rig.animation_data.action=None
bpy.ops.object.select_all(action='DESELECT')
for o in bpy.data.objects:
    if o==rig or (o.type=='MESH' and o.parent==rig):o.select_set(True)
bpy.context.view_layer.objects.active=rig
bpy.ops.export_scene.gltf(filepath=str(OUT/'harbor-natural-running.glb'),export_format='GLB',
    use_selection=True,export_animations=True,export_animation_mode='NLA_TRACKS',export_skins=True)
for track in rig.animation_data.nla_tracks:track.mute=True
rig.animation_data.action=action
sc.render.fps=30;sc.frame_start=1;sc.frame_end=count
cam=sc.camera;cam.location=(3.7,-5,2.1)
cam.rotation_euler=(Vector((0,0,.9))-cam.location).to_track_quat('-Z','Y').to_euler()
cam.data.ortho_scale=2.05
sc.render.resolution_x=480;sc.render.resolution_y=640;sc.cycles.samples=10
sc.frame_set(7)
sc.render.filepath=str(OUT/'running.png');bpy.ops.render.render(write_still=True)
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'harbor-natural-running.blend'))
frames=OUT/'run-frames';frames.mkdir(exist_ok=True)
for frame in range(1,count+1):
    sc.frame_set(frame);sc.render.filepath=str(frames/('%03d.png'%frame))
    bpy.ops.render.render(write_still=True)
print('RUN_STUDY_DONE',flush=True)

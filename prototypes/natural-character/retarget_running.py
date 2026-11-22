"""Retarget the project's existing Kenney CC0 Run clip to the original prototype body."""
import bpy, bmesh, math
from pathlib import Path
from mathutils import Vector, Matrix, Quaternion

OUT=Path(__file__).resolve().parent
bpy.ops.wm.open_mainfile(filepath=str(OUT/'harbor-natural-01.blend'))
target=bpy.data.objects['Harbor natural rig'];sc=bpy.context.scene
# Running hands have a loose curl rather than the base model's open, flat fingers.
# This is a separate running variant; the original prototype retains its open hands.
arms=bpy.data.objects['Arms and relaxed hands']
bm=bmesh.new();bm.from_mesh(arms.data)
bmesh.ops.delete(bm,geom=[v for v in bm.verts if (arms.matrix_world @ v.co).z<.922],context='VERTS')
bm.to_mesh(arms.data);bm.free();arms.data.update()
skin=bpy.data.materials['Warm skin']
def ball(name,loc,scale):
    bpy.ops.mesh.primitive_uv_sphere_add(segments=16,ring_count=10,location=loc)
    o=bpy.context.object;o.name=name;o.scale=scale
    bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
    o.data.materials.append(skin)
    return o
for s,side in [(-1,'L'),(1,'R')]:
    pieces=[ball('Relaxed running palm',(s*.254,-.049,.908),(.021,.030,.031)),
            ball('Curled fingers',(s*.245,-.050,.886),(.019,.029,.023))]
    for i in range(4):
        pieces.append(ball('Soft knuckle',(s*.254,-.071+i*.014,.884),(.011,.009,.012)))
    thumb=ball('Relaxed thumb',(s*.235,-.075,.904),(.011,.011,.023))
    thumb.rotation_euler.y=s*.45;pieces.append(thumb)
    bpy.ops.object.select_all(action='DESELECT')
    for o in pieces:o.select_set(True)
    bpy.context.view_layer.objects.active=pieces[0];bpy.ops.object.join();hand=bpy.context.object
    hand.name='Loose running fist.'+side
    rem=hand.modifiers.new('Connected hand surface','REMESH');rem.mode='VOXEL';rem.voxel_size=.0025
    bpy.ops.object.modifier_apply(modifier=rem.name)
    sm=hand.modifiers.new('Soft finger transitions','SMOOTH');sm.factor=.7;sm.iterations=3
    bpy.ops.object.modifier_apply(modifier=sm.name)
    dec=hand.modifiers.new('Hand budget','DECIMATE');dec.ratio=.3
    bpy.ops.object.modifier_apply(modifier=dec.name)
    for poly in hand.data.polygons:poly.use_smooth=True
    # Keep coordinates in rig space when adding the skin modifier.
    bpy.ops.object.transform_apply(location=True,rotation=True,scale=True)
    hand.parent=target
    group=hand.vertex_groups.new(name='Hand.'+side);group.add(list(range(len(hand.data.vertices))),1,'REPLACE')
    mod=hand.modifiers.new('Hand skin','ARMATURE');mod.object=target
def smooth(value):
    t=max(0,min(1,value));return t*t*(3-2*t)
# Keep the jacket torso on the spine: distance-only weighting pulled its back toward the elbows.
jacket=bpy.data.objects['Neo Harbor tech jacket']
for group in jacket.vertex_groups:group.remove(list(range(len(jacket.data.vertices))))
for vertex in jacket.data.vertices:
    co=jacket.matrix_world @ vertex.co
    arm=smooth((abs(co.x)-.145)/.07)*smooth((co.z-1.18)/.10)
    hips=1-smooth((co.z-.97)/.10);chest=smooth((co.z-1.17)/.15)
    weights={'Hips':hips*(1-arm),'Chest':chest*(1-arm),'Spine':max(0,1-hips-chest)*(1-arm),
             'Arm.L' if co.x<0 else 'Arm.R':arm}
    for name,weight in weights.items():
        if weight>0:jacket.vertex_groups[name].add([vertex.index],weight,'REPLACE')
before=set(bpy.data.objects)
bpy.ops.import_scene.gltf(filepath=str(OUT.parents[1]/'game/models/kperson.glb'))
imported=set(bpy.data.objects)-before
source=next(o for o in imported if o.type=='ARMATURE')
run=next(a for a in bpy.data.actions if a.name.startswith('Run_'))
for track in source.animation_data.nla_tracks:track.mute=True
source.animation_data.action=run
for track in target.animation_data.nla_tracks:track.mute=True
target.animation_data.action=None
start,end=run.frame_range
count=20
samples=[]
def wp(name):return source.matrix_world @ source.pose.bones[name].head
for index in range(count+1):
    time=start+(end-start)*index/count
    sc.frame_set(int(time),subframe=time-int(time));bpy.context.view_layer.update()
    points={b.name:wp(b.name).copy() for b in source.pose.bones}
    rot={b.name:(source.matrix_world.to_quaternion() @ b.matrix.to_quaternion()) for b in source.pose.bones}
    soles=[points[n].z for n in points if 'Heel' in n or 'Toes' in n]
    samples.append((points,rot,min(soles)))
ground=min(s[2] for s in samples)
source_leg=sum((samples[0][0][a]-samples[0][0][b]).length for a,b in [('LeftUpLeg','LeftLeg'),('LeftLeg','LeftFoot')])
scale=(target.data.bones['Thigh.L'].length+target.data.bones['Shin.L'].length)/source_leg
mapping={'Hips':('Hips','Spine'),'Spine':('Spine','Chest'),'Chest':('Chest','UpperChest'),'Head':('Head',None)}
for side,src in [('L','Right'),('R','Left')]:
    for tgt,a,b in [('Arm','Arm','ForeArm'),('Forearm','ForeArm','Hand'),('Hand','Hand',None),
            ('Thigh','UpLeg','Leg'),('Shin','Leg','Foot'),('Foot','Foot','Toes')]:
        mapping[tgt+'.'+side]=(src+a,src+b if b else None)

# Store snapshots first so source sampling and target keyframes cannot influence each other.
action=bpy.data.actions.new('Authored run retarget');target.animation_data.action=action
shoe_objects=[o for o in bpy.data.objects if o.parent==target and o.type=='MESH' and
    (o.name.startswith('Sneaker upper') or o.name.startswith('Rubber sole'))]
def pose(name,points,rot):
    bone=target.data.bones[name];pb=target.pose.bones[name]
    src,child=mapping[name]
    across=points['LeftUpLeg']-points['RightUpLeg']
    shoulder=points['LeftArm']-points['RightArm']
    hip_yaw=max(-.10,min(.10,math.atan2(across.y,across.x)))
    chest_yaw=max(-.16,min(.16,math.atan2(shoulder.y,shoulder.x)))
    if bone.parent:
        position=(target.pose.bones[bone.parent.name].matrix @ bone.parent.matrix_local.inverted() @ bone.matrix_local).translation
    else:
        position=bone.head_local.copy()
        position.z+=(points['Hips'].z-samples[0][0]['Hips'].z)*scale
    if child:
        desired=(points[child]-points[src]).normalized()
        if name in ['Spine','Chest']:
            desired=(desired+Vector((0,-.18,0))).normalized()
        if name.startswith('Arm.') or name.startswith('Forearm.'):
            side='Right' if name.endswith('.L') else 'Left'
            upper=(points[side+'ForeArm']-points[side+'Arm']).normalized()
            angle=max(-.55,min(.65,math.atan2(-upper.y,-upper.z)))
            if name.startswith('Forearm.'):angle+=1.45
            lateral=-.035 if name.endswith('.L') else .035
            desired=Vector((lateral,-math.sin(angle),-math.cos(angle))).normalized()
            desired=Quaternion((0,0,1),chest_yaw) @ desired
        if name.startswith('Thigh.') or name.startswith('Shin.'):
            side='Right' if name.endswith('.L') else 'Left'
            upper=(points[side+'Leg']-points[side+'UpLeg']).normalized()
            lower=(points[side+'Foot']-points[side+'Leg']).normalized()
            thigh=math.atan2(-upper.y,-upper.z)
            shin=math.atan2(-lower.y,-lower.z)
            knee=max(0,min(2.0,(thigh-shin+math.pi)%(2*math.pi)-math.pi))
            angle=.78*thigh
            if name.startswith('Shin.'):angle-=.90*knee
            desired=Vector((desired.x*.55,-math.sin(angle),-math.cos(angle))).normalized()
        rest=(bone.tail_local-bone.head_local).normalized()
        q=rest.rotation_difference(desired) @ bone.matrix_local.to_quaternion()
        if name in ['Hips','Spine','Chest']:
            yaw=hip_yaw if name=='Hips' else (chest_yaw if name=='Chest' else .4*hip_yaw+.6*chest_yaw)
            q=Quaternion((0,0,1),yaw) @ q
    elif name.startswith('Hand.'):
        parent=bone.parent
        q=(target.pose.bones[parent.name].matrix @ parent.matrix_local.inverted() @ bone.matrix_local).to_quaternion()
    else:
        # Gaze stays forward while the chest turns beneath it.
        q=Quaternion((0,0,1),chest_yaw*.15) @ Quaternion((1,0,0),.03) @ bone.matrix_local.to_quaternion()
    pb.matrix=Matrix.Translation(position) @ q.to_matrix().to_4x4()
    bpy.context.view_layer.update()

for frame,(points,rot,low) in enumerate(samples,1):
    for pb in target.pose.bones:
        pb.rotation_mode='XYZ';pb.rotation_euler=(0,0,0);pb.location=(0,0,0)
    for name in mapping:pose(name,points,rot)
    deps=bpy.context.evaluated_depsgraph_get()
    foot_low=min((o.evaluated_get(deps).matrix_world @ v.co).z for o in shoe_objects
                 for v in o.evaluated_get(deps).data.vertices)
    shift=.029+(low-ground)*scale*.35-foot_low
    hp=target.pose.bones['Hips'];mat=hp.matrix.copy();mat.translation.z+=shift;hp.matrix=mat
    bpy.context.view_layer.update()
    for pb in target.pose.bones:
        pb.keyframe_insert('rotation_euler',frame=frame);pb.keyframe_insert('location',frame=frame)
action.name='Refined run';action.use_fake_user=True
for obj in imported:bpy.data.objects.remove(obj,do_unlink=True)
track=target.animation_data.nla_tracks.new();track.name=action.name
track.strips.new(action.name,1,action);track.mute=True
target.animation_data.action=None
bpy.ops.object.select_all(action='DESELECT')
for o in bpy.data.objects:
    if o==target or (o.type=='MESH' and o.parent==target):o.select_set(True)
bpy.context.view_layer.objects.active=target
bpy.ops.export_scene.gltf(filepath=str(OUT/'harbor-refined-run.glb'),export_format='GLB',
    use_selection=True,export_animations=True,export_animation_mode='NLA_TRACKS',export_skins=True)
for track in target.animation_data.nla_tracks:track.mute=True
target.animation_data.action=action
sc.render.fps=30;sc.frame_start=1;sc.frame_end=count
cam=sc.camera
def camera(loc):
    cam.location=loc;cam.rotation_euler=(Vector((0,0,.88))-cam.location).to_track_quat('-Z','Y').to_euler()
    cam.data.ortho_scale=2.12
sc.render.resolution_x=480;sc.render.resolution_y=640;sc.cycles.samples=10
sc.frame_set(6);camera((5,-.3,1.7))
sc.render.filepath=str(OUT/'refined-run-side.png');bpy.ops.render.render(write_still=True)
camera((3.7,-5,2.1))
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'harbor-refined-run.blend'))
frames=OUT/'refined-run-frames';frames.mkdir(exist_ok=True)
for frame in range(1,count+1):
    sc.frame_set(frame);sc.render.filepath=str(frames/('%03d.png'%frame));bpy.ops.render.render(write_still=True)
print('AUTHORED_RUN_DONE',flush=True)

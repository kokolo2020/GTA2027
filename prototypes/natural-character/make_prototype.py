"""Isolated original Harbor City character study. Does not modify game assets."""
import bpy, math, os
from pathlib import Path
from mathutils import Vector, Matrix

OUT = Path(__file__).resolve().parent
bpy.ops.wm.read_factory_settings(use_empty=True)

def material(name, color, rough=.7):
    m = bpy.data.materials.new(name); m.diffuse_color = (*color, 1)
    m.use_nodes = True
    bs = m.node_tree.nodes['Principled BSDF']
    bs.inputs['Base Color'].default_value = (*color, 1)
    bs.inputs['Roughness'].default_value = rough
    return m

skin = material('Warm skin', (.46,.245,.145), .78)
hair = material('Dark chestnut', (.035,.021,.017), .83)
shirt = material('Midnight teal technical fabric', (.018,.065,.085), .72)
tee = material('Graphite stretch fabric', (.025,.035,.044), .88)
pants = material('Graphite technical trousers', (.045,.057,.070), .85)
shoe = material('Graphite city sneakers', (.07,.09,.105), .75)
sole = material('Rubber soles', (.32,.33,.30), .95)
white = material('Soft eye white', (.70,.65,.55), .5)
iris = material('Brown iris', (.045,.027,.015), .4)
pupil = material('Pupils', (.006,.004,.003), .3)
lip = material('Natural lips', (.30,.12,.085), .85)
detail = material('Clothing seams', (.018,.12,.115), .9)
button = material('Matte buttons', (.18,.22,.20), .75)
panel = material('Silver blue woven panels', (.19,.30,.34), .75)
glow = material('Cyan light piping', (.045,.65,.80), .45)
gb=glow.node_tree.nodes['Principled BSDF']
gb.inputs['Emission Color'].default_value=(.02,.65,.9,1)
gb.inputs['Emission Strength'].default_value=1.4

def uv(name, loc, scale, mat, seg=20, rings=12):
    bpy.ops.mesh.primitive_uv_sphere_add(segments=seg, ring_count=rings, location=loc)
    o=bpy.context.object; o.name=name; o.scale=scale
    bpy.ops.object.transform_apply(location=False, rotation=False, scale=True)
    o.data.materials.append(mat)
    for p in o.data.polygons: p.use_smooth=True
    return o

def capsule(name, a, b, r, mat, width=1):
    a,b=Vector(a),Vector(b); d=b-a
    o=uv(name,(a+b)/2,(r,r*width,d.length/2+r*.6),mat)
    o.rotation_mode='QUATERNION'; o.rotation_quaternion=Vector((0,0,1)).rotation_difference(d.normalized())
    bpy.context.view_layer.objects.active=o
    bpy.ops.object.transform_apply(location=False,rotation=True,scale=True)
    return o

def rings_mesh(name, rings, mat, n=32):
    # Each ring: height, half width, front/back depth, centre toward front.
    verts=[]; faces=[]
    for z,rx,ry,cy in rings:
        for i in range(n):
            a=2*math.pi*i/n; verts.append((rx*math.cos(a),cy+ry*math.sin(a),z))
    for j in range(len(rings)-1):
        for i in range(n):
            k=j*n+i; l=j*n+(i+1)%n
            faces.append((k,l,l+n,k+n))
    faces.extend([tuple(reversed(range(n))), tuple((len(rings)-1)*n+i for i in range(n))])
    me=bpy.data.meshes.new(name); me.from_pydata(verts,[],faces); me.update()
    o=bpy.data.objects.new(name,me); bpy.context.collection.objects.link(o); o.data.materials.append(mat)
    for p in me.polygons:p.use_smooth=True
    return o

def limb(name, a, b, profile, mat):
    o=rings_mesh(name,[(t, r, r*.91, 0) for t,r in profile],mat,20)
    a,b=Vector(a),Vector(b);d=b-a
    for v in o.data.vertices:v.co.z *= d.length
    o.rotation_mode='QUATERNION';o.rotation_quaternion=Vector((0,0,1)).rotation_difference(d.normalized())
    o.location=a
    bpy.context.view_layer.objects.active=o
    bpy.ops.object.transform_apply(location=False,rotation=True,scale=True)
    return o

def merge(name, parts, voxel=.008, reduce=.45):
    bpy.ops.object.select_all(action='DESELECT')
    for o in parts:o.select_set(True)
    bpy.context.view_layer.objects.active=parts[0]; bpy.ops.object.join()
    o=bpy.context.object; o.name=name
    rem=o.modifiers.new('Continuous surface','REMESH'); rem.mode='VOXEL'; rem.voxel_size=voxel
    bpy.ops.object.modifier_apply(modifier=rem.name)
    sm=o.modifiers.new('Soft anatomical transitions','SMOOTH');sm.factor=1.0;sm.iterations=4
    bpy.ops.object.modifier_apply(modifier=sm.name)
    dec=o.modifiers.new('Mobile mesh budget','DECIMATE');dec.ratio=reduce
    bpy.ops.object.modifier_apply(modifier=dec.name)
    for p in o.data.polygons:p.use_smooth=True
    return o

def curve_mesh(name, points, radius, mat):
    cu=bpy.data.curves.new(name,'CURVE');cu.dimensions='3D';cu.bevel_depth=radius;cu.bevel_resolution=2
    sp=cu.splines.new('BEZIER');sp.bezier_points.add(len(points)-1)
    for bp,pt in zip(sp.bezier_points,points):bp.co=pt;bp.handle_left_type='AUTO';bp.handle_right_type='AUTO'
    o=bpy.data.objects.new(name,cu);bpy.context.collection.objects.link(o);o.data.materials.append(mat)
    bpy.context.view_layer.objects.active=o;o.select_set(True)
    bpy.ops.object.convert(target='MESH');o.select_set(False)
    return o

# Adult proportions, slightly softened for a friendly city-world style.
head= rings_mesh('Sculpted head',[(1.508,.030,.035,-.014),(1.525,.055,.056,-.014),
    (1.55,.071,.067,-.010),(1.59,.080,.074,-.002),(1.63,.083,.075,.001),
    (1.67,.081,.074,.003),(1.71,.070,.065,.004),(1.735,.046,.044,.004),
    (1.745,.009,.010,.004)],skin)
headparts=[head, capsule('Neck',(0,.008,1.43),(0,.007,1.55),.039,skin),
    uv('Nose bridge',(0,-.069,1.606),(.012,.018,.031),skin),
    uv('Nose tip',(0,-.085,1.589),(.019,.019,.013),skin)]
for s in [-1,1]:
    headparts.append(uv('Ear',(s*.083,.004,1.611),(.016,.013,.029),skin))
head=merge('Face and neck',headparts,.0035,.38)
rigid=[(head,'Head')]
for s in [-1,1]:
    # Small inset eyes, with lids wrapping the whites instead of protruding eyeballs.
    x=s*.033
    rigid.append((uv('Eye white',(x,-.0668,1.628),(.017,.006,.0085),white),'Head'))
    rigid.append((uv('Iris',(x,-.0723,1.628),(.0061,.002,.0062),iris),'Head'))
    rigid.append((uv('Pupil',(x,-.074,1.628),(.0028,.001,.0033),pupil),'Head'))
    rigid.append((curve_mesh('Upper eyelid',[(x-.017,-.066,1.628),(x,-.071,1.636),(x+.017,-.066,1.628)],.0028,skin),'Head'))
    rigid.append((curve_mesh('Lower eyelid',[(x-.016,-.066,1.627),(x,-.070,1.621),(x+.016,-.066,1.627)],.0016,skin),'Head'))
    rigid.append((curve_mesh('Eyebrow',[(x-.017,-.065,1.648),(x,-.069,1.652),(x+.016,-.064,1.648)],.003,hair),'Head'))
rigid.append((curve_mesh('Relaxed mouth',[(-.024,-.073,1.557),(-.010,-.077,1.554),(0,-.078,1.555),(.012,-.077,1.554),(.024,-.073,1.557)],.0028,lip),'Head'))
rigid.append((uv('Lower lip',(0,-.075,1.55),(.016,.003,.0035),lip),'Head'))

# A fitted, asymmetric hair silhouette, with broad locks rather than balls.
hairparts=[uv('Hair cap',(0,.010,1.707),(.085,.077,.050),hair)]
for s in [-1,1]:
    hairparts.append(uv('Side hair',(s*.076,.008,1.665),(.012,.061,.044),hair))
for i in range(5):
    o=uv('Swept lock',(-.052+i*.024,-.034+i*.003,1.726),(.031,.052,.024),hair)
    o.rotation_euler.y=-.25
    hairparts.append(o)
hairmesh=merge('Side swept hair',hairparts,.0038,.4);rigid.append((hairmesh,'Head'))

torso=rings_mesh('Shirt torso',[(.91,.145,.092,0),(.95,.151,.097,0),(1.04,.137,.088,0),
    (1.14,.143,.093,0),(1.27,.17,.105,0),(1.37,.19,.095,.005),
    (1.42,.17,.078,.006),(1.455,.058,.047,.008)],shirt)
shirtparts=[torso]
skinparts=[]
for s in [-1,1]:
    sleeve_rows=[(1.237,.230,.004,.048,.047),(1.29,.224,.001,.051,.049),
        (1.34,.213,.000,.056,.052),(1.385,.190,.000,.058,.058),
        (1.407,.155,.000,.060,.060),(1.415,.110,.000,.060,.060)]
    sleeve=rings_mesh('Fitted technical sleeve',[(z,rx,ry,y) for z,x,y,rx,ry in sleeve_rows],shirt,24)
    for index,(z,x,y,rx,ry) in enumerate(sleeve_rows):
        for v in list(sleeve.data.vertices)[index*24:(index+1)*24]:v.co.x+=s*x
    shirtparts.append(sleeve)
    # A continuous anatomical loft: triceps -> elbow -> fuller upper forearm -> narrow wrist.
    # Elbow is slightly behind the wrist; palms face inward toward the thighs.
    rows=[(1.335,.214,.000,.042,.040),(1.29,.224,.001,.044,.041),
        (1.235,.231,.004,.039,.036),(1.185,.236,.008,.033,.030),
        (1.15,.239,.008,.031,.029),(1.12,.242,.002,.033,.030),
        (1.08,.245,-.010,.035,.029),(1.03,.248,-.022,.031,.025),
        (.98,.252,-.035,.025,.020),(.94,.254,-.043,.021,.017),
        (.92,.254,-.046,.021,.017)]
    rows=list(reversed(rows))
    arm=rings_mesh('Continuous arm',[(z,rx,ry,y) for z,x,y,rx,ry in rows],skin,24)
    for index,(z,x,y,rx,ry) in enumerate(rows):
        for v in list(arm.data.vertices)[index*24:(index+1)*24]:v.co.x+=s*x
    skinparts.extend([arm,uv('Relaxed palm',(s*.254,-.050,.893),(.016,.031,.044),skin)])
    for i in range(4):
        y=-.071+i*.014;end=.825+abs(i-1.2)*.009
        skinparts.append(capsule('Finger',(s*.254,y,.872),(s*.249,y-.002,end+.013),.0067,skin))
        skinparts.append(capsule('Relaxed fingertip',(s*.249,y-.002,end+.013),(s*.243,y-.006,end),.0063,skin))
    skinparts.append(capsule('Thumb',(s*.251,-.078,.908),(s*.242,-.091,.874),.009,skin))
top=merge('Neo Harbor tech jacket',shirtparts,.006,.35)
arms=merge('Arms and relaxed hands',skinparts,.004,.36)
collar=rings_mesh('Standing technical collar',[(1.428,.061,.050,.008),(1.451,.058,.049,.008),(1.477,.051,.044,.008)],shirt)
rigid.append((collar,'Chest'))
for s in [-1,1]:
    rigid.append((curve_mesh('Shoulder panel',[(s*.040,-.054,1.435),(s*.11,-.074,1.411),(s*.17,-.063,1.37)],.012,panel),'Chest'))
    rigid.append((curve_mesh('Cyan chest chevron',[(s*.025,-.104,1.32),(s*.082,-.104,1.35),(s*.14,-.083,1.38)],.0028,glow),'Chest'))
    rigid.append((curve_mesh('Jacket tailored panel',[(s*.115,-.078,1.18),(s*.098,-.078,1.08),(s*.106,-.084,.97)],.004,panel),'Spine'))
    rigid.append((curve_mesh('Pocket zip',[(s*.065,-.090,1.08),(s*.11,-.078,1.14)],.002,button),'Spine'))
rigid.append((curve_mesh('Sealed central zip',[(0,-.043,1.475),(0,-.09,1.40),(0,-.109,1.30),(0,-.097,1.09),(0,-.099,.94)],.003,button),'Chest'))

pelvis=rings_mesh('Trouser hips',[(.835,.113,.076,0),(.88,.149,.095,0),(.95,.145,.09,0)],pants)
legparts=[pelvis]
for s in [-1,1]:
    legparts.extend([limb('Thigh',(s*.085,0,.91),(s*.098,.005,.49),[(0,.074),(.2,.078),(.55,.070),(1,.052)],pants),
        limb('Calf',(s*.098,.005,.54),(s*.103,.004,.145),[(0,.053),(.23,.055),(.55,.049),(1,.039)],pants)])
trousers=merge('Soft tailored trousers',legparts,.006,.35)
for s in [-1,1]:
    foot='Foot.L' if s<0 else 'Foot.R'
    rigid.append((uv('Sneaker upper',(s*.103,-.035,.095),(.061,.128,.052),shoe),foot))
    rigid.append((uv('Rubber sole',(s*.103,-.036,.052),(.064,.133,.023),sole),foot))
    rigid.append((curve_mesh('Sneaker light strip',[(s*.103-.053,-.08,.077),(s*.103,-.151,.074),(s*.103+.053,-.08,.077)],.0025,glow),foot))
    for k in range(3):
        rigid.append((curve_mesh('Laces',[(s*.103-.027,-.055-k*.018,.139-k*.004),(s*.103+.027,-.055-k*.018,.139-k*.004)],.0023,tee),foot))

# A genuine skinned skeleton, with a spine, elbows, knees, ankles and independent feet.
for o in list(bpy.data.objects):
    if o.type=='MESH' and len(o.data.polygons)>2000:
        bpy.context.view_layer.objects.active=o
        dec=o.modifiers.new('Prototype topology reduction','DECIMATE');dec.ratio=.32
        bpy.ops.object.modifier_apply(modifier=dec.name)
bpy.ops.object.select_all(action='DESELECT')
ad=bpy.data.armatures.new('Harbor natural rig');rig=bpy.data.objects.new('Harbor natural rig',ad)
bpy.context.collection.objects.link(rig);bpy.context.view_layer.objects.active=rig;rig.select_set(True)
bpy.ops.object.mode_set(mode='EDIT')
segments={}
def bone(name,a,b,parent=None):
    bo=ad.edit_bones.new(name);bo.head=a;bo.tail=b
    if parent:bo.parent=ad.edit_bones[parent]
    segments[name]=(Vector(a),Vector(b))
bone('Hips',(0,0,.87),(0,0,1.02))
bone('Spine',(0,0,1.02),(0,0,1.23),'Hips')
bone('Chest',(0,0,1.23),(0,0,1.43),'Spine')
bone('Head',(0,0,1.43),(0,0,1.72),'Chest')
for s,side in [(-1,'L'),(1,'R')]:
    bone('Arm.'+side,(s*.20,0,1.405),(s*.239,.008,1.15),'Chest')
    bone('Forearm.'+side,(s*.239,.008,1.15),(s*.254,-.043,.94),'Arm.'+side)
    bone('Hand.'+side,(s*.254,-.043,.94),(s*.249,-.052,.835),'Forearm.'+side)
    bone('Thigh.'+side,(s*.085,0,.87),(s*.098,.005,.51),'Hips')
    bone('Shin.'+side,(s*.098,.005,.51),(s*.103,.004,.15),'Thigh.'+side)
    bone('Foot.'+side,(s*.103,.004,.15),(s*.103,-.14,.07),'Shin.'+side)
bpy.ops.object.mode_set(mode='OBJECT')

def bind(o, fixed=None, allowed=None):
    o.parent=rig
    mod=o.modifiers.new('Skin deformation','ARMATURE');mod.object=rig
    if fixed:
        vg=o.vertex_groups.new(name=fixed);vg.add(list(range(len(o.data.vertices))),1,'REPLACE');return
    groups={n:o.vertex_groups.new(name=n) for n in allowed}
    for v in o.data.vertices:
        co=o.matrix_world@v.co;ds=[]
        if o==arms:
            side='L' if co.x<0 else 'R'
            def smooth(t):
                t=max(0,min(1,t));return t*t*(3-2*t)
            upper=smooth((co.z-1.10)/.10)
            hand=1-smooth((co.z-.915)/.07)
            for n,w in [('Arm.'+side,upper),('Forearm.'+side,(1-upper)*(1-hand)),('Hand.'+side,(1-upper)*hand)]:
                if w>0:groups[n].add([v.index],w,'REPLACE')
            continue
        for n in allowed:
            a,b=segments[n];d=b-a;t=max(0,min(1,(co-a).dot(d)/d.length_squared))
            dist=(co-(a+t*d)).length
            ds.append((dist,n))
        ds.sort();near=ds[:3]
        ws=[1/(d+.018)**6 for d,n in near];total=sum(ws)
        for (d,n),w in zip(near,ws):
            if w/total>.005:groups[n].add([v.index],w/total,'REPLACE')
for o,n in rigid:bind(o,fixed=n)
bind(top,allowed=['Hips','Spine','Chest','Arm.L','Arm.R'])
bind(arms,allowed=['Arm.L','Forearm.L','Hand.L','Arm.R','Forearm.R','Hand.R'])
bind(trousers,allowed=['Hips','Thigh.L','Shin.L','Thigh.R','Shin.R'])

# Subtle idle and a planted-foot walk study. These are prototypes, not production clips.
def animate(name, count, walk=False):
    act=bpy.data.actions.new(name);rig.animation_data_create();rig.animation_data.action=act
    for f in range(1,count+2):
        p=(f-1)/count;ang=p*math.tau
        for pb in rig.pose.bones:pb.rotation_mode='XYZ';pb.rotation_euler=(0,0,0);pb.location=(0,0,0)
        if walk:
            rig.pose.bones['Hips'].location.y=-.027-.008*math.cos(ang*2)
            rig.pose.bones['Hips'].rotation_euler.y=.035*math.sin(ang)
            rig.pose.bones['Chest'].rotation_euler.y=-.065*math.sin(ang)
            for side,offset in [('L',0),('R',math.pi)]:
                ph=ang+offset
                rig.pose.bones['Arm.'+side].rotation_euler.x=-.19*math.cos(ph)
                rig.pose.bones['Forearm.'+side].rotation_euler.x=-.07-.12*max(0,math.cos(ph-.35))
                rig.pose.bones['Hand.'+side].rotation_euler.x=.035*math.sin(ph-.3)
            bpy.context.view_layer.update()
            for side,offset in [('L',0),('R',math.pi)]:
                ph=ang+offset;s=-1 if side=='L' else 1
                hip=rig.pose.bones['Hips'].matrix @ Vector((s*.085,0,0))
                # Use the rest hip position transformed by the animated pelvis.
                hip=(rig.pose.bones['Hips'].matrix @ ad.bones['Hips'].matrix_local.inverted()) @ segments['Thigh.'+side][0]
                ankle=Vector((s*.103,.17*math.cos(ph),.15+.065*max(0,math.sin(ph))**2))
                upper=(segments['Thigh.'+side][1]-segments['Thigh.'+side][0]).length
                lower=(segments['Shin.'+side][1]-segments['Shin.'+side][0]).length
                delta=ankle-hip;length=min(delta.length,upper+lower-.001);direction=delta.normalized()
                along=(upper*upper-lower*lower+length*length)/(2*length)
                bend=Vector((0,-1,0));bend=(bend-direction*bend.dot(direction)).normalized()
                knee=hip+direction*along+bend*math.sqrt(max(0,upper*upper-along*along))
                for name,position,end in [('Thigh.'+side,hip,knee),('Shin.'+side,knee,ankle),
                        ('Foot.'+side,ankle,ankle+Vector((0,-.144,-.08)))]:
                    rest=ad.bones[name].matrix_local.to_quaternion()
                    rd=segments[name][1]-segments[name][0]
                    rotation=rd.normalized().rotation_difference((end-position).normalized()) @ rest
                    rig.pose.bones[name].matrix=Matrix.Translation(position) @ rotation.to_matrix().to_4x4()
                    bpy.context.view_layer.update()
        else:
            rig.pose.bones['Chest'].rotation_euler.x=.008*math.sin(ang)
            rig.pose.bones['Hips'].rotation_euler.z=.012*math.sin(ang)
            rig.pose.bones['Head'].rotation_euler.y=.045*math.sin(ang)
            for side in ['L','R']:
                rig.pose.bones['Forearm.'+side].rotation_euler.x=-.025-.012*math.sin(ang)
        for pb in rig.pose.bones:
            pb.keyframe_insert('rotation_euler',frame=f);pb.keyframe_insert('location',frame=f)
    act.use_fake_user=True
    return act
idle=animate('Relaxed idle',72);walk=animate('Walk study',32,True)
rig.animation_data.action=idle
for action in [idle,walk]:
    track=rig.animation_data.nla_tracks.new();track.name=action.name
    strip=track.strips.new(action.name,1,action);track.mute=True
rig.animation_data.action=None
for pb in rig.pose.bones:pb.rotation_euler=(0,0,0);pb.location=(0,0,0)

# Export only character and rig; studio never enters the asset.
bpy.ops.object.select_all(action='DESELECT')
for o in [rig]+[o for o in bpy.data.objects if o.type=='MESH']:o.select_set(True)
bpy.ops.export_scene.gltf(filepath=str(OUT/'harbor-natural-01.glb'),export_format='GLB',use_selection=True,
    export_animations=True,export_animation_mode='NLA_TRACKS',export_skins=True)
for track in rig.animation_data.nla_tracks:track.mute=True
rig.animation_data.action=idle
bpy.context.scene.frame_set(1)

floor=material('Studio floor',(.10,.13,.15),.9)
bpy.ops.mesh.primitive_plane_add(size=200,location=(0,0,.029));bpy.context.object.data.materials.append(floor)
world=bpy.data.worlds.new('Studio');bpy.context.scene.world=world;world.use_nodes=True
world.node_tree.nodes['Background'].inputs[0].default_value=(.20,.25,.29,1)
world.node_tree.nodes['Background'].inputs[1].default_value=.4
def area(name,loc,power,size):
    da=bpy.data.lights.new(name,'AREA');da.energy=power;da.shape='DISK';da.size=size
    o=bpy.data.objects.new(name,da);bpy.context.collection.objects.link(o);o.location=loc
    o.rotation_euler=(Vector((0,0,1))-o.location).to_track_quat('-Z','Y').to_euler()
area('Large soft key',(-3,-4,5),450,4)
area('Soft fill',(3,-2,3),230,3)
area('Rim',(1,3,4),550,3)
camdata=bpy.data.cameras.new('Camera');cam=bpy.data.objects.new('Camera',camdata)
bpy.context.collection.objects.link(cam);bpy.context.scene.camera=cam
def camera(loc,target,scale):
    cam.location=loc;cam.rotation_euler=(Vector(target)-cam.location).to_track_quat('-Z','Y').to_euler()
    camdata.type='ORTHO';camdata.ortho_scale=scale
sc=bpy.context.scene;sc.render.engine='CYCLES';sc.cycles.samples=24
sc.cycles.use_denoising=True;sc.render.resolution_percentage=100
sc.view_settings.view_transform='AgX';sc.render.image_settings.file_format='PNG'
sc.render.resolution_x=900;sc.render.resolution_y=1100
camera((2.6,-5,2.3),(0,0,.91),2.06)
sc.render.filepath=str(OUT/'full-body.png');bpy.ops.render.render(write_still=True)
camera((1.5,-5,1.85),(0,-.005,1.59),.49)
sc.render.resolution_x=900;sc.render.resolution_y=900
sc.render.filepath=str(OUT/'face.png');bpy.ops.render.render(write_still=True)
bpy.ops.wm.save_as_mainfile(filepath=str(OUT/'harbor-natural-01.blend'))
sc.render.resolution_x=480;sc.render.resolution_y=640
sc.cycles.samples=12
camera((2.7,-5,2.1),(0,0,.90),2.07)
rig.animation_data.action=walk
frames=OUT/'frames';frames.mkdir(exist_ok=True)
for previous in frames.glob('*.png'):previous.unlink()
for index,f in enumerate(range(1,33,2),1):
    sc.frame_set(f);sc.render.filepath=str(frames/('%03d.png'%index));bpy.ops.render.render(write_still=True)
print('NATURAL_CHARACTER_DONE',OUT,flush=True)

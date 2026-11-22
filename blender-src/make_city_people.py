"""Original Harbor City adult male/female variants; lower-cost crowd versions share the rig.
Run with Blender 4.2 --background --factory-startup --python blender-src/make_city_people.py.
The existing 0.53 trial asset is the source; no unrelated character-redesign files are touched.
"""
import bpy, math
from pathlib import Path
from mathutils import Vector

ROOT=Path(__file__).resolve().parents[1]
OUT=ROOT/'game/models'
SHOTS=ROOT/'prototypes/natural-character/city-preview';SHOTS.mkdir(exist_ok=True)

def bell(z,center,width):return math.exp(-((z-center)/width)**2)
def shape(point,female,name):
    x,y,z=point
    if z<1.46:
        if female:
            width=1+.17*bell(z,.87,.15)-.12*bell(z,1.085,.12)-.025*bell(z,1.38,.10)
            x*=width
            # Rounded hips and a fuller chest under a modest, high-collar jacket.
            if y<0:
                y-=.024*bell(z,1.30,.085)*math.exp(-((abs(x)-.075)/.075)**2)
            else:y+=.013*bell(z,.88,.13)
        else:
            width=1+.17*bell(z,1.38,.13)+.055*bell(z,1.25,.13)-.025*bell(z,1.06,.11)
            x*=width
            y*=1+.10*bell(z,1.30,.16)+.05*bell(z,.70,.18)
            if 'Arms' in name:
                side=-1 if x<0 else 1
                center=side*(.239+.006*max(0,1.15-z))
                x=center+(x-center)*(1+.12*bell(z,1.25,.10))
                y*=1+.12*bell(z,1.25,.10)
    elif female and ('Face' in name or 'head' in name.lower()):
        x*=1-.11*bell(z,1.55,.075)
        y*=1-.04*bell(z,1.55,.07)
    return Vector((x,y,z))

def sphere(name,loc,scale,mat):
    bpy.ops.mesh.primitive_uv_sphere_add(segments=16,ring_count=10,location=loc)
    obj=bpy.context.object;obj.name=name;obj.scale=scale
    bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
    obj.data.materials.append(mat)
    for p in obj.data.polygons:p.use_smooth=True
    return obj

def material(name,color,rough=.75):
    m=bpy.data.materials.new(name);m.use_nodes=True;m.diffuse_color=(*color,1)
    bs=m.node_tree.nodes['Principled BSDF'];bs.inputs['Base Color'].default_value=(*color,1)
    bs.inputs['Roughness'].default_value=rough
    return m

def make(female,crowd):
    bpy.ops.wm.read_factory_settings(use_empty=True)
    bpy.context.scene.render.fps=30
    bpy.ops.import_scene.gltf(filepath=str(OUT/'natural_player_trial.glb'))
    rig=next(o for o in bpy.data.objects if o.type=='ARMATURE')
    for tr in rig.animation_data.nla_tracks:
        tr.mute=True
        for strip in tr.strips:
            base=strip.action.name.split('_')[0]
            if base in ['Idle','Walk','Run','Sit','Wave','Talk','Cheer']:
                strip.action.name=base;strip.name=base;tr.name=base
    rig.animation_data.action=None
    for pb in rig.pose.bones:pb.matrix_basis.identity()
    palette={
        'Shirt':material('Shirt',(.20,.035,.19) if female else (.018,.065,.085)),
        'Pants':material('Pants',(.045,.057,.070)),
        'Skin':material('Skin',(.46,.245,.145)),
        'Hair':material('Hair',(.035,.021,.017)),
        'Shoes':material('Shoes',(.07,.09,.105)),
        'Eye':material('Eye',(.025,.016,.009),.4),
        'Light':material('Light',(.70,.65,.55),.5),
        'Trim':material('Trim',(.19,.30,.34)),
        'Glow':material('Glow',(.045,.65,.80),.45),
        'Lip':material('Lip',(.30,.12,.085),.85),
    }
    glow=palette['Glow'].node_tree.nodes['Principled BSDF']
    glow.inputs['Emission Color'].default_value=(.02,.65,.9,1);glow.inputs['Emission Strength'].default_value=1.4
    meshes=[o for o in bpy.data.objects if o.type=='MESH']
    for obj in list(meshes):
        if female and (('hair' in obj.name.lower() or 'Eyebrow' in obj.name) or
                all(slot.material and 'chestnut' in slot.material.name.lower() for slot in obj.material_slots)):
            bpy.data.objects.remove(obj,do_unlink=True);continue
        for slot in obj.material_slots:
            old=slot.material.name if slot.material else ''
            key='Trim'
            if 'skin' in old.lower():key='Skin'
            elif 'chestnut' in old.lower():key='Hair'
            elif 'technical fabric' in old or 'cotton' in old.lower() and 'ivory' not in old.lower():key='Shirt'
            elif 'trousers' in old:key='Pants'
            elif 'sneakers' in old:key='Shoes'
            elif 'eye white' in old:key='Light'
            elif 'iris' in old.lower() or 'Pupils' in old:key='Eye'
            elif 'lips' in old.lower():key='Lip'
            elif 'piping' in old or 'Cyan' in old:key='Glow'
            slot.material=palette[key]
        inverse=obj.matrix_world.inverted()
        for v in obj.data.vertices:v.co=inverse @ shape(obj.matrix_world @ v.co,female,obj.name)
        # Female fitted sleeves are fabric, with wrists and hands left uncovered.
        if female and 'Arms' in obj.name:
            idx=len(obj.data.materials);obj.data.materials.append(palette['Shirt'])
            for poly in obj.data.polygons:
                z=sum((obj.matrix_world @ obj.data.vertices[i].co).z for i in poly.vertices)/len(poly.vertices)
                if z>.947:poly.material_index=idx
        if crowd:
            # Preserve eye/face detail before combining all surfaces into one skinned mesh.
            triangles=sum(len(p.vertices)-2 for p in obj.data.polygons)
            budget=1400 if 'head' in obj.name.lower() else (450 if any(m and m.name=='Hair' for m in obj.data.materials) else (650 if 'shirt' in obj.name.lower() else (650 if 'trouser' in obj.name.lower() else (600 if 'arm' in obj.name.lower() else 90))))
            if triangles>budget:
                bpy.context.view_layer.objects.active=obj
                mod=obj.modifiers.new('Crowd budget','DECIMATE');mod.ratio=budget/triangles
                bpy.ops.object.modifier_apply(modifier=mod.name)
    if female:
        pieces=[sphere('Ponytail cap',(0,.010,1.710),(.085,.078,.052),palette['Hair']),
                sphere('Ponytail tie',(0,.063,1.724),(.035,.032,.028),palette['Hair']),
                sphere('Ponytail upper',(.035,.099,1.684),(.044,.034,.075),palette['Hair']),
                sphere('Ponytail lower',(.055,.117,1.574),(.035,.027,.074),palette['Hair']),
                sphere('Side fringe',(-.025,-.067,1.695),(.060,.025,.024),palette['Hair'])]
        for s in [-1,1]:
            pieces.append(sphere('Face frame',(s*.077,-.010,1.666),(.013,.048,.041),palette['Hair']))
            pieces.append(sphere('Eyebrow',(s*.033,-.067,1.651),(.018,.004,.003),palette['Hair']))
        brows=[o for o in pieces if o.name.startswith('Eyebrow')]
        hair_pieces=[o for o in pieces if o not in brows]
        bpy.ops.object.select_all(action='DESELECT')
        for obj in hair_pieces:obj.select_set(True)
        bpy.context.view_layer.objects.active=hair_pieces[0];bpy.ops.object.join()
        hair_mesh=bpy.context.object;hair_mesh.name='Sculpted ponytail'
        rem=hair_mesh.modifiers.new('Continuous hair silhouette','REMESH');rem.mode='VOXEL';rem.voxel_size=.0035
        bpy.ops.object.modifier_apply(modifier=rem.name)
        sm=hair_mesh.modifiers.new('Soft hair contours','SMOOTH');sm.factor=.8;sm.iterations=3
        bpy.ops.object.modifier_apply(modifier=sm.name)
        dec=hair_mesh.modifiers.new('Hair budget','DECIMATE');dec.ratio=.12 if crowd else .3
        bpy.ops.object.modifier_apply(modifier=dec.name)
        for poly in hair_mesh.data.polygons:poly.use_smooth=True
        pieces=[hair_mesh]+brows
        for obj in pieces:
            bpy.context.view_layer.objects.active=obj
            bpy.ops.object.transform_apply(location=True,rotation=True,scale=True)
            obj.parent=rig;group=obj.vertex_groups.new(name='Head')
            group.add(list(range(len(obj.data.vertices))),1,'REPLACE')
            mod=obj.modifiers.new('Hair skin','ARMATURE');mod.object=rig
        for s,side in [(-1,'L'),(1,'R')]:
            bpy.ops.mesh.primitive_cylinder_add(vertices=16,radius=.024,depth=.035,location=(s*.254,-.043,.945))
            cuff=bpy.context.object;cuff.name='Fitted sleeve cuff';cuff.scale.y=.85
            bpy.ops.object.transform_apply(location=True,rotation=True,scale=True)
            for vertex in cuff.data.vertices:vertex.co=shape(vertex.co,True,cuff.name)
            cuff.data.materials.append(palette['Shirt']);cuff.parent=rig
            group=cuff.vertex_groups.new(name='Hand.'+side);group.add(list(range(len(cuff.data.vertices))),1,'REPLACE')
            mod=cuff.modifiers.new('Cuff skin','ARMATURE');mod.object=rig
    bpy.ops.object.select_all(action='DESELECT')
    meshes=[o for o in bpy.data.objects if o.type=='MESH']
    for obj in meshes:obj.select_set(True)
    bpy.context.view_layer.objects.active=meshes[0];bpy.ops.object.join()
    body=bpy.context.object;body.name='NaturalFemale' if female else 'NaturalMale'
    # Combining meshes keeps one rig and shared material surfaces instead of dozens of draw nodes.
    for mod in list(body.modifiers):
        if mod.type=='ARMATURE':body.modifiers.remove(mod)
    arm=body.modifiers.new('Shared skeleton','ARMATURE');arm.object=rig
    body.parent=rig
    if crowd:
        tris=sum(len(p.vertices)-2 for p in body.data.polygons)
        if tris>6000:
            dec=body.modifiers.new('Final crowd budget','DECIMATE');dec.ratio=6000/tris
            bpy.context.view_layer.objects.active=body;bpy.ops.object.modifier_apply(modifier=dec.name)
    if not crowd:
        tris=sum(len(p.vertices)-2 for p in body.data.polygons)
        if tris>18000:
            dec=body.modifiers.new('Hero budget','DECIMATE');dec.ratio=18000/tris
            bpy.context.view_layer.objects.active=body;bpy.ops.object.modifier_apply(modifier=dec.name)
    if crowd:
        # One skinned draw surface instead of ten. Runtime shader recolours these material IDs.
        identifiers=['Shirt','Pants','Skin','Hair','Shoes','Eye','Light','Trim','Glow','Lip']
        attribute=body.data.color_attributes.new(name='MaterialID',type='FLOAT_COLOR',domain='CORNER')
        body.data.color_attributes.active_color=attribute
        for poly in body.data.polygons:
            old=body.data.materials[poly.material_index]
            identifier=identifiers.index(old.name) if old.name in identifiers else 7
            for loop in poly.loop_indices:attribute.data[loop].color=(identifier/15.0,0,0,1)
            poly.material_index=0
        body.data.materials.clear()
        id_material=material('CrowdID',(1,1,1))
        vertex=id_material.node_tree.nodes.new('ShaderNodeVertexColor');vertex.layer_name='MaterialID'
        id_material.node_tree.links.new(vertex.outputs['Color'],id_material.node_tree.nodes['Principled BSDF'].inputs['Base Color'])
        body.data.materials.append(id_material)
    bpy.ops.object.select_all(action='DESELECT');body.select_set(True);rig.select_set(True)
    path=OUT/('natural_%s%s.glb'%('female' if female else 'male','_crowd' if crowd else ''))
    bpy.ops.export_scene.gltf(filepath=str(path),export_format='GLB',use_selection=True,
        export_animations=True,export_animation_mode='NLA_TRACKS',export_skins=True)
    print('CITY_PEOPLE',path.name,sum(len(p.vertices)-2 for p in body.data.polygons),'triangles',flush=True)
    if not crowd:render(rig,female)

def render(rig,female):
    sc=bpy.context.scene
    for tr in rig.animation_data.nla_tracks:tr.mute=True
    rig.animation_data.action=next(a for a in bpy.data.actions if a.name=='Idle')
    sc.frame_set(1)
    floor=material('Studio floor',(.10,.13,.15),.9)
    bpy.ops.mesh.primitive_plane_add(size=200,location=(0,0,.029));bpy.context.object.data.materials.append(floor)
    world=bpy.data.worlds.new('Studio');sc.world=world;world.use_nodes=True
    world.node_tree.nodes['Background'].inputs[0].default_value=(.20,.25,.29,1)
    world.node_tree.nodes['Background'].inputs[1].default_value=.4
    for name,loc,power,size in [('Key',(-3,-4,5),450,4),('Fill',(3,-2,3),230,3),('Rim',(1,3,4),550,3)]:
        data=bpy.data.lights.new(name,'AREA');data.energy=power;data.shape='DISK';data.size=size
        obj=bpy.data.objects.new(name,data);sc.collection.objects.link(obj);obj.location=loc
        obj.rotation_euler=(Vector((0,0,1))-obj.location).to_track_quat('-Z','Y').to_euler()
    data=bpy.data.cameras.new('Camera');cam=bpy.data.objects.new('Camera',data);sc.collection.objects.link(cam)
    cam.location=(2.6,-5,2.2);cam.rotation_euler=(Vector((0,0,.91))-cam.location).to_track_quat('-Z','Y').to_euler()
    data.type='ORTHO';data.ortho_scale=2.05;sc.camera=cam
    sc.render.engine='CYCLES';sc.cycles.samples=20;sc.cycles.use_denoising=True
    sc.view_settings.view_transform='AgX';sc.render.resolution_x=720;sc.render.resolution_y=960;sc.render.resolution_percentage=100
    sc.render.filepath=str(SHOTS/('female.png' if female else 'male.png'))
    bpy.ops.render.render(write_still=True)

for female,crowd in [(False,False),(True,False),(False,True),(True,True)]:make(female,crowd)
print('CITY_PEOPLE_DONE',flush=True)

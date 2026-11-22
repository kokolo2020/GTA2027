"""Original, anatomically shaped Phase 2 wildlife. Blender Z-up, +Y forward.
Connected remeshed anatomy, shaped jointed limbs, vertex-colour coats, no external assets.
Loaded by make_animals.py; keeps existing export names and save identities.
"""
import bpy, math, os, json
from pathlib import Path
from mathutils import Vector, noise

def rgb(h):
    values=[int(h[i:i+2],16)/255 for i in (0,2,4)]
    return tuple(v/12.92 if v<.04045 else ((v+.055)/1.055)**2.4 for v in values)

def build(kind,out):
    bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
    groups={}; palette={}
    fur=bpy.data.materials.new('World_'+kind);fur.use_nodes=True
    bs=fur.node_tree.nodes.get('Principled BSDF');bs.inputs['Base Color'].default_value=(1,1,1,1);bs.inputs['Roughness'].default_value=.92;bs.inputs['Specular IOR Level'].default_value=.15
    vc=fur.node_tree.nodes.new('ShaderNodeVertexColor');vc.layer_name='Coat';fur.node_tree.links.new(vc.outputs['Color'],bs.inputs['Base Color'])
    wet=bpy.data.materials.new('Wildlife_eyes_nose');wet.use_nodes=True
    ws=wet.node_tree.nodes.get('Principled BSDF');ws.inputs['Base Color'].default_value=(*rgb('141611'),1);ws.inputs['Roughness'].default_value=.40
    colours={'wolf':'777b73','brownbear':'664b35','bison':'6b4b31','hedgehog':'8e7760','wombat':'817b6b','koala':'89918b','kangaroo':'a88462','platypus':'5b4938','europeanowl':'78664e','stork':'e8e8da','baldeagle':'4b3b2d','emu':'615b4b','cockatoo':'e4e5db'}
    def select(items):
        bpy.ops.object.select_all(action='DESELECT')
        for ob in items:ob.select_set(True)
        bpy.context.view_layer.objects.active=items[0]
    def add(ob,group='core',colour=None,gloss=False):
        ob.data.materials.append(wet if gloss else fur)
        groups.setdefault(group,[]).append(ob)
        palette[ob.name]=colour or colours[kind]
        return ob
    def ell(p,r,group='core',colour=None,rot=None,gloss=False):
        bpy.ops.mesh.primitive_uv_sphere_add(segments=16,ring_count=10,radius=1,location=p)
        ob=bpy.context.object;ob.scale=r
        if rot:ob.rotation_euler=rot
        bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
        return add(ob,group,colour,gloss)
    def tube(points,radii,group='core',colour=None,n=10):
        pts=[Vector(p) for p in points];verts=[];faces=[];previous_u=None
        for i,p in enumerate(pts):
            t=(pts[min(i+1,len(pts)-1)]-pts[max(0,i-1)]).normalized()
            # Parallel-transport the cross-section: hocks must not flip the skin
            # when a limb changes forward/backward direction at a joint.
            seed=previous_u if previous_u is not None else Vector((1,0,0))
            u=seed-t*seed.dot(t)
            if u.length<.01:
                seed=Vector((0,1,0));u=seed-t*seed.dot(t)
            u.normalize();previous_u=u.copy();v=t.cross(u).normalized();r=radii[i];r=(r,r) if isinstance(r,(int,float)) else r
            for j in range(n):
                a=j*2*math.pi/n;verts.append(p+u*math.cos(a)*r[0]+v*math.sin(a)*r[1])
        for i in range(len(pts)-1):
            for j in range(n):faces.append((i*n+j,i*n+(j+1)%n,(i+1)*n+(j+1)%n,(i+1)*n+j))
        faces.extend([tuple(reversed(range(n))),tuple((len(pts)-1)*n+j for j in range(n))])
        mesh=bpy.data.meshes.new('Anatomy');mesh.from_pydata(verts,[],faces);mesh.update()
        ob=bpy.data.objects.new('Anatomy',mesh);bpy.context.collection.objects.link(ob)
        return add(ob,group,colour)
    def ear(side,y,z,w=.1,h=.22,colour=None):
        x=side*w
        tube([(x,y,z),(x*1.15,y-.015,z+h*.65),(x*1.22,y-.025,z+h)],[(w*.68,w*.38),(w*.4,w*.17),(.006,.005)],'details',colour)
        ell((x,y+w*.3,z+h*.42),(w*.32,.012,h*.32),'details','8b746a')
    def eye_pair(y,z,x,r=.025,iris=None):
        for side in (-1,1):
            if iris:ell((side*x,y,z),(r*1.15,r*.6,r),'details',iris)
            ell((side*x,y+r*.28,z),(r*.63,r*.5,r*.72),'details',gloss=True)
            ell((side*x-r*.16,y+r*.76,z+r*.2),(r*.14,r*.10,r*.14),'details','d4ddc7')
    def nose(p,r):ell(p,r,'details',gloss=True)
    def leg(name,pts,radii,colour=None,hoof=False):
        anchor=Vector(pts[0]);anchor.x*=.70;anchor.z+=.06
        first=radii[0];first=first*.65 if isinstance(first,(int,float)) else tuple(v*.65 for v in first)
        tube([anchor,*pts],[first,*radii],name,colour,n=10)
        p=pts[-1]
        if hoof:
            for side in (-1,1):ell((p[0]+side*.024,p[1]+.018,.045),(.029,.075,.04),name,'29281f')
        else:
            for toe in (-1,0,1):
                tube([(p[0]+toe*.025,p[1]+.035,.045),(p[0]+toe*.025,p[1]+.075,.033)],[.012,.002],name,'544d3d',n=5)
    if kind in ('wolf','brownbear','bison','wombat'):
        if kind=='wolf':
            ell((0,-.08,.80),(.23,.55,.29));ell((0,.30,.84),(.24,.28,.34));ell((0,-.43,.80),(.23,.26,.25))
            tube([(0,.27,.89),(0,.47,1.01),(0,.62,1.08)],[.20,.17,.14]);ell((0,.63,1.08),(.15,.20,.18))
            tube([(0,.73,1.04),(0,.9,1.0),(0,1.02,.995)],[(.115,.09),(.08,.065),(.055,.05)])
            nose((0,1.035,1.01),(.063,.035,.045));eye_pair(.765,1.115,.125,.020,'bd9a54')
            for side in (-1,1):
                ear(side,.55,1.18,.095,.17)
                leg('LegF'+('L' if side<0 else 'R'),[(side*.165,.31,.84),(side*.18,.35,.48),(side*.17,.36,.13),(side*.17,.46,.055)],[.09,.065,.035,(.07,.05)])
                leg('LegB'+('L' if side<0 else 'R'),[(side*.17,-.44,.80),(side*.2,-.29,.48),(side*.18,-.56,.23),(side*.18,-.55,.10),(side*.18,-.43,.05)],[.13,.085,.04,.035,(.07,.045)])
            tube([(0,-.53,.86),(0,-.8,.72),(0,-1.06,.48),(0,-1.25,.40)],[.11,.12,.09,.025])
        elif kind=='brownbear':
            ell((0,-.12,.88),(.40,.73,.44));ell((0,.35,.99),(.40,.36,.46));ell((0,-.53,.84),(.37,.36,.38))
            tube([(0,.36,.98),(0,.65,.99),(0,.85,.98)],[.29,.25,.20]);ell((0,.84,1.02),(.235,.26,.23))
            tube([(0,.95,.96),(0,1.13,.91)],[(.19,.14),(.125,.10)])
            nose((0,1.15,.94),(.105,.055,.07));eye_pair(.99,1.10,.185,.024)
            for side in (-1,1):
                ell((side*.18,.76,1.21),(.085,.07,.10),'details');ell((side*.18,.81,1.22),(.05,.022,.06),'details','453b30')
                for front in (-1,1):
                    y=.43 if front==1 else -.55
                    leg('Leg'+('F' if front==1 else 'B')+('L' if side<0 else 'R'),[(side*.27,y,.88),(side*.28,y+.03,.44),(side*.27,y+.06,.13),(side*.27,y+.16,.06)],[.155,.12,.09,(.12,.07)])
        elif kind=='bison':
            ell((0,-.12,1.0),(.42,.75,.47));ell((0,.35,1.31),(.45,.48,.57));ell((0,-.65,.94),(.34,.34,.34))
            tube([(0,.52,1.21),(0,.82,1.04),(0,1.03,.94)],[.34,.30,.24]);ell((0,.93,1.04),(.30,.32,.34))
            ell((0,1.18,.82),(.23,.22,.18));nose((0,1.35,.84),(.16,.045,.10));eye_pair(1.1,1.15,.254,.024)
            for side in (-1,1):
                tube([(side*.24,.94,1.25),(side*.43,.91,1.31),(side*.49,.90,1.49),(side*.43,.91,1.61)],[.075,.06,.035,.003],'details','bbb7a1')
                ell((side*.32,.85,1.17),(.12,.065,.06),'details')
                for front in (-1,1):
                    y=.43 if front==1 else -.65;hip=.96 if front==1 else .83
                    leg('Leg'+('F' if front==1 else 'B')+('L' if side<0 else 'R'),[(side*.28,y,hip),(side*.29,y+.06,.45),(side*.28,y+.02,.14),(side*.28,y+.08,.055)],[.15 if front==1 else .11,.085,.045,(.065,.05)],hoof=True)
            tube([(0,-.76,1.04),(0,-1.0,.84),(0,-1.09,.45)],[.045,.03,.018]);ell((0,-1.09,.40),(.055,.05,.13),'details','302a21')
            for j in range(40):
                x=(j%9-4)*.035;y=.72+j//9*.10
                tube([(x,y,.78),(x,y+.02,.59-(j%3)*.025)],[.012,.001],'details','3f3325',n=6)
        else:
            ell((0,-.04,.34),(.27,.44,.26));ell((0,-.3,.33),(.26,.25,.25));ell((0,.37,.34),(.21,.24,.20))
            ell((0,.53,.28),(.17,.13,.11));nose((0,.63,.31),(.10,.035,.065));eye_pair(.49,.41,.176,.017)
            for side in (-1,1):
                ell((side*.15,.25,.52),(.07,.05,.09),'details');ell((side*.15,.29,.53),(.04,.012,.05),'details','645b4c')
                for front in (-1,1):
                    y=front*.27
                    leg('Leg'+('F' if front==1 else 'B')+('L' if side<0 else 'R'),[(side*.19,y,.31),(side*.21,y+.02,.14),(side*.22,y+.09,.045)],[.10,.075,(.085,.04)])
    elif kind=='kangaroo':
        ell((0,-.07,.70),(.225,.25,.42));ell((0,.12,1.07),(.17,.19,.30))
        tube([(0,.15,1.18),(0,.26,1.38),(0,.34,1.50)],[.13,.095,.07]);ell((0,.36,1.51),(.105,.16,.11))
        tube([(0,.44,1.49),(0,.57,1.46)],[(.075,.06),(.045,.04)]);nose((0,.585,1.48),(.043,.025,.03));eye_pair(.438,1.55,.085,.018)
        for side in (-1,1):
            ear(side,.29,1.56,.075,.30,'9b8065')
            ell((side*.20,-.13,.52),(.16,.22,.29))
            leg('LegB'+('L' if side<0 else 'R'),[(side*.20,-.12,.57),(side*.27,.08,.34),(side*.25,-.17,.13),(side*.25,.04,.055),(side*.25,.28,.045)],[.12,.09,.045,(.065,.045),(.04,.03)])
            tube([(side*.13,.16,1.11),(side*.20,.32,.94),(side*.18,.43,.84)],[.048,.035,.025])
            for toe in (-1,0,1):tube([(side*.18+toe*.012,.43,.85),(side*.18+toe*.012,.46,.80)],[.009,.002],'details','51483b',n=5)
        tube([(0,-.20,.52),(0,-.43,.29),(0,-.72,.13),(0,-1.06,.07),(0,-1.21,.06)],[.14,.12,.08,.035,.004])
        ell((0,.205,.81),(.12,.035,.08),'details','493a2b')
        tube([(-.12,.21,.78),(-.08,.24,.75),(0,.25,.74),(.08,.24,.75),(.12,.21,.78)],[.023]*5,'details','a58665')
        ell((0,.24,.87),(.06,.07,.078),'details','a58665');ell((0,.30,.85),(.04,.03,.033),'details','b29a7b')
        for side in (-1,1):
            ell((side*.04,.22,.96),(.018,.02,.08),'details','a58665');ell((side*.049,.29,.89),(.008,.009,.009),'details',gloss=True)
    elif kind=='koala':
        ell((0,-.035,.37),(.24,.22,.34));ell((0,.10,.66),(.22,.18,.20))
        ell((0,.19,.65),(.15,.09,.15));nose((0,.255,.65),(.057,.04,.095));eye_pair(.285,.71,.13,.018)
        for side in (-1,1):
            ell((side*.225,.055,.79),(.13,.08,.135),'details','b5bcb2');ell((side*.225,.115,.79),(.08,.024,.08),'details','686e66')
            tube([(side*.18,.07,.47),(side*.20,.24,.31),(side*.13,.27,.20)],[.08,.065,.045]);ell((side*.17,.08,.13),(.12,.15,.10))
            ell((side*.17,.22,.065),(.065,.105,.045),'details')
            for toe in (-1,0,1):tube([(side*.13+toe*.02,.29,.20),(side*.13+toe*.02,.32,.17)],[.011,.002],'details','363a32',n=5)
    elif kind=='hedgehog':
        ell((0,-.04,.16),(.15,.23,.14));ell((0,.19,.12),(.095,.12,.09))
        tube([(0,.20,.12),(0,.31,.085),(0,.38,.075)],[.08,.045,.018]);nose((0,.387,.08),(.024,.018,.021));eye_pair(.265,.145,.066,.012)
        for side in (-1,1):
            ell((side*.087,.15,.22),(.034,.023,.041),'details','9e8870')
            for front in (-1,1):
                y=.13 if front==1 else -.15
                leg('Leg'+('F' if front==1 else 'B')+('L' if side<0 else 'R'),[(side*.09,y,.10),(side*.10,y+.04,.025)],[.03,(.025,.018)])
        for j in range(360):
            a=j*2.399963;v=(j+.5)/360;z=.04+.25*v;r=math.sqrt(max(0,1-((z-.16)/.14)**2));x=math.cos(a)*.146*r;y=-.04+math.sin(a)*.22*r
            p=Vector((x,y,z));d=Vector((x*.5,(y+.04)*.4,.10)).normalized()
            tube([p,p+d*.035],[.0045,.0008],'details','b1a18a' if j%3 else '51483c',n=4)
    elif kind=='platypus':
        ell((0,-.07,.18),(.18,.37,.135));ell((0,.27,.16),(.13,.15,.11))
        ell((0,.43,.125),(.125,.18,.032),'details','766f58');nose((0,.315,.21),(.011,.014,.009));eye_pair(.32,.222,.107,.012)
        tube([(0,-.32,.16),(0,-.52,.13),(0,-.75,.105),(0,-.82,.10)],[(.12,.045),(.16,.042),(.11,.028),(.015,.01)])
        for side in (-1,1):
            for front in (-1,1):
                y=front*.22;group='Leg'+('F' if front==1 else 'B')+('L' if side<0 else 'R')
                tube([(side*.13,y,.15),(side*.21,y+.03,.065),(side*.25,y+.09,.035)],[.06,.04,(.07,.02)],group,'645b47')
                for toe in (-1,0,1):tube([(side*.25,y+.08,.035),(side*(.25+toe*.025),y+.18,.025)],[.024,.008],group,'645b47',n=6)
    else:
        # Species-specific birds: tucked resting wings plus separately articulated flight wings.
        if kind=='stork':
            ell((0,-.04,.88),(.21,.34,.23));tube([(0,.19,.95),(0,.27,1.12),(0,.22,1.29),(0,.33,1.42)],[.11,.075,.055,.055]);ell((0,.36,1.43),(.072,.10,.075))
            tube([(0,.43,1.43),(0,.72,1.42)],[.035,.001],'details','af4933');eye_pair(.39,1.46,.065,.011)
            hip=.77;bodyz=.90;bodyy=0;span=.68;wingcol='33372f'
        elif kind=='emu':
            ell((0,-.05,1.02),(.29,.44,.37));tube([(0,.23,1.20),(0,.27,1.44),(0,.26,1.65),(0,.34,1.77)],[.11,.065,.055,.05]);ell((0,.36,1.79),(.065,.10,.078))
            tube([(0,.44,1.79),(0,.55,1.76)],[.035,.005],'details','464437');eye_pair(.39,1.82,.061,.012,'8f693e')
            hip=.84;bodyz=1.05;bodyy=0;span=.16;wingcol='4e4b3f'
            for j in range(160):
                a=j*2.39996;v=(j+.5)/160;z=.72+v*.65;r=math.sqrt(max(.01,1-((z-1.02)/.37)**2));p=Vector((math.cos(a)*.28*r,-.05+math.sin(a)*.43*r,z))
                tube([p,p+Vector((0,-.11,-.09))],[.006,.0008],'details','807764' if j%3 else '45463b',n=5)
        else:
            configs={'europeanowl':(.16,.17,.27,.35,.67,.12,.15,.57,'877354'),'baldeagle':(.19,.29,.29,.40,.79,.31,.25,1.04,'4b3b2d'),'cockatoo':(.115,.15,.22,.28,.52,.13,.16,.46,'d6d9cf')}
            w,l,h,bodyz,headz,heady,bodyy,span,wingcol=configs[kind]
            ell((0,0,bodyz),(w,l,h));ell((0,heady,headz),(.16 if kind=='europeanowl' else .12 if kind=='baldeagle' else .09,.125 if kind=='europeanowl' else .13,.15 if kind=='europeanowl' else .12))
            if kind=='europeanowl':
                for side in (-1,1):
                    ell((side*.065,.20,.68),(.09,.045,.105))
                    tube([(side*.025,.25,.735),(side*.075,.25,.75),(side*.115,.225,.735)],[.009,.012,.004],'details','685840',n=6)
                eye_pair(.25,.695,.067,.024,'8c5631');tube([(0,.265,.66),(0,.315,.62)],[.023,.005],'details','6b6b54')
            elif kind=='baldeagle':
                tube([(0,.10,.54),(0,.22,.70),(0,.31,.78)],[.12,.105,.10])
                ell((0,.31,.79),(.123,.135,.12),'details','dedfd3');eye_pair(.38,.82,.098,.016,'ba9d45')
                tube([(0,.405,.78),(0,.49,.76),(0,.48,.705)],[.043,.035,.003],'details','bca34a')
            else:
                eye_pair(.19,.55,.073,.013);tube([(0,.23,.51),(0,.27,.49),(0,.25,.45)],[.028,.025,.004],'details','3e443b')
                for j in range(6):
                    tube([((j-2.5)*.013,.05,.59),((j-2.5)*.016,.015,.70),((j-2.5)*.017,.075,.75-j*.008)],[.018,.014,.001],'details','c8be63',n=6)
            hip=.15 if kind!='baldeagle' else .19
            for j in range(7):
                tube([((j-3)*.025,-.10,bodyz-.12),((j-3)*.045,-(.37 if kind!='europeanowl' else .28),bodyz-.30)],[.035,.008],'details',wingcol,n=6)
        for side in (-1,1):
            group='LegF'+('L' if side<0 else 'R');x=side*(.085 if kind!='emu' else .12)
            if kind in ('stork','emu'):
                tube([(x,.02,hip),(x,.10,hip*.64),(x,-.04,hip*.30),(x,.025,.075)],[.04 if kind=='emu' else .022,.025,.018,.016],group,'725d40' if kind=='emu' else 'a94e38')
            else:tube([(x,.08,hip),(x,.12,.05)],[.035,.023],group,'77735b')
            ell((x,.025,.068),(.021,.026,.035),group,'82785c' if kind!='stork' else 'a94e38')
            for toe in (-1,0,1):tube([(x,.025,.065),(x+toe*.04,.16,.025),(x+toe*.04,.18,.02)],[.018,.010,.002],group,'82785c' if kind!='stork' else 'a94e38',n=6)
            # Contour feathers lie flat along the back when the bird is resting.
            wx=.255 if kind=='emu' else .18 if kind in ('stork','baldeagle') else .15 if kind=='europeanowl' else .108
            ell((side*wx,-.06,bodyz),(.035,.27 if kind in ('stork','baldeagle') else .17,.17 if kind!='emu' else .085),'FoldedWings',wingcol)
            for j in range(5):
                p=(side*wx,.04-j*.027,bodyz-.015+j*.018)
                tube([p,(side*(wx-.01),-.25-j*.018,bodyz-.16)],[(.018,.035),(.004,.003)],'FoldedWings',wingcol,n=8)
            if kind not in ('emu','stork'):
                wing='WingL' if side<0 else 'WingR'
                tube([(side*.10,.02,bodyz+.12),(side*span*.46,.10,bodyz+.10),(side*span*.76,-.02,bodyz+.08)],[(.09,.05),(.14,.035),(.06,.02)],wing,wingcol,n=10)
                for j in range(10):
                    t=j/9;rootx=.18+t*span*.60;rooty=.06-t*.14;tipx=rootx+span*(.18 if j<5 else .26);tipy=rooty-.24+max(0,j-6)*.04
                    tube([(side*rootx,rooty,bodyz+.10),(side*tipx,tipy,bodyz+.08)],[.047 if kind!='cockatoo' else .028,.003],wing,wingcol if j%3 else ('a99d83' if kind=='europeanowl' else '665b48' if kind=='baldeagle' else 'e3e3d3'),n=8)
    def coat_colour(p):
        base=rgb(colours[kind]);x,y,z=p
        if kind=='wolf':
            if z>.88 and y<.40:base=rgb('4e554f')
            elif z<.64 or y>.75:base=rgb('b5ad96')
            elif y>.30:base=rgb('8f9385')
        elif kind=='brownbear' and y>.92:base=rgb('9d805e')
        elif kind=='bison':
            if y>.32:base=rgb('40352a')
            elif z<.46:base=rgb('443b2c')
        elif kind=='koala' and y>.09 and z<.57:base=rgb('b9bdb0')
        elif kind=='kangaroo' and y>.16 and z<1.21:base=rgb('c2b092')
        elif kind=='hedgehog' and y>.10:base=rgb('b3a089')
        elif kind=='emu' and z>1.34:base=rgb('454b43')
        elif kind=='europeanowl':
            if y>.20 and z>.57:base=rgb('c0b299')
            elif y>.05 and z<.55:base=rgb('b9af96')
        elif kind=='baldeagle' and y>.16 and z>.65:base=rgb('dedfd3')
        variation=.94+.08*noise.noise(Vector(p)*19)+.035*noise.noise(Vector(p)*63)
        return tuple(max(0,min(1,c*variation)) for c in base)
    exports=[];stats={}
    for group,objects in groups.items():
        if not objects:continue
        # Colour detail pieces before joining so feathers, eyes and claws retain their hues.
        if group!='core':
            for ob in objects:
                attr=ob.data.color_attributes.new(name='Coat',type='FLOAT_COLOR',domain='CORNER')
                col=rgb(palette[ob.name])
                for c in attr.data:c.color=(*col,1)
        select(objects);bpy.ops.object.join();ob=bpy.context.object;ob.name='Body' if group=='core' else group
        bpy.ops.object.transform_apply(location=True,rotation=True,scale=True)
        if group=='core':
            remesh=ob.modifiers.new('Continuous skin','REMESH');remesh.mode='VOXEL';remesh.voxel_size=.017 if kind in ('wolf','kangaroo','koala','wombat') else .029 if kind in ('bison','brownbear','emu') else .009
            bpy.ops.object.modifier_apply(modifier=remesh.name)
            smooth=ob.modifiers.new('Skin relax','SMOOTH');smooth.factor=.65;smooth.iterations=4;bpy.ops.object.modifier_apply(modifier=smooth.name)
            tris=sum(len(f.vertices)-2 for f in ob.data.polygons)
            if tris>2300:
                dec=ob.modifiers.new('Mobile detail budget','DECIMATE');dec.ratio=2300/tris;bpy.ops.object.modifier_apply(modifier=dec.name)
            attr=ob.data.color_attributes.new(name='Coat',type='FLOAT_COLOR',domain='CORNER')
            for loop,c in zip(ob.data.loops,attr.data):c.color=(*coat_colour(ob.data.vertices[loop.vertex_index].co),1)
        for face in ob.data.polygons:face.use_smooth=True
        ob.data.color_attributes.active_color=ob.data.color_attributes.get('Coat')
        if group.startswith('Leg'):
            pts=[v.co for v in ob.data.vertices];top=max(v.z for v in pts)
            bpy.context.scene.cursor.location=(sum(v.x for v in pts)/len(pts),sum(v.y for v in pts)/len(pts),top-.025)
            select([ob]);bpy.ops.object.origin_set(type='ORIGIN_CURSOR')
        if group.startswith('Wing'):
            bpy.context.scene.cursor.location=(0,0,bodyz+.10);select([ob]);bpy.ops.object.origin_set(type='ORIGIN_CURSOR')
        exports.append(ob);stats[group]=sum(len(f.vertices)-2 for f in ob.data.polygons)
    # Fold details into the static body to keep runtime object/material counts small.
    static=[ob for ob in exports if ob.name in ('Body','details')]
    if len(static)>1:
        exports=[ob for ob in exports if ob.name!='details']
        select(static);bpy.context.view_layer.objects.active=next(ob for ob in static if ob.name=='Body');bpy.ops.object.join()
    select(exports)
    path=Path(out)/('animal_'+kind+'.glb')
    bpy.ops.export_scene.gltf(filepath=str(path),export_format='GLB',use_selection=True,export_yup=True,export_materials='EXPORT')
    print('REFINED_ANIMAL '+kind+' '+json.dumps(stats),flush=True)
    if os.environ.get('HARBOR_REFINED_PREVIEWS'):
        preview(kind,exports,Path(os.environ['HARBOR_REFINED_PREVIEWS']))

def preview(kind,objects,out):
    out.mkdir(parents=True,exist_ok=True)
    # Native Blender presentation, using the exported game meshes.
    for ob in objects:
        if ob.name in ('WingL','WingR'):ob.hide_render=True
    verts=[ob.matrix_world@v.co for ob in objects if not ob.hide_render for v in ob.data.vertices]
    zmax=max(v.z for v in verts);ys=[v.y for v in verts];y=(min(ys)+max(ys))*.5
    bpy.ops.mesh.primitive_plane_add(size=200,location=(0,0,-.005));floor=bpy.context.object
    mat=bpy.data.materials.new('Neutral ground');mat.diffuse_color=(.12,.15,.13,1);floor.data.materials.append(mat)
    bpy.ops.object.camera_add(location=(zmax*2.0,y+zmax*2.8,zmax*1.5));camera=bpy.context.object
    camera.rotation_euler=(Vector((0,y,zmax*.48))-camera.location).to_track_quat('-Z','Y').to_euler();camera.data.type='ORTHO';camera.data.ortho_scale=max(zmax*1.45,(max(ys)-min(ys))*1.4)
    scene=bpy.context.scene;scene.camera=camera;scene.render.engine='CYCLES';scene.cycles.samples=16;scene.cycles.use_denoising=True
    scene.render.resolution_x=960;scene.render.resolution_y=800;scene.render.resolution_percentage=100
    scene.world.color=(.32,.32,.32)
    for pos,power,size in [((3,4,6),550,5),((-4,0,3),350,4),((0,-4,5),650,3)]:
        bpy.ops.object.light_add(type='AREA',location=pos);light=bpy.context.object;light.data.energy=power;light.data.shape='DISK';light.data.size=size;light.rotation_euler=(Vector((0,0,.5))-light.location).to_track_quat('-Z','Y').to_euler()
    scene.view_settings.view_transform='AgX';scene.render.filepath=str(out/(kind+'.png'));bpy.ops.render.render(write_still=True)

extends RefCounted
# v0.77: the four boss creatures and the Ultimate boss, built from simple shapes. Everything faces +z.
#   dragon (Paris), serpent (Tokyo), golem (New York), kraken (Bangkok), ultimate (the World Eater).
# Each one is about 2 to 3 units tall at scale 1; the caller scales it. Moving parts are listed in the root's
# meta "anim" and are driven by animate(root, time).
# SINK: how far the sleeping version is buried (times its scale).

const SINK := {"dragon":0.95,"serpent":1.1,"golem":0.9,"kraken":0.85,"ultimate":0.0}

var g

func _init(main) -> void:
	g = main

func mat(hex: String) -> StandardMaterial3D:
	return g._material(Color(hex))

func glow(hex: String) -> StandardMaterial3D:
	return g._fc_glow(Color(hex))

func part(parent: Node3D, mesh: Mesh, pos: Vector3, m: Material, sc := Vector3.ONE, rot := Vector3.ZERO) -> MeshInstance3D:
	var mi: MeshInstance3D = g._fc_part(parent,mesh,pos,m,sc)
	mi.rotation = rot
	return mi

func ball(parent: Node3D, pos: Vector3, r: float, m: Material, sc := Vector3.ONE) -> MeshInstance3D:
	return part(parent,g._bsph(r),pos,m,sc)

func cone(parent: Node3D, pos: Vector3, top: float, bottom: float, h: float, m: Material, rot := Vector3.ZERO) -> MeshInstance3D:
	return part(parent,g._bcone(top,bottom,h),pos,m,Vector3.ONE,rot)

func box(parent: Node3D, pos: Vector3, size: Vector3, m: Material, rot := Vector3.ZERO) -> MeshInstance3D:
	return part(parent,g._bbox(),pos,m,size,rot)

func pivot(parent: Node3D, pos: Vector3, rot := Vector3.ZERO) -> Node3D:
	var n := Node3D.new()
	n.position = pos
	n.rotation = rot
	parent.add_child(n)
	return n

func anim(root: Node3D, n: Node3D, mode: String, amp: float, freq: float, phase := 0.0) -> void:
	var list: Array = root.get_meta("anim",[])
	list.append([n,mode,amp,freq,phase,n.rotation,n.position])
	root.set_meta("anim",list)

func animate(root: Node3D, t: float, speed := 1.0) -> void:
	if not root.has_meta("anim"):
		return
	for e: Array in root.get_meta("anim"):
		var n: Node3D = e[0]
		if not is_instance_valid(n):
			continue
		var rb: Vector3 = e[5]
		var pb: Vector3 = e[6]
		var ph := float(e[4])
		var fr := float(e[3])*speed
		var s := sin(t*fr+ph)*float(e[2])
		match String(e[1]):
			"rx":
				n.rotation = Vector3(rb.x+s,rb.y,rb.z)
			"ry":
				n.rotation = Vector3(rb.x,rb.y+s,rb.z)
			"rz":
				n.rotation = Vector3(rb.x,rb.y,rb.z+s)
			"px":
				n.position = Vector3(pb.x+s,pb.y,pb.z)
			"py":
				n.position = Vector3(pb.x,pb.y+s,pb.z)
			"spin":
				n.rotation = Vector3(rb.x,rb.y+t*fr+ph,rb.z)

# v0.77.1: parts made in Blender (blender-src/make_bosses.py) live in res://models/boss_<name>.glb. If a part is missing the
# older shape-built version below is used, so the game never loses a boss.
func glb(parent: Node3D, part_name: String, pos := Vector3.ZERO, sc := Vector3.ONE, rot := Vector3.ZERO) -> Node3D:
	var path := "res://models/boss_%s.glb" % part_name
	if not ResourceLoader.exists(path):
		return null
	var ps = load(path)
	if not (ps is PackedScene):
		return null
	var n := (ps as PackedScene).instantiate() as Node3D
	if n == null:
		return null
	n.position = pos
	n.scale = sc
	n.rotation = rot
	parent.add_child(n)
	return n

func has_glb(kind: String) -> bool:
	return ResourceLoader.exists("res://models/boss_%s.glb" % {"dragon":"dragon_body","serpent":"serpent_coil","golem":"golem_torso","kraken":"kraken_head","ultimate":"ultimate_shell"}[kind])

func build(kind: String) -> Node3D:
	var root := Node3D.new()
	var fancy := has_glb(kind)
	match kind:
		"dragon":
			if fancy:
				dragon_glb(root)
			else:
				dragon(root)
		"serpent":
			if fancy:
				serpent_glb(root)
			else:
				serpent(root)
		"golem":
			if fancy:
				golem_glb(root)
			else:
				golem(root)
		"kraken":
			if fancy:
				kraken_glb(root)
			else:
				kraken(root)
		"ultimate":
			ultimate(root)
	return root

# ---------- Blender-made versions ----------
func dragon_glb(root: Node3D) -> void:
	glb(root,"dragon_body")
	var head := pivot(root,Vector3(0,2.08,1.32))
	glb(head,"dragon_head")
	var jaw := pivot(head,Vector3(0,-0.12,0.05),Vector3(0.22,0,0))
	glb(jaw,"dragon_jaw")
	anim(root,jaw,"rx",0.2,2.2)
	anim(root,head,"rx",0.08,1.4)
	for sx: float in [-1.0,1.0]:
		var wing := pivot(root,Vector3(sx*0.36,1.5,0.25),Vector3(0,0,-sx*0.15))
		glb(wing,"dragon_wing_r" if sx > 0.0 else "dragon_wing_l")
		anim(root,wing,"rz",-sx*0.55,3.0)
	for k in 7:
		var kf := float(k)
		var tail := glb(root,"dragon_tail",Vector3(0,0.98-0.07*kf,-0.7-0.4*kf),Vector3(1.0-0.11*kf,1.0-0.11*kf,1.0))
		if tail != null:
			anim(root,tail,"px",0.05*kf,1.8,kf*0.55)
	var tip := glb(root,"dragon_tailtip",Vector3(0,0.5,-3.6))
	if tip != null:
		anim(root,tip,"px",0.35,1.8,4.2)

func serpent_glb(root: Node3D) -> void:
	glb(root,"serpent_coil")
	var n := 10
	for k in n:
		var f := float(k)/float(n-1)
		var seg := glb(root,"serpent_segB" if k % 2 == 1 else "serpent_segA",Vector3(0,0.75+0.16*float(k),0.1+0.28*sin(f*2.6)),Vector3.ONE*(1.0-0.039*float(k)))
		if seg != null:
			anim(root,seg,"px",0.03+0.12*f,1.7,float(k)*0.55)
	var head := pivot(root,Vector3(0,2.36,0.5))
	glb(head,"serpent_head")
	anim(root,head,"px",0.15,1.7,float(n)*0.55)
	anim(root,head,"rz",0.05,3.0)

func golem_glb(root: Node3D) -> void:
	glb(root,"golem_torso")
	for sx: float in [-1.0,1.0]:
		glb(root,"golem_leg",Vector3(sx*0.36,0,0))
		var arm := pivot(root,Vector3(sx*0.88,1.75,0))
		glb(arm,"golem_arm_r" if sx > 0.0 else "golem_arm_l")
		anim(root,arm,"rx",0.55,2.2,0.0 if sx < 0.0 else PI)
	var head := pivot(root,Vector3(0,2.18,0.12))
	glb(head,"golem_head")
	anim(root,head,"ry",0.12,0.9)

func kraken_glb(root: Node3D) -> void:
	glb(root,"kraken_head")
	var have := ResourceLoader.exists("res://models/boss_kraken_tentacle.glb")
	for k in 8:
		var a := float(k)*TAU/8.0+0.2
		if have:
			var pv := pivot(root,Vector3(cos(a)*0.45,0.5,sin(a)*0.45),Vector3(0.0,PI*0.5-a,0.0))
			glb(pv,"kraken_tentacle",Vector3.ZERO,Vector3.ONE*(1.0+0.12*float(k % 2)))
			anim(root,pv,"rx",0.18,1.6,float(k)*0.8)
			continue
		for j in 9:
			var jf := float(j)
			var rr := 0.45+0.25*jf
			var ts := glb(root,"kraken_tentB" if j % 2 == 1 else "kraken_tentA",Vector3(cos(a)*rr,0.45+0.02*jf*jf*0.6,sin(a)*rr),Vector3.ONE*(1.0-0.09*jf),Vector3(0,-a,0))
			if ts != null:
				anim(root,ts,"py",0.04+0.03*jf,2.0,jf*0.6+float(k))
	for sx: float in [-1.0,1.0]:
		if have:
			var arm := pivot(root,Vector3(sx*0.5,0.9,0.65),Vector3(-1.05,sx*0.25,0.0))
			glb(arm,"kraken_tentacle",Vector3.ZERO,Vector3.ONE*0.9)
			anim(root,arm,"ry",0.3,1.5,sx)
			continue
		for j in 7:
			var jf2 := float(j)
			var seg := glb(root,"kraken_tentB" if j % 2 == 1 else "kraken_tentA",Vector3(sx*(0.45+0.12*jf2),0.8+0.24*jf2,0.7+0.22*jf2),Vector3.ONE*((0.2-0.02*jf2)/0.3))
			if seg != null:
				anim(root,seg,"px",0.04+0.07*jf2,1.6,jf2*0.5+sx)

# ---------- the dragon (Paris): red scales, big wings, a tail, fire in its mouth ----------
func dragon(root: Node3D) -> void:
	var red := mat("8a1616")
	var dark := mat("5a0f1c")
	var belly := mat("e8b04a")
	var bone := mat("f0e6c8")
	var fire := glow("ff6a1a")
	ball(root,Vector3(0,1.05,0),0.5,red,Vector3(0.9,0.8,1.5))
	ball(root,Vector3(0,0.9,0.12),0.46,belly,Vector3(0.75,0.6,1.4))
	ball(root,Vector3(0,1.2,0.62),0.42,red)
	for k in 3:
		ball(root,Vector3(0,1.42+0.27*float(k),0.88+0.14*float(k)),0.27-0.03*float(k),red)
	var head := pivot(root,Vector3(0,2.08,1.32))
	ball(head,Vector3.ZERO,0.27,red,Vector3(0.95,0.8,1.3))
	box(head,Vector3(0,-0.07,0.38),Vector3(0.28,0.18,0.42),red)
	box(head,Vector3(0,-0.2,0.34),Vector3(0.24,0.07,0.42),dark)
	ball(head,Vector3(0,-0.12,0.52),0.09,fire)
	for sx: float in [-1.0,1.0]:
		ball(head,Vector3(sx*0.15,0.08,0.18),0.05,fire)
		cone(head,Vector3(sx*0.13,0.2,-0.16),0.0,0.065,0.55,bone,Vector3(-0.95,0,-sx*0.3))
		cone(head,Vector3(sx*0.16,-0.2,0.5),0.0,0.025,0.12,bone,Vector3(PI,0,0))
	anim(root,head,"rx",0.08,1.4)
	for sx: float in [-1.0,1.0]:
		var wing := pivot(root,Vector3(sx*0.36,1.5,0.25),Vector3(0,0,-sx*0.15))
		box(wing,Vector3(sx*1.2,0.05,0.0),Vector3(2.4,0.1,0.12),dark)
		box(wing,Vector3(sx*1.25,0.0,-0.6),Vector3(2.3,0.03,1.2),mat("7a1424"))
		box(wing,Vector3(sx*0.7,0.01,-0.6),Vector3(0.06,0.06,1.2),dark,Vector3(0,sx*0.35,0))
		box(wing,Vector3(sx*1.6,0.01,-0.6),Vector3(0.06,0.06,1.2),dark,Vector3(0,-sx*0.25,0))
		cone(wing,Vector3(sx*2.45,0.05,0.0),0.0,0.08,0.4,bone,Vector3(0,0,-sx*PI*0.5))
		anim(root,wing,"rz",-sx*0.55,3.0)
	for k in 7:
		var tail := ball(root,Vector3(0,0.98-0.07*float(k),-0.7-0.4*float(k)),0.34-0.04*float(k),red)
		anim(root,tail,"px",0.05*float(k),1.8,float(k)*0.55)
		cone(root,Vector3(0,1.25-0.07*float(k)+(0.0 if k > 2 else 0.1),-0.7-0.4*float(k)),0.0,0.07,0.28,bone)
	for k in 6:
		cone(root,Vector3(0,1.5,0.7-0.3*float(k)),0.0,0.08,0.3,bone)
	for sx: float in [-1.0,1.0]:
		for fz: float in [0.55,-0.4]:
			cone(root,Vector3(sx*0.42,0.42,fz),0.2,0.27,0.75,red)
			box(root,Vector3(sx*0.42,0.07,fz+0.12),Vector3(0.38,0.16,0.5),dark)
			for cl in 3:
				cone(root,Vector3(sx*(0.32+0.1*float(cl)),0.08,fz+0.4),0.0,0.04,0.18,bone,Vector3(PI*0.5,0,0))

# ---------- the neon serpent (Tokyo): a coiled body, a raised cobra head with a glowing hood ----------
func serpent(root: Node3D) -> void:
	var body := mat("2a0f4a")
	var band := mat("7a1f9a")
	var neon := glow("ff5ad0")
	var cyan := glow("3af0ff")
	part(root,g._fc_torus(0.5,1.0),Vector3(0,0.28,0),body,Vector3(1.0,1.2,1.0))
	part(root,g._fc_torus(0.3,0.78),Vector3(0,0.66,0),band,Vector3(1.0,1.2,1.0))
	for k in 12:
		var ca := float(k)*TAU/12.0
		ball(root,Vector3(cos(ca)*0.75,0.55,sin(ca)*0.75),0.07,neon)
	cone(root,Vector3(0.0,0.45,-1.15),0.0,0.2,1.1,body,Vector3(-1.2,0,0))
	var n := 10
	for k in n:
		var f := float(k)/float(n-1)
		var seg := ball(root,Vector3(0,0.75+0.16*float(k),0.1+0.28*sin(f*2.6)),0.31-0.012*float(k),body if k % 2 == 0 else band)
		anim(root,seg,"px",0.03+0.12*f,1.7,float(k)*0.55)
		if k % 2 == 1:
			var stripe := ball(root,Vector3(0,0.75+0.16*float(k),0.1+0.28*sin(f*2.6)+0.2),0.06,neon)
			anim(root,stripe,"px",0.03+0.12*f,1.7,float(k)*0.55)
	var head := pivot(root,Vector3(0,2.36,0.5))
	ball(head,Vector3.ZERO,0.3,mat("3a1260"),Vector3(0.9,0.7,1.35))
	var hood := ball(head,Vector3(0,-0.05,-0.28),0.5,neon,Vector3(1.5,1.35,0.22))
	ball(head,Vector3(0,-0.05,-0.2),0.36,mat("2a0f4a"),Vector3(1.4,1.25,0.2))
	for sx: float in [-1.0,1.0]:
		ball(head,Vector3(sx*0.16,0.1,0.22),0.065,cyan)
		cone(head,Vector3(sx*0.09,-0.3,0.34),0.0,0.045,0.32,mat("f6f2e6"),Vector3(PI,0,0))
	box(head,Vector3(0,-0.17,0.5),Vector3(0.03,0.02,0.45),glow("ff2a4a"))
	anim(root,head,"px",0.15,1.7,float(n)*0.55)
	anim(root,hood,"rz",0.04,3.0)

# ---------- the rock giant (New York): grey stone, glowing gold cracks, mossy shoulders, crystal crown ----------
func golem(root: Node3D) -> void:
	var rock := mat("707078")
	var dark := mat("55555e")
	var moss := mat("4f7a3a")
	var lava := glow("ffb02a")
	for sx: float in [-1.0,1.0]:
		box(root,Vector3(sx*0.36,0.5,0),Vector3(0.52,1.0,0.52),rock)
		box(root,Vector3(sx*0.36,0.1,0.14),Vector3(0.62,0.22,0.84),dark)
		ball(root,Vector3(sx*0.36,0.95,0.2),0.26,rock)
	box(root,Vector3(0,1.4,0),Vector3(1.25,1.05,0.85),dark)
	ball(root,Vector3(0,1.55,0.36),0.52,rock,Vector3(1.15,0.85,0.55))
	ball(root,Vector3(0,1.45,0.62),0.17,lava)
	for k in 4:
		var kk := float(k)
		box(root,Vector3(-0.38+0.25*kk,1.15+0.2*sin(kk*1.7),0.44),Vector3(0.04,0.42,0.02),lava,Vector3(0,0,0.5-0.3*kk))
	box(root,Vector3(0.45,1.7,0.44),Vector3(0.04,0.4,0.02),lava,Vector3(0,0,-0.6))
	box(root,Vector3(0,0.9,0.44),Vector3(0.5,0.04,0.02),lava)
	for sx: float in [-1.0,1.0]:
		ball(root,Vector3(sx*0.85,1.85,0),0.4,rock,Vector3(1.0,0.8,1.0))
		ball(root,Vector3(sx*0.9,2.02,-0.05),0.2,moss,Vector3(1.2,0.5,1.2))
		var arm := pivot(root,Vector3(sx*0.88,1.75,0))
		box(arm,Vector3(0,-0.45,0),Vector3(0.38,0.95,0.38),dark)
		box(arm,Vector3(0,-1.1,0.02),Vector3(0.66,0.6,0.66),rock)
		box(arm,Vector3(sx*0.1,-1.12,0.35),Vector3(0.04,0.3,0.02),lava,Vector3(0,0,0.4))
		anim(root,arm,"rx",0.55,2.2,0.0 if sx < 0.0 else PI)
	var head := pivot(root,Vector3(0,2.18,0.12))
	box(head,Vector3.ZERO,Vector3(0.52,0.46,0.5),rock)
	box(head,Vector3(0,-0.2,0.12),Vector3(0.4,0.12,0.36),dark)
	box(head,Vector3(0,0.12,0.2),Vector3(0.56,0.1,0.2),dark)
	for sx: float in [-1.0,1.0]:
		ball(head,Vector3(sx*0.12,0.04,0.26),0.06,lava)
	for k in 5:
		var ca := float(k)*TAU/5.0
		cone(head,Vector3(cos(ca)*0.18,0.38,sin(ca)*0.14),0.0,0.07,0.38+0.08*float(k % 2),lava,Vector3(sin(ca)*0.25,0,-cos(ca)*0.25))
	anim(root,head,"ry",0.12,0.9)
	for k in 4:
		cone(root,Vector3(-0.45+0.3*float(k),1.95,-0.5),0.0,0.14,0.55,dark,Vector3(-0.5,0,0))

# ---------- the river kraken (Bangkok): a big teal dome head, glowing eyes and waving tentacles ----------
func kraken(root: Node3D) -> void:
	var teal := mat("0f4a4a")
	var light := mat("1a8a7a")
	var fin := glow("3affc0")
	var eye := glow("e8fff0")
	ball(root,Vector3(0,1.5,0),0.78,teal,Vector3(1.0,1.15,1.0))
	ball(root,Vector3(0,1.78,-0.12),0.55,light,Vector3(1.0,0.9,1.0))
	for k in 5:
		cone(root,Vector3(0,2.4-0.2*float(k),-0.2-0.12*float(k)),0.0,0.11,0.4,fin,Vector3(-0.5,0,0))
	for sx: float in [-1.0,1.0]:
		ball(root,Vector3(sx*0.32,1.4,0.58),0.17,eye)
		ball(root,Vector3(sx*0.32,1.4,0.72),0.08,mat("0a1414"))
		cone(root,Vector3(sx*0.14,0.85,0.7),0.0,0.05,0.34,mat("f2ead0"),Vector3(PI+0.3,0,-sx*0.2))
	for k in 8:
		var a := float(k)*TAU/8.0+0.2
		for j in 9:
			var jf := float(j)
			var rr := 0.45+0.25*jf
			var ts := ball(root,Vector3(cos(a)*rr,0.45+0.02*jf*jf*0.6,sin(a)*rr),0.3-0.027*jf,teal if j % 2 == 0 else light)
			anim(root,ts,"py",0.04+0.03*jf,2.0,jf*0.6+float(k))
		var tip := ball(root,Vector3(cos(a)*2.55,0.85,sin(a)*2.55),0.09,fin)
		anim(root,tip,"py",0.25,2.0,3.0+float(k))
	for sx: float in [-1.0,1.0]:
		for j in 7:
			var jf2 := float(j)
			var seg := ball(root,Vector3(sx*(0.45+0.12*jf2),0.8+0.24*jf2,0.7+0.22*jf2),0.2-0.02*jf2,teal if j % 2 == 0 else light)
			anim(root,seg,"px",0.04+0.07*jf2,1.6,jf2*0.5+sx)
			if j == 6:
				ball(seg,Vector3.ZERO,0.1,fin)

# ---------- THE WORLD EATER (the Ultimate boss): a dark crystal core with a giant eye, spinning rings, a crown of spikes,
# four necks (a dragon, a serpent, a rock fist and a kraken's tentacles) and a swarm of orbiting shards ----------
func ultimate(root: Node3D) -> void:
	var shell := mat("17121f")
	var core := glow("e8d8ff")
	var violet := glow("7a3aff")
	var white := glow("ffffff")
	var fancy := glb(root,"ultimate_shell") != null
	if not fancy:
		ball(root,Vector3(0,2.9,0),1.25,shell)
		cone(root,Vector3(0,1.2,0),0.85,0.05,2.3,shell)
		ball(root,Vector3(0,2.95,1.0),0.55,core,Vector3(1.0,1.0,0.45))
		ball(root,Vector3(0,2.95,1.18),0.26,mat("0a0710"),Vector3(0.6,1.4,0.5))
		var ring_eye := part(root,g._fc_torus(0.5,0.58),Vector3(0,2.95,1.1),violet,Vector3.ONE,Vector3(PI*0.5,0,0))
		ring_eye.scale = Vector3(1.0,1.0,1.0)
	for k in 2:
		var pv := pivot(root,Vector3(0,2.9,0),Vector3(0.9 if k == 0 else -0.9,0,0.4 if k == 0 else -0.4))
		var rg := part(pv,g._fc_torus(2.1+0.2*float(k),2.2+0.2*float(k)),Vector3.ZERO,violet)
		anim(root,rg,"spin",0.0,0.7 if k == 0 else -0.5)
	for k in 9:
		if fancy:
			break
		var ca := float(k)*TAU/9.0
		cone(root,Vector3(cos(ca)*0.9,4.0,sin(ca)*0.9),0.0,0.17,0.9+0.3*float(k % 3),shell,Vector3(sin(ca)*0.35,0,-cos(ca)*0.35))
		ball(root,Vector3(cos(ca)*1.15,4.55+0.3*float(k % 3),sin(ca)*1.15),0.06,violet)
	var arms := [["dragon",Vector3(1.0,0,1.0)],["serpent",Vector3(-1.0,0,1.0)],["golem",Vector3(1.0,0,-1.0)],["kraken",Vector3(-1.0,0,-1.0)]]
	for ai in arms.size():
		var e: Array = arms[ai]
		var dir: Vector3 = (e[1] as Vector3).normalized()
		var arm := pivot(root,Vector3(0,2.9,0),Vector3(0,atan2(dir.x,dir.z),0))
		for k in 4:
			var ns: Node3D = glb(arm,"ultimate_neck",Vector3(0,0.1*float(k),1.4+0.5*float(k)),Vector3.ONE*(1.0-0.1*float(k)))
			if ns == null:
				ns = ball(arm,Vector3(0,0.1*float(k),1.4+0.5*float(k)),0.3-0.03*float(k),shell)
			anim(root,ns,"py",0.1,1.5,float(k)*0.7+float(ai))
		var tip := Vector3(0,0.45,3.6)
		match String(e[0]):
			"dragon" when glb(arm,"dragon_head",tip,Vector3.ONE*1.5) != null:
				pass
			"serpent" when glb(arm,"serpent_head",tip,Vector3.ONE*1.3) != null:
				pass
			"dragon":
				ball(arm,tip,0.38,mat("8a1616"),Vector3(0.9,0.8,1.3))
				box(arm,tip+Vector3(0,-0.1,0.5),Vector3(0.3,0.2,0.5),mat("8a1616"))
				ball(arm,tip+Vector3(0,-0.1,0.78),0.12,glow("ff6a1a"))
				for sx: float in [-1.0,1.0]:
					cone(arm,tip+Vector3(sx*0.2,0.3,-0.2),0.0,0.07,0.55,mat("f0e6c8"),Vector3(-0.95,0,-sx*0.3))
					ball(arm,tip+Vector3(sx*0.2,0.1,0.25),0.06,glow("ff6a1a"))
			"serpent":
				ball(arm,tip,0.36,mat("3a1260"),Vector3(0.9,0.7,1.3))
				ball(arm,tip+Vector3(0,0,-0.3),0.55,glow("ff5ad0"),Vector3(1.4,1.3,0.2))
				for sx: float in [-1.0,1.0]:
					ball(arm,tip+Vector3(sx*0.17,0.1,0.28),0.06,glow("3af0ff"))
					cone(arm,tip+Vector3(sx*0.1,-0.3,0.4),0.0,0.04,0.3,mat("f6f2e6"),Vector3(PI,0,0))
			"golem":
				box(arm,tip,Vector3(0.85,0.8,0.85),mat("707078"))
				box(arm,tip+Vector3(0,0.1,0.45),Vector3(0.05,0.5,0.02),glow("ffb02a"),Vector3(0,0,0.4))
				for k in 4:
					cone(arm,tip+Vector3(-0.3+0.2*float(k),0.5,0),0.0,0.09,0.45,glow("ffb02a"))
			_:
				ball(arm,tip,0.4,mat("0f4a4a"))
				for k in 5:
					var ka := float(k)*TAU/5.0
					for j in 4:
						var tl := ball(arm,tip+Vector3(cos(ka)*0.25*float(j+1),sin(ka)*0.25*float(j+1)-0.1*float(j),0.35*float(j)),0.14-0.025*float(j),mat("1a8a7a"))
						anim(root,tl,"py",0.08*float(j),2.0,float(j)*0.6+float(k))
	var swarm := pivot(root,Vector3(0,2.9,0))
	for k in 10:
		var sa := float(k)*TAU/10.0
		cone(swarm,Vector3(cos(sa)*3.9,-0.8+1.5*sin(float(k)*1.9),sin(sa)*3.9),0.0,0.2,1.1,violet if k % 2 == 0 else white,Vector3(0.4,sa,0.3))
	anim(root,swarm,"spin",0.0,0.6)

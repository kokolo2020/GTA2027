extends RefCounted
# v0.56.1: the Sun Dome, a giant futuristic glass dome over Harbor Commons (fountain, puzzle pavilion,
# playground, court). Everyone spawns here. Neon lattice, tinted glass, a golden sun core at the top, chrome
# pylons with light beams, glowing floor inlays, and the Challenge Core: a hologram tower with the hourly
# challenge terminal and a ring of seats to hang out and chat. Talks to main through `g`.
const R := 46.0
const H := 27.0
const MERIDIANS := 24
const SEGS := 10

var g
var root: Node3D
var c: Vector3
var core: Vector3
var term: Vector3
var hr_sign: Label3D
var spinners: Array = []

func _init(g_main, centre: Vector3) -> void:
	g = g_main
	c = centre
	core = c+Vector3(0,0,29.0)
	term = core+Vector3(0,0,-3.6)

func pt(theta: float, phi: float) -> Vector3:
	return c+Vector3(R*sin(theta)*cos(phi),H*cos(theta),R*sin(theta)*sin(phi))

func rib(xf: Array, a: Vector3, b: Vector3, w: float) -> void:
	var d := b-a
	var ln := d.length()
	if ln < 0.01:
		return
	var z := d/ln
	var up := Vector3.UP if absf(z.y) < 0.95 else Vector3.RIGHT
	var x := up.cross(z).normalized()
	var y := z.cross(x)
	xf.append(Transform3D(Basis(x*w,y*w,z*ln),(a+b)*0.5))

func multimesh(xf: Array, col: Color) -> void:
	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = BoxMesh.new()
	mm.instance_count = xf.size()
	for i in xf.size():
		mm.set_instance_transform(i,xf[i])
	var mmi := MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = g._fc_glow(col)
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mmi)

func spin(n: Node3D, axis: String, secs: float, from := 0.0) -> void:
	var tw: Tween = g.create_tween()
	tw.set_loops()
	tw.tween_property(n,"rotation:"+axis,from+TAU,secs).from(from)

func part(parent: Node3D, mesh: Mesh, pos: Vector3, mat: Material, sc := Vector3.ONE) -> MeshInstance3D:
	return g._fc_part(parent,mesh,pos,mat,sc)

func build() -> void:
	root = Node3D.new()
	root.name = "SunDome"
	g.add_child(root)
	# ---- neon lattice: cyan struts, magenta accent bands ----
	var cyan: Array = []
	var pink: Array = []
	for m in MERIDIANS:
		var phi := TAU*float(m)/float(MERIDIANS)
		for s in SEGS:
			var t0 := (PI/2.0)*float(s)/float(SEGS)
			var t1 := (PI/2.0)*float(s+1)/float(SEGS)
			rib(cyan,pt(t0,phi),pt(t1,phi),0.4)
	for s in range(2,SEGS+1,2):
		var th := (PI/2.0)*float(s)/float(SEGS)
		for m in MERIDIANS:
			var p0 := TAU*float(m)/float(MERIDIANS)
			var p1 := TAU*float(m+1)/float(MERIDIANS)
			rib(pink if s == 4 or s == 8 else cyan,pt(th,p0),pt(th,p1),0.55 if s == 4 or s == 8 else 0.4)
	for s in range(0,SEGS-2,2):
		var ta := (PI/2.0)*float(s)/float(SEGS)
		var tb := (PI/2.0)*float(s+2)/float(SEGS)
		for m in MERIDIANS:
			var pa := TAU*float(m)/float(MERIDIANS)
			var pb := TAU*float(m+1)/float(MERIDIANS)
			rib(cyan,pt(ta,pa),pt(tb,pb),0.28)
	multimesh(cyan,Color("8ff3ff"))
	multimesh(pink,Color("ff5fd2"))
	# ---- tinted glass ----
	var sph := SphereMesh.new()
	sph.radius = R
	sph.height = R
	sph.is_hemisphere = true
	sph.radial_segments = 48
	sph.rings = 16
	var gm := StandardMaterial3D.new()
	gm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	gm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	gm.albedo_color = Color(0.55,0.85,1.0,0.07)
	gm.cull_mode = BaseMaterial3D.CULL_DISABLED
	var glass: MeshInstance3D = part(root,sph,c,gm,Vector3(1,H/R,1))
	glass.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	# ---- the Sun Core at the top: golden disc, counter-rotating neon rings, rays ----
	var sun := Node3D.new()
	sun.position = c+Vector3(0,H-1.2,0)
	root.add_child(sun)
	part(sun,g._fc_cone(6.0,6.0,0.3),Vector3.ZERO,g._fc_glow(Color("ffcf4a")))
	part(sun,g._fc_torus(7.4,8.0),Vector3.ZERO,g._fc_glow(Color("fff0b0")))
	for k in 16:
		var a := TAU*float(k)/16.0
		var long_ray := k % 2 == 0
		var ln := 12.0 if long_ray else 8.0
		var mi: MeshInstance3D = part(sun,BoxMesh.new(),Vector3(cos(a)*(8.5+ln*0.5),0,sin(a)*(8.5+ln*0.5)),g._fc_glow(Color("ffd978")),Vector3(ln,0.2,0.9 if long_ray else 0.6))
		mi.rotation.y = -a
	spin(sun,"y",120.0)
	var halo := Node3D.new()
	halo.position = c+Vector3(0,H-2.4,0)
	root.add_child(halo)
	var hr1: MeshInstance3D = part(halo,g._fc_torus(13.4,13.8),Vector3.ZERO,g._fc_glow(Color("4fe3ff")))
	hr1.rotation.x = 0.0
	var hr2: MeshInstance3D = part(halo,g._fc_torus(17.0,17.35),Vector3.ZERO,g._fc_glow(Color("ff5fd2")))
	hr2.rotation.x = 0.0
	spin(halo,"y",-80.0)
	# ---- chrome pylons with light beams around the rim ----
	for k in 12:
		var a := TAU*float(k)/12.0+PI/12.0
		var pp := c+Vector3(cos(a)*40.0,0,sin(a)*40.0)
		part(root,g._fc_cone(0.5,0.9,11.0),pp+Vector3(0,5.5,0),g._fc_chrome())
		part(root,g._fc_cone(0.18,0.18,11.0),pp+Vector3(cos(a)*0.55,5.5,sin(a)*0.55),g._fc_glow(Color("4fe3ff")))
		part(root,SphereMesh.new(),pp+Vector3(0,11.4,0),g._fc_glow(Color("fff0b0")),Vector3.ONE*1.1)
		part(root,g._fc_cone(0.25,0.55,9.0),pp+Vector3(0,16.0,0),g._fc_ghost(Color("8ff3ff")))
	# ---- floor inlays: rings and rays (rays stay clear of the Commons paths) ----
	for rr in [20.0,32.0,44.0]:
		var ring: MeshInstance3D = part(root,g._fc_torus(rr-0.2,rr+0.2),c+Vector3(0,0.15,0),g._fc_glow(Color("4fe3ff") if rr != 32.0 else Color("ff5fd2")),Vector3(1,0.3,1))
		ring.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	for side in [1.0,-1.0]:
		for deg in [45.0,60.0,75.0,105.0,120.0,135.0]:
			var a := deg_to_rad(deg)
			var dirv := Vector3(cos(a),0,sin(a)*side)
			var ray: MeshInstance3D = part(root,BoxMesh.new(),c+dirv*31.0+Vector3(0,0.15,0),g._fc_glow(Color("ffe9a8") if int(deg) % 30 == 0 else Color("8ff3ff")),Vector3(26.0,0.04,0.5))
			ray.rotation.y = -atan2(dirv.z,dirv.x)
	build_core()
	# ---- welcome signs where everyone arrives ----
	var s1: Label3D = g._sign("SUN DOME",c+Vector3(0,11.0,12.0),Color("8ff3ff"),90)
	s1.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	var s2: Label3D = g._sign("everyone meets here  ·  chat  ·  hourly challenge  ·  daily puzzle",c+Vector3(0,8.4,12.0),Color("fff6d8"),32)
	s2.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y

func build_core() -> void:
	# a hologram tower with the hourly terminal on its north side, and a ring of seats around it
	part(root,g._fc_cone(3.0,3.4,0.6),core+Vector3(0,0.3,0),g._fc_pearl())
	part(root,g._fc_torus(3.2,3.5),core+Vector3(0,0.65,0),g._fc_glow(Color("ff5fd2")))
	part(root,g._fc_cone(1.0,1.3,6.0),core+Vector3(0,3.4,0),g._fc_ghost(Color("4fe3ff")))
	part(root,g._fc_cone(0.18,0.18,9.0),core+Vector3(0,4.5,0),g._fc_glow(Color("fff0b0")))
	var rot := Node3D.new()
	rot.position = core+Vector3(0,8.0,0)
	root.add_child(rot)
	var r1: MeshInstance3D = part(rot,g._fc_torus(1.8,1.95),Vector3.ZERO,g._fc_glow(Color("4fe3ff")))
	r1.rotation.x = PI/2.0
	var r2: MeshInstance3D = part(rot,g._fc_torus(2.4,2.55),Vector3.ZERO,g._fc_glow(Color("ff5fd2")))
	r2.rotation.z = PI/2.0
	part(rot,BoxMesh.new(),Vector3.ZERO,g._fc_ghost(Color("ffd23f")),Vector3.ONE*1.3)
	spin(rot,"y",14.0)
	# terminal pedestal facing north (where the player stands)
	part(root,g._fc_cone(0.3,0.42,1.0),term+Vector3(0,0.5,0.55),g._fc_pearl())
	var scr: MeshInstance3D = part(root,BoxMesh.new(),term+Vector3(0,1.15,0.6),g._fc_glow(Color("7dffea")),Vector3(1.0,0.6,0.05))
	scr.rotation.x = 0.6
	g._collider(root,core+Vector3(0,0.9,0),Vector3(3.8,1.8,3.8))
	hr_sign = g._sign("HOURLY CHALLENGE",core+Vector3(0,12.2,0),Color("7dffea"),56)
	hr_sign.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	hr_sign.outline_size = 12
	# a glowing floor path from the arrival spot to the core, so newcomers find it
	var from := Vector3(c.x,0.16,c.z+14.0)
	var to := Vector3(c.x,0.16,core.z-5.0)
	part(root,BoxMesh.new(),(from+to)*0.5,g._fc_glow(Color("7dffea")),Vector3(0.35,0.04,to.z-from.z))
	# seats around the core (the hangout ring), facing in
	for k in 6:
		var a := PI/6.0+TAU*float(k)/6.0
		if absf(sin(a)+1.0) < 0.2:
			continue
		var bp := core+Vector3(cos(a)*8.6,0,sin(a)*8.6)
		g._cm_bench(root,bp,atan2(cos(a),sin(a)))
	var ring: MeshInstance3D = part(root,g._fc_torus(10.2,10.5),core+Vector3(0,0.15,0),g._fc_glow(Color("ff5fd2")),Vector3(1,0.3,1))
	ring.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

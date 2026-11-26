extends RefCounted
# v0.67 Infected Paris: zombie kinds, burning wrecks, barricades, safe zone, red infected sky, runner surge.
# Works for every outbreak world through outbreak.gd (o).

const SPEC := {
	"walker": [2.3,13.0,1.5,22.0],   # speed, notice range, bite reach, damage per second
	"runner": [3.9,18.0,1.4,15.0],
	"brute": [1.5,10.0,2.2,40.0],
}
const SAFE_R := 7.0

var o
var w
var g
var fires: Array = []       # [OmniLight3D, base energy, phase]
var surge := false
var amt := 0.0
var clk := 0.0
var sync := 0.0
var swapped: Array = []     # [MeshInstance3D, via mesh surface, original override]
var grass_orig := {}
var grass_mats: Array = []   # [material, original colour]
var crowns: Array = []       # [MultiMeshInstance3D, original override]

func _init(outbreak) -> void:
	o = outbreak
	w = o.w
	g = o.g

func post_local() -> Vector2:
	return Vector2(o.post_pos.x-w.C.x,o.post_pos.z-w.C.z)

func ash_ground() -> void:
	# Dead world: grass turns to grey ash, leaves to dry brown. Originals are kept and restored in clear().
	swapped.clear()
	grass_orig.clear()
	grass_mats.clear()
	crowns.clear()
	for hex in g.SURF_GRASS:
		if g.surf_mats.has(hex) and not grass_orig.has(hex):
			var gm: StandardMaterial3D = g.surf_mats[hex]
			grass_orig[hex] = gm.albedo_color
			gm.albedo_color = Color(0.62,0.58,0.62)
	var dead := StandardMaterial3D.new()
	dead.albedo_color = Color(0.33,0.28,0.17)
	dead.roughness = 0.95
	var stack: Array[Node] = [w.root]
	while stack.size() > 0:
		var nd: Node = stack.pop_back()
		if nd == o.props:
			continue
		stack.append_array(nd.get_children())
		if nd is MultiMeshInstance3D:
			var mmi := nd as MultiMeshInstance3D
			if mmi.multimesh != null and mmi.multimesh.use_colors and mmi.multimesh.mesh is SphereMesh:
				var tint := StandardMaterial3D.new()
				tint.vertex_color_use_as_albedo = true
				tint.albedo_color = Color(1.0,0.82,0.55)
				tint.roughness = 0.95
				crowns.append([mmi,mmi.material_override])
				mmi.material_override = tint
			continue
		if not (nd is MeshInstance3D):
			continue
		var mi := nd as MeshInstance3D
		if mi.mesh is ArrayMesh:
			var gm := mi.material_override as StandardMaterial3D
			if gm != null and gm.albedo_texture != null and mi.mesh.get_aabb().size.x > 100.0 and mi.mesh.get_aabb().size.y < 2.0 and gm.albedo_color.r > 0.8:
				grass_mats.append([gm,gm.albedo_color])
				gm.albedo_color = Color(0.62,0.58,0.62)
			continue
		if mi.mesh is BoxMesh:
			continue
		var sm := mi.material_override as StandardMaterial3D
		var via_mesh := false
		if sm == null and mi.mesh != null and mi.mesh.get_surface_count() > 0:
			sm = mi.mesh.surface_get_material(0) as StandardMaterial3D
			via_mesh = true
		if sm == null or sm.albedo_texture != null:
			continue
		var c := sm.albedo_color
		if not (c.g > c.r*1.08 and c.g > c.b*1.08):
			continue
		swapped.append([mi,via_mesh,mi.material_override])
		if via_mesh:
			mi.set_surface_override_material(0,dead)
		else:
			mi.material_override = dead

func reset() -> void:
	surge = false
	amt = 0.0
	clk = 0.0
	fires.clear()

func clear() -> void:
	fires.clear()
	for sw in swapped:
		if is_instance_valid(sw[0]):
			if bool(sw[1]):
				(sw[0] as MeshInstance3D).set_surface_override_material(0,null)
			else:
				(sw[0] as MeshInstance3D).material_override = sw[2]
	swapped.clear()
	for hx in grass_orig:
		if g.surf_mats.has(hx):
			(g.surf_mats[hx] as StandardMaterial3D).albedo_color = grass_orig[hx]
	grass_orig.clear()
	for gmx in grass_mats:
		(gmx[0] as StandardMaterial3D).albedo_color = gmx[1]
	grass_mats.clear()
	for cx in crowns:
		if is_instance_valid(cx[0]):
			(cx[0] as MultiMeshInstance3D).material_override = cx[1]
	crowns.clear()
	amt = 0.0
	if g != null and g.get("infect_amt") != null and float(g.infect_amt) != 0.0:
		g.infect_amt = 0.0
		g._daynight_apply(true)

func dress(parent: Node3D) -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = 6702
	var clues: Array = w.W["clues"]
	var rp: Vector2 = w.RET
	var bases: Array = [rp+Vector2(-6,-12),rp+Vector2(-6,12)]
	for c in clues:
		bases.append(c)
	var pal := [Color("4a3f3a"),Color("3b4a52"),Color("5a2e2a"),Color("34393d"),Color("52482e")]
	for k in 10:
		var b: Vector2 = bases[k%bases.size()]
		var a := rng.randf()*TAU
		var s: Vector2 = o.spot(b+Vector2(cos(a),sin(a))*rng.randf_range(7.0,20.0))
		if s.distance_to(post_local()) < SAFE_R+3.0:
			continue
		wreck(parent,s,rng.randf()*PI,pal[k%pal.size()],k%2==0)
	for k in 7:
		var b2: Vector2 = bases[(k*2+1)%bases.size()]
		var a2 := rng.randf()*TAU
		var s2: Vector2 = o.spot(b2+Vector2(cos(a2),sin(a2))*rng.randf_range(6.0,16.0))
		if s2.distance_to(post_local()) < SAFE_R+3.0:
			continue
		barricade(parent,s2,rng.randf()*PI)
	for c2 in bases:
		litter(parent,o.spot(c2),9,rng)
	ash_ground()
	safe_zone(parent)
	for off in [Vector2(-9,-9),Vector2(-9,9)]:
		var bs: Vector2 = o.spot(rp+off)
		var zn: Node3D = o.figure(parent,Vector3(bs.x,0,bs.y),Color("5a6a35"),Color("7f9a5c"),true)
		zn.scale = Vector3(1.45,1.45,1.45)
		o.zomb.append([zn,bs,"brute"])
		w.label(zn,"BRUTE",Vector3(0,2.5,0),Color("ff8a5a"),34)

func part(parent: Node3D, mesh: Mesh, pos: Vector3, col: Color, rough := 0.75, metal := 0.25) -> MeshInstance3D:
	var mi := MeshInstance3D.new()
	mi.mesh = mesh
	var m := StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = rough
	m.metallic = metal
	mi.material_override = m
	mi.position = pos
	parent.add_child(mi)
	return mi

func box(parent: Node3D, pos: Vector3, size: Vector3, col: Color, rough := 0.75, metal := 0.25) -> MeshInstance3D:
	var bm := BoxMesh.new()
	bm.size = size
	return part(parent,bm,pos,col,rough,metal)

func wreck(parent: Node3D, s: Vector2, yaw: float, col: Color, burning: bool) -> void:
	# A crashed car: sagging body, smashed dark glass, black scorch, a missing wheel, one door hanging open.
	var p := Vector3(s.x,0,s.y)
	g._hm(parent,p+Vector3(0,0.62,0),Vector3(4.2,0.9,1.9),col.darkened(0.2),true,yaw)
	var r := Node3D.new()
	r.position = p
	r.rotation = Vector3(0.0,yaw,randf_range(-0.07,0.07))
	parent.add_child(r)
	var dark := Color("0d0e10")
	box(r,Vector3(1.55,0.95,0),Vector3(1.0,0.12,1.8),col.darkened(0.35))                   # hood, sagging
	box(r,Vector3(-0.3,1.38,0),Vector3(2.0,0.62,1.7),col.darkened(0.3))                    # cabin
	box(r,Vector3(-0.3,1.72,0),Vector3(1.85,0.08,1.6),Color("17110d"),0.95,0.0)            # scorched roof
	box(r,Vector3(-0.3,1.4,0.86),Vector3(1.9,0.44,0.05),dark,0.1,0.6)                       # smashed glass
	box(r,Vector3(-0.3,1.4,-0.86),Vector3(1.9,0.44,0.05),dark,0.1,0.6)
	box(r,Vector3(0.72,1.4,0),Vector3(0.05,0.44,1.5),dark,0.1,0.6)
	box(r,Vector3(-1.32,1.4,0),Vector3(0.05,0.44,1.5),dark,0.1,0.6)
	box(r,Vector3(-2.12,0.7,0),Vector3(0.12,0.3,1.7),Color("20201f"),0.5,0.7)              # bumper hanging
	box(r,Vector3(2.14,0.62,0.55),Vector3(0.1,0.18,0.3),Color("e8e0b0"),0.3,0.0)            # dead headlight
	var door := box(r,Vector3(0.2,1.0,1.35),Vector3(1.1,0.7,0.07),col.darkened(0.25))       # open door
	door.rotation.x = 0.7
	var cm := CylinderMesh.new()
	cm.top_radius = 0.38
	cm.bottom_radius = 0.38
	cm.height = 0.32
	cm.radial_segments = 10
	for wx in [-1.35,1.35]:
		for wz in [-0.92,0.92]:
			if wx < 0 and wz > 0:
				continue
			var wh := part(r,cm,Vector3(wx,0.38,wz),Color("0f0f0f"),0.9,0.0)
			wh.rotation.x = PI*0.5
	var burn := box(r,Vector3(0.4,0.99,0.1),Vector3(3.0,0.03,1.2),Color("0a0807"),1.0,0.0)
	burn.rotation.y = 0.2
	if burning:
		fire(parent,p+Vector3(0.6,1.2,0))

func smoke(parent: Node3D, p: Vector3) -> void:
	var pm := CPUParticles3D.new()
	pm.position = p+Vector3(0,1.0,0)
	pm.amount = 14
	pm.lifetime = 3.6
	pm.direction = Vector3(0.25,1,0)
	pm.spread = 14.0
	pm.initial_velocity_min = 1.0
	pm.initial_velocity_max = 1.8
	pm.gravity = Vector3(0.5,0.4,0)
	pm.scale_amount_min = 0.8
	pm.scale_amount_max = 1.4
	var curve := Curve.new()
	curve.add_point(Vector2(0,0.3))
	curve.add_point(Vector2(1,2.6))
	pm.scale_amount_curve = curve
	var grad := Gradient.new()
	grad.set_color(0,Color(0.12,0.1,0.1,0.55))
	grad.set_color(1,Color(0.2,0.17,0.16,0.0))
	pm.color_ramp = grad
	var sm := SphereMesh.new()
	sm.radius = 0.6
	sm.height = 1.2
	sm.radial_segments = 8
	sm.rings = 4
	var mt := StandardMaterial3D.new()
	mt.vertex_color_use_as_albedo = true
	mt.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mt.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	sm.material = mt
	pm.mesh = sm
	pm.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	parent.add_child(pm)
	var em := CPUParticles3D.new()
	em.position = p+Vector3(0,1.0,0)
	em.amount = 10
	em.lifetime = 2.2
	em.direction = Vector3(0,1,0)
	em.spread = 35.0
	em.initial_velocity_min = 1.5
	em.initial_velocity_max = 3.2
	em.gravity = Vector3(0,0.3,0)
	var es := SphereMesh.new()
	es.radius = 0.05
	es.height = 0.1
	es.radial_segments = 4
	es.rings = 2
	es.material = g._fc_glow(Color("ff9a3a"))
	em.mesh = es
	em.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	parent.add_child(em)

func litter(parent: Node3D, c: Vector2, n: int, rng: RandomNumberGenerator) -> void:
	# blood stains, rubble and dropped bags around a hot spot
	for k in n:
		var a := rng.randf()*TAU
		var q := c+Vector2(cos(a),sin(a))*rng.randf_range(1.5,7.0)
		var kind := k%3
		if kind == 0:
			var cyl := CylinderMesh.new()
			var rr := rng.randf_range(0.5,1.5)
			cyl.top_radius = rr
			cyl.bottom_radius = rr
			cyl.height = 0.02
			cyl.radial_segments = 10
			part(parent,cyl,Vector3(q.x,0.1,q.y),Color(0.22,0.03,0.03),0.4,0.0)
		elif kind == 1:
			var sz := Vector3(rng.randf_range(0.2,0.7),rng.randf_range(0.15,0.5),rng.randf_range(0.2,0.6))
			var rb := box(parent,Vector3(q.x,sz.y*0.5,q.y),sz,Color(0.34,0.33,0.31).darkened(rng.randf()*0.3),0.95,0.0)
			rb.rotation.y = rng.randf()*PI
		else:
			var bag := box(parent,Vector3(q.x,0.16,q.y),Vector3(0.5,0.3,0.32),Color(0.2,0.25,0.3).lerp(Color(0.4,0.15,0.12),rng.randf()),0.9,0.0)
			bag.rotation.y = rng.randf()*PI

func barricade(parent: Node3D, s: Vector2, yaw: float) -> void:
	var p := Vector3(s.x,0,s.y)
	var side := Vector3(cos(yaw),0,-sin(yaw))
	g._hm(parent,p+Vector3(0,0.45,0),Vector3(3.4,0.9,0.5),Color("6b5d3f"),true,yaw)
	g._hm(parent,p+Vector3(0,1.15,0),Vector3(3.2,0.22,0.16),Color("8a7350"),false,yaw+0.06)
	g._hm(parent,p+Vector3(0,1.45,0),Vector3(3.0,0.22,0.16),Color("7a6445"),false,yaw-0.05)
	for sg in [-1.5,1.5]:
		g._hm(parent,p+side*float(sg)+Vector3(0,0.85,0),Vector3(0.16,1.7,0.16),Color("4e4130"),false,yaw)
	g._hm(parent,p+Vector3(0,1.7,0),Vector3(3.2,0.1,0.06),Color("e03a2a"),false,yaw)

func fire(parent: Node3D, p: Vector3) -> void:
	for k in 3:
		var h := 1.0+0.35*float(k)
		g._fc_part(parent,g._bcone(0.02,0.38-0.1*float(k),h),p+Vector3(0.18*float(k-1),h*0.5,0.12*float(1-k)),g._fc_glow(Color("ff7a1f") if k != 1 else Color("ffc23a")))
	var l := OmniLight3D.new()
	l.position = p+Vector3(0,1.3,0)
	l.light_color = Color("ff8a3a")
	l.light_energy = 2.2
	l.omni_range = 11.0
	l.shadow_enabled = false
	parent.add_child(l)
	smoke(parent,p)
	fires.append([l,2.2,float(fires.size())*1.7])

func safe_zone(parent: Node3D) -> void:
	var c := post_local()
	var ring := MeshInstance3D.new()
	var tm := TorusMesh.new()
	tm.inner_radius = SAFE_R-0.25
	tm.outer_radius = SAFE_R
	tm.rings = 48
	ring.mesh = tm
	var m := StandardMaterial3D.new()
	m.albedo_color = Color(0.3,1.0,0.5,0.55)
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	ring.material_override = m
	ring.scale = Vector3(1,0.02,1)
	ring.position = Vector3(c.x,0.12,c.y)
	parent.add_child(ring)
	w.label(parent,"SAFE ZONE",Vector3(c.x,4.0,c.y+3.0),Color("8dffb0"),44)

func spawn_runners() -> void:
	if o.props == null or g.player == null:
		return
	var p: Vector3 = g.player.position
	var lp := Vector2(p.x-w.C.x,p.z-w.C.z)
	var n := 3
	for k in n:
		var a := float(k)*TAU/float(n)+0.6
		var s: Vector2 = o.spot(lp+Vector2(cos(a),sin(a))*22.0)
		var zn: Node3D = o.figure(o.props,Vector3(s.x,0,s.y),Color("7a3a3a"),Color("a3b58a"),true)
		zn.scale = Vector3(0.95,0.95,0.95)
		o.zomb.append([zn,s,"runner"])
	if not w.dry:
		g._show_toast("THE INFECTED ARE SURGING! Runners are coming. Reach the SAFE ZONE to rest.")

func tick(delta: float) -> void:
	clk += delta
	amt = move_toward(amt,1.0,delta*0.35)
	sync += delta
	if sync > 0.3 and absf(amt-float(g.infect_amt)) > 0.004:
		sync = 0.0
		g.infect_amt = amt
		g._daynight_apply(true)
	for f in fires:
		if is_instance_valid(f[0]):
			(f[0] as OmniLight3D).light_energy = float(f[1])*(0.75+0.25*sin(clk*9.0+float(f[2]))+0.1*sin(clk*23.0+float(f[2])*2.0))
	if not surge and o.left < o.TIME*0.55:
		surge = true
		spawn_runners()

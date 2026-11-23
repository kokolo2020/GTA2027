extends Node
# v0.57 festive costumes: Santa, reindeer, angel, elf, snowman and funny hats. Everything is built
# from simple shapes (no model files) in the person's own space: feet at y=0, face towards -Z,
# head centre at y=1.545.

var g
var cache := {}

const HEAD_Y := 1.545

func _init(main) -> void:
	g = main

func mat(col: Color, glow := 0.0) -> StandardMaterial3D:
	var key := "%s_%s" % [col.to_html(),glow]
	if cache.has(key):
		return cache[key]
	var m := StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = 0.7
	if glow > 0.0:
		m.emission_enabled = true
		m.emission = col
		m.emission_energy_multiplier = glow
	cache[key] = m
	return m

func add(parent: Node3D, mesh: Mesh, pos: Vector3, m: Material) -> MeshInstance3D:
	var mi := MeshInstance3D.new()
	mi.mesh = mesh
	mi.material_override = m
	mi.position = pos
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	parent.add_child(mi)
	return mi

func box(parent: Node3D, pos: Vector3, size: Vector3, col: Color, glow := 0.0) -> MeshInstance3D:
	var b := BoxMesh.new()
	b.size = size
	return add(parent,b,pos,mat(col,glow))

func ball(parent: Node3D, pos: Vector3, size: Vector3, col: Color, glow := 0.0) -> MeshInstance3D:
	var s := SphereMesh.new()
	s.radius = 0.5
	s.height = 1.0
	s.radial_segments = 12
	s.rings = 6
	var mi := add(parent,s,pos,mat(col,glow))
	mi.scale = size
	return mi

func torus(parent: Node3D, pos: Vector3, r: float, tube: float, col: Color, glow := 0.0) -> MeshInstance3D:
	var t := TorusMesh.new()
	t.inner_radius = r-tube
	t.outer_radius = r+tube
	t.rings = 24
	t.ring_segments = 8
	return add(parent,t,pos,mat(col,glow))

func cyl(parent: Node3D, pos: Vector3, rt: float, rb: float, h: float, col: Color, glow := 0.0) -> MeshInstance3D:
	var c := CylinderMesh.new()
	c.top_radius = rt
	c.bottom_radius = rb
	c.height = h
	c.radial_segments = 16
	return add(parent,c,pos,mat(col,glow))

# A cone (or tapered rod) from a to b: radius ra at a, rb at b.
func rod(parent: Node3D, a: Vector3, b: Vector3, ra: float, rb: float, col: Color, glow := 0.0) -> MeshInstance3D:
	var d := b-a
	var c := CylinderMesh.new()
	c.top_radius = rb
	c.bottom_radius = ra
	c.height = d.length()
	c.radial_segments = 10
	var mi := add(parent,c,(a+b)*0.5,mat(col,glow))
	mi.basis = Basis(Quaternion(Vector3.UP,d.normalized()))
	return mi

# A flattened ellipsoid pointing along dir (a feather).
func feather(parent: Node3D, base: Vector3, dir: Vector3, length: float, width: float, col: Color, glow := 0.0) -> MeshInstance3D:
	var s := SphereMesh.new()
	s.radius = 0.5
	s.height = 1.0
	s.radial_segments = 10
	s.rings = 5
	var mi := add(parent,s,base+dir.normalized()*length*0.5,mat(col,glow))
	mi.basis = Basis(Quaternion(Vector3.UP,dir.normalized())).scaled_local(Vector3(width,length,0.018))
	return mi

# ---- the catalogue: [id, name, slot, price]. Suits also recolour the shirt and trousers.
const ITEMS := [
	["santa_hat","Santa Hat","head",300],
	["santa_suit","Santa Suit","suit",1500],
	["antlers","Reindeer Antlers","head",400],
	["reindeer_suit","Reindeer Outfit","suit",1200],
	["halo","Angel Halo","head",600],
	["wings","Angel Wings","back",1800],
	["angel_robe","Angel Robe","suit",900],
	["elf_hat","Elf Hat","head",300],
	["elf_suit","Elf Outfit","suit",1100],
	["snow_hat","Snowman Hat & Nose","head",500],
	["snowman_suit","Snowman Suit","suit",1000],
	["duck","Rubber Duck Hat","head",700],
	["propeller","Propeller Beanie","head",500],
	["gift_hat","Gift Box Hat","head",600],
	["tree_hat","Mini Tree Hat","head",800],
]

func suit_colors(id: String) -> Array:
	match id:
		"santa_suit": return [Color("c4152d"),Color("c4152d")]
		"reindeer_suit": return [Color("8a5a36"),Color("6b4226")]
		"angel_robe": return [Color("f6f3ec"),Color("f6f3ec")]
		"elf_suit": return [Color("1f8a3c"),Color("c4152d")]
		"snowman_suit": return [Color("ffffff"),Color("e3ecf7")]
	return []

func build(id: String) -> Node3D:
	var r := Node3D.new()
	r.name = "Fest_"+id
	var hy := HEAD_Y
	var white := Color("f8f8f8")
	var gold := Color("f0c75e")
	match id:
		"santa_hat":
			var base := Vector3(0,hy+0.085,0.0)
			var tip := base+Vector3(0,0.2,0.2)
			rod(r,base,tip,0.15,0.03,Color("d01a2e"))
			torus(r,base,0.15,0.035,white)
			ball(r,tip,Vector3.ONE*0.085,white)
		"santa_suit":
			box(r,Vector3(0,1.0,0),Vector3(0.5,0.07,0.3),Color("1b1b1f"))
			box(r,Vector3(0,1.0,-0.152),Vector3(0.1,0.085,0.02),gold,0.4)
			torus(r,Vector3(0,1.4,0),0.15,0.04,white)
			box(r,Vector3(0,1.22,-0.13),Vector3(0.07,0.38,0.02),white)
			ball(r,Vector3(0,hy-0.09,-0.1),Vector3(0.2,0.2,0.12),white)
			ball(r,Vector3(-0.045,hy-0.015,-0.125),Vector3(0.07,0.04,0.04),white)
			ball(r,Vector3(0.045,hy-0.015,-0.125),Vector3(0.07,0.04,0.04),white)
			for s in [-1.0,1.0]:
				torus(r,Vector3(float(s)*0.31,0.93,0),0.055,0.025,white)
		"antlers":
			for s in [-1.0,1.0]:
				var sf := float(s)
				var b := Vector3(sf*0.07,hy+0.1,0.0)
				var m1 := b+Vector3(sf*0.07,0.15,0.02)
				var tp := m1+Vector3(sf*0.03,0.12,0.0)
				var brown := Color("7a5230")
				rod(r,b,m1,0.014,0.011,brown)
				rod(r,m1,tp,0.011,0.007,brown)
				rod(r,b+Vector3(sf*0.035,0.075,0.01),b+Vector3(sf*0.15,0.12,-0.03),0.009,0.006,brown)
				rod(r,m1,m1+Vector3(sf*0.08,0.04,-0.03),0.009,0.006,brown)
				ball(r,m1+Vector3(sf*0.02,0.0,-0.02),Vector3.ONE*0.03,gold,0.6)
		"reindeer_suit":
			ball(r,Vector3(0,hy-0.01,-0.145),Vector3.ONE*0.075,Color("e02020"),1.4)
			for s in [-1.0,1.0]:
				var e := ball(r,Vector3(float(s)*0.15,hy+0.07,0.0),Vector3(0.08,0.14,0.04),Color("8a5a36"))
				e.rotation.z = -float(s)*0.6
				ball(r,Vector3(float(s)*0.15,hy+0.07,-0.018),Vector3(0.04,0.09,0.02),Color("f2b8a0")).rotation.z = -float(s)*0.6
			ball(r,Vector3(0,0.98,0.12),Vector3.ONE*0.13,white)
			torus(r,Vector3(0,1.4,0),0.14,0.022,Color("c4152d"))
			ball(r,Vector3(0,1.36,-0.14),Vector3.ONE*0.05,gold,0.6)
		"halo":
			var h := torus(r,Vector3(0,hy+0.26,0.0),0.115,0.016,gold,2.2)
			h.rotation.x = 0.12
		"wings":
			for s in [-1.0,1.0]:
				var sf := float(s)
				var pivot := Vector3(sf*0.09,1.28,0.12)
				for row in 2:
					for k in 6:
						var a := 0.35+float(k)*0.27
						var ln := (0.8-float(k)*0.07)*(1.0-0.28*float(row))
						var d := Vector3(sf*sin(a),cos(a)*0.75,0.18+float(row)*0.05)
						var f := feather(r,pivot+Vector3(0,-0.03*float(row),0.015*float(row)),d,ln,0.17,Color("fbfbff") if row == 0 else Color("e6ecf8"),0.25)
		"angel_robe":
			torus(r,Vector3(0,1.4,0),0.14,0.02,gold,0.5)
			box(r,Vector3(0,1.0,0),Vector3(0.5,0.05,0.3),gold,0.4)
		"elf_hat":
			var base := Vector3(0,hy+0.085,0.0)
			var tip := base+Vector3(0,0.22,0.24)
			rod(r,base,tip,0.15,0.025,Color("1f8a3c"))
			torus(r,base,0.15,0.03,Color("c4152d"))
			ball(r,tip,Vector3.ONE*0.06,gold,0.8)
			for s in [-1.0,1.0]:
				var sf := float(s)
				rod(r,Vector3(sf*0.125,hy-0.01,0.0),Vector3(sf*0.27,hy+0.09,0.0),0.035,0.004,Color("e8b890"))
		"elf_suit":
			box(r,Vector3(0,1.0,0),Vector3(0.5,0.07,0.3),Color("7a3b12"))
			box(r,Vector3(0,1.0,-0.152),Vector3(0.09,0.08,0.02),gold,0.4)
			torus(r,Vector3(0,1.4,0),0.15,0.03,Color("c4152d"))
			for k in 5:
				box(r,Vector3((float(k)-2.0)*0.07,1.4,-0.135),Vector3(0.035,0.04,0.02),white)
		"snow_hat":
			cyl(r,Vector3(0,hy+0.16,0),0.095,0.095,0.15,Color("1b1b1f"))
			cyl(r,Vector3(0,hy+0.09,0),0.16,0.16,0.02,Color("1b1b1f"))
			cyl(r,Vector3(0,hy+0.115,0),0.098,0.098,0.03,Color("c4152d"))
			rod(r,Vector3(0,hy-0.02,-0.12),Vector3(0,hy-0.035,-0.3),0.03,0.002,Color("ff7a1a"))
		"snowman_suit":
			torus(r,Vector3(0,1.4,0),0.145,0.035,Color("c4152d"))
			box(r,Vector3(-0.06,1.3,-0.14),Vector3(0.07,0.2,0.025),Color("c4152d"))
			for k in 3:
				ball(r,Vector3(0,1.22-float(k)*0.12,-0.125),Vector3.ONE*0.045,Color("1b1b1f"))
		"duck":
			ball(r,Vector3(0,hy+0.165,0.02),Vector3(0.2,0.14,0.22),Color("ffd21f"))
			ball(r,Vector3(0,hy+0.27,-0.05),Vector3.ONE*0.12,Color("ffd21f"))
			box(r,Vector3(0,hy+0.26,-0.125),Vector3(0.075,0.025,0.055),Color("ff8a1a"))
			for s in [-1.0,1.0]:
				ball(r,Vector3(float(s)*0.04,hy+0.285,-0.1),Vector3.ONE*0.022,Color("1b1b1f"))
			ball(r,Vector3(0,hy+0.19,0.15),Vector3(0.07,0.09,0.06),Color("ffd21f"))
		"propeller":
			var cols := [Color("e23b3b"),Color("3b8fe2"),Color("f2c230"),Color("3bbf6a")]
			for k in 4:
				var a := TAU*float(k)/4.0
				var q := ball(r,Vector3(sin(a)*0.06,hy+0.1,cos(a)*0.06),Vector3(0.15,0.13,0.15),cols[k])
			cyl(r,Vector3(0,hy+0.2,0),0.012,0.012,0.07,Color("dddddd"))
			var prop := Node3D.new()
			prop.name = "Prop"
			prop.position = Vector3(0,hy+0.24,0)
			r.add_child(prop)
			box(prop,Vector3.ZERO,Vector3(0.3,0.012,0.045),Color("ff5a5a"))
			box(prop,Vector3.ZERO,Vector3(0.045,0.012,0.3),Color("5ab0ff"))
			ball(r,Vector3(0,hy+0.245,0),Vector3.ONE*0.035,gold)
		"gift_hat":
			var red := Color("c4152d")
			box(r,Vector3(0,hy+0.17,0),Vector3(0.24,0.16,0.24),red)
			box(r,Vector3(0,hy+0.17,0),Vector3(0.05,0.165,0.245),gold,0.4)
			box(r,Vector3(0,hy+0.17,0),Vector3(0.245,0.165,0.05),gold,0.4)
			for s in [-1.0,1.0]:
				var l := ball(r,Vector3(float(s)*0.06,hy+0.285,0),Vector3(0.1,0.06,0.05),gold,0.4)
				l.rotation.z = float(s)*0.5
			ball(r,Vector3(0,hy+0.27,0),Vector3.ONE*0.04,gold,0.4)
		"tree_hat":
			var green := Color("1f7a3a")
			rod(r,Vector3(0,hy+0.09,0),Vector3(0,hy+0.22,0),0.15,0.09,green)
			rod(r,Vector3(0,hy+0.19,0),Vector3(0,hy+0.31,0),0.115,0.06,Color("2a9448"))
			rod(r,Vector3(0,hy+0.28,0),Vector3(0,hy+0.4,0),0.08,0.01,green)
			ball(r,Vector3(0,hy+0.41,0),Vector3.ONE*0.05,Color("ffd84a"),2.5)
			var oc := [Color("ff3b3b"),Color("4ad0ff"),Color("ffd84a"),Color("ff7be0")]
			for k in 8:
				var a := float(k)*2.3
				var hh := 0.11+float(k)*0.035
				var rr := 0.14-float(k)*0.011
				ball(r,Vector3(sin(a)*rr,hy+hh,cos(a)*rr),Vector3.ONE*0.026,oc[k % 4],2.2)
	return r

# Put a list of festive ids on person pp (replacing whatever festive pieces it wore).
func dress(pp: Dictionary, ids: Array) -> void:
	if pp.is_empty() or not pp.has("root"):
		return
	var root: Node3D = pp["root"]
	for old in pp.get("fest",[]):
		if is_instance_valid(old):
			(old as Node).queue_free()
	var made: Array = []
	for id in ids:
		var n := build(String(id))
		if String(id) in ["santa_hat","antlers","halo","elf_hat","snow_hat","duck","propeller","gift_hat","tree_hat"]:
			n.scale = Vector3.ONE*1.3
			n.position = Vector3(0,HEAD_Y,0)*(1.0-1.3)
		root.add_child(n)
		made.append(n)
	pp["fest"] = made

func spin(pp: Dictionary, t: float) -> void:
	for n in pp.get("fest",[]):
		if is_instance_valid(n):
			var p := (n as Node).get_node_or_null("Prop")
			if p != null:
				(p as Node3D).rotation.y = t*18.0

extends RefCounted
# v0.71: the Fruit Garden. The old Marina Heights island (south of downtown) keeps its three shops
# (showroom, style shop, paint shop), the fountain, yacht club and boardwalk, and is now covered in
# orchards, vines and crop rows of many kinds of fruit. Built once from MultiMeshes (a few draw calls),
# no collision, so walking and driving through are unchanged.

var g: Node3D
var root: Node3D
var rng := RandomNumberGenerator.new()
var parts := {}
var meshes := {}
var mat: StandardMaterial3D
var excl: Array = []
var total := 0

const TRUNK := Color("6b4a30")
const LEAF := Color("4f9a45")
const PATH := Color("e3d6b0")

func _init(main: Node3D) -> void:
	g = main
	rng.seed = 7171
	root = Node3D.new()
	root.name = "FruitGarden"
	g.add_child(root)
	mat = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.roughness = 0.9
	var c := CylinderMesh.new()
	c.top_radius = 0.5
	c.bottom_radius = 0.5
	c.height = 1.0
	c.radial_segments = 6
	c.rings = 0
	meshes["cyl"] = c
	var s := SphereMesh.new()
	s.radius = 0.5
	s.height = 1.0
	s.radial_segments = 6
	s.rings = 3
	meshes["sph"] = s
	var t := SphereMesh.new()
	t.radius = 0.5
	t.height = 1.0
	t.radial_segments = 4
	t.rings = 2
	meshes["tiny"] = t
	meshes["box"] = BoxMesh.new()
	# Places the garden must leave alone: x, z, width, depth.
	excl = [
		Rect2(-9,108,18,140), Rect2(-110,144,220,12), Rect2(-110,199,220,12),
		Rect2(-54,110,36,37), Rect2(17,110,37,37), Rect2(17,160,37,37),
		Rect2(-55,165,40,26), Rect2(-78,216,32,20), Rect2(39,210,62,23), Rect2(10,230,12,12),
		Rect2(-90,120,16,16), Rect2(74,120,16,16), Rect2(-90,170,16,16), Rect2(74,170,16,16),
		Rect2(-16.5,108,5,140), Rect2(11.5,108,5,140),
	]
	_reset()
	_ground()
	_build()

func _reset() -> void:
	parts = {"cyl":[],"sph":[],"tiny":[],"box":[]}

func _ground() -> void:
	var mi := MeshInstance3D.new()
	var b := BoxMesh.new()
	b.size = Vector3(208,0.04,132)
	mi.mesh = b
	mi.position = Vector3(0,0.0,176)
	mi.material_override = g._surface_material(Color("78a06b"),"grass")
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mi)

func _tint(c: Color, a := 0.1) -> Color:
	var v := rng.randf_range(-a,a)
	return c.lightened(v) if v > 0.0 else c.darkened(-v)

func _add(kind: String, pos: Vector3, sc: Vector3, col: Color, rot := Vector3.ZERO) -> void:
	var b := Basis.from_euler(rot) * Basis.from_scale(sc)
	(parts[kind] as Array).append([Transform3D(b,pos),col])

func _flush(label: String) -> void:
	for kind in parts:
		var arr: Array = parts[kind]
		if arr.is_empty():
			continue
		var mm := MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.use_colors = true
		mm.mesh = meshes[kind]
		mm.instance_count = arr.size()
		for i in arr.size():
			mm.set_instance_transform(i,arr[i][0])
			mm.set_instance_color(i,arr[i][1])
		var mmi := MultiMeshInstance3D.new()
		mmi.name = "%s_%s" % [label,kind]
		mmi.multimesh = mm
		mmi.material_override = mat
		mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		mmi.visibility_range_end = 700.0
		root.add_child(mmi)
		total += arr.size()
	_reset()

func _ok(x: float, z: float, m := 1.5) -> bool:
	if absf(x) > 100.0 or z < 111.0 or z > 240.0:
		return false
	var p := Vector2(x,z)
	for r in excl:
		if (r as Rect2).grow(m).has_point(p):
			return false
	return true

func _dir() -> Vector3:
	var a := rng.randf()*TAU
	var yy := rng.randf_range(-0.15,0.95)
	var rr := sqrt(1.0-yy*yy)
	return Vector3(cos(a)*rr,yy,sin(a)*rr)

func _build() -> void:
	var blocks := [
		[-102.0,-77.0,110.0,176.0,"mango","MANGO ORCHARD"],
		[-102.0,-77.0,176.0,242.0,"coconut","COCONUT GROVE"],
		[-77.0,-52.0,110.0,176.0,"orange","ORANGE ORCHARD"],
		[-77.0,-52.0,176.0,242.0,"banana","BANANA PLANTATION"],
		[-52.0,-17.0,110.0,170.0,"strawberry","STRAWBERRY FIELD"],
		[-52.0,-17.0,170.0,206.0,"lemon","LEMON GROVE"],
		[-52.0,-17.0,206.0,242.0,"peach","PEACH ORCHARD"],
		[17.0,53.0,110.0,170.0,"apple","APPLE ORCHARD"],
		[17.0,53.0,170.0,242.0,"pineapple","PINEAPPLE ROWS"],
		[53.0,77.0,110.0,176.0,"dragon","DRAGON FRUIT"],
		[53.0,77.0,176.0,242.0,"papaya","PAPAYA GROVE"],
		[77.0,102.0,110.0,176.0,"grapes","VINEYARD"],
		[77.0,102.0,176.0,242.0,"watermelon","MELON PATCH"],
	]
	for b in blocks:
		var x0: float = b[0]
		var x1: float = b[1]
		var z0: float = b[2]
		var z1: float = b[3]
		var fruit: String = b[4]
		_block(x0,x1,z0,z1,fruit)
		_flush(fruit)
		var cx := (x0+x1)*0.5
		var cz := (z0+z1)*0.5
		if _ok(cx,cz,0.5) or fruit in ["strawberry","pineapple","grapes"]:
			g._sign(String(b[5]),Vector3(cx,9.5,cz),Color("fff1b0"),80)
		else:
			g._sign(String(b[5]),Vector3(cx,9.5,z0+14.0),Color("fff1b0"),80)
	_extras()
	_flush("extras")
	g._sign("FRUIT GARDEN",Vector3(0,11.2,112),Color("ffe38a"),130)

func _block(x0: float, x1: float, z0: float, z1: float, fruit: String) -> void:
	match fruit:
		"grapes":
			_grapes(x0,x1,z0,z1)
		"strawberry", "pineapple":
			_rows(x0,x1,z0,z1,fruit)
		_:
			var sp: float = {"mango":8.0,"coconut":7.0,"orange":6.5,"banana":4.5,"lemon":6.0,"peach":6.0,"apple":6.0,"dragon":5.5,"papaya":5.5,"watermelon":4.5}[fruit]
			var z := z0+sp*0.5
			while z < z1:
				var x := x0+sp*0.5
				while x < x1:
					var px := x+rng.randf_range(-0.5,0.5)
					var pz := z+rng.randf_range(-0.5,0.5)
					if _ok(px,pz,2.0):
						_plant(fruit,Vector3(px,0.02,pz))
					x += sp
				z += sp

func _plant(fruit: String, p: Vector3) -> void:
	match fruit:
		"mango": _round_tree(p,Color("3f8a3c"),Color("f2a33a"),rng.randf_range(5.0,5.8),9,0.55)
		"orange": _round_tree(p,Color("4f9a45"),Color("f08a1e"),rng.randf_range(3.8,4.4),10,0.55)
		"lemon": _round_tree(p,Color("5aa64a"),Color("f4e040"),rng.randf_range(3.6,4.2),10,0.5)
		"apple": _round_tree(p,Color("4c9440"),Color("d9302c"),rng.randf_range(3.8,4.4),10,0.5)
		"peach": _round_tree(p,Color("7cb86a").lerp(Color("f2a8c0"),0.35),Color("f6a07a"),rng.randf_range(3.8,4.4),9,0.55)
		"coconut": _palm(p)
		"banana": _banana(p)
		"papaya": _papaya(p)
		"dragon": _dragon(p)
		"watermelon": _melon(p)

func _round_tree(p: Vector3, leaf: Color, fruit: Color, size: float, nfruit: int, fsz: float) -> void:
	var h := rng.randf_range(1.7,2.2)
	_add("cyl",p+Vector3(0,h*0.5,0),Vector3(0.5,h,0.5),_tint(TRUNK,0.08))
	var cy := h+size*0.32
	var lc := _tint(leaf.lightened(0.12),0.08)
	_add("sph",p+Vector3(0,cy,0),Vector3(size,size*0.8,size),lc)
	for k in 2:
		var a := rng.randf()*TAU
		_add("sph",p+Vector3(cos(a)*size*0.3,cy-size*0.08,sin(a)*size*0.3),Vector3(size*0.7,size*0.55,size*0.7),_tint(leaf,0.1))
	var fb := fsz*1.8
	for i in nfruit+4:
		var d := _dir()
		var fp := p+Vector3(0,cy,0)+Vector3(d.x*size*0.48,d.y*size*0.4,d.z*size*0.48)
		_add("tiny",fp,Vector3(fb,fb,fb),_tint(fruit,0.12))

func _palm(p: Vector3) -> void:
	var yaw := rng.randf()*TAU
	var lean := rng.randf_range(-0.12,0.12)
	var top := p
	for i in 5:
		var off := Vector3(cos(yaw),0,sin(yaw))*lean*float(i*i)*0.4
		var w := 0.55-0.04*float(i)
		_add("cyl",p+off+Vector3(0,float(i)*1.5+0.75,0),Vector3(w,1.55,w),_tint(Color("8a6a48"),0.06))
		top = p+off+Vector3(0,float(i)*1.5+1.5,0)
	for k in 8:
		var th := float(k)*TAU/8.0+rng.randf()*0.3
		var d := Vector3(sin(th),0,cos(th))
		_add("box",top+d*2.0+Vector3(0,-0.3,0),Vector3(0.7,0.1,4.4),_tint(Color("3f8c3a"),0.1),Vector3(0.5,th,0))
	for k in 3:
		_add("tiny",top+Vector3(rng.randf_range(-0.4,0.4),-0.55,rng.randf_range(-0.4,0.4)),Vector3(0.62,0.62,0.62),Color("7a5a2c"))

func _banana(p: Vector3) -> void:
	var h := rng.randf_range(2.6,3.2)
	_add("cyl",p+Vector3(0,h*0.5,0),Vector3(0.45,h,0.45),Color("a5c46e"))
	var top := p+Vector3(0,h,0)
	for k in 5:
		var th := float(k)*TAU/5.0+rng.randf()*0.5
		var d := Vector3(sin(th),0,cos(th))
		_add("box",top+d*1.5+Vector3(0,0.35,0),Vector3(1.1,0.07,3.6),_tint(Color("5fa845"),0.1),Vector3(-0.45,th,0))
	var bd := rng.randf()*TAU
	var bv := Vector3(sin(bd),0,cos(bd))*0.75
	for k in 6:
		_add("sph",top+bv+Vector3(rng.randf_range(-0.2,0.2),-0.55-0.12*float(k % 3),rng.randf_range(-0.2,0.2)),Vector3(0.34,0.8,0.34),_tint(Color("f2d433"),0.06))
	_add("sph",top+bv+Vector3(0,-1.35,0),Vector3(0.45,0.6,0.45),Color("7a2a5a"))

func _papaya(p: Vector3) -> void:
	var h := rng.randf_range(3.0,3.6)
	_add("cyl",p+Vector3(0,h*0.5,0),Vector3(0.42,h,0.42),Color("b89a6a"))
	var top := p+Vector3(0,h,0)
	for k in 6:
		var th := float(k)*TAU/6.0+rng.randf()*0.4
		var d := Vector3(sin(th),0,cos(th))
		_add("box",top+d*1.05+Vector3(0,0.25,0),Vector3(0.7,0.08,2.3),_tint(Color("4f9a45"),0.1),Vector3(-0.2,th,0))
	for k in 4:
		var a := float(k)*TAU/4.0
		_add("sph",top+Vector3(cos(a)*0.45,-0.45,sin(a)*0.45),Vector3(0.55,0.9,0.55),_tint(Color("f0922a"),0.08))

func _dragon(p: Vector3) -> void:
	_add("cyl",p+Vector3(0,1.2,0),Vector3(0.5,2.4,0.5),Color("9a9488"))
	var top := p+Vector3(0,2.6,0)
	_add("sph",top,Vector3(2.6,1.0,2.6),_tint(Color("5f9a52"),0.08))
	for k in 4:
		var th := float(k)*TAU/4.0+rng.randf()*0.5
		var d := Vector3(sin(th),0,cos(th))
		_add("cyl",top+d*1.4+Vector3(0,-0.5,0),Vector3(0.32,1.7,0.32),Color("5a9450"))
	for k in 5:
		var d := _dir()
		_add("tiny",top+Vector3(d.x*1.2,-0.15+d.y*0.2,d.z*1.2),Vector3(0.55,0.65,0.55),_tint(Color("e0307a"),0.08))

func _melon(p: Vector3) -> void:
	var gcol := _tint(Color("3f8a45"),0.12)
	_add("sph",p+Vector3(0,0.5,0),Vector3(1.4,1.0,1.2),gcol,Vector3(0,rng.randf()*TAU,0))
	_add("sph",p+Vector3(0.9,0.28,0.6),Vector3(0.7,0.5,0.7),gcol)
	for k in 2:
		var th := rng.randf()*TAU
		_add("box",p+Vector3(sin(th),0.06,cos(th))*1.4,Vector3(0.9,0.05,0.9),Color("5aa84a"),Vector3(0,th,0))

func _rows(x0: float, x1: float, z0: float, z1: float, fruit: String) -> void:
	var rsp := 3.2 if fruit == "strawberry" else 3.6
	var psp := 1.5 if fruit == "strawberry" else 2.1
	var z := z0+1.6
	while z < z1:
		var x := x0+1.4
		while x < x1:
			if _ok(x,z,1.0):
				var p := Vector3(x,0.02,z)
				_add("box",p+Vector3(0,0.15,0),Vector3(psp,0.3,1.4),Color("5a3b28"))
				if fruit == "strawberry":
					_add("sph",p+Vector3(0,0.5,0),Vector3(0.85,0.5,0.85),_tint(Color("4f9a45"),0.1))
					_add("tiny",p+Vector3(0.3,0.42,0.28),Vector3(0.24,0.24,0.24),Color("d6283a"))
					_add("tiny",p+Vector3(-0.28,0.4,-0.3),Vector3(0.24,0.24,0.24),Color("d6283a"))
				else:
					_add("sph",p+Vector3(0,0.75,0),Vector3(0.85,1.0,0.85),_tint(Color("e8b83a"),0.08))
					_add("box",p+Vector3(0,1.4,0),Vector3(0.18,0.8,0.18),Color("4f9a45"),Vector3(0.2,0,0.2))
					_add("box",p+Vector3(0,1.4,0),Vector3(0.18,0.8,0.18),Color("5aa84a"),Vector3(-0.2,0,-0.2))
			x += psp
		z += rsp

func _grapes(x0: float, x1: float, z0: float, z1: float) -> void:
	var z := z0+3.0
	while z < z1:
		var x := x0+2.0
		while x < x1-1.0:
			if _ok(x,z,1.2):
				_add("sph",Vector3(x,2.0,z),Vector3(1.8,1.5,1.1),_tint(Color("4f9a45"),0.1))
				_add("tiny",Vector3(x+rng.randf_range(-0.5,0.5),1.3,z+0.3),Vector3(0.4,0.6,0.4),Color("5a2a82"))
				_add("tiny",Vector3(x+rng.randf_range(-0.5,0.5),1.25,z-0.3),Vector3(0.4,0.6,0.4),Color("6a3a92"))
				_add("box",Vector3(x,2.55,z),Vector3(1.7,0.07,0.07),Color("8a8a8a"))
				if int(roundf((x-x0)/1.7)) % 3 == 0:
					_add("cyl",Vector3(x,1.3,z),Vector3(0.22,2.6,0.22),TRUNK)
			x += 1.7
		z += 5.5

func _extras() -> void:
	# Paths between the blocks.
	for x in [-77.0,-52.0,53.0,77.0]:
		_add("box",Vector3(x,0.03,176),Vector3(2.0,0.02,132),PATH)
	_add("box",Vector3(-59.5,0.03,176),Vector3(85,0.02,2.0),PATH)
	_add("box",Vector3(59.5,0.03,176),Vector3(85,0.02,2.0),PATH)
	# Flower ring around the fountain plaza.
	var fc := [Color("e8559a"),Color("f2d046"),Color("ffffff"),Color("e8685a"),Color("a070e0")]
	for i in 36:
		var a := float(i)*TAU/36.0
		var rx := cos(a)*12.5
		var rz := sin(a)*12.5
		_add("sph",Vector3(-35.0+rx,0.35,178.0+rz),Vector3(0.9,0.5,0.9),Color("4f9a45"))
		_add("tiny",Vector3(-35.0+rx,0.7,178.0+rz),Vector3(0.45,0.45,0.45),fc[i % 5])
	# Fruit crates at path corners.
	var spots := [Vector3(-79.5,0,158),Vector3(-54.5,0,158),Vector3(54.5,0,158),Vector3(79.5,0,158),Vector3(-79.5,0,214),Vector3(79.5,0,238),Vector3(54.5,0,238),Vector3(-54.5,0,238),Vector3(-79.5,0,238),Vector3(79.5,0,130)]
	var cols := [Color("f2a33a"),Color("d9302c"),Color("f4e040"),Color("f08a1e"),Color("6a3a92")]
	for i in spots.size():
		var sp: Vector3 = spots[i]
		if not _ok(sp.x,sp.z,0.5):
			continue
		_add("box",sp+Vector3(0,0.4,0),Vector3(1.6,0.8,1.1),Color("9a7448"))
		for k in 5:
			_add("tiny",sp+Vector3(-0.55+0.28*float(k),0.9,rng.randf_range(-0.2,0.2)),Vector3(0.4,0.4,0.4),cols[(i+k) % 5])

extends RefCounted
# v0.70: what the Sky view sees beyond the city: open sea to the horizon, far mountains and boats.
# Everything here is hidden unless the Sky view is on, so normal play pays nothing for it.

var g: Node3D
var root: Node3D
var boats: Array = []
var t := 0.0
const C := Vector3(80.0,0.0,0.0)

func _init(main: Node3D) -> void:
	g = main
	root = Node3D.new()
	root.name = "Horizon"
	root.visible = false
	g.add_child(root)
	_sea()
	_mountains()
	_boats()

func _mat(col: Color, rough := 0.9, metal := 0.0) -> StandardMaterial3D:
	var m := StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = rough
	m.metallic = metal
	return m

func _part(mesh: Mesh, pos: Vector3, mat: Material, parent: Node3D = null) -> MeshInstance3D:
	var mi := MeshInstance3D.new()
	mi.mesh = mesh
	mi.position = pos
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	(parent if parent != null else root).add_child(mi)
	return mi

func _sea() -> void:
	var p := PlaneMesh.new()
	p.size = Vector2(16000.0,16000.0)
	var m := _mat(Color("248caa"),0.35,0.0)
	_part(p,C+Vector3(0,-0.95,0),m)

func _mountains() -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = 7070
	var cols := [Color("3c4c80"),Color("46568c"),Color("34447a")]
	for i in 34:
		var a := TAU*float(i)/34.0+rng.randf_range(-0.07,0.07)
		var r := rng.randf_range(1900.0,2700.0)
		var h := rng.randf_range(130.0,330.0)
		var w := rng.randf_range(200.0,480.0)
		var c := CylinderMesh.new()
		c.top_radius = 0.0
		c.bottom_radius = w
		c.height = h
		c.radial_segments = 7
		c.rings = 1
		var mi := _part(c,C+Vector3(cos(a)*r,h*0.5-3.0,sin(a)*r),_mat(cols[i % 3],1.0))
		mi.rotation.y = rng.randf()*TAU

func _boats() -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = 4242
	for i in 9:
		var b := Node3D.new()
		root.add_child(b)
		var hull := BoxMesh.new()
		hull.size = Vector3(7.0,2.0,22.0)
		_part(hull,Vector3(0,0.2,0),_mat(Color("f2f4f8"),0.3,0.2),b)
		var cab := BoxMesh.new()
		cab.size = Vector3(5.0,3.0,8.0)
		_part(cab,Vector3(0,2.6,2.0),_mat(Color("dfe6ee"),0.3,0.1),b)
		var glow := BoxMesh.new()
		glow.size = Vector3(5.2,0.9,8.2)
		_part(glow,Vector3(0,3.0,2.0),_mat(Color("ffd9a0"),0.4),b)
		var wake := PrismMesh.new()
		wake.size = Vector3(12.0,0.1,70.0)
		var wm := _mat(Color(1,1,1,0.5),0.8)
		wm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		wm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		var wk := _part(wake,Vector3(0,-0.7,46.0),wm,b)
		wk.rotation.x = PI/2.0
		boats.append({"node":b,"r":rng.randf_range(920.0,1500.0),"a":rng.randf()*TAU,"s":rng.randf_range(10.0,22.0)*(1.0 if i % 2 == 0 else -1.0)})

func tick(delta: float) -> void:
	root.visible = g.sky_cam
	if not root.visible:
		return
	t += delta
	for bd in boats:
		bd["a"] = float(bd["a"])+float(bd["s"])/float(bd["r"])*delta
		var a: float = bd["a"]
		var n: Node3D = bd["node"]
		n.position = C+Vector3(cos(a)*float(bd["r"]),-0.3+sin(t*1.3+a*5.0)*0.25,sin(a)*float(bd["r"]))
		n.rotation.y = -a+(0.0 if float(bd["s"]) > 0.0 else PI)

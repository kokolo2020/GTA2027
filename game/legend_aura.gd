extends RefCounted
# v0.77: reaching the top level (40) gives the character a golden glow: two spinning ground rings,
# a floating halo, rising sparkles and a warm light. Local player only. Cheap enough for the phone.

const GOLD := Color("ffc93c")
const DEEP := Color("ff9a1f")
const FOOT_Y := -0.85

var g
var root: Node3D
var ring_a: MeshInstance3D
var ring_b: MeshInstance3D
var halo: MeshInstance3D
var light: OmniLight3D
var sparks: CPUParticles3D
var t := 0.0
var check_t := 0.0
var force := false     # tests

func _init(main) -> void:
	g = main

func is_max() -> bool:
	return force or (g.player != null and g._level() >= g._level_table().size())

func tick(delta: float) -> void:
	if g.player == null:
		return
	check_t -= delta
	if check_t <= 0.0:
		check_t = 1.0
		var want := is_max()
		if want and root == null:
			build()
		if root != null:
			root.visible = want and g.player.visible
	if root == null or not root.visible:
		return
	t += delta
	ring_a.rotation.y += delta*1.4
	ring_b.rotation.y -= delta*2.2
	var pulse := 1.0+sin(t*3.0)*0.06
	ring_a.scale = Vector3(pulse,1,pulse)
	ring_b.scale = Vector3(2.0-pulse,1,2.0-pulse)
	halo.rotation.y += delta*1.8
	halo.position.y = 1.0+sin(t*2.0)*0.05
	light.light_energy = 0.9+sin(t*4.0)*0.25

func build() -> void:
	root = Node3D.new()
	root.name = "LegendAura"
	g.player.add_child(root)
	var glow: StandardMaterial3D = g._fc_glow(GOLD)
	var deep: StandardMaterial3D = g._fc_glow(DEEP)
	ring_a = _ring(1.0,1.16,FOOT_Y+0.35,glow)
	ring_b = _ring(0.82,0.94,FOOT_Y+0.95,deep)
	halo = _ring(0.30,0.40,1.05,glow)
	var shell := MeshInstance3D.new()
	var cap := CapsuleMesh.new()
	cap.radius = 0.62
	cap.height = 2.0
	cap.radial_segments = 16
	cap.rings = 4
	var sm := StandardMaterial3D.new()
	sm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	sm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	sm.albedo_color = Color(1.0,0.78,0.2,0.16)
	sm.cull_mode = BaseMaterial3D.CULL_FRONT
	cap.material = sm
	shell.mesh = cap
	shell.position = Vector3(0,0.1,0)
	shell.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(shell)
	halo.rotation.x = deg_to_rad(12)
	light = OmniLight3D.new()
	light.light_color = GOLD
	light.omni_range = 5.0
	light.position = Vector3(0,0.2,0)
	root.add_child(light)
	sparks = CPUParticles3D.new()
	sparks.amount = 40
	sparks.lifetime = 1.8
	sparks.position = Vector3(0,FOOT_Y+0.1,0)
	sparks.emission_shape = CPUParticles3D.EMISSION_SHAPE_SPHERE
	sparks.emission_sphere_radius = 0.8
	sparks.direction = Vector3(0,1,0)
	sparks.spread = 12.0
	sparks.gravity = Vector3(0,0.6,0)
	sparks.initial_velocity_min = 0.7
	sparks.initial_velocity_max = 1.4
	sparks.scale_amount_min = 0.5
	sparks.scale_amount_max = 1.2
	var m := SphereMesh.new()
	m.radius = 0.06
	m.height = 0.12
	m.radial_segments = 6
	m.rings = 3
	m.material = glow
	sparks.mesh = m
	root.add_child(sparks)

func _ring(inner: float, outer: float, y: float, mat: Material) -> MeshInstance3D:
	var mi := MeshInstance3D.new()
	mi.mesh = g._fc_torus(inner,outer)
	mi.material_override = mat
	mi.position = Vector3(0,y,0)
	mi.scale = Vector3(1,0.6,1)
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mi)
	return mi

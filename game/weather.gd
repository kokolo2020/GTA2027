# v0.58 Weather: rain showers over Chit Chat City. Showers come at random (about one 10-minute slot in
# four, each lasting 2 to 5 minutes) but follow the clock, so everyone online sees the same weather.
# Rain falls around the camera (never under a roof), the sky greys over and the streets turn wet and shiny.
# No rain sound. Menu > Settings > Weather switches it off. Start with --rain to force rain (screenshots).
# `g` is the main script. No `:=` on anything read from `g` (it is a Variant).
extends Node

const SLOT := 600.0        # the clock is cut into 10-minute slots; some of them get a shower
const CHANCE := 0.25       # share of slots with rain
const FADE := 20.0         # seconds to build up and to clear

var g
var drops: GPUParticles3D
var amt := 0.0              # 0 dry .. 1 full rain
var cover := 0.0            # 1 = the player is under a roof (no drops, quieter)
var check_t := 0.0
var apply_t := 0.0
var last_applied := -1.0
var forced := false
var enabled := true
var lite := false

func _init(g_main) -> void:
	g = g_main

func _ready() -> void:
	var args := OS.get_cmdline_user_args()
	forced = "--rain" in args
	# Tests and developer screenshot modes stay dry (so their pictures and checks do not change) unless --rain.
	for a in args:
		if String(a).begins_with("--") and not String(a).begins_with("--autoplay") and a != "--rain":
			enabled = forced
	lite = OS.has_feature("android") or OS.has_feature("web") or "--web-lite" in args
	_build_drops()

func _hash01(n: int, salt: int) -> float:
	return float(abs(hash(Vector2i(n,salt))) % 10000)/10000.0

func target() -> float:
	if not enabled:
		return 0.0
	if forced:
		return 1.0
	if not g.weather_on:
		return 0.0
	var now := Time.get_unix_time_from_system()
	var slot := int(now/SLOT)
	if _hash01(slot,11) > CHANCE:
		return 0.0
	# this slot has a shower: a random length (2 to 5 minutes) starting at a random moment inside it
	var length := lerpf(120.0,300.0,_hash01(slot,23))
	var start := (SLOT-length)*_hash01(slot,37)
	var t := fposmod(now,SLOT)-start
	if t < 0.0 or t > length:
		return 0.0
	return clampf(minf(t,length-t)/FADE,0.0,1.0)

func _build_drops() -> void:
	drops = GPUParticles3D.new()
	drops.amount = 900 if lite else 2600
	drops.lifetime = 0.75
	drops.local_coords = false
	drops.emitting = false
	drops.visibility_aabb = AABB(Vector3(-40,-40,-40),Vector3(80,80,80))
	drops.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	var pm := ParticleProcessMaterial.new()
	pm.emission_shape = ParticleProcessMaterial.EMISSION_SHAPE_BOX
	pm.emission_box_extents = Vector3(18,0.5,18)
	pm.direction = Vector3(0.06,-1,0.02)
	pm.spread = 2.0
	pm.initial_velocity_min = 24.0
	pm.initial_velocity_max = 30.0
	pm.gravity = Vector3(0,-6,0)
	drops.process_material = pm
	var quad := QuadMesh.new()
	quad.size = Vector2(0.022,0.62)
	var mat := StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.albedo_color = Color(0.82,0.88,0.96,0.34)
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.disable_receive_shadows = true
	quad.material = mat
	drops.draw_pass_1 = quad
	g.add_child(drops)

func under_roof() -> bool:
	if g.player == null:
		return false
	var from: Vector3 = g.player.global_position+Vector3(0,2.2,0)
	if g.camera != null and (g.sky_riding or g.driving):
		from = g.camera.global_position+Vector3(0,0.5,0)
	var q := PhysicsRayQueryParameters3D.create(from,from+Vector3(0,90,0))
	var ex: Array[RID] = []
	ex.append(g.player.get_rid())
	q.exclude = ex
	var hit: Dictionary = g.get_world_3d().direct_space_state.intersect_ray(q)
	return not hit.is_empty()

func _physics_process(delta: float) -> void:
	if g.camera == null or not g.booted:
		return
	var want := target()
	amt = move_toward(amt,want,delta/1.5)
	check_t -= delta
	if check_t <= 0.0:
		check_t = 0.3
		var roofed := under_roof() if amt > 0.01 else false
		cover = move_toward(cover,1.0 if roofed else 0.0,0.34)
	var falling := amt > 0.03 and cover < 0.5
	if drops.emitting != falling:
		drops.emitting = falling
	if falling:
		var fwd: Vector3 = -g.camera.global_basis.z
		fwd.y = 0.0
		drops.global_position = g.camera.global_position+fwd.normalized()*9.0+Vector3(0,13.0,0)
		drops.amount_ratio = clampf(amt,0.15,1.0)
	# sky, light and wet streets (a few times a second is plenty)
	apply_t -= delta
	if apply_t <= 0.0 and absf(amt-last_applied) > 0.004:
		apply_t = 0.2
		last_applied = amt
		g.rain_amt = amt
		g._daynight_apply(true)
		for m in g.road_mats:
			var rm: StandardMaterial3D = m
			rm.roughness = lerpf(0.62,0.08,amt)
			rm.metallic_specular = lerpf(0.3,0.95,amt)

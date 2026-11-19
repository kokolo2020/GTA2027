extends Node3D
## Harbor City: original single-player driving prototype. No external assets or services.

# v0.23: job stops sit on the pavement beside the road (6.5 m from the road centre), not in the lanes.
const PICKUP := Vector3(-25.5, 0, 26)
const DROPOFF := Vector3(25.5, 0, -22)
const STOP_PORT := Vector3(-25.5,0,26)
const STOP_SUNSET := Vector3(25.5,0,-22)
const STOP_CLOCK := Vector3(6.5,0,-22)
const STOP_WEST := Vector3(-25.5,0,8)
const STOP_EAST := Vector3(25.5,0,23)
const STOP_NORTH := Vector3(-25.5,0,-22)
const STOP_FERRY := Vector3(6.5,0,44)
const ROUTES := [
	{"pickup": STOP_PORT, "dropoff": STOP_SUNSET, "from": "Port Dispatch", "to": "Sunset Market", "pay": 150},
	{"pickup": STOP_CLOCK, "dropoff": STOP_WEST, "from": "Clocktower", "to": "West Arcade", "pay": 175},
	{"pickup": STOP_EAST, "dropoff": STOP_NORTH, "from": "East Gardens", "to": "North Gate", "pay": 225},
	{"pickup": STOP_NORTH, "dropoff": STOP_FERRY, "from": "North Gate", "to": "Ferry Steps", "pay": 200},
	{"pickup": STOP_SUNSET, "dropoff": STOP_EAST, "from": "Sunset Market", "to": "East Gardens", "pay": 125},
	{"pickup": STOP_WEST, "dropoff": STOP_CLOCK, "from": "West Arcade", "to": "Clocktower", "pay": 175},
]
const FINDS := [
	{"name": "Ferry Steps", "pos": Vector3(0,0,46)},
	{"name": "Lighthouse Walk", "pos": Vector3(-46,0,49)},
	{"name": "East Lookout", "pos": Vector3(46,0,49)},
	{"name": "East Gardens", "pos": Vector3(32,0,23)},
	{"name": "Sunset Market", "pos": Vector3(32,0,-29)},
	{"name": "Clocktower", "pos": Vector3(0,0,-28)},
	{"name": "North Gate", "pos": Vector3(-32,0,-30)},
	{"name": "West Arcade", "pos": Vector3(-32,0,8)},
]
const CARS := [
	{"name":"Harbor Blue","price":0,"speed":18.0,"accel":9.0,"turn":3.4,"color":Color("438fd0"),"roof":Color("264d68"),"note":"Reliable starter car"},
	{"name":"Mint Cruiser","price":500,"speed":21.0,"accel":10.0,"turn":3.9,"color":Color("52c79a"),"roof":Color("21614f"),"note":"Smooth, easy city handling"},
	{"name":"Ridge Rover","price":1400,"speed":20.0,"accel":12.0,"turn":3.6,"color":Color("e2893a"),"roof":Color("6a3d1c"),"note":"Tough off-road climber"},
	{"name":"Coast Runner","price":2600,"speed":25.0,"accel":13.0,"turn":4.3,"color":Color("e3555a"),"roof":Color("5a1f27"),"note":"Fast and sharp through corners"},
	{"name":"Night Comet","price":4500,"speed":29.0,"accel":15.0,"turn":4.7,"color":Color("7b5bd6"),"roof":Color("2a1f55"),"note":"Top speed, quick grip"},
	{"name":"Marina GT","price":7500,"speed":32.0,"accel":16.0,"turn":4.9,"color":Color("22b5c9"),"roof":Color("0f4a55"),"note":"Showroom grand tourer","premium":true,"model":4},
	{"name":"Skyline Racer","price":12000,"speed":36.0,"accel":18.0,"turn":5.2,"color":Color("f2d046"),"roof":Color("5a4a10"),"note":"Showroom supercar","premium":true,"model":4},
	{"name":"Phantom Black","price":18000,"speed":40.0,"accel":20.0,"turn":5.5,"color":Color("23262b"),"roof":Color("0b0c0e"),"note":"Showroom flagship","premium":true,"model":4},
]
const RIDGE_GATE := Vector3(57,0,0)
const RIDGE := [
	{"name":"Ridge Pass Marker","pos":Vector3(68,0,0),"pay":150},
	{"name":"Trailhead Camp","pos":Vector3(82,0,14),"pay":200},
	{"name":"Old Mill","pos":Vector3(90,0,-14),"pay":200},
	{"name":"Pine Hollow","pos":Vector3(102,0,17),"pay":250},
	{"name":"Crystal Pool","pos":Vector3(100,0,-15),"pay":250},
	{"name":"Summit Lookout","pos":Vector3(144,5.7,0),"pay":400},
]
const RIDGE_BONUS := 600
const MISSIONS := [
	{"name":"Garage Day","desc":"Buy a second car","pay":200},
	{"name":"Open the Ridge Gate","desc":"Own a Ridge Rover","pay":300},
	{"name":"Ridge Scout","desc":"Discover 3 Ridge sites","pay":300},
	{"name":"Summit View","desc":"Reach Summit Lookout","pay":400},
	{"name":"Speed Run","desc":"Reach 85 km/h","pay":250},
	{"name":"Courier Veteran","desc":"Complete 25 deliveries","pay":300},
	{"name":"Ridge Master","desc":"Discover all 6 Ridge sites","pay":800},
	{"name":"Car Collector","desc":"Own all 5 cars","pay":1000},
	{"name":"Master Tuner","desc":"Fully tune one car","pay":1200},
	{"name":"Bay Master","desc":"Discover all 6 Bay sites","pay":1500},
	{"name":"Trial Runner","desc":"Clear every time trial and street event","pay":700},
	{"name":"North Explorer","desc":"Discover all 8 North sites","pay":2000},
	{"name":"Marina Arrival","desc":"Cross the bridge to Marina Heights (Level 5)","pay":500},
	{"name":"Window Shopper","desc":"Visit the showroom, style shop and paint shop","pay":800},
	{"name":"Showroom Dream","desc":"Own a showroom car","pay":2000},
	{"name":"Marina Explorer","desc":"Discover all 5 Marina sites","pay":3000},
	{"name":"Skyline Explorer","desc":"Discover all 8 Skyline District sites","pay":3000},
	{"name":"Rush Hour","desc":"Clear the Skyline Dash time trial","pay":1000},
]
const BAY_GATE := Vector3(-57,0,0)
const BAY := [
	{"name":"Cove Cafe","pos":Vector3(-90,0,9),"pay":300},
	{"name":"Fisher's Wharf","pos":Vector3(-108,0,-9),"pay":300},
	{"name":"Whale Rock","pos":Vector3(-126,0,9),"pay":400},
	{"name":"Glass Beach","pos":Vector3(-144,0,-9),"pay":400},
	{"name":"Windmill Point","pos":Vector3(-160,0,9),"pay":500},
	{"name":"Lighthouse Light","pos":Vector3(-172,0,0),"pay":600},
]
const BAY_BONUS := 1000
const NORTH_GATE := Vector3(0,0,-56.5)
const NORTH := [
	{"name":"Container Yard","pos":Vector3(-72,0,-110),"pay":400},
	{"name":"Smokestack Works","pos":Vector3(86,0,-108),"pay":400},
	{"name":"Maple Court","pos":Vector3(-90,0,-281),"pay":450},
	{"name":"Skate Plaza","pos":Vector3(90,0,-247),"pay":450},
	{"name":"Hangar 3","pos":Vector3(50,0,-401),"pay":550},
	{"name":"Control Tower","pos":Vector3(62,0,-318),"pay":550},
	{"name":"Runway End","pos":Vector3(92,0,-440),"pay":700},
	{"name":"Summit Pass Overlook","pos":Vector3(178,5.7,-270),"pay":800},
]
const NORTH_BONUS := 2000
const BUS_STOPS := [
	{"name":"Marina Heights","z":150.0},
	{"name":"Harbor Waterfront","z":44.0},
	{"name":"Downtown","z":-12.0},
	{"name":"North Gate","z":-48.0},
	{"name":"Industrial Quarter","z":-90.0},
	{"name":"Maple Suburbs","z":-180.0},
	{"name":"Harbor Airfield","z":-324.0}]
const BUS_FARE := 15
const CHASE_BLOCK_TIMES := [12.0,40.0,68.0]
const CHASE_HELI_START := 30.0
const CHASE_HELI_END := 52.0
const BUS_SPEED := 9.0
const BUS_DWELL := 7.0
const BUS_LANE := 2.6
const TRIALS := [
	{"name":"City Sprint","area":0,"start":Vector3(-32,0,32),"cps":[Vector3(32,0,32),Vector3(32,0,-32),Vector3(-32,0,-32),Vector3(-32,0,32)],"par":40.0,"pay":300},
	{"name":"Ridge Sprint","area":1,"start":Vector3(52,0,0),"cps":[Vector3(68,0,0),Vector3(100,0,0),Vector3(118,2.5,0),Vector3(144,5.7,0)],"par":16.0,"pay":500},
	{"name":"Bay Run","area":2,"start":Vector3(-52,0,0),"cps":[Vector3(-70,0,0),Vector3(-100,0,0),Vector3(-140,0,0),Vector3(-172,0,0)],"par":13.0,"pay":800},
	{"name":"Pizza Rush","area":0,"start":Vector3(0,0,32),"cps":[Vector3(0,0,0),Vector3(32,0,0),Vector3(32,0,-32),Vector3(0,0,-32),Vector3(-32,0,-32),Vector3(-32,0,0),Vector3(-32,0,32)],"par":38.0,"pay":400},
	{"name":"Waterfront Dash","area":0,"start":Vector3(-50,0,0),"cps":[Vector3(-20,0,0),Vector3(20,0,0),Vector3(50,0,0)],"par":11.0,"pay":250},
	{"name":"North Highway","area":3,"start":Vector3(0,0,-70),"cps":[Vector3(0,0,-130),Vector3(0,0,-200),Vector3(0,0,-270),Vector3(0,0,-330)],"par":15.0,"pay":700},
	{"name":"Runway Dash","area":3,"start":Vector3(92,0,-322),"cps":[Vector3(92,0,-355),Vector3(92,0,-395),Vector3(92,0,-435)],"par":8.0,"pay":600},
	{"name":"Marina Boulevard","area":4,"start":Vector3(0,0,114),"cps":[Vector3(0,0,150),Vector3(0,0,205),Vector3(0,0,234)],"par":9.0,"pay":900},
	{"name":"Skyline Dash","area":5,"start":Vector3(-134,0,-100),"cps":[Vector3(-134,0,-190),Vector3(-134,0,-290),Vector3(-134,0,-390),Vector3(-220,0,-386),Vector3(-300,0,-386)],"par":36.0,"pay":1200},
]
const UPGRADES := [
	{"name":"Engine","desc":"top speed","per":0.06},
	{"name":"Turbo","desc":"acceleration","per":0.08},
	{"name":"Tires","desc":"handling","per":0.06},
]
const UPGRADE_COSTS := [300,600,1000,1600,2500]
const MAX_TUNE := 5
const SAVE_PATH := "user://harbor_save.cfg"
const RADIO_SR := 16000
const RADIO := [{"name":"Off"},{"name":"Harbor FM"},{"name":"Bay Waves"},{"name":"Talk 88"}]
var tunes: Array = []
var bay_mask := 0
var trial_done := 0
var best_times: Array = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
var north_mask := 0
var north_nodes: Array[Node3D] = []
var north_gate_body: StaticBody3D
var north_gate_sign: Label3D
var trial_active := -1
var trial_cp := 0
var trial_start := 0.0
var bay_nodes: Array[Node3D] = []
var bay_gate_body: StaticBody3D
var bay_gate_sign: Label3D
var trial_panel: PanelContainer
var trial_info: Label
var trial_buttons: Array[Button] = []
var trial_cancel: Button
var tune_panel: PanelContainer
var tune_title: Label
var tune_info: Label
var tune_buttons: Array[Button] = []
var garage_tune: Button
var owned_mask := 1
var car_id := 0
var ridge_mask := 0
var claimed_mask := 0
var best_kmh := 0.0
var car_max := 18.0
var car_accel := 9.0
var car_turn := 3.4
var car_body_mat: StandardMaterial3D
var car_roof_mat: StandardMaterial3D
var spoiler: Node3D
var ridge_nodes: Array[Node3D] = []
var gate_body: StaticBody3D
var gate_sign: Label3D
var garage: PanelContainer
var journal: PanelContainer
var garage_view := 0
var garage_title: Label
var garage_stats: Label
var garage_state: Label
var garage_swatch: ColorRect
var garage_button: Button
var journal_label: Label
var exploring := true
var found_mask := 0
var route_index := 0
var next_job_pending := false
var find_nodes: Array[Node3D] = []
var mode_button: Button
var collection_label: Label
var mission_label: Label
var player: CharacterBody3D
var car: CharacterBody3D
var camera: Camera3D
var marker: Node3D
var hud: CanvasLayer
var objective: Label
var balance_label: Label
var status_label: Label
var action_button: Button
var menu: PanelContainer
var driving := false
var bus: Node3D
var bus_label: Label3D
var bus_z := 44.0
var bus_idx := 0
var bus_next := 1
var bus_fwd := true
var bus_dwell := 5.0
var bus_riding := false
var bus_stop_nodes: Array = []
var chase_heli: Node3D
var chase_rotor: Node3D
var chase_blocks: Array = []
var chase_block_n := 0
var carrying := false
var cash := 0
var deliveries := 0
var car_speed := 0.0
var touch_id := -1
var touch_origin := Vector2.ZERO
var stick := Vector2.ZERO
var mouse_stick := false
var paused := false
var clock := 0.0
var toast_time := 0.0
var joystick: Control
var booted := false
var car_boxes: Node3D
var car_model: Node3D
var car_model_id := -1
var radio_station := 0
var radio_player: AudioStreamPlayer
var radio_streams := {}
var radio_busy := {}
var radio_t0 := 0
var radio_line := 0
var radio_line_time := 0.0
var radio_button: Button
const ONLINE_TOPIC := "realtime:harbor-city-lobby"
const ONLINE_MAX_PEERS := 12
const ONLINE_TIMEOUT := 6.0
var online_on := false
var online_state := 0
var online_ws: WebSocketPeer
var online_config := {}
var online_id := ""
var online_name := ""
var online_ref := 1
var online_hb := 0.0
var online_send_t := 0.0
var online_retry := 0.0
var online_peers := {}
var online_button: Button
const ORO_POLICE_PAY := 400
var online_role := 0
var orole_t := 0.0
var orole_bust := 0.0
var orole_cool := 0.0
var orole_test := false
const CHASE_TIME := 90.0
const CHASE_PAY := 600
const CHASE_COPS := 3
var chase_mode := 0
var chase_t := 0.0
var chase_bust := 0.0
var chase_units: Array = []
var chase_wins := 0
var chase_panel: PanelContainer
var chase_info: Label
var chase_end_button: Button
var chase_label: Label
var radio_caption: Label
var peds: Array = []
var touch_buttons: Array[Button] = []
var compass: Label
var speed_label: Label

func _ready() -> void:
	Input.emulate_mouse_from_touch = false
	tunes.resize(CARS.size()*UPGRADES.size())
	tunes.fill(0)
	car_paint.resize(CARS.size())
	car_paint.fill(0)
	_build_world()
	_build_collectibles()
	_build_player()
	_build_car()
	_build_ridge()
	_build_bay()
	_build_north()
	_build_marina()
	_build_bus()
	_build_landscape()
	_build_downtown()
	_build_city_detail()
	_build_civic()
	_build_checkpoints()
	_build_hub()
	_build_raceway()
	_build_expansion()
	_build_connect()
	_build_airport()
	_build_skytrain()
	_build_peds()
	_build_traffic()
	traffic_on = "--smoke-test" not in OS.get_cmdline_user_args()
	radio_player = AudioStreamPlayer.new()
	radio_player.volume_db = -6.0
	add_child(radio_player)
	_build_hud()
	_load_progress()
	_quick_daily_check()
	_web_perf_setup()
	_night_setup()
	_refresh_time_button()
	_refresh_checkpoints()
	var dev_mode := false
	for flag in ["--smoke-test","--shots","--people-shots","--skyline-shots","--view-shots","--levelup-shots","--stadium-shots","--bake-map","--guide-shots","--hub-shots","--nick-shots","--civic-shots","--race-shots","--follow-shots","--v23-shots","--crate-shots","--daily-shots","--expand-shots","--city-shots","--sky-check"]:
		if flag in OS.get_cmdline_user_args():
			dev_mode = true
	if not dev_mode:
		_spawn_at_checkpoint()
	_apply_car()
	_apply_avatar()
	_update_gate()
	_refresh_hud()
	_radio_refresh()
	if radio_station > 0 and "--smoke-test" not in OS.get_cmdline_user_args() and "--shots" not in OS.get_cmdline_user_args():
		_radio_set(radio_station)
	_show_toast("Harbor City 0.29.1: tap QUESTS (under the QR code) for your daily quests. Tap the minimap for the Menu.")
	booted = true
	if not dev_mode and not crate_done:
		_open_crate()
	if "--smoke-test" in OS.get_cmdline_user_args():
		await _smoke_test()
	elif "--shots" in OS.get_cmdline_user_args():
		await _shots()
	elif "--people-shots" in OS.get_cmdline_user_args():
		await _people_shots()
	elif "--skyline-shots" in OS.get_cmdline_user_args():
		await _skyline_shots()
	elif "--view-shots" in OS.get_cmdline_user_args():
		await _view_shots()
	elif "--levelup-shots" in OS.get_cmdline_user_args():
		await _levelup_shots()
	elif "--stadium-shots" in OS.get_cmdline_user_args():
		await _stadium_shots()
	elif "--guide-shots" in OS.get_cmdline_user_args():
		await _guide_shots()
	elif "--hub-shots" in OS.get_cmdline_user_args():
		await _hub_shots()
	elif "--nick-shots" in OS.get_cmdline_user_args():
		await _nick_shots()
	elif "--civic-shots" in OS.get_cmdline_user_args():
		await _civic_shots()
	elif "--race-shots" in OS.get_cmdline_user_args():
		await _race_shots()
	elif "--follow-shots" in OS.get_cmdline_user_args():
		await _follow_shots()
	elif "--v23-shots" in OS.get_cmdline_user_args():
		await _v23_shots()
	elif "--expand-shots" in OS.get_cmdline_user_args():
		await _expand_shots()
	elif "--sky-check" in OS.get_cmdline_user_args():
		await get_tree().physics_frame
		await get_tree().physics_frame
		for i in sky_st_info.size():
			var e: Vector3 = sky_st_info[i]["entrance"]
			print("SKYST ",i," ",e," road=",_on_road(e)," blk=",_blocker(e+Vector3(0,1.0,0),0.6)," side=",sky_st_info[i]["side"])
		print("SKYLEN ",sky_len," period ",sky_period," pillars ",sky_pillars.size())
		get_tree().quit()
	elif "--city-shots" in OS.get_cmdline_user_args():
		await _city_shots()
	elif "--daily-shots" in OS.get_cmdline_user_args():
		await _daily_shots()
	elif "--crate-shots" in OS.get_cmdline_user_args():
		await _crate_shots()
	elif "--bake-map" in OS.get_cmdline_user_args():
		await _bake_map()

const HAZE := Color("c6e1ea")
# v0.24: big flat surfaces (roads, grass, pavements) get a subtle world-space texture.
const SURF_ASPHALT := ["354653","4a5560","394552","33383e"]
const SURF_GRASS := ["91ab82","6f945c","78a06b","6aa35a"]
const SURF_PAVE := ["8f8d86","9c9a92","b9b6ad","a9a69e","8f8c85","e8d5ad"]
var surf_mats := {}
var surf_tex := {}

func _surf_texture(kind: String) -> NoiseTexture2D:
	if surf_tex.has(kind):
		return surf_tex[kind]
	var noise := FastNoiseLite.new()
	noise.seed = {"asphalt":11,"grass":23,"pave":37}[kind]
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH if kind == "grass" else FastNoiseLite.TYPE_VALUE
	noise.frequency = {"asphalt":0.35,"grass":0.025,"pave":0.12}[kind]
	noise.fractal_octaves = 3
	var tex := NoiseTexture2D.new()
	tex.width = 256
	tex.height = 256
	tex.seamless = true
	tex.generate_mipmaps = true
	tex.noise = noise
	var ramp := Gradient.new()
	var lo := {"asphalt":0.8,"grass":0.78,"pave":0.86}[kind] as float
	ramp.set_color(0,Color(lo,lo,lo))
	ramp.set_color(1,Color(1,1,1))
	tex.color_ramp = ramp
	surf_tex[kind] = tex
	return tex

func _surface_material(color: Color, kind: String) -> StandardMaterial3D:
	var key := color.to_html(false)
	if surf_mats.has(key):
		return surf_mats[key]
	var mat := StandardMaterial3D.new()
	var lift := {"asphalt":1.1,"grass":1.12,"pave":1.07}[kind] as float
	mat.albedo_color = Color(color.r*lift,color.g*lift,color.b*lift)
	mat.albedo_texture = _surf_texture(kind)
	mat.uv1_triplanar = true
	mat.uv1_world_triplanar = true
	var sc := {"asphalt":0.22,"grass":0.05,"pave":0.4}[kind] as float
	mat.uv1_scale = Vector3(sc,sc,sc)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS_ANISOTROPIC
	mat.roughness = 0.95
	surf_mats[key] = mat
	return mat

func _material(color: Color) -> StandardMaterial3D:
	var hex := color.to_html(false)
	if hex in SURF_ASPHALT:
		return _surface_material(color,"asphalt")
	if hex in SURF_GRASS:
		return _surface_material(color,"grass")
	if hex in SURF_PAVE:
		return _surface_material(color,"pave")
	var mat := StandardMaterial3D.new()
	mat.albedo_color = color
	mat.roughness = 0.85
	return mat

func _box(parent: Node3D, pos: Vector3, size: Vector3, color: Color, solid := false) -> MeshInstance3D:
	_note_road(pos,size,0.0,color)
	var mesh := MeshInstance3D.new()
	var shape := BoxMesh.new()
	shape.size = size
	mesh.mesh = shape
	mesh.material_override = _material(color)
	mesh.position = pos
	parent.add_child(mesh)
	if solid:
		var body := StaticBody3D.new()
		var collider := CollisionShape3D.new()
		var box := BoxShape3D.new()
		box.size = size
		collider.shape = box
		body.position = pos
		body.add_child(collider)
		parent.add_child(body)
	return mesh

func _sign(text: String, pos: Vector3, tint := Color.WHITE, font_size := 48) -> Label3D:
	var label := Label3D.new()
	label.text = text
	label.font_size = font_size
	label.modulate = tint
	label.position = pos
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.outline_size = 8
	label.pixel_size = 0.014
	add_child(label)
	return label

func _build_world() -> void:
	var world_env := WorldEnvironment.new()
	var env := Environment.new()
	# v0.24 graphics: a real gradient sky with a sun, soft distance haze, colour grading,
	# stronger sunlight with softer shadows.
	var sky_mat := ProceduralSkyMaterial.new()
	sky_mat.sky_top_color = Color("3d7cc9")
	sky_mat.sky_horizon_color = Color("c6e1ea")
	sky_mat.sky_curve = 0.12
	sky_mat.ground_bottom_color = Color("6d8f86")
	sky_mat.ground_horizon_color = Color("c6e1ea")
	sky_mat.sun_angle_max = 18.0
	sky_mat.sun_curve = 0.12
	var sky := Sky.new()
	sky.sky_material = sky_mat
	sky.radiance_size = Sky.RADIANCE_SIZE_32
	env.sky = sky
	env.background_mode = Environment.BG_SKY
	env.background_color = Color("82bfc8")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color("c9dcef")
	env.ambient_light_energy = 0.55
	env.tonemap_mode = Environment.TONE_MAPPER_LINEAR
	env.tonemap_exposure = 0.94
	env.adjustment_enabled = true
	env.adjustment_saturation = 1.16
	env.adjustment_contrast = 1.1
	env.fog_enabled = true
	env.fog_mode = Environment.FOG_MODE_DEPTH
	env.fog_light_color = HAZE
	env.fog_sky_affect = 0.0
	env.fog_depth_curve = 1.6
	env.fog_depth_begin = 90.0
	env.fog_depth_end = 330.0
	world_env.environment = env
	world_env_res = env
	add_child(world_env)
	var sun := DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-50, -30, 0)
	sun.light_color = Color("fff1d6")
	sun.light_energy = 1.05
	sun.shadow_enabled = true
	sun.shadow_blur = 1.6
	sun.shadow_opacity = 0.82
	sun.directional_shadow_mode = DirectionalLight3D.SHADOW_PARALLEL_2_SPLITS
	sun.directional_shadow_max_distance = 110.0
	add_child(sun)
	sun_light = sun
	_box(self, Vector3(0,-0.35,0), Vector3(112,0.6,112), Color("91ab82"), true)
	_box(self, Vector3(0,-0.65,78), Vector3(230,0.3,55), Color("248caa"))
	_box(self, Vector3(0,0.01,49), Vector3(112,0.1,7), Color("e8d5ad"))
	# Broad avenues make the city readable and forgiving on a touch screen.
	for lane in [-32.0, 0.0, 32.0]:
		_box(self, Vector3(lane,0.01,0), Vector3(9,0.08,104), Color("354653"))
		_box(self, Vector3(0,0.02,lane), Vector3(104,0.08,9), Color("354653"))
		for dash in range(-48,49,8):
			_box(self, Vector3(lane,0.07,dash), Vector3(0.15,0.02,3), Color("e7d9a4"))
			_box(self, Vector3(dash,0.08,lane), Vector3(3,0.02,0.15), Color("e7d9a4"))
	var palette := [Color("dba88e"),Color("e2c994"),Color("a6bcc2"),Color("b3a2ad")]
	var count := 0
	for x in [-46.0,-17.0,17.0,46.0]:
		for z in [-46.0,-17.0,17.0]:
			var height := 4.0 + float(count % 4) * 2.2
			var vis: Array = []
			_box(self, Vector3(x,0.12,z), Vector3(15,0.25,15), Color("ccd0c3"))
			vis.append(_box(self, Vector3(x,height/2.0,z), Vector3(11,height,10), palette[count % 4], true))
			vis.append(_box(self, Vector3(x,height+0.15,z), Vector3(11.5,0.35,10.5), Color("f2e6d2")))
			for floor_index in range(1,int(height/2.0)+1):
				for column in [-3.2,0.0,3.2]:
					vis.append(_box(self, Vector3(x+column,float(floor_index)*1.7,z+5.02), Vector3(1.2,0.95,0.06), Color("345361")))
			_landmark("res://models/building_%d.glb" % (count % 4),Vector3(x,0.12,z),vis)
			count += 1
	# Waterfront kiosks and trees.
	var tree_vis: Array = []
	var tree_pts: Array = []
	for x in [-45.0,-15.0,15.0,45.0]:
		_box(self, Vector3(x,1.8,40), Vector3(8,3.6,6), Color("e1b486"), true)
		_box(self, Vector3(x,3.8,40), Vector3(8.6,0.4,6.7), Color("c36658"))
		for z in [-4.0,26.0]:
			tree_vis.append(_box(self, Vector3(x+7,1.4,z), Vector3(0.5,2.8,0.5), Color("866743")))
			tree_vis.append(_box(self, Vector3(x+7,3.3,z), Vector3(3.7,2.6,3.7), Color("547c58")))
			tree_pts.append(Vector3(x+7,0,z))
	if _scatter("res://models/tree_round.glb",tree_pts,1.0,1.15):
		for tv in tree_vis:
			(tv as MeshInstance3D).visible = false
	_sign("HARBOR CITY",Vector3(0,5,47),Color("fff3c9"),64)
	_sign("PORT DISPATCH",PICKUP+Vector3(0,4,0),Color("f7da87"))
	_sign("SUNSET MARKET",DROPOFF+Vector3(0,4,0),Color("c2f7e8"))
	_box(self,PICKUP+Vector3(3,0.5,0),Vector3(0.9,1,0.9),Color("c89552"))
	marker = Node3D.new()
	add_child(marker)
	var ring := MeshInstance3D.new()
	var torus := TorusMesh.new()
	torus.inner_radius = 1.6
	torus.outer_radius = 2.0
	ring.mesh = torus
	ring.material_override = _material(Color("f4d06c"))
	marker.add_child(ring)

func _build_collectibles() -> void:
	for find in FINDS:
		var pos: Vector3 = find["pos"]
		var token := Node3D.new()
		token.position = pos+Vector3(0,1.7,0)
		add_child(token)
		var gem := MeshInstance3D.new()
		var crystal := PrismMesh.new()
		crystal.size = Vector3(0.9,1.3,0.9)
		gem.mesh = crystal
		var mat := _material(Color("5ce6ed"))
		mat.emission_enabled = true
		mat.emission = Color("279ca8")
		gem.material_override = mat
		token.add_child(gem)
		find_nodes.append(token)
		_sign(find["name"].to_upper(),pos+Vector3(0,4.6,0),Color("adf2f5"),36)
		_box(self,pos+Vector3(0,0.1,0),Vector3(2.4,0.18,2.4),Color("365a69"))
	# Simple original landmarks make the waterfront finds recognizable.
	_box(self,Vector3(-49,4,47),Vector3(2.6,8,2.6),Color("eee2c2"),true)
	_box(self,Vector3(-49,8.5,47),Vector3(3.3,1,3.3),Color("e4b95a"))
	_box(self,Vector3(4,5,-28),Vector3(2.2,10,2.2),Color("cfb892"),true)
	_sign("12 : 00",Vector3(4,11.2,-28),Color("f7edd4"),30)
	for x in [42.0,46.0,50.0]:
		_box(self,Vector3(x,0.6,53),Vector3(0.3,1.2,0.3),Color("a8855b"))
	_box(self,Vector3(46,1.1,53),Vector3(8,0.2,0.2),Color("ead0a0"))

func _find_count() -> int:
	var count := 0
	for index in FINDS.size():
		if found_mask & (1 << index):
			count += 1
	return count

func _nearest_find() -> int:
	var closest := -1
	var best := INF
	var body: CharacterBody3D = car if driving else player
	for index in FINDS.size():
		if found_mask & (1 << index):
			continue
		var pos: Vector3 = FINDS[index]["pos"]
		var distance := Vector2(body.position.x-pos.x,body.position.z-pos.z).length()
		if distance < best:
			best = distance
			closest = index
	return closest

func _destination() -> Vector3:
	if race_car and rec_act > 0:
		return _rw_target()
	if trial_active >= 0:
		return TRIALS[trial_active]["cps"][trial_cp]
	if quick_on:
		return QUICK[quick_idx]["pos"]
	if exploring:
		var index := _nearest_find()
		if index >= 0:
			return FINDS[index]["pos"]
		var civic_index := _nearest_civic()
		if civic_index >= 0:
			return CIVIC[civic_index]["pos"]
		if not _ridge_open():
			return RIDGE_GATE
		var ridge_index := _nearest_ridge()
		if ridge_index >= 0:
			return RIDGE[ridge_index]["pos"]
		var bay_index := _nearest_bay()
		if bay_index >= 0:
			return BAY[bay_index]["pos"]
		var north_index := _nearest_north()
		if _north_open() and north_index >= 0:
			return NORTH[north_index]["pos"]
		if _downtown_open():
			var dt_index := _nearest_downtown()
			if dt_index >= 0:
				return DOWNTOWN[dt_index]["pos"]
		if _marina_open():
			var marina_index := _nearest_marina()
			if marina_index >= 0:
				return MARINA[marina_index]["pos"]
		return car.position if driving else player.position
	return ROUTES[route_index]["dropoff"] if carrying else ROUTES[route_index]["pickup"]

func _toggle_activity() -> void:
	# v0.25: Quick quests -> Delivery jobs -> Exploring -> Quick quests.
	if quick_on:
		quick_on = false
		exploring = false
	elif not exploring:
		exploring = true
	else:
		exploring = false
		quick_on = true
		if not legacy_rules and _quick_left() == 0:
			# Nothing left today: skip ahead to delivery jobs.
			quick_on = false
			_save_progress()
			if paused:
				_toggle_menu()
			_refresh_hud()
			_show_toast("All daily quests are done for today (new ones tomorrow). Delivery jobs instead!")
			return
		_quick_fix_target()
	_save_progress()
	if paused:
		_toggle_menu()
	_refresh_hud()
	if quick_on:
		_show_toast("Quick quests: go to the golden ring, tap PICK UP, get paid. The next one starts right away!")
	else:
		_show_toast("Explore freely. Find glowing blue tokens on foot." if exploring else "Delivery jobs: different routes and payouts. Follow the golden ring.")

func _collect_find(index: int) -> void:
	if found_mask & (1 << index):
		return
	found_mask |= 1 << index
	var count := _find_count()
	var reward := 25
	if count == 4:
		reward += 100
	elif count == FINDS.size():
		reward += 250
	cash += reward
	find_nodes[index].hide()
	_save_progress()
	_show_toast("%s found! %d/8 tokens  +$%d%s" % [FINDS[index]["name"],count,reward,"  CITY COLLECTION COMPLETE!" if count == 8 else ""])

func _owned_count() -> int:
	var n := 0
	for i in CARS.size():
		if owned_mask & (1 << i):
			n += 1
	return n

func _ridge_open() -> bool:
	# v0.25: every town is open from the start (legacy_rules keeps the old locks for the older tests).
	return not legacy_rules or (owned_mask & 4) != 0

func _ridge_count() -> int:
	var n := 0
	for i in RIDGE.size():
		if ridge_mask & (1 << i):
			n += 1
	return n

func _nearest_ridge() -> int:
	var closest := -1
	var best := INF
	var body: CharacterBody3D = car if driving else player
	for i in RIDGE.size():
		if ridge_mask & (1 << i):
			continue
		var pos: Vector3 = RIDGE[i]["pos"]
		var d := Vector2(body.position.x-pos.x,body.position.z-pos.z).length()
		if d < best:
			best = d
			closest = i
	return closest

func _apply_car() -> void:
	if race_car:
		car_max = RACE_MAX
		car_accel = RACE_ACCEL
		car_turn = RACE_TURN
		car_body_mat.albedo_color = RACE_COLOR
		car_roof_mat.albedo_color = Color("23262b")
		spoiler.visible = true
		_apply_car_model()
		return
	var spec: Dictionary = CARS[car_id]
	var stats := _car_stats(car_id)
	car_max = stats.x
	car_accel = stats.y
	car_turn = stats.z
	var paint := int(car_paint[car_id]) if car_paint.size() > car_id else 0
	if paint > 0:
		var paint_color: Color = PAINTS[paint]["color"]
		car_body_mat.albedo_color = paint_color
		car_roof_mat.albedo_color = paint_color.darkened(0.55)
	else:
		car_body_mat.albedo_color = spec["color"]
		car_roof_mat.albedo_color = spec["roof"]
	spoiler.visible = car_id >= 3
	_apply_car_model()

func _tune_level(car_index: int, cat: int) -> int:
	return int(tunes[car_index*UPGRADES.size()+cat])

func _tune_cost(car_index: int, cat: int) -> int:
	var level := _tune_level(car_index,cat)
	if level >= MAX_TUNE:
		return -1
	return int(round(float(UPGRADE_COSTS[level])*(1.0+0.5*car_index)))

func _car_stats(car_index: int) -> Vector3:
	var spec: Dictionary = CARS[car_index]
	return Vector3(
		float(spec["speed"])*(1.0+float(UPGRADES[0]["per"])*_tune_level(car_index,0)),
		float(spec["accel"])*(1.0+float(UPGRADES[1]["per"])*_tune_level(car_index,1)),
		float(spec["turn"])*(1.0+float(UPGRADES[2]["per"])*_tune_level(car_index,2)))

func _buy_tune(cat: int) -> bool:
	var car_index := garage_view
	if not (owned_mask & (1 << car_index)):
		return false
	var cost := _tune_cost(car_index,cat)
	if cost < 0:
		_show_toast("%s is already maxed." % UPGRADES[cat]["name"])
		return false
	if cash < cost:
		_show_toast("Need $%d more for that upgrade." % (cost-cash))
		_refresh_tune()
		return false
	cash -= cost
	tunes[car_index*UPGRADES.size()+cat] = _tune_level(car_index,cat)+1
	_apply_car()
	_save_progress()
	_show_toast("%s upgraded: %s Lv %d" % [CARS[car_index]["name"],UPGRADES[cat]["name"],_tune_level(car_index,cat)])
	_refresh_tune()
	_refresh_garage()
	return true

func _open_tune() -> void:
	if not (owned_mask & (1 << garage_view)):
		return
	_refresh_tune()
	_open_panel(tune_panel)

func _back_to_garage() -> void:
	_refresh_garage()
	_open_panel(garage)

func _refresh_tune() -> void:
	var spec: Dictionary = CARS[garage_view]
	var stats := _car_stats(garage_view)
	tune_title.text = "TUNE  %s" % spec["name"]
	tune_info.text = "Top speed %d km/h   Pickup %.1f   Handling %.1f\nYour cash: $%d" % [int(stats.x*3.6),stats.y,stats.z,cash]
	for u in UPGRADES.size():
		var cost := _tune_cost(garage_view,u)
		var level := _tune_level(garage_view,u)
		tune_buttons[u].text = "%s  Lv %d/%d  (+%d%% %s)  %s" % [UPGRADES[u]["name"],level,MAX_TUNE,int(round(float(UPGRADES[u]["per"])*100.0*level)),UPGRADES[u]["desc"],"MAXED" if cost < 0 else "$%d" % cost]
		tune_buttons[u].disabled = cost < 0

func _bay_open() -> bool:
	return not legacy_rules or _ridge_count() == RIDGE.size()

func _area_open(area: int) -> bool:
	return area == 0 or (area == 1 and _ridge_open()) or (area == 2 and _bay_open()) or (area == 3 and _north_open()) or (area == 4 and _marina_open()) or (area == 5 and _downtown_open())

func _bay_count() -> int:
	var n := 0
	for i in BAY.size():
		if bay_mask & (1 << i):
			n += 1
	return n

func _nearest_bay() -> int:
	var closest := -1
	var best := INF
	var body: CharacterBody3D = car if driving else player
	for i in BAY.size():
		if bay_mask & (1 << i):
			continue
		var pos: Vector3 = BAY[i]["pos"]
		var d := Vector2(body.position.x-pos.x,body.position.z-pos.z).length()
		if d < best:
			best = d
			closest = i
	return closest

func _build_bay() -> void:
	var sand := Color("e8d5ad")
	var rock := Color("8a8377")
	_slab(Vector3(-66,-0.35,0),Vector3(20,0.6,12),0,Color("d9c79a"))
	_box(self,Vector3(-66,0.01,0),Vector3(20,0.08,7),Color("4a5560"))
	_slab(Vector3(-126,-0.35,0),Vector3(100,0.6,30),0,Color("d9c79a"))
	_box(self,Vector3(-126,0.01,0),Vector3(100,0.08,7),Color("4a5560"))
	# v0.27: no walls; the bay road joins open land on every side.
	bay_gate_body = _slab(BAY_GATE+Vector3(0,2,0),Vector3(1,4,12),0,Color("3d7cc4"))
	_box(bay_gate_body,Vector3(0.52,1.0,0),Vector3(0.1,0.8,11),Color("fff3d0"))
	_box(bay_gate_body,Vector3(0.52,-0.8,0),Vector3(0.1,0.8,11),Color("fff3d0"))
	bay_gate_sign = _sign("",Vector3(-57,5.6,0),Color("a8e2ff"),38)
	_sign("BAY ROAD",Vector3(-66,5.2,-2),Color("f7edd4"),48)
	for x in [-90.0,-108.0,-126.0,-144.0,-160.0]:
		_box(self,Vector3(x,0.02,-12 if int(x) % 4 == 0 else 12),Vector3(12,0.06,5),sand)
	if not ResourceLoader.exists("res://models/palm.glb"):
		for p in [Vector2(-84,-12),Vector2(-100,12),Vector2(-118,-12),Vector2(-136,12),Vector2(-152,-12),Vector2(-166,12)]:
			_box(self,Vector3(p.x,1.5,p.y),Vector3(0.4,3,0.4),Color("8a6a43"))
			_box(self,Vector3(p.x,3.1,p.y),Vector3(3.6,0.4,0.6),Color("3f9a5a"))
			_box(self,Vector3(p.x,3.1,p.y),Vector3(0.6,0.4,3.6),Color("3f9a5a"))
	_box(self,Vector3(-90,2,13),Vector3(6,4,3),Color("f0d6a8"),true)
	_box(self,Vector3(-90,4.2,12),Vector3(6.8,0.4,4),Color("d8584e"))
	_box(self,Vector3(-108,0.05,-12),Vector3(8,0.1,4),Color("8a6a43"))
	for x in [-111.0,-105.0]:
		_box(self,Vector3(x,0.6,-14.2),Vector3(0.3,1.2,0.3),Color("6d4a2a"))
	_box(self,Vector3(-126,1.2,13),Vector3(5,2.4,3),Color("7f8a93"),true)
	_box(self,Vector3(-144,0.03,-12),Vector3(6,0.06,4),Color("6fd0c0"))
	var mill_a := _box(self,Vector3(-160,3,13),Vector3(2.5,6,2.5),Color("e8e0d0"),true)
	var mill_b := _box(self,Vector3(-160,6.2,11.6),Vector3(6,0.3,0.2),Color("a8855b"))
	var mill_c := _box(self,Vector3(-160,6.2,11.6),Vector3(0.2,6,0.3),Color("a8855b"))
	var light_a := _box(self,Vector3(-172,5,7),Vector3(3,10,3),Color("f4f1ea"),true)
	var light_b := _box(self,Vector3(-172,10.5,7),Vector3(3.6,1,3.6),Color("d8584e"))
	var light_c := _box(self,Vector3(-172,11.6,7),Vector3(1.6,1.2,1.6),Color("ffd86a"))
	_landmark("res://models/windmill.glb",Vector3(-160,0,13),[mill_a,mill_b,mill_c])
	_landmark("res://models/lighthouse.glb",Vector3(-172,0,7),[light_a,light_b,light_c])
	for site in BAY:
		var pos: Vector3 = site["pos"]
		var token := Node3D.new()
		token.position = pos+Vector3(0,1.7,0)
		add_child(token)
		var gem := MeshInstance3D.new()
		var crystal := PrismMesh.new()
		crystal.size = Vector3(0.9,1.3,0.9)
		gem.mesh = crystal
		var mat := _material(Color("c78cff"))
		mat.emission_enabled = true
		mat.emission = Color("6a3ba8")
		gem.material_override = mat
		token.add_child(gem)
		bay_nodes.append(token)
		_sign(str(site["name"]).to_upper(),pos+Vector3(0,4.4,0),Color("e6caff"),36)
		_box(self,pos+Vector3(0,0.1,0),Vector3(2.4,0.18,2.4),Color("4b3a66"))

func _check_bay() -> void:
	var body: CharacterBody3D = car if driving else player
	for i in BAY.size():
		var found := (bay_mask & (1 << i)) != 0
		var pos: Vector3 = BAY[i]["pos"]
		bay_nodes[i].visible = not found
		bay_nodes[i].rotation.y = clock
		bay_nodes[i].position.y = pos.y+1.7+sin(clock*2+i)*0.25
		if found:
			continue
		if Vector2(body.position.x-pos.x,body.position.z-pos.z).length() < 4.5 and absf(body.position.y-pos.y) < 3.5:
			_discover_bay(i)

func _discover_bay(i: int) -> void:
	if bay_mask & (1 << i):
		return
	bay_mask |= 1 << i
	var count := _bay_count()
	var reward := int(BAY[i]["pay"])
	if count == BAY.size():
		reward += BAY_BONUS
	cash += reward
	bay_nodes[i].hide()
	_save_progress()
	_show_toast("%s discovered!  %d/%d  +$%d%s" % [BAY[i]["name"],count,BAY.size(),reward,"  BAY COMPLETE!" if count == BAY.size() else ""])

func _north_count() -> int:
	var n := 0
	for i in NORTH.size():
		if north_mask & (1 << i):
			n += 1
	return n

func _north_open() -> bool:
	return not legacy_rules or _bay_count() >= 3

func _nearest_north() -> int:
	var closest := -1
	var best := INF
	var body: CharacterBody3D = car if driving else player
	for i in NORTH.size():
		if north_mask & (1 << i):
			continue
		var pos: Vector3 = NORTH[i]["pos"]
		var d := Vector2(body.position.x-pos.x,body.position.z-pos.z).length()
		if d < best:
			best = d
			closest = i
	return closest

func _check_north() -> void:
	var body: CharacterBody3D = car if driving else player
	for i in NORTH.size():
		var found := (north_mask & (1 << i)) != 0
		var pos: Vector3 = NORTH[i]["pos"]
		north_nodes[i].visible = not found
		north_nodes[i].rotation.y = clock
		north_nodes[i].position.y = pos.y+1.7+sin(clock*2+i)*0.25
		if found:
			continue
		if Vector2(body.position.x-pos.x,body.position.z-pos.z).length() < 4.5 and absf(body.position.y-pos.y) < 3.5:
			_discover_north(i)

func _discover_north(i: int) -> void:
	if north_mask & (1 << i):
		return
	north_mask |= 1 << i
	var count := _north_count()
	var reward := int(NORTH[i]["pay"])
	if count == NORTH.size():
		reward += NORTH_BONUS
	cash += reward
	north_nodes[i].hide()
	_save_progress()
	_show_toast("%s discovered!  %d/%d  +$%d%s" % [NORTH[i]["name"],count,NORTH.size(),reward,"  NORTH COMPLETE!" if count == NORTH.size() else ""])

func _prop(path: String, pos: Vector3, size: Vector3, yaw := 0.0, color := Color("b8bfc2"), solid := true) -> Node3D:
	var holder := Node3D.new()
	holder.position = pos
	holder.rotation_degrees.y = yaw
	add_child(holder)
	var model := _try_model(path)
	if model != null:
		holder.add_child(model)
	else:
		_box(holder,Vector3(0,size.y/2.0,0),size,color)
	if solid:
		_collider(holder,Vector3(0,size.y/2.0,0),size)
	return holder

func _collider(parent: Node3D, pos: Vector3, size: Vector3) -> void:
	var body := StaticBody3D.new()
	var shape := CollisionShape3D.new()
	var box := BoxShape3D.new()
	box.size = size
	shape.shape = box
	body.position = pos
	body.add_child(shape)
	parent.add_child(body)

func _first_mesh(node: Node) -> MeshInstance3D:
	if node is MeshInstance3D and (node as MeshInstance3D).mesh != null:
		return node as MeshInstance3D
	for child in node.get_children():
		var found := _first_mesh(child)
		if found != null:
			return found
	return null

func _scatter(path: String, points: Array, smin := 0.85, smax := 1.2, fixed_yaw := -1.0) -> bool:
	if points.is_empty():
		return false
	if path.ends_with("/lamp.glb"):
		# v0.30: street lamps are the tall city lamps; these old rows had their arms facing away from the road.
		var items := []
		for pt in points:
			items.append([pt,maxf(fixed_yaw,0.0)+PI,1.0])
		_model_batch(path,items)
		return true
	var model := _try_model(path)
	if model == null:
		return false
	var source := _first_mesh(model)
	if source == null:
		model.free()
		return false
	var rng := RandomNumberGenerator.new()
	rng.seed = 808
	var multi := MultiMesh.new()
	multi.transform_format = MultiMesh.TRANSFORM_3D
	multi.mesh = source.mesh
	multi.instance_count = points.size()
	for i in points.size():
		var s := rng.randf_range(smin,smax)
		var yaw := rng.randf()*TAU if fixed_yaw < 0.0 else fixed_yaw
		var basis := Basis(Vector3.UP,yaw).scaled(Vector3(s,s,s)*_prop_stretch(path))
		multi.set_instance_transform(i,Transform3D(basis,points[i]))
	var instance := MultiMeshInstance3D.new()
	instance.multimesh = multi
	add_child(instance)
	model.free()
	return true

func _prop_stretch(path: String) -> Vector3:
	# v0.23: with the street-level camera, trees and street lamps looked short. Grow them taller
	# (width unchanged) so you walk under the leaves.
	# Width stays as before so trees keep their old footprint beside the roads.
	if path.contains("tree_round"):
		return Vector3(1.0,1.6,1.0)
	if path.contains("tree_pine"):
		return Vector3(1.0,1.45,1.0)
	if path.contains("palm"):
		return Vector3(1.0,1.4,1.0)
	if path.contains("lamp"):
		return Vector3(1.0,1.3,1.0)
	return Vector3.ONE

func _north_token(pos: Vector3, label: String) -> Node3D:
	var token := Node3D.new()
	token.position = pos+Vector3(0,1.7,0)
	add_child(token)
	var gem := MeshInstance3D.new()
	var crystal := PrismMesh.new()
	crystal.size = Vector3(0.9,1.3,0.9)
	gem.mesh = crystal
	var mat := _material(Color("ffb35c"))
	mat.emission_enabled = true
	mat.emission = Color("a85a1a")
	gem.material_override = mat
	token.add_child(gem)
	_sign(label.to_upper(),pos+Vector3(0,4.4,0),Color("ffe0b8"),36)
	_box(self,pos+Vector3(0,0.1,0),Vector3(2.4,0.18,2.4),Color("5a4326"))
	return token

# v0.29: the North Highway district rebuilt at big-city scale, on the same grid as the Skyline District.
const NM_X0 := -110.5
const NM_X1 := 110.0
const NM_Z0 := -56.0
const NM_Z1 := -458.0
const NM_SIGNALS := [Vector2(-60,-140),Vector2(-60,-220),Vector2(-60,-300),Vector2(-60,-380),Vector2(0,-140),Vector2(0,-220),Vector2(0,-300),Vector2(0,-380),Vector2(60,-140),Vector2(60,-220),Vector2(60,-300)]
const NM_HOUSE_SCALE := 1.3
const NM_PARK := Vector3(-90,0,-260)
const NM_SKATE := Vector3(90,0,-247)

func _nm_roads() -> Array:
	# [from, to, width]: the highway, two avenues, four cross streets, the industrial roads and the Summit Pass link.
	return [
		[Vector2(0,NM_Z0),Vector2(0,NM_Z1),20.0],
		[Vector2(-60,-140),Vector2(-60,NM_Z1),20.0],
		[Vector2(60,-140),Vector2(60,-300),20.0],
		[Vector2(NM_X0,-140),Vector2(NM_X1,-140),20.0],
		[Vector2(NM_X0,-220),Vector2(NM_X1,-220),20.0],
		[Vector2(NM_X0,-300),Vector2(NM_X1,-300),20.0],
		[Vector2(NM_X0,-380),Vector2(0,-380),20.0],
		[Vector2(-32,NM_Z0),Vector2(-32,-140),12.0],
		[Vector2(32,NM_Z0),Vector2(32,-140),12.0],
		[Vector2(60,-270),Vector2(NM_X1,-270),10.0],
	]

func _prop_big(path: String, pos: Vector3, size: Vector3, yaw_deg: float, s: float, color := Color("b8bfc2"), solid := true) -> Node3D:
	# Like _prop, but the model is scaled up (the collider grows with it).
	var holder := Node3D.new()
	holder.position = pos
	holder.rotation_degrees.y = yaw_deg
	add_child(holder)
	var model := _try_model(path)
	if model != null:
		model.scale = Vector3.ONE*s
		holder.add_child(model)
	else:
		_box(holder,Vector3(0,size.y*s/2.0,0),size*s,color)
	if solid:
		_collider(holder,Vector3(0,size.y*s/2.0,0),size*s)
	return holder

func _nm_near_cross(p: Vector2, n: Vector2, w: float) -> bool:
	for s in [-1.0,1.0]:
		var q: Vector2 = p+n*s*(w/2.0+3.0)
		if _on_road(Vector3(q.x,0,q.y)):
			return true
	return false

func _build_north() -> void:
	var asphalt := Color("394552")
	var walk := Color("8f8d86")
	# One joined pavement slab; blocks get their own ground on top. v0.27: no border walls.
	_slab(Vector3((NM_X0+NM_X1)/2.0,-0.35,(NM_Z0-453.0)/2.0),Vector3(NM_X1-NM_X0,0.6,NM_Z0+453.0),0,walk)
	north_gate_body = _slab(NORTH_GATE+Vector3(0,2,0),Vector3(20,4,1),0,Color("e0902f"))
	_box(north_gate_body,Vector3(0,1.0,0.52),Vector3(19,0.8,0.1),Color("fff3d0"))
	_box(north_gate_body,Vector3(0,-0.8,0.52),Vector3(19,0.8,0.1),Color("fff3d0"))
	north_gate_sign = _sign("",Vector3(0,5.6,-57.5),Color("ffd9a0"),38)
	# Roads first (so crossings are known), then markings.
	var roads := []
	for r in _nm_roads():
		var a: Vector2 = r[0]
		var b: Vector2 = r[1]
		var w: float = r[2]
		var mid := (a+b)/2.0
		var size := Vector3(absf(b.x-a.x),0.08,w) if absf(b.x-a.x) > absf(b.y-a.y) else Vector3(w,0.08,absf(b.y-a.y))
		roads.append([Vector3(mid.x,0.011,mid.y),size])
	# The Harbor Raceway approach road (z -150) joins the east end of the -140 street.
	roads.append([Vector3(NM_X1-6.0,0.012,-142.5),Vector3(14,0.08,25)])
	_box_batch(asphalt,roads)
	var yellow := []
	var dashes := []
	var curbs := []
	for r in _nm_roads():
		var a: Vector2 = r[0]
		var b: Vector2 = r[1]
		var w: float = r[2]
		var len := a.distance_to(b)
		var dir := (b-a)/len
		var n := Vector2(-dir.y,dir.x)
		var along_z := absf(dir.y) > 0.5
		var t := 4.0
		while t < len-2.0:
			var p := a+dir*t
			if not _nm_near_cross(p,n,w):
				if w >= 20.0:
					for s in [-0.25,0.25]:
						var q: Vector2 = p+n*s
						yellow.append([Vector3(q.x,0.06,q.y),Vector3(0.16,0.02,4.2) if along_z else Vector3(4.2,0.02,0.16)])
					for s in [-5.0,5.0]:
						var q: Vector2 = p+n*s
						dashes.append([Vector3(q.x,0.06,q.y),Vector3(0.18,0.02,3) if along_z else Vector3(3,0.02,0.18)])
				else:
					dashes.append([Vector3(p.x,0.06,p.y),Vector3(0.18,0.02,3) if along_z else Vector3(3,0.02,0.18)])
			t += 8.0
		# Curbs in 4 m pieces, left out where another road joins.
		t = 2.0
		while t < len-1.0:
			var p := a+dir*t
			for s in [-1.0,1.0]:
				var e: Vector2 = p+n*s*(w/2.0+0.2)
				var out: Vector2 = p+n*s*(w/2.0+1.2)
				if not _on_road(Vector3(out.x,0,out.y)) and not _on_road(Vector3(e.x,0,e.y)+Vector3(n.x,0,n.y)*s*1.0):
					curbs.append([Vector3(e.x,0.06,e.y),Vector3(0.4,0.12,4.0) if along_z else Vector3(4.0,0.12,0.4)])
			t += 4.0
	_box_batch(Color("f2c230"),yellow)
	_box_batch(Color("eef0ec"),dashes)
	_box_batch(Color("b3b0a8"),curbs)
	# Crossings and traffic signals.
	var zebra := []
	var poles := []
	var ns_caps := []
	var ew_caps := []
	var half := 10.0
	for sp: Vector2 in NM_SIGNALS:
		light_spots.append(Vector3(sp.x,0,sp.y))
		for s in [-1.0,1.0]:
			if _on_road(Vector3(sp.x,0,sp.y+s*(half+2.0))):
				for k in 12:
					zebra.append([Vector3(sp.x-8.8+1.6*k,0.065,sp.y+s*(half+2.0)),Vector3(0.7,0.02,3.0)])
			if _on_road(Vector3(sp.x+s*(half+2.0),0,sp.y)):
				for k in 12:
					zebra.append([Vector3(sp.x+s*(half+2.0),0.067,sp.y-8.8+1.6*k),Vector3(3.0,0.02,0.7)])
		var c := half+2.6
		var at := Vector3(sp.x,0,sp.y)
		_signal_pole(poles,ns_caps,ew_caps,at+Vector3(c,0,c),PI,true)
		_signal_pole(poles,ns_caps,ew_caps,at+Vector3(-c,0,-c),0.0,true)
		_signal_pole(poles,ns_caps,ew_caps,at+Vector3(-c,0,c),PI/2.0,false)
		_signal_pole(poles,ns_caps,ew_caps,at+Vector3(c,0,-c),-PI/2.0,false)
	_box_batch(Color("eef0ec"),zebra)
	_model_batch("res://models/traffic_light.glb",poles)
	var ns_inst := _box_batch(Color.WHITE,ns_caps)
	var ew_inst := _box_batch(Color.WHITE,ew_caps)
	if light_ns_mat == null:
		light_ns_mat = _material(Color("4fd36a"))
		light_ew_mat = _material(Color("e04a3a"))
		for m in [light_ns_mat,light_ew_mat]:
			m.emission_enabled = true
			m.emission_energy_multiplier = 1.4
	if ns_inst != null:
		ns_inst.material_override = light_ns_mat
	if ew_inst != null:
		ew_inst.material_override = light_ew_mat
	# Summit Pass: a branch road east up to a lookout.
	var grass := Color("6f945c")
	var rock := Color("7d776c")
	_slab(Vector3(127,-0.35,-270),Vector3(34,0.6,24),0,grass)
	_box(self,Vector3(127,0.01,-270),Vector3(34,0.08,8),asphalt)
	_slab(Vector3(151.7,2.51,-270),Vector3(24,0.6,20),14.0,Color("93866f"))
	for z in [-259.8,-280.2]:
		_slab(Vector3(151.5,3.38,z),Vector3(24,1.2,0.5),14.0,rock)
	_slab(Vector3(176.3,5.4,-270),Vector3(26,0.6,20),0,grass)
	for z in [-259.6,-280.4]:
		_box(self,Vector3(176.3,6.7,z),Vector3(26,2,0.8),rock,true)
	_box(self,Vector3(189.8,6.7,-270),Vector3(0.8,2,21),rock,true)
	_sign("SUMMIT PASS",Vector3(112,5.2,-270),Color("ffe0b8"),44)
	_sign("NORTH HIGHWAY",Vector3(0,9.0,-64),Color("ffe0b8"),60)
	_sign("INDUSTRIAL QUARTER",Vector3(-32,7.0,-66),Color("d8dde0"),48)
	_sign("MAPLE SUBURBS",Vector3(0,8.0,-158),Color("e3f5d0"),52)
	_sign("MIDTOWN",Vector3(-60,8.0,-318),Color("e8f0ff"),56)
	_sign("HARBOR AIRFIELD",Vector3(14,8.0,-318),Color("cfe6ff"),52)
	_build_nm_blocks()
	for site in NORTH:
		north_nodes.append(_north_token(site["pos"],site["name"]))
	_build_north_landscape()

func _build_nm_blocks() -> void:
	var plates := {}
	var add_plate := func(col: Color, x0: float, x1: float, z0: float, z1: float) -> void:
		var key := col.to_html(false)
		if not plates.has(key):
			plates[key] = []
		plates[key].append([Vector3((x0+x1)/2.0,0.03,(z0+z1)/2.0),Vector3(x1-x0,0.06,z1-z0)])
	var concrete := Color("9d9a92")
	var lawn := Color("7fae68")
	var paved := Color("a19c90")
	# Industrial Quarter (between the Old City and the -140 street).
	add_plate.call(concrete,-105.5,-43.0,-125.0,-63.0)
	add_plate.call(concrete,43.0,105.0,-125.0,-63.0)
	add_plate.call(lawn,-21.0,-15.0,-125.0,-63.0)
	add_plate.call(lawn,15.0,21.0,-125.0,-63.0)
	for z in [-75.0,-111.0]:
		_prop_big("res://models/warehouse.glb",Vector3(-52,0,z),Vector3(20,6.4,12),90.0,1.4)
		_prop_big("res://models/warehouse.glb",Vector3(52,0,z),Vector3(20,6.4,12),-90.0,1.4)
	for r in 6:
		for c in 2:
			var cx := -99.0 if c == 0 else -91.0
			var cz := -100.0-float(r)*4.2
			_prop("res://models/container_%d.glb" % ((r+c) % 3),Vector3(cx,0,cz),Vector3(6,2.6,2.4),0.0,Color("c4533f"))
			if (r+c) % 2 == 0:
				_prop("res://models/container_%d.glb" % ((r+c+1) % 3),Vector3(cx,2.6,cz),Vector3(6,2.6,2.4),0.0,Color("3f78a8"))
	_prop("res://models/crane.glb",Vector3(-82,0,-75),Vector3(1,1,1),0.0,Color("e3a428"),false)
	for lx in [-6.0,6.0]:
		for lz in [-2.5,2.5]:
			_collider(self,Vector3(-82+lx,7,-75-lz),Vector3(0.8,14,0.8))
	_box(self,Vector3(88,5.2,-80),Vector3(20.8,10.4,15.6),Color("c4c0b8"),true)
	_box(self,Vector3(88,10.9,-80),Vector3(21.6,1.0,16.4),Color("8d979e"))
	_box(self,Vector3(102,17,-80),Vector3(4,34,4),Color("b36a4c"),true)
	for y in [26.0,30.0]:
		_box(self,Vector3(102,y,-80),Vector3(4.4,1.4,4.4),Color("f2e6d2"))
	# Maple Suburbs: houses on the outer blocks, shops and apartments along the highway.
	var items := {}
	for c in [Vector2(-90.25,-180),Vector2(90,-180)]:
		add_plate.call(lawn,c.x-15.25,c.x+15.25,c.y-25.0,c.y+25.0)
	add_plate.call(lawn,NM_PARK.x-15.25,NM_PARK.x+15.25,-285.0,-235.0)
	add_plate.call(paved,75.0,105.0,-260.0,-235.0)
	var hi := 0
	for cz in [-196.0,-180.0,-164.0]:
		for hx in [[-80.0,90.0],[-100.0,-90.0],[80.0,-90.0],[100.0,90.0]]:
			_prop_big("res://models/house_%d.glb" % (hi % 2),Vector3(float(hx[0]),0,cz),Vector3(8,5.6,7),float(hx[1]),NM_HOUSE_SCALE,Color("efe2c8"))
			hi += 1
	for c in [Vector2(-30,-180),Vector2(30,-260)]:
		add_plate.call(paved,c.x-15.0,c.x+15.0,c.y-25.0,c.y+25.0)
		_place(items,"tower_3",Vector3(c.x,0,c.y),0.0,1.2)
	for c in [Vector2(30,-180),Vector2(-30,-260)]:
		add_plate.call(paved,c.x-15.0,c.x+15.0,c.y-25.0,c.y+25.0)
		_place(items,"shops_0",Vector3(c.x,0,c.y+14.0),0.0,1.2)
		_place(items,"shops_1",Vector3(c.x,0,c.y-14.0),PI,1.2)
	_build_park(NM_PARK,30.0)
	# Skate Plaza.
	_box(self,NM_SKATE+Vector3(0,0.07,0),Vector3(18,0.1,13),Color("9a9d98"))
	_slab(NM_SKATE+Vector3(-4,0.5,0),Vector3(5,0.3,5),-12.0,Color("c9a96a"))
	_slab(NM_SKATE+Vector3(5,0.5,0),Vector3(5,0.3,5),12.0,Color("c9a96a"))
	_box(self,NM_SKATE+Vector3(0,0.45,3.5),Vector3(8,0.9,0.5),Color("6d7a82"),true)
	# Midtown: towers that carry the Skyline on east of the -140 avenue.
	for e in [["tower_1",-90.25,-340.0,0.0,1.5],["tower_0",-30.0,-340.0,0.0,1.5],["tower_2",-90.25,-419.0,PI/2.0,1.25],["tower_3",-30.0,-419.0,0.0,1.6]]:
		var c := Vector3(float(e[1]),0,float(e[2]))
		add_plate.call(paved,c.x-15.0,c.x+15.0,c.z-25.0 if c.z > -400.0 else -443.0,c.z+25.0 if c.z > -400.0 else -395.0)
		_place(items,e[0],c,float(e[3]),float(e[4]))
	for key in items:
		_model_batch("res://models/%s.glb" % key,items[key])
	# Harbor Airfield (east of the highway, north of the -300 street): apron, runway, hangars, tower.
	add_plate.call(Color("8f9396"),15.0,105.0,-443.0,-315.0)
	_box(self,Vector3(92,0.07,-381),Vector3(16,0.06,126),Color("2c3640"))
	var marks := []
	var z2 := -324.0
	while z2 > -440.0:
		marks.append([Vector3(92,0.105,z2),Vector3(0.5,0.02,5)])
		z2 -= 12.0
	for x in [84.6,99.4]:
		marks.append([Vector3(x,0.105,-381),Vector3(0.3,0.02,126)])
	for bx in range(86,99,4):
		marks.append([Vector3(float(bx),0.105,-441),Vector3(1.4,0.02,5)])
	_box_batch(Color("f4f1e8"),marks)
	for z in [-338.0,-380.0,-422.0]:
		_prop_big("res://models/hangar.glb",Vector3(31,0,z),Vector3(24,9,22),90.0,1.3,Color("c9d0d4"))
		_prop_big("res://models/airplane.glb",Vector3(64,0,z),Vector3(14,4,12),90.0,1.3,Color("f0f2f4"))
	_prop_big("res://models/tower.glb",Vector3(76,0,-319),Vector3(8.4,26,8.4),0.0,1.3,Color("d8dcd8"))
	for key in plates:
		_box_batch(Color(key),plates[key])

func _build_north_landscape() -> void:
	# Lamps and street trees on the pavements, and the rocks at the Summit Pass turn.
	var lamps := []
	var trees := []
	for r in _nm_roads():
		var a: Vector2 = r[0]
		var b: Vector2 = r[1]
		var w: float = r[2]
		var len := a.distance_to(b)
		var dir := (b-a)/len
		var n := Vector2(-dir.y,dir.x)
		var t := 14.0
		var k := 0
		while t < len-8.0:
			for s in [-1.0,1.0]:
				var lp: Vector2 = a+dir*(t+(0.0 if s > 0.0 else 13.0))+n*s*(w/2.0+1.4)
				var tp: Vector2 = a+dir*(t+6.5*s)+n*s*(w/2.0+3.6)
				if _nm_free(lp,dir):
					lamps.append([Vector3(lp.x,0,lp.y),atan2(-n.y*s,n.x*s)+PI])
				if k % 2 == 0 and _nm_free(tp,dir) and not _blocked_at(Vector3(tp.x,1.0,tp.y),1.2):
					trees.append([Vector3(tp.x,0,tp.y),float(k)*1.7,0.7])
			t += 26.0
			k += 1
	_model_batch("res://models/lamp.glb",lamps)
	_model_batch("res://models/tree_round.glb",trees)
	_scatter("res://models/rock.glb",[Vector3(118,0,-262),Vector3(120,0,-279),Vector3(138,0,-264)],0.8,1.6)

func _nm_free(p: Vector2, dir: Vector2) -> bool:
	# A pavement spot away from crossings, bus stops and anything solid.
	var p3 := Vector3(p.x,0,p.y)
	if _on_road(p3) or _on_road(p3+Vector3(dir.x,0,dir.y)*5.0) or _on_road(p3-Vector3(dir.x,0,dir.y)*5.0):
		return false
	for st in BUS_STOPS:
		if absf(p.x) < 16.0 and absf(p.y-float(st["z"])) < 6.0:
			return false
	return not _blocked_at(p3+Vector3(0,1.0,0),0.6)

func _build_landscape() -> void:
	# Lamps along the city avenues and pines/rocks around the Ridge approach.
	var lamps_a: Array = []
	var lamps_b: Array = []
	for lane in [-32.0,0.0,32.0]:
		for z in range(-40,48,16):
			lamps_a.append(Vector3(lane+5.6,0,float(z)+4.0))
			lamps_b.append(Vector3(lane-5.6,0,float(z)-4.0))
	_scatter("res://models/lamp.glb",lamps_a,1.0,1.0,0.0)
	_scatter("res://models/lamp.glb",lamps_b,1.0,1.0,PI)
	var pines: Array = []
	for x in range(80,110,6):
		pines.append(Vector3(float(x),0,19.0))
		pines.append(Vector3(float(x)+3.0,0,-19.5))
	_scatter("res://models/tree_pine.glb",pines,0.9,1.3)
	_scatter("res://models/rock.glb",[Vector3(75,0,-8),Vector3(96,0,6),Vector3(108,0,-9),Vector3(-100,0,-8),Vector3(-134,0,10),Vector3(-152,0,-10)],0.8,1.4)

# ---- Online (v0.9.0): Supabase Realtime broadcast, other players shown as ghost cars. ----
func _online_load_config() -> bool:
	if not online_config.is_empty():
		return true
	if not FileAccess.file_exists("res://multiplayer.local.json"):
		return false
	var file := FileAccess.open("res://multiplayer.local.json",FileAccess.READ)
	if file == null:
		return false
	var data = JSON.parse_string(file.get_as_text())
	if data is Dictionary and data.has("url") and data.has("anon"):
		online_config = data
		return true
	return false

func _online_toggle() -> void:
	if online_on:
		_online_stop()
		_show_toast("Online play off. Back to single player.")
	else:
		if not _online_load_config():
			_show_toast("Online play is not set up in this build.")
			return
		online_on = true
		if online_id == "":
			online_id = "%x%x" % [randi(),randi()]
		if online_name == "":
			online_name = "Driver%d" % (100+randi() % 900)
		online_retry = 0.0
		_online_connect()
		_show_toast("Connecting as %s ..." % online_name)
		if not nick_chosen and not paused:
			nick_from_online = true
			_toggle_menu()
			_open_nick()
	_online_refresh_button()

func _online_connect() -> void:
	online_ws = WebSocketPeer.new()
	var host := String(online_config["url"]).replace("https://","").replace("/","")
	var url := "wss://%s/realtime/v1/websocket?apikey=%s&vsn=1.0.0" % [host,String(online_config["anon"])]
	online_state = 1 if online_ws.connect_to_url(url) == OK else 0
	online_hb = 0.0

func _online_stop() -> void:
	if online_ws != null and online_ws.get_ready_state() == WebSocketPeer.STATE_OPEN and online_state >= 2:
		_online_send({"topic":ONLINE_TOPIC,"event":"phx_leave","payload":{},"ref":str(_online_next_ref()),"join_ref":"1"})
		online_ws.poll()
	if online_ws != null:
		online_ws.close()
	online_ws = null
	online_on = false
	online_state = 0
	_online_clear_peers()

func _online_next_ref() -> int:
	online_ref += 1
	return online_ref

func _online_send(msg: Dictionary) -> void:
	if online_ws != null and online_ws.get_ready_state() == WebSocketPeer.STATE_OPEN:
		online_ws.send_text(JSON.stringify(msg))

func _online_join_frame() -> Dictionary:
	return {"topic":ONLINE_TOPIC,"event":"phx_join","payload":{"config":{"broadcast":{"ack":false,"self":false},"presence":{"enabled":false},"private":false}},"ref":"1","join_ref":"1"}

func _online_pos_frame() -> Dictionary:
	var body: CharacterBody3D = car if driving else player
	var payload := {
		"i":online_id,"n":online_name,
		"x":snappedf(body.position.x,0.01),"y":snappedf(body.position.y,0.01),"z":snappedf(body.position.z,0.01),
		"r":snappedf(body.rotation.y,0.01),"c":car_id,"d":1 if driving else 0,"t":online_role,"l":_level(),
		"s":seat_id,"q":my_bubble,"qn":my_bubble_n,"e":my_emote,"en":my_emote_n,"rc":1 if race_car else 0}
	return {"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"pos","payload":payload},"ref":str(_online_next_ref()),"join_ref":"1"}

func _online_tick(delta: float) -> void:
	_online_update_peers(delta)
	if not online_on:
		return
	if online_ws == null:
		online_retry -= delta
		if online_retry <= 0.0:
			_online_connect()
		return
	online_ws.poll()
	var ready := online_ws.get_ready_state()
	if ready == WebSocketPeer.STATE_OPEN:
		if online_state == 1:
			_online_send(_online_join_frame())
			online_state = 2
			_online_refresh_button()
		while online_ws.get_available_packet_count() > 0:
			_online_handle(online_ws.get_packet().get_string_from_utf8())
		online_hb += delta
		if online_hb >= 20.0:
			online_hb = 0.0
			_online_send({"topic":"phoenix","event":"heartbeat","payload":{},"ref":str(_online_next_ref())})
		if online_state == 3:
			online_send_t += delta
			if online_send_t >= 0.2:
				online_send_t = 0.0
				_online_send(_online_pos_frame())
	elif ready == WebSocketPeer.STATE_CLOSED:
		online_ws = null
		online_state = 0
		online_retry = 3.0
		_online_clear_peers()
		_online_refresh_button()

func _online_handle(text: String) -> void:
	var msg = JSON.parse_string(text)
	if not msg is Dictionary:
		return
	var event := String(msg.get("event",""))
	if event == "broadcast":
		var outer = msg.get("payload",{})
		if outer is Dictionary and String(outer.get("event","")) == "pos":
			var inner = outer.get("payload",{})
			if inner is Dictionary:
				_online_peer_update(inner)
		elif outer is Dictionary and String(outer.get("event","")) == "gm":
			var inner = outer.get("payload",{})
			if inner is Dictionary:
				_hub_game_msg(inner)
		elif outer is Dictionary and String(outer.get("event","")) in ["rcs","rcf","spk"]:
			var inner = outer.get("payload",{})
			if inner is Dictionary:
				_race_msg(String(outer.get("event","")),inner)
		elif outer is Dictionary and String(outer.get("event","")) in ["fms","fmf","fmr"]:
			var inner = outer.get("payload",{})
			if inner is Dictionary:
				_fm_msg(String(outer.get("event","")),inner)
		elif outer is Dictionary and (String(outer.get("event","")) == "lfp" or String(outer.get("event","")) == "lfa"):
			var inner = outer.get("payload",{})
			if inner is Dictionary:
				_lfp_msg(String(outer.get("event","")),inner)
	elif event == "phx_reply" and String(msg.get("topic","")) == ONLINE_TOPIC:
		var reply = msg.get("payload",{})
		if reply is Dictionary and String(reply.get("status","")) == "ok":
			if online_state == 2:
				online_state = 3
				_show_toast("Online! You are %s." % online_name)
				_online_refresh_button()
		elif reply is Dictionary and String(reply.get("status","")) == "error":
			_show_toast("Online join failed.")
	elif event == "phx_error" or event == "phx_close":
		if online_state == 3:
			online_state = 1

func _online_clean_name(raw: String) -> String:
	var out := ""
	for ch in raw.substr(0,14):
		if ch.unicode_at(0) >= 32 and ch.unicode_at(0) < 127:
			out += ch
	if out != "" and _nick_rude(out):
		return "Player"
	return out if out != "" else "Driver"

func _online_peer_update(p: Dictionary) -> void:
	var id := String(p.get("i",""))
	if id == "" or id == online_id or id.length() > 24:
		return
	var pos := Vector3(float(p.get("x",0.0)),float(p.get("y",0.0)),float(p.get("z",0.0)))
	if absf(pos.x) > 600.0 or absf(pos.z) > 600.0 or absf(pos.y) > 60.0:
		return
	if not online_peers.has(id):
		if online_peers.size() >= ONLINE_MAX_PEERS:
			return
		online_peers[id] = _online_make_peer(id,_online_clean_name(String(p.get("n","Driver"))),clampi(int(p.get("c",0)),0,CARS.size()-1))
		(online_peers[id]["node"] as Node3D).position = pos
	var peer: Dictionary = online_peers[id]
	peer["target"] = pos
	peer["yaw"] = float(p.get("r",0.0))
	peer["seen"] = Time.get_ticks_msec()/1000.0
	peer["driving"] = int(p.get("d",1)) == 1
	peer["role"] = clampi(int(p.get("t",0)),0,2)
	peer["lvl"] = clampi(int(p.get("l",1)),1,20)
	var seat := int(p.get("s",-1))
	peer["seat"] = seat if seat >= 0 and seat < hub_seats.size() else -1
	var rc := int(p.get("rc",0)) == 1
	if rc != bool(peer.get("rc",false)):
		peer["rc"] = rc
		_peer_car_model(peer,4 if rc else clampi(int(p.get("c",0)),0,CARS.size()-1),rc)
	var qn := int(p.get("qn",0))
	var q := int(p.get("q",-1))
	if qn != int(peer.get("qn",0)) and q >= 0 and q < HUB_PHRASES.size():
		_bubble(peer["node"],HUB_PHRASES[q],3.0 if peer["driving"] else 2.6)
		if int(peer.get("qn",0)) != 0 or qn == 1:
			_feed_add("%s: %s" % [peer["name"],HUB_PHRASES[q]],"")
	peer["qn"] = qn
	var en := int(p.get("en",0))
	var e := int(p.get("e",-1))
	if en != int(peer.get("en",0)) and e >= 0 and e < HUB_EMOTES.size():
		_emote(peer.get("person",{}),e)
	peer["en"] = en
	var nm := _online_clean_name(String(p.get("n","Driver")))
	if nm != peer["name"]:
		peer["name"] = nm
		peer["shown"] = -1

func _online_make_peer(id: String, nm: String, car_index: int) -> Dictionary:
	var node := Node3D.new()
	add_child(node)
	var hue := float(id.hash() % 360)/360.0
	var body_color := Color.from_hsv(hue,0.65,0.9)
	var car_node := Node3D.new()
	node.add_child(car_node)
	var model := _try_model("res://models/car_%d.glb" % int(CARS[car_index].get("model",car_index)))
	if model != null:
		car_node.add_child(model)
		_online_tint(model,body_color)
	else:
		_box(car_node,Vector3(0,0.5,0),Vector3(1.8,0.8,3.6),body_color)
	var red_light := _box(car_node,Vector3(-0.35,1.45,0.1),Vector3(0.6,0.18,0.3),Color("ff2a2a"))
	var blue_light := _box(car_node,Vector3(0.35,1.45,0.1),Vector3(0.6,0.18,0.3),Color("2a4aff"))
	red_light.hide()
	blue_light.hide()
	var foot_node := Node3D.new()
	node.add_child(foot_node)
	var foot_person := _make_person(foot_node,id.hash() & 3,{"Shirt":body_color,"Pants":Color("263d54"),"Skin":Color("e8c9a0"),"Hair":Color("2b1d14"),"Shoes":Color("2b2b2b"),"Eye":Color("1c1c22")})
	if foot_person.is_empty():
		_box(foot_node,Vector3(0,0.75,0),Vector3(0.5,1.2,0.35),body_color)
		_box(foot_node,Vector3(0,1.5,0),Vector3(0.4,0.4,0.4),Color("e8c9a0"))
	_player_ring(foot_node,Color("4fe3ff"))
	foot_node.hide()
	var label := Label3D.new()
	label.text = nm
	label.font_size = 40
	label.modulate = Color("ffffff")
	label.position = Vector3(0,3.2,0)
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.outline_size = 10
	label.pixel_size = 0.012
	label.no_depth_test = true
	node.add_child(label)
	return {"node":node,"car":car_node,"foot":foot_node,"label":label,"name":nm,"target":Vector3.ZERO,"yaw":0.0,"seen":Time.get_ticks_msec()/1000.0,"driving":true,"role":0,"lvl":1,"shown":0,"red":red_light,"blue":blue_light,"person":foot_person,"seat":-1,"qn":0,"en":0}

func _online_tint(node: Node, color: Color) -> void:
	if node is MeshInstance3D:
		var mi := node as MeshInstance3D
		if mi.mesh != null:
			for surface in mi.mesh.get_surface_count():
				var m := mi.mesh.surface_get_material(surface)
				var mat_name := m.resource_name if m != null else ""
				if mat_name.begins_with("Body"):
					mi.set_surface_override_material(surface,_material(color))
				elif mat_name.begins_with("Cabin"):
					mi.set_surface_override_material(surface,_material(color.darkened(0.5)))
	for child in node.get_children():
		_online_tint(child,color)

func _online_update_peers(delta: float) -> void:
	if online_peers.is_empty():
		return
	var now := Time.get_ticks_msec()/1000.0
	var gone: Array = []
	for id in online_peers:
		var peer: Dictionary = online_peers[id]
		if now-float(peer["seen"]) > ONLINE_TIMEOUT:
			gone.append(id)
			continue
		var node: Node3D = peer["node"]
		var target: Vector3 = peer["target"]
		var pseat := int(peer.get("seat",-1))
		if pseat >= 0 and not peer["driving"]:
			# Seated players are drawn in their chair.
			var st: Dictionary = hub_seats[pseat]
			node.position = st["pos"]
			node.rotation.y = float(st["face"])
			_sit_pose(peer.get("person",{}),float(st["h"]),0.0)
			peer["sat"] = true
			(peer["car"] as Node3D).visible = false
			(peer["foot"] as Node3D).visible = true
			continue
		if peer.get("sat",false):
			peer["sat"] = false
			_pose_person(peer.get("person",{}),0.0,0.0)
		if node.position.distance_to(target) > 25.0:
			node.position = target
		else:
			node.position = node.position.lerp(target,minf(1.0,delta*8.0))
		node.rotation.y = lerp_angle(node.rotation.y,float(peer["yaw"]),minf(1.0,delta*8.0))
		(peer["car"] as Node3D).visible = peer["driving"]
		(peer["foot"] as Node3D).visible = not peer["driving"]
		var role := int(peer["role"])
		var cop := role == 2
		var flash := int(clock*6.0) % 2 == 0
		(peer["red"] as Node3D).visible = cop and flash
		(peer["blue"] as Node3D).visible = cop and not flash
		var key := role*100+int(peer["lvl"])
		if key != int(peer["shown"]):
			peer["shown"] = key
			var tag := String(peer["name"])
			var lab: Label3D = peer["label"]
			lab.text = "%s Lv%d" % [tag,int(peer["lvl"])]+("" if role == 0 else (" · THIEF" if role == 1 else " · POLICE"))
			lab.modulate = Color("ffb020") if role == 1 else (Color("9cc4ff") if role == 2 else Color.WHITE)
	for id in gone:
		(online_peers[id]["node"] as Node3D).queue_free()
		online_peers.erase(id)
	if not gone.is_empty():
		_online_refresh_button()

func _online_clear_peers() -> void:
	for id in online_peers:
		(online_peers[id]["node"] as Node3D).queue_free()
	online_peers.clear()

func _online_refresh_button() -> void:
	if online_button == null:
		return
	if not online_on:
		online_button.text = "Online: OFF"
	elif online_state < 3:
		online_button.text = "Online: ..."
	else:
		online_button.text = "Online: %d" % (online_peers.size()+1)

# ---------- v0.13.0: Marina Heights (Level 5 district: showroom, style shop, paint shop) ----------
const BASE_CARS := 5
const BASE_TRIALS := 7
const PAINT_PRICE := 150
const MARINA_GATE := Vector3(0,0,58)
const MARINA := [
	{"name":"Bridge Midpoint","pos":Vector3(0,0,82),"pay":500},
	{"name":"Fountain Plaza","pos":Vector3(-35,0,166.5),"pay":600},
	{"name":"Yacht Club","pos":Vector3(-62,0,216),"pay":700},
	{"name":"Sunset Boardwalk","pos":Vector3(70,0,222),"pay":700},
	{"name":"Marina Lighthouse","pos":Vector3(0,0,232),"pay":900},
]
const MARINA_BONUS := 3000
const SHOPS := [
	{"name":"Harbor Motors Showroom","pos":Vector3(-15,0,128),"tint":Color("5aa7d6"),"verb":"SHOWROOM"},
	{"name":"Style Shop","pos":Vector3(15,0,128),"tint":Color("e8685a"),"verb":"STYLE SHOP"},
	{"name":"Paint Shop","pos":Vector3(15,0,178),"tint":Color("f2c94c"),"verb":"PAINT SHOP"},
]
const PAINTS := [
	{"name":"Factory colors","color":Color("438fd0")},
	{"name":"Pearl White","color":Color("eef1f2")},
	{"name":"Jet Black","color":Color("23262b")},
	{"name":"Racing Red","color":Color("d33a3a")},
	{"name":"Sunset Orange","color":Color("f07f2e")},
	{"name":"Lemon","color":Color("f2d046")},
	{"name":"Lime","color":Color("7ac74f")},
	{"name":"Lagoon Teal","color":Color("22b5c9")},
	{"name":"Royal Blue","color":Color("2f5fd0")},
	{"name":"Violet","color":Color("7b5bd6")},
	{"name":"Hot Pink","color":Color("e8559a")},
]
const SHIRTS := [
	{"name":"Sunrise Yellow","color":Color("f2b24a"),"price":0},
	{"name":"Sky Blue","color":Color("5aa7d6"),"price":120},
	{"name":"Coral","color":Color("e8685a"),"price":120},
	{"name":"Mint","color":Color("52c79a"),"price":120},
	{"name":"Violet","color":Color("7b5bd6"),"price":200},
	{"name":"Midnight","color":Color("23262b"),"price":200},
]
const PANTS := [
	{"name":"Navy","color":Color("263d54"),"price":0},
	{"name":"Khaki","color":Color("b89a64"),"price":100},
	{"name":"Charcoal","color":Color("3b3f45"),"price":100},
	{"name":"Cream","color":Color("e9edef"),"price":150},
	{"name":"Crimson","color":Color("b03a3a"),"price":150},
]
const HATS := [
	{"name":"No hat","color":Color("ffffff"),"price":0},
	{"name":"Cap","color":Color("5aa7d6"),"price":150},
	{"name":"Top hat","color":Color("23262b"),"price":300},
	{"name":"Helmet","color":Color("e8685a"),"price":250},
	{"name":"Crown","color":Color("f2c94c"),"price":800},
]
var marina_mask := 0
var marina_nodes: Array[Node3D] = []
var marina_gate_body: StaticBody3D
var marina_gate_sign: Label3D
var shop_visit_mask := 0
var car_paint: Array = []
var av_shirt := 0
var av_pants := 0
var av_hat := 0
var av_own: Array = [1,1,1]
var shirt_mat: StandardMaterial3D
var pants_mats: Array = []
var hat_holder: Node3D
var player_person := {}
var player_walk := 0.0
var player_phase := 0.0
var shop_panel: PanelContainer
var shop_title: Label
var shop_info: Label
var shop_rows: Array = []
var shop_row_labels: Array = []
var shop_buy: Button
var shop_kind := -1
var shop_sel: Array = [0,0,0]
var journal_page := 0
var journal_next: Button

func _marina_open() -> bool:
	return not legacy_rules or _level() >= 5

func _marina_count() -> int:
	var n := 0
	for i in MARINA.size():
		if marina_mask & (1 << i):
			n += 1
	return n

func _nearest_marina() -> int:
	var closest := -1
	var best := INF
	var body: CharacterBody3D = car if driving else player
	for i in MARINA.size():
		if marina_mask & (1 << i):
			continue
		var pos: Vector3 = MARINA[i]["pos"]
		var d := Vector2(body.position.x-pos.x,body.position.z-pos.z).length()
		if d < best:
			best = d
			closest = i
	return closest

func _check_marina() -> void:
	var body: CharacterBody3D = car if driving else player
	for i in MARINA.size():
		var found := (marina_mask & (1 << i)) != 0
		var pos: Vector3 = MARINA[i]["pos"]
		marina_nodes[i].visible = not found
		marina_nodes[i].rotation.y = clock
		marina_nodes[i].position.y = pos.y+1.7+sin(clock*2+i)*0.25
		if found:
			continue
		if Vector2(body.position.x-pos.x,body.position.z-pos.z).length() < 4.5 and absf(body.position.y-pos.y) < 3.5:
			_discover_marina(i)

func _discover_marina(i: int) -> void:
	if marina_mask & (1 << i):
		return
	marina_mask |= 1 << i
	var count := _marina_count()
	var reward := int(MARINA[i]["pay"])
	if count == MARINA.size():
		reward += MARINA_BONUS
	cash += reward
	marina_nodes[i].hide()
	_save_progress()
	_show_toast("%s discovered!  %d/%d  +$%d%s" % [MARINA[i]["name"],count,MARINA.size(),reward,"  MARINA COMPLETE!" if count == MARINA.size() else ""])

func _shop_available(i: int) -> bool:
	return (i == 1) != driving

func _nearest_shop() -> int:
	var body: CharacterBody3D = car if driving else player
	for i in SHOPS.size():
		var pos: Vector3 = SHOPS[i]["pos"]
		if _shop_available(i) and Vector2(body.position.x-pos.x,body.position.z-pos.z).length() < 5.5 and absf(body.position.y-pos.y) < 3.0:
			return i
	return -1

func _premium_cars() -> Array:
	var list: Array = []
	for i in CARS.size():
		if bool(CARS[i].get("premium",false)):
			list.append(i)
	return list

func _glass(pos: Vector3, size: Vector3) -> void:
	var g := _box(self,pos,size,Color("9fd3e8"),true)
	var mat := g.material_override as StandardMaterial3D
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.albedo_color = Color(0.55,0.8,0.92,0.3)

func _shop_building(cx: float, cz: float, front_x: float, back_x: float, depth: float, wall_color: Color, roof_color: Color) -> void:
	var width := absf(front_x-back_x)
	var mid := (front_x+back_x)/2.0
	_box(self,Vector3(mid,0.06,cz),Vector3(width+2.0,0.12,depth+2.0),Color("e8e6dd"))
	_box(self,Vector3(back_x,3.5,cz),Vector3(1,7,depth),wall_color,true)
	_box(self,Vector3(mid,3.5,cz-depth/2.0),Vector3(width,7,1),wall_color,true)
	_box(self,Vector3(mid,3.5,cz+depth/2.0),Vector3(width,7,1),wall_color,true)
	_box(self,Vector3(mid,7.3,cz),Vector3(width+1.5,0.6,depth+1.5),roof_color)
	_glass(Vector3(front_x,3.0,cz),Vector3(0.3,6,depth))

func _shop_pad(i: int) -> void:
	var pos: Vector3 = SHOPS[i]["pos"]
	var tint: Color = SHOPS[i]["tint"]
	var pad := _box(self,pos+Vector3(0,0.04,0),Vector3(4.2,0.08,4.2),tint)
	var mat := pad.material_override as StandardMaterial3D
	mat.emission_enabled = true
	mat.emission = tint.darkened(0.4)
	_sign(String(SHOPS[i]["name"]).to_upper(),pos+Vector3(0,5.2,0),tint.lightened(0.3),40)

# ---------- public bus (Airport Line): Marina Heights - Waterfront - North Highway - Harbor Airfield ----------
func _bus_first() -> int:
	return 0 if _marina_open() else 1

func _bus_last() -> int:
	return BUS_STOPS.size()-1 if _north_open() else 3

func _build_bus() -> void:
	for i in BUS_STOPS.size():
		var z: float = BUS_STOPS[i]["z"]
		var parts: Array = []
		# v0.29: north of the Old City the highway is 20 m wide, so the shelters stand on its pavement.
		var sx := _bus_side(z)
		parts.append(_box(self,Vector3(sx,1.7,z),Vector3(0.3,3.4,0.3),Color("2f7fb8")))
		parts.append(_box(self,Vector3(sx,3.5,z),Vector3(1.6,0.9,0.2),Color("f4f7fa")))
		parts.append(_box(self,Vector3(sx+1.0,0.15,z),Vector3(2.6,0.1,4.2),Color("8fa0aa")))
		parts.append(_sign("BUS STOP\n"+String(BUS_STOPS[i]["name"]),Vector3(sx,5.2,z),Color("bfe4ff"),40))
		if i == 0:
			bus_stop_nodes = parts
	bus = Node3D.new()
	add_child(bus)
	_box(bus,Vector3(0,1.55,0),Vector3(2.7,2.5,9.6),Color("2f7fb8"))
	_box(bus,Vector3(0,0.95,0),Vector3(2.74,0.5,9.64),Color("f4f7fa"))
	_box(bus,Vector3(0,2.0,0),Vector3(2.76,0.9,8.6),Color("1d3442"))
	_box(bus,Vector3(0,2.85,0),Vector3(2.5,0.25,9.2),Color("e8eef2"))
	for wx in [-1.2,1.2]:
		for wz in [-3.0,3.0]:
			_box(bus,Vector3(wx,0.45,wz),Vector3(0.45,0.9,1.1),Color("20262b"))
	_box(bus,Vector3(0,1.3,-4.82),Vector3(2.3,0.5,0.1),Color("ffe9a8"))
	bus_label = Label3D.new()
	bus_label.font_size = 46
	bus_label.modulate = Color("d8f0ff")
	bus_label.position = Vector3(0,4.6,0)
	bus_label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	bus_label.outline_size = 8
	bus_label.pixel_size = 0.014
	bus.add_child(bus_label)
	_bus_reset()

func _bus_side(z: float) -> float:
	return 6.6 if z > NM_Z0 else 12.6

func _bus_reset() -> void:
	bus_idx = _bus_first()
	bus_next = bus_idx+1
	bus_fwd = true
	bus_dwell = 5.0
	bus_z = float(BUS_STOPS[bus_idx]["z"])
	bus.position = Vector3(BUS_LANE,0,bus_z)
	bus.rotation.y = 0.0

func _bus_text() -> String:
	if bus_dwell > 0.0:
		return "AIRPORT LINE\nAt %s" % BUS_STOPS[bus_idx]["name"]
	return "AIRPORT LINE\nNext: %s" % BUS_STOPS[bus_next]["name"]

func _bus_tick(delta: float) -> void:
	if bus == null:
		return
	var first := _bus_first()
	var last := _bus_last()
	var marina_on := _marina_open()
	for node: Node3D in bus_stop_nodes:
		node.visible = marina_on
	if bus_dwell > 0.0:
		bus_dwell -= delta
		if bus_dwell <= 0.0:
			if bus_fwd and bus_idx >= last:
				bus_fwd = false
			elif not bus_fwd and bus_idx <= first:
				bus_fwd = true
			bus_next = clampi(bus_idx+(1 if bus_fwd else -1),first,BUS_STOPS.size()-1)
			if bus_riding:
				_show_toast("Next stop: %s" % BUS_STOPS[bus_next]["name"])
	else:
		var target_z: float = BUS_STOPS[bus_next]["z"]
		var remaining := absf(target_z-bus_z)
		var speed := minf(BUS_SPEED,2.0+remaining*1.1)
		var step := minf(speed*delta,remaining)
		bus_z += step*(-1.0 if bus_fwd else 1.0)
		if remaining-step < 0.02:
			bus_z = target_z
			bus_idx = bus_next
			bus_dwell = BUS_DWELL+(3.0 if bus_idx <= first or bus_idx >= last else 0.0)
			if bus_riding:
				_show_toast("%s  ·  tap GET OFF to hop off" % BUS_STOPS[bus_idx]["name"])
	var lane := BUS_LANE if bus_fwd else -BUS_LANE
	bus.position.x = move_toward(bus.position.x,lane,delta*2.2)
	bus.position.z = bus_z
	bus.rotation.y = lerp_angle(bus.rotation.y,0.0 if bus_fwd else PI,minf(delta*3.0,1.0))
	bus_label.text = _bus_text()
	if bus_riding:
		player.position = bus.position+Vector3(0,1.3,0)
		player.velocity = Vector3.ZERO

func _bus_near() -> bool:
	if bus == null or driving or bus_riding or bus_dwell <= 0.0:
		return false
	if exploring and _nearest_find() >= 0:
		return false
	if not exploring:
		var dest := _destination()
		if Vector2(player.position.x-dest.x,player.position.z-dest.z).length() < 4.8:
			return false
	return Vector2(player.position.x-bus.position.x,player.position.z-bus.position.z).length() < 9.0

func _bus_board() -> void:
	if chase_mode != 0 or online_role != 0:
		_show_toast("No bus rides during a chase.")
		return
	if cash < BUS_FARE:
		_show_toast("Bus fare is $%d. You have $%d." % [BUS_FARE,cash])
		return
	cash -= BUS_FARE
	_save_progress()
	bus_riding = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	_show_toast("Fare paid -$%d  ·  next stop: %s" % [BUS_FARE,BUS_STOPS[bus_next if bus_dwell <= 0.0 else clampi(bus_idx+(1 if bus_fwd else -1),_bus_first(),BUS_STOPS.size()-1)]["name"]])

func _bus_alight(force := false) -> void:
	if not bus_riding:
		return
	if bus_dwell <= 0.0 and not force:
		_show_toast("Wait for the next stop: %s" % BUS_STOPS[bus_next]["name"])
		return
	bus_riding = false
	var z := bus.position.z
	player.position = Vector3(_bus_side(z)-1.4,0.9,z+3.2)
	player.velocity = Vector3.ZERO
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	_show_toast("Hopped off at %s." % BUS_STOPS[bus_idx]["name"])

func _build_marina() -> void:
	var asphalt := Color("354653")
	var line := Color("e7d9a4")
	var wall := Color("c9ccc4")
	_box(self,Vector3(0,-0.65,185),Vector3(430,0.3,180),Color("248caa"))
	# Bridge from the Ferry Steps beach to the island.
	_slab(Vector3(0,-0.35,84),Vector3(12,0.6,52),0,Color("8d9498"))
	_box(self,Vector3(0,0.01,84),Vector3(9,0.08,52),asphalt)
	for z in range(62,108,8):
		_box(self,Vector3(0,0.07,float(z)),Vector3(0.15,0.02,3),line)
	for sx in [-6.0,6.0]:
		_box(self,Vector3(sx,0.6,84),Vector3(0.4,1.2,52),wall,true)
	for z in [70.0,90.0,106.0]:
		for sx in [-4.0,4.0]:
			_box(self,Vector3(sx,-2.0,z),Vector3(1.4,3.4,1.4),Color("737b80"))
	marina_gate_body = _slab(MARINA_GATE+Vector3(0,2,0),Vector3(12,4,1),0,Color("5aa7d6"))
	_box(marina_gate_body,Vector3(0,1.0,0.52),Vector3(11,0.8,0.1),Color("fff3d0"))
	_box(marina_gate_body,Vector3(0,-0.8,0.52),Vector3(11,0.8,0.1),Color("fff3d0"))
	marina_gate_sign = _sign("",Vector3(0,5.8,58),Color("cfe6ff"),38)
	_sign("MARINA HEIGHTS",Vector3(0,7.2,112),Color("cfe6ff"),52)
	# Island deck (v0.27: open seafront, no perimeter wall).
	_slab(Vector3(0,-0.35,175),Vector3(210,0.6,134),0,Color("cfcab8"))
	# Boulevard and cross streets.
	_box(self,Vector3(0,0.01,175),Vector3(10,0.08,134),asphalt)
	for z in range(112,240,8):
		_box(self,Vector3(0,0.07,float(z)),Vector3(0.15,0.02,3),line)
	for cz in [150.0,205.0]:
		_box(self,Vector3(0,0.015,cz),Vector3(206,0.08,8),asphalt)
		for x in range(-100,101,8):
			if absi(x) > 6:
				_box(self,Vector3(float(x),0.075,cz),Vector3(3,0.02,0.15),line)
	# Harbor Motors Showroom (west side, glass front facing the boulevard).
	_shop_building(-36,128,-22,-50,32,Color("f2f0e8"),Color("2f5f86"))
	var showcase := [Color("22b5c9"),Color("f2d046"),Color("23262b")]
	for k in 3:
		var sz := 118.0+float(k)*10.0
		_box(self,Vector3(-38,0.25,sz),Vector3(7,0.5,7),Color("2c3a45"))
		var display := _prop("res://models/car_4.glb",Vector3(-38,0.5,sz),Vector3(1.8,1.2,3.6),-90.0,showcase[k],false)
		_online_tint(display,showcase[k])
	_shop_pad(0)
	# Style Shop (east side).
	_shop_building(36,128,22,50,32,Color("fbe9e4"),Color("e8685a"))
	var dress := [Color("5aa7d6"),Color("e8685a"),Color("52c79a")]
	for k in 3:
		var mz := 119.0+float(k)*9.0
		_box(self,Vector3(32,0.9,mz),Vector3(0.7,1.4,0.5),dress[k])
		_box(self,Vector3(32,1.85,mz),Vector3(0.5,0.5,0.5),Color("e8c9a0"))
		_box(self,Vector3(32,0.2,mz),Vector3(1.4,0.4,1.4),Color("3a3f45"))
	_box(self,Vector3(20,4.4,128),Vector3(5,0.3,30),Color("e8685a"))
	_shop_pad(1)
	# Paint Shop (east side, further south).
	_shop_building(36,178,22,50,32,Color("fff6d8"),Color("c89a22"))
	var cans := [Color("d33a3a"),Color("f2d046"),Color("22b5c9"),Color("7b5bd6"),Color("52c79a")]
	for k in 5:
		_box(self,Vector3(30,0.6,164.0+float(k)*7.0),Vector3(1.3,1.2,1.3),cans[k])
	_shop_pad(2)
	# Fountain plaza.
	_box(self,Vector3(-35,0.3,178),Vector3(17,0.6,17),Color("d9d4c4"),true)
	_box(self,Vector3(-35,0.65,178),Vector3(14,0.3,14),Color("4fa8c9"))
	_box(self,Vector3(-35,1.8,178),Vector3(1.6,3.0,1.6),Color("e8e6dd"),true)
	_box(self,Vector3(-35,3.4,178),Vector3(4.5,0.4,4.5),Color("4fa8c9"))
	_sign("FOUNTAIN PLAZA",Vector3(-35,7,178),Color("d8f0ff"),44)
	for bx in [-48.0,-22.0]:
		_box(self,Vector3(bx,0.5,170),Vector3(4,0.5,1.2),Color("866743"),true)
		_box(self,Vector3(bx,0.5,186),Vector3(4,0.5,1.2),Color("866743"),true)
	# Yacht club, boardwalk, lighthouse.
	_prop("res://models/building_2.glb",Vector3(-62,0,226),Vector3(26,9,14),0.0,Color("eef1f2"))
	_sign("YACHT CLUB",Vector3(-62,11,226),Color("ffffff"),44)
	_box(self,Vector3(70,0.04,222),Vector3(54,0.1,16),Color("a98562"))
	_sign("SUNSET BOARDWALK",Vector3(70,6,226),Color("ffd9a0"),40)
	for bx in [-40.0,-10.0,22.0,50.0]:
		_box(self,Vector3(bx,-0.2,248),Vector3(3,0.7,8),Color("eef1f2"))
		_box(self,Vector3(bx,0.4,248),Vector3(1.4,0.8,3),Color("5aa7d6"))
	_prop("res://models/lighthouse.glb",Vector3(16,0,236),Vector3(5,20,5),0.0,Color("f2f0e8"))
	# Skyline towers, trees and lamps.
	var tower_index := 0
	for tz in [128.0,178.0]:
		for tx in [-82.0,82.0]:
			_prop("res://models/building_%d.glb" % (tower_index % 4),Vector3(tx,0,tz),Vector3(11,14,10),0.0,Color("b3a2ad"))
			tower_index += 1
	var trees: Array = []
	for tx in [-14.0,14.0]:
		for tz in range(116,236,12):
			if not (absf(tx) < 16.0 and (tz > 120 and tz < 136 or tz > 170 and tz < 186)):
				trees.append(Vector3(tx,0,float(tz)))
	_scatter("res://models/tree_round.glb",trees,0.9,1.1)
	var lamps_a: Array = []
	var lamps_b: Array = []
	for z in range(116,236,14):
		lamps_a.append(Vector3(5.8,0,float(z)))
		lamps_b.append(Vector3(-5.8,0,float(z)+6.0))
	for z in range(62,108,12):
		lamps_a.append(Vector3(5.2,0,float(z)))
		lamps_b.append(Vector3(-5.2,0,float(z)+6.0))
	_scatter("res://models/lamp.glb",lamps_a,1.0,1.0,0.0)
	_scatter("res://models/lamp.glb",lamps_b,1.0,1.0,PI)
	for i in MARINA.size():
		marina_nodes.append(_north_token(MARINA[i]["pos"],MARINA[i]["name"]))

# Avatar and shop UI.
func _set_hat(index: int) -> void:
	for child in hat_holder.get_children():
		child.queue_free()
	var col: Color = HATS[index]["color"]
	if player_person.is_empty():
		# Old box head (no Blender model): simple box hats.
		match index:
			1:
				_box(hat_holder,Vector3(0,0.93,0),Vector3(0.5,0.16,0.5),col)
				_box(hat_holder,Vector3(0,0.87,-0.3),Vector3(0.46,0.05,0.2),col.darkened(0.25))
			2:
				_box(hat_holder,Vector3(0,0.92,0),Vector3(0.72,0.05,0.72),col)
				_box(hat_holder,Vector3(0,1.14,0),Vector3(0.44,0.42,0.44),col)
			3:
				_box(hat_holder,Vector3(0,0.98,0),Vector3(0.58,0.3,0.58),col)
			4:
				_box(hat_holder,Vector3(0,0.96,0),Vector3(0.5,0.18,0.5),col)
		return
	# v0.23: hats shaped and sized for the Blender head (centre 0.555 above the holder, face towards -Z).
	var hc := 0.555
	match index:
		1:
			var dome := SphereMesh.new()
			dome.radius = 0.122
			dome.height = 0.122
			dome.is_hemisphere = true
			dome.radial_segments = 16
			dome.rings = 6
			_hat_part(dome,Vector3(0,hc+0.045,0.005),Vector3(1.0,1.05,1.08),col)
			var brim := CylinderMesh.new()
			brim.top_radius = 0.085
			brim.bottom_radius = 0.085
			brim.height = 0.016
			brim.radial_segments = 14
			_hat_part(brim,Vector3(0,hc+0.05,-0.115),Vector3(1.15,1,1.0),col.darkened(0.25))
			_hat_part(SphereMesh.new(),Vector3(0,hc+0.175,0.005),Vector3(0.03,0.03,0.03),col.darkened(0.25))
		2:
			_hat_part(_cyl(0.165,0.018),Vector3(0,hc+0.085,0),Vector3.ONE,col)
			_hat_part(_cyl(0.108,0.2),Vector3(0,hc+0.19,0),Vector3.ONE,col)
			_hat_part(_cyl(0.111,0.035),Vector3(0,hc+0.112,0),Vector3.ONE,Color("d33a3a"))
		3:
			var shell := SphereMesh.new()
			shell.radius = 0.142
			shell.height = 0.142
			shell.is_hemisphere = true
			shell.radial_segments = 18
			shell.rings = 7
			_hat_part(shell,Vector3(0,hc+0.01,0.005),Vector3(1.0,1.15,1.08),col)
			_hat_part(_cyl(0.145,0.03),Vector3(0,hc+0.012,0.005),Vector3(1.0,1,1.08),col.darkened(0.2))
			_hat_part(BoxMesh.new(),Vector3(0,hc+0.075,-0.15),Vector3(0.16,0.035,0.012),Color("23262b"))
		4:
			_hat_part(_cyl(0.105,0.07),Vector3(0,hc+0.115,0),Vector3.ONE,col)
			for k in 6:
				var a := TAU*float(k)/6.0
				var spike := PrismMesh.new()
				spike.size = Vector3(0.06,0.07,0.02)
				var part := _hat_part(spike,Vector3(sin(a)*0.098,hc+0.185,cos(a)*0.098),Vector3.ONE,col)
				part.rotation.y = a
				_hat_part(SphereMesh.new(),Vector3(sin(a)*0.098,hc+0.225,cos(a)*0.098),Vector3(0.022,0.022,0.022),Color("e0434f") if k % 2 == 0 else Color("4fb3e8"))

func _cyl(radius: float, height: float) -> CylinderMesh:
	var c := CylinderMesh.new()
	c.top_radius = radius
	c.bottom_radius = radius
	c.height = height
	c.radial_segments = 16
	c.rings = 1
	return c

func _hat_part(mesh: Mesh, pos: Vector3, scale_v: Vector3, color: Color) -> MeshInstance3D:
	var m := MeshInstance3D.new()
	m.mesh = mesh
	m.position = pos
	m.scale = scale_v
	m.material_override = _material(color)
	hat_holder.add_child(m)
	return m

func _apply_avatar() -> void:
	shirt_mat.albedo_color = SHIRTS[av_shirt]["color"]
	for m in pants_mats:
		(m as StandardMaterial3D).albedo_color = PANTS[av_pants]["color"]
	_set_hat(av_hat)

func _shop_count(row: int) -> int:
	match shop_kind:
		0:
			return _premium_cars().size()
		1:
			return [SHIRTS.size(),PANTS.size(),HATS.size()][row]
		2:
			return PAINTS.size()
	return 1

func _shop_open(kind: int) -> void:
	shop_kind = kind
	shop_sel = [0,0,0]
	if kind == 1:
		shop_sel = [av_shirt,av_pants,av_hat]
	elif kind == 2:
		shop_sel[0] = int(car_paint[car_id])
	shop_visit_mask |= 1 << kind
	_save_progress()
	if not paused:
		paused = true
		stick = Vector2.ZERO
		touch_id = -1
		mouse_stick = false
		joystick.queue_redraw()
	_refresh_shop()
	_open_panel(shop_panel)

func _shop_step(row: int, step: int) -> void:
	if shop_kind < 0:
		return
	shop_sel[row] = posmod(int(shop_sel[row])+step,_shop_count(row))
	_refresh_shop()

func _shop_close() -> void:
	if shop_kind < 0:
		return
	shop_kind = -1
	shop_panel.hide()
	paused = false
	_apply_car()
	_apply_avatar()
	stick = Vector2.ZERO
	touch_id = -1
	mouse_stick = false
	joystick.queue_redraw()

func _owned_text(owned: bool, price: int) -> String:
	return "owned" if owned else ("$%d" % price)

func _refresh_shop() -> void:
	for r in 3:
		(shop_rows[r] as Control).visible = shop_kind == 1 or r == 0
	match shop_kind:
		0:
			var idx: int = _premium_cars()[int(shop_sel[0])]
			var spec: Dictionary = CARS[idx]
			var owned := (owned_mask & (1 << idx)) != 0
			var price := int(spec["price"])
			var st := _car_stats(idx)
			shop_title.text = "HARBOR MOTORS SHOWROOM"
			(shop_row_labels[0] as Label).text = "%s   %s" % [spec["name"],_owned_text(owned,price)]
			shop_info.text = "%s\nTop speed  %s  %d km/h\nPickup       %s\nHandling    %s\nYour cash: $%d" % [spec["note"],_bar(st.x,45.0),int(st.x*3.6),_bar(st.y,22.0),_bar(st.z,6.5),cash]
			if idx == car_id:
				shop_buy.text = "IN USE"
				shop_buy.disabled = true
			elif owned:
				shop_buy.text = "DRIVE THIS CAR"
				shop_buy.disabled = false
			else:
				shop_buy.text = "BUY  $%d%s" % [price,"" if cash >= price else "  (need $%d more)" % (price-cash)]
				shop_buy.disabled = false
		1:
			shop_title.text = "STYLE SHOP"
			var cost := 0
			var lists := [SHIRTS,PANTS,HATS]
			var names := ["Shirt","Pants","Hat"]
			for r in 3:
				var entry: Dictionary = (lists[r] as Array)[int(shop_sel[r])]
				var owned := (int(av_own[r]) & (1 << int(shop_sel[r]))) != 0
				if not owned:
					cost += int(entry["price"])
				(shop_row_labels[r] as Label).text = "%s: %s   %s" % [names[r],entry["name"],_owned_text(owned,int(entry["price"]))]
			shop_info.text = "Preview your look on the character, then buy and wear it.\nTotal to pay: $%d   Your cash: $%d" % [cost,cash]
			shop_buy.text = "WEAR THIS LOOK" if cost == 0 else "BUY & WEAR  $%d" % cost
			shop_buy.disabled = false
			shirt_mat.albedo_color = SHIRTS[int(shop_sel[0])]["color"]
			for m in pants_mats:
				(m as StandardMaterial3D).albedo_color = PANTS[int(shop_sel[1])]["color"]
			_set_hat(int(shop_sel[2]))
		2:
			var sel := int(shop_sel[0])
			var cur := int(car_paint[car_id])
			var cost2 := 0 if (sel == 0 or sel == cur) else PAINT_PRICE
			shop_title.text = "PAINT SHOP"
			(shop_row_labels[0] as Label).text = "%s   %s" % [PAINTS[sel]["name"],"$%d" % PAINT_PRICE if cost2 > 0 else ("current" if sel == cur else "free")]
			shop_info.text = "Painting your %s. Preview is live on your car.\nYour cash: $%d" % [CARS[car_id]["name"],cash]
			shop_buy.text = "PAINT  $%d" % cost2 if cost2 > 0 else ("KEEP THIS PAINT" if sel == cur else "RESTORE FACTORY COLORS")
			shop_buy.disabled = false
			var base: Color = CARS[car_id]["color"] if sel == 0 else PAINTS[sel]["color"]
			car_body_mat.albedo_color = base
			car_roof_mat.albedo_color = (CARS[car_id]["roof"] as Color) if sel == 0 else base.darkened(0.55)

func _shop_action() -> void:
	match shop_kind:
		0:
			var idx: int = _premium_cars()[int(shop_sel[0])]
			var spec: Dictionary = CARS[idx]
			if not (owned_mask & (1 << idx)):
				var price := int(spec["price"])
				if cash < price:
					_show_toast("Need $%d more for the %s." % [price-cash,spec["name"]])
					_refresh_shop()
					return
				cash -= price
				owned_mask |= 1 << idx
				_show_toast("You own the %s!" % spec["name"])
			car_id = idx
			_apply_car()
			_update_gate()
		1:
			var cost := 0
			var lists := [SHIRTS,PANTS,HATS]
			for r in 3:
				if not (int(av_own[r]) & (1 << int(shop_sel[r]))):
					cost += int((lists[r] as Array)[int(shop_sel[r])]["price"])
			if cash < cost:
				_show_toast("Need $%d more for this look." % (cost-cash))
				_refresh_shop()
				return
			cash -= cost
			for r in 3:
				av_own[r] = int(av_own[r]) | (1 << int(shop_sel[r]))
			av_shirt = int(shop_sel[0])
			av_pants = int(shop_sel[1])
			av_hat = int(shop_sel[2])
			_show_toast("Looking sharp!")
		2:
			var sel := int(shop_sel[0])
			var cur := int(car_paint[car_id])
			var cost2 := 0 if (sel == 0 or sel == cur) else PAINT_PRICE
			if cash < cost2:
				_show_toast("Need $%d more for paint." % (cost2-cash))
				_refresh_shop()
				return
			cash -= cost2
			car_paint[car_id] = sel
			_apply_car()
			_show_toast("Fresh paint!" if sel > 0 else "Factory colors restored.")
	_save_progress()
	_refresh_shop()

func _journal_flip() -> void:
	journal_page = (journal_page+1) % 3
	_refresh_journal()

# ---------- v0.12.0: player level (derived from progress, so old saves convert automatically) ----------
# v0.25: 20 levels, quick to climb early on. Quick quests and delivery jobs add bonus XP on top
# of the XP that comes from discoveries, trials and missions.
const LEVEL_XP := [0,100,250,450,700,1000,1350,1750,2200,2700,3250,3850,4500,5200,5950,6750,7600,8500,9450,10450]
const LEVEL_XP_LEGACY := [0,150,450,900,1500]
var last_level := 0
var bonus_xp := 0
var legacy_rules := false

func _level_table() -> Array:
	return LEVEL_XP_LEGACY if legacy_rules else LEVEL_XP

func _xp() -> int:
	var missions := 0
	for i in MISSIONS.size():
		if claimed_mask & (1 << i):
			missions += 1
	return _find_count()*20+(_civic_count()+_ridge_count()+_bay_count()+_north_count()+_marina_count()+_downtown_count())*25+_trial_count()*40+missions*60+mini(deliveries,ROUTES.size())*10+(0 if legacy_rules else bonus_xp)

func _level_for(xp: int) -> int:
	var level := 1
	var table := _level_table()
	for i in table.size():
		if xp >= int(table[i]):
			level = i+1
	return level

func _level() -> int:
	return _level_for(_xp())

func _level_text() -> String:
	var xp := _xp()
	var lv := _level_for(xp)
	var table := _level_table()
	if lv >= table.size():
		return "Level %d (MAX)  ·  %d XP" % [lv,xp]
	var lo := int(table[lv-1])
	var hi := int(table[lv])
	return "Level %d  %s  %d/%d XP" % [lv,_bar(float(xp-lo),float(hi-lo)),xp-lo,hi-lo]

func _check_level() -> void:
	var lv := _level()
	if lv != last_level and marina_gate_body != null:
		_update_gate()
	if last_level == 0 or lv < last_level:
		last_level = lv
		return
	if lv > last_level:
		last_level = lv
		var extra := " MAX LEVEL! You are a Harbor City legend." if lv >= _level_table().size() else ""
		_show_toast("LEVEL UP! You are now Level %d.%s" % [lv,extra])
		_level_up_fx(lv)

# ---------- v0.11.0: online police vs thief ----------
func _orole_ready() -> bool:
	return orole_test or (online_on and online_state == 3)

func _orole_start(role: int) -> void:
	_bus_alight(true)
	if not _orole_ready():
		_show_toast("Turn Online on first (top right), then pick a role.")
		return
	if trial_active >= 0:
		_show_toast("Finish or cancel your trial first.")
		return
	if chase_mode != 0:
		_chase_end("Chase ended.",0)
	if not driving:
		car.position = player.position+Vector3(0,0.8,0)
		car.velocity = Vector3.ZERO
		car_speed = 0.0
		driving = true
		player.hide()
		player.get_child(0).set_deferred("disabled",true)
	player.position = car.position
	online_role = role
	orole_t = 0.0
	orole_bust = 0.0
	orole_cool = 0.0
	if paused:
		_toggle_menu()
	chase_label.show()
	_show_toast("Online THIEF: escape the police for %ds. Others see you as the thief." % int(CHASE_TIME) if role == 1 else "Online POLICE: catch any player who is a thief. Each arrest pays $%d." % ORO_POLICE_PAY)

func _orole_end(message: String, reward: int) -> void:
	online_role = 0
	chase_label.hide()
	if reward > 0:
		cash += reward
		chase_wins += 1
		_save_progress()
	_show_toast(message)

func _orole_tick(delta: float) -> void:
	if online_role == 0:
		return
	if not _orole_ready():
		_orole_end("Online lost. Role ended.",0)
		return
	if not driving:
		_orole_end("You left the car. Role ended.",0)
		return
	orole_cool = maxf(0.0,orole_cool-delta)
	var want := 2 if online_role == 1 else 1
	var now := Time.get_ticks_msec()/1000.0
	var nearest := 9999.0
	var nearest_pos := car.position
	var count := 0
	for id in online_peers:
		var peer: Dictionary = online_peers[id]
		if int(peer["role"]) != want or now-float(peer["seen"]) > 2.0 or not bool(peer["driving"]):
			continue
		count += 1
		var tp: Vector3 = peer["target"]
		var d := tp.distance_to(car.position)
		if d < nearest:
			nearest = d
			nearest_pos = tp
	if count > 0 and online_role == 1:
		orole_t += delta
	if count > 0 and nearest < 5.0:
		orole_bust += delta
	else:
		orole_bust = maxf(0.0,orole_bust-delta*0.6)
	if orole_bust >= 2.5:
		orole_bust = 0.0
		if online_role == 1:
			_orole_end("BUSTED! A police player caught you. No money lost.",0)
			return
		if orole_cool <= 0.0:
			orole_cool = 20.0
			cash += ORO_POLICE_PAY
			chase_wins += 1
			_save_progress()
			_show_toast("Thief arrested!  +$%d" % ORO_POLICE_PAY)
	if online_role == 1 and orole_t >= CHASE_TIME:
		_orole_end("You escaped the police!  +$%d" % CHASE_PAY,CHASE_PAY)
		return
	var offset := nearest_pos-car.position
	var screen_right := camera.global_basis.x
	var screen_forward := -camera.global_basis.z
	screen_forward.y = 0
	var angle := atan2(offset.dot(screen_right),offset.dot(screen_forward.normalized()))
	var arrows := ["↑","↗","→","↘","↓","↙","←","↖"]
	var arrow: String = arrows[posmod(int(round(angle/(PI/4.0))),8)]
	if online_role == 1:
		if count == 0:
			chase_label.text = "ONLINE THIEF  ·  waiting for police players\nTimer starts when a police car is online"
		else:
			chase_label.text = "ONLINE THIEF  ·  escape in %ds\nNearest police %dm %s   Busted %s" % [int(ceil(CHASE_TIME-orole_t)),int(nearest),arrow,_bar(orole_bust,2.5)]
	else:
		if count == 0:
			chase_label.text = "ONLINE POLICE  ·  no thief online yet\nAsk a friend to pick THIEF"
		else:
			chase_label.text = "ONLINE POLICE  ·  thief %dm %s\nArrest %s" % [int(nearest),arrow,_bar(orole_bust,2.5)]

# ---------- v0.10.0: chase mode (offline) ----------
func _chase_open() -> void:
	chase_info.text = "THIEF: drive away from 3 police cars for %d seconds. If a cop stays close for 2.5s you are busted (no money lost).\nPOLICE: catch the fleeing thief car by staying within 5m for 2.5s.\nWin pays $%d. Chases won so far: %d.\nONLINE: turn Online on, then pick a role. Other players see you as THIEF or POLICE. Police arrests pay $%d each." % [int(CHASE_TIME),CHASE_PAY,chase_wins,ORO_POLICE_PAY]
	chase_end_button.disabled = chase_mode == 0 and online_role == 0
	_open_panel(chase_panel)

func _chase_clear() -> void:
	for u in chase_units:
		var body: Node = u["node"]
		if is_instance_valid(body):
			body.queue_free()
	chase_units.clear()
	for rb in chase_blocks:
		if is_instance_valid(rb["node"]):
			(rb["node"] as Node).queue_free()
	chase_blocks.clear()
	if chase_heli != null and is_instance_valid(chase_heli):
		chase_heli.queue_free()
	chase_heli = null

func _chase_make_unit(cop: bool) -> Dictionary:
	var body := CharacterBody3D.new()
	var shape := CollisionShape3D.new()
	var box := BoxShape3D.new()
	box.size = Vector3(1.7,1.3,3.3)
	shape.shape = box
	body.add_child(shape)
	_box(body,Vector3(0,0,0),Vector3(1.8,0.65,3.4),Color("f4f6f8") if cop else Color("b83a2c"))
	_box(body,Vector3(0,0.55,0.15),Vector3(1.45,0.65,1.6),Color("1f2a33"))
	var red: MeshInstance3D = null
	var blue: MeshInstance3D = null
	if cop:
		red = _box(body,Vector3(-0.35,0.98,0.1),Vector3(0.6,0.18,0.3),Color("ff2a2a"))
		blue = _box(body,Vector3(0.35,0.98,0.1),Vector3(0.6,0.18,0.3),Color("2a4aff"))
	else:
		_box(body,Vector3(0,0.98,0.1),Vector3(0.5,0.15,0.3),Color("ffb020"))
	var label := Label3D.new()
	label.text = "POLICE" if cop else "THIEF"
	label.font_size = 40
	label.modulate = Color("9cc4ff") if cop else Color("ffb020")
	label.position = Vector3(0,2.6,0)
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.outline_size = 10
	label.pixel_size = 0.012
	label.no_depth_test = true
	body.add_child(label)
	add_child(body)
	return {"node":body,"red":red,"blue":blue,"cop":cop,"stuck":0.0,"last":Vector3.ZERO,"turn":0.0,"dir":1.0}

func _chase_spawn_point(center: Vector3, dist: float) -> Vector3:
	for i in 20:
		var a := randf()*TAU
		var p := center+Vector3(sin(a),0,cos(a))*(dist+randf()*10.0)
		p.y = center.y+0.3
		if absf(p.x) < 560.0 and absf(p.z) < 560.0 and not _blocked_at(p+Vector3(0,1.0,0),1.2):
			return p
	return center+Vector3(dist,0.3,0)

func _chase_start(mode: int) -> void:
	if race_car:
		_show_toast("Return the race car first (Raceway menu).")
		return
	_bus_alight(true)
	if trial_active >= 0:
		_show_toast("Finish or cancel your trial first.")
		return
	online_role = 0
	_chase_clear()
	if not driving:
		car.position = player.position+Vector3(0,0.8,0)
		car.velocity = Vector3.ZERO
		car_speed = 0.0
		driving = true
		player.hide()
		player.get_child(0).set_deferred("disabled",true)
	player.position = car.position
	chase_mode = mode
	chase_t = 0.0
	chase_bust = 0.0
	chase_block_n = 0
	if mode == 1:
		for i in CHASE_COPS:
			var u := _chase_make_unit(true)
			(u["node"] as Node3D).position = _chase_spawn_point(car.position,45.0+i*10.0)
			chase_units.append(u)
	else:
		var t := _chase_make_unit(false)
		(t["node"] as Node3D).position = _chase_spawn_point(car.position,40.0)
		chase_units.append(t)
	if paused:
		_toggle_menu()
	chase_label.show()
	_show_toast("Run! Lose the police for %ds." % int(CHASE_TIME) if mode == 1 else "Catch the thief! Stay within 5m.")

func _chase_end(message: String, reward: int) -> void:
	chase_mode = 0
	online_role = 0
	_chase_clear()
	chase_label.hide()
	if reward > 0:
		cash += reward
		chase_wins += 1
		_save_progress()
	_show_toast(message)

func _chase_steer(u: Dictionary, goal: Vector3, speed: float, delta: float) -> void:
	var body: CharacterBody3D = u["node"]
	var to := goal-body.position
	to.y = 0
	var want := atan2(-to.x,-to.z)
	var best := want
	var free := false
	for off in [0.0,0.5,-0.5,1.0,-1.0,1.6,-1.6]:
		var h: float = want+off
		var dir := Vector3(-sin(h),0,-cos(h))
		if not _blocked_at(body.position+dir*4.5+Vector3(0,0.6,0),1.1):
			best = h
			free = true
			break
	if not free:
		best = want+PI
	u["stuck"] = float(u["stuck"])+delta
	if float(u["stuck"]) >= 1.0:
		var last: Vector3 = u["last"]
		if Vector2(body.position.x-last.x,body.position.z-last.z).length() < 1.0:
			u["turn"] = 1.0
			u["dir"] = 1.0 if randf() < 0.5 else -1.0
		u["last"] = body.position
		u["stuck"] = 0.0
	if float(u["turn"]) > 0.0:
		u["turn"] = float(u["turn"])-delta
		best = want+float(u["dir"])*2.0
	body.rotation.y = lerp_angle(body.rotation.y,best,minf(delta*3.5,1.0))
	var forward := -body.global_basis.z
	body.velocity.x = forward.x*speed
	body.velocity.z = forward.z*speed
	body.velocity.y -= 24*delta
	body.move_and_slide()
	if body.is_on_floor():
		body.velocity.y = 0

func _chase_roadblock() -> void:
	var forward := -car.global_basis.z
	forward.y = 0
	forward = forward.normalized()
	var side := car.global_basis.x
	side.y = 0
	side = side.normalized()
	var pos := Vector3.ZERO
	var found := false
	for dist in [60.0,50.0,70.0,45.0,80.0,40.0]:
		pos = car.position+forward*dist
		pos.y = 0.0
		if absf(pos.x) > 540.0 or absf(pos.z) > 540.0:
			continue
		var clear := true
		for off in [0.0,-3.5,3.5]:
			if _blocked_at(pos+side*off+Vector3(0,1.4,0),0.9):
				clear = false
		if clear:
			found = true
			break
	if not found:
		return
	var node := Node3D.new()
	node.position = pos
	node.rotation.y = car.rotation.y
	add_child(node)
	for sx in [-2.1,2.1]:
		_box(node,Vector3(sx,0.55,0),Vector3(3.6,0.9,1.8),Color("f4f6f8"),true)
		_box(node,Vector3(sx,1.2,0),Vector3(2.0,0.5,1.5),Color("1f2a33"))
		_box(node,Vector3(sx-0.5,1.55,0),Vector3(0.6,0.18,0.3),Color("ff2a2a"))
		_box(node,Vector3(sx+0.5,1.55,0),Vector3(0.6,0.18,0.3),Color("2a4aff"))
	var label := Label3D.new()
	label.text = "ROADBLOCK"
	label.font_size = 44
	label.modulate = Color("ffb020")
	label.position = Vector3(0,3.4,0)
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.outline_size = 10
	label.pixel_size = 0.012
	label.no_depth_test = true
	node.add_child(label)
	chase_blocks.append({"node":node,"t":14.0})
	_show_toast("Roadblock ahead!")

func _chase_heli_build() -> void:
	chase_heli = Node3D.new()
	chase_heli.position = car.position+Vector3(50,14,50)
	add_child(chase_heli)
	_box(chase_heli,Vector3(0,0,0),Vector3(2.4,2.0,5.0),Color("22313f"))
	_box(chase_heli,Vector3(0,0.2,-2.4),Vector3(1.8,1.2,1.2),Color("8fd0ff"))
	_box(chase_heli,Vector3(0,0.4,4.4),Vector3(0.4,0.5,4.0),Color("22313f"))
	_box(chase_heli,Vector3(0,1.3,0),Vector3(0.4,0.6,0.4),Color("22313f"))
	chase_rotor = Node3D.new()
	chase_rotor.position = Vector3(0,1.7,0)
	chase_heli.add_child(chase_rotor)
	_box(chase_rotor,Vector3.ZERO,Vector3(10,0.1,0.5),Color("cfd6db"))
	_box(chase_rotor,Vector3.ZERO,Vector3(0.5,0.1,10),Color("cfd6db"))
	_box(chase_heli,Vector3(0.7,-1.2,0),Vector3(0.5,0.4,0.5),Color("ffe9a8"))
	var label := Label3D.new()
	label.text = "POLICE HELI"
	label.font_size = 44
	label.modulate = Color("9cc4ff")
	label.position = Vector3(0,4.0,0)
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.outline_size = 10
	label.pixel_size = 0.012
	label.no_depth_test = true
	chase_heli.add_child(label)
	_show_toast("Police helicopter overhead! Outrun it.")

func _chase_extras(delta: float) -> bool:
	for rb in chase_blocks.duplicate():
		rb["t"] = float(rb["t"])-delta
		if float(rb["t"]) <= 0.0:
			if is_instance_valid(rb["node"]):
				(rb["node"] as Node).queue_free()
			chase_blocks.erase(rb)
	if chase_block_n < CHASE_BLOCK_TIMES.size() and chase_t >= float(CHASE_BLOCK_TIMES[chase_block_n]):
		chase_block_n += 1
		_chase_roadblock()
	var on := false
	if chase_t >= CHASE_HELI_START and chase_t < CHASE_HELI_END:
		if chase_heli == null:
			_chase_heli_build()
		var to := Vector3(car.position.x-chase_heli.position.x,0,car.position.z-chase_heli.position.z)
		var flat := to.length()
		if flat > 0.01:
			chase_heli.position += to/flat*minf(car_max*0.78*delta,flat)
		chase_heli.position.y = lerpf(chase_heli.position.y,14.0,minf(delta*2.0,1.0))
		chase_heli.rotation.y = lerp_angle(chase_heli.rotation.y,atan2(-to.x,-to.z),minf(delta*2.0,1.0))
		chase_rotor.rotation.y += delta*30.0
		on = flat < 16.0
	elif chase_heli != null:
		chase_heli.queue_free()
		chase_heli = null
	return on

func _chase_tick(delta: float) -> void:
	if chase_mode == 0:
		return
	if not driving:
		_chase_end("You left the car. Chase over.",0)
		return
	chase_t += delta
	var left := CHASE_TIME-chase_t
	var ramp := clampf(chase_t/CHASE_TIME,0.0,1.0)
	var phase := int(clock*6.0) % 2 == 0
	var nearest := 9999.0
	var nearest_pos := car.position
	for u in chase_units:
		var body: CharacterBody3D = u["node"]
		var d := body.position.distance_to(car.position)
		if bool(u["cop"]):
			_chase_steer(u,car.position,car_max*(0.78+0.14*ramp),delta)
			(u["red"] as MeshInstance3D).visible = phase
			(u["blue"] as MeshInstance3D).visible = not phase
			if d > 130.0 or body.position.y < -5.0:
				body.position = _chase_spawn_point(car.position,70.0)
				body.velocity = Vector3.ZERO
		else:
			var away := body.position+(body.position-car.position)
			if absf(body.position.x) > 540.0 or absf(body.position.z) > 540.0 or body.position.y < -5.0:
				away = Vector3.ZERO
			_chase_steer(u,away,car_max*(0.72+0.1*ramp),delta)
			if body.position.y < -5.0:
				body.position = _chase_spawn_point(car.position,40.0)
				body.velocity = Vector3.ZERO
		if d < nearest:
			nearest = d
			nearest_pos = body.position
	var heli_on := _chase_extras(delta) if chase_mode == 1 else false
	if nearest < 5.0:
		chase_bust += delta
	elif heli_on:
		chase_bust += delta*0.35
	else:
		chase_bust = maxf(0.0,chase_bust-delta*0.6)
	if chase_bust >= 2.5:
		if chase_mode == 1:
			_chase_end("BUSTED! The police caught you. No money lost.",0)
		else:
			_chase_end("Thief arrested!  +$%d" % CHASE_PAY,CHASE_PAY)
		return
	if left <= 0.0:
		if chase_mode == 1:
			_chase_end("You escaped the police!  +$%d" % CHASE_PAY,CHASE_PAY)
		else:
			_chase_end("The thief got away. Try again from Menu > Chase.",0)
		return
	var offset := nearest_pos-car.position
	var screen_right := camera.global_basis.x
	var screen_forward := -camera.global_basis.z
	screen_forward.y = 0
	var angle := atan2(offset.dot(screen_right),offset.dot(screen_forward.normalized()))
	var arrows := ["↑","↗","→","↘","↓","↙","←","↖"]
	var arrow: String = arrows[posmod(int(round(angle/(PI/4.0))),8)]
	if chase_mode == 1:
		chase_label.text = "WANTED  ·  escape in %ds\nNearest cop %dm %s   Busted %s%s" % [int(ceil(left)),int(nearest),arrow,_bar(chase_bust,2.5),"   HELI ON YOU!" if heli_on else ""]
	else:
		chase_label.text = "POLICE  ·  thief escapes in %ds\nThief %dm %s   Arrest %s" % [int(ceil(left)),int(nearest),arrow,_bar(chase_bust,2.5)]

func _start_trial(i: int) -> bool:
	if race_car:
		_show_toast("Return the race car first (Raceway menu).")
		return false
	var trial: Dictionary = TRIALS[i]
	if not _area_open(int(trial["area"])):
		_show_toast("%s is locked. Explore more to open its area." % trial["name"])
		return false
	trial_active = i
	trial_cp = 0
	trial_start = clock
	var start: Vector3 = trial["start"]
	var first: Vector3 = trial["cps"][0]
	var dir := first-start
	car.position = start+Vector3(0,0.8,0)
	car.rotation = Vector3(0,atan2(-dir.x,-dir.z),0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	driving = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	player.position = car.position
	if paused:
		_toggle_menu()
	_show_toast("%s started! Drive through the golden rings." % trial["name"])
	return true

func _cancel_trial() -> void:
	trial_active = -1
	_refresh_trials()
	_show_toast("Trial cancelled.")

func _check_trial() -> void:
	if trial_active < 0:
		return
	var trial: Dictionary = TRIALS[trial_active]
	var elapsed := clock-trial_start
	if elapsed > float(trial["par"])*3.0:
		trial_active = -1
		_show_toast("Trial timed out. Try again from Menu > Trials.")
		return
	var cp: Vector3 = trial["cps"][trial_cp]
	if Vector2(car.position.x-cp.x,car.position.z-cp.z).length() < 6.0 and absf(car.position.y-cp.y) < 4.0:
		trial_cp += 1
		if trial_cp >= trial["cps"].size():
			_finish_trial(elapsed)
		else:
			_show_toast("Checkpoint %d/%d  %.1fs" % [trial_cp,trial["cps"].size(),elapsed])

func _finish_trial(elapsed: float) -> void:
	var i := trial_active
	var trial: Dictionary = TRIALS[i]
	var first := (trial_done & (1 << i)) == 0
	var reward := int(trial["pay"]) if first else int(trial["pay"])/4
	var under := first and elapsed <= float(trial["par"])
	if under:
		reward += int(trial["pay"])/2
	cash += reward
	trial_done |= 1 << i
	if float(best_times[i]) <= 0.0 or elapsed < float(best_times[i]):
		best_times[i] = elapsed
	trial_active = -1
	_save_progress()
	_show_toast("%s done in %.1fs  +$%d%s" % [trial["name"],elapsed,reward,"  (beat par!)" if under else ""])

func _trial_count() -> int:
	var n := 0
	for i in TRIALS.size():
		if trial_done & (1 << i):
			n += 1
	return n

func _open_trials() -> void:
	_refresh_trials()
	_open_panel(trial_panel)

func _refresh_trials() -> void:
	trial_info.text = "Drive through every golden ring in order.\nFirst clear pays full; beat par on the first clear for +50%. Repeats pay 25%."
	for i in TRIALS.size():
		var trial: Dictionary = TRIALS[i]
		var best := float(best_times[i])
		var label := "%s · %ds · $%d · best %s" % [trial["name"],int(trial["par"]),int(trial["pay"]),("%.1fs" % best) if best > 0.0 else "--"]
		if not _area_open(int(trial["area"])):
			label = "%s · LOCKED" % trial["name"]
		trial_buttons[i].text = label
		trial_buttons[i].disabled = not _area_open(int(trial["area"]))
	trial_cancel.disabled = trial_active < 0

func _update_gate() -> void:
	var bay_is_open := _bay_open()
	bay_gate_body.get_child(0).set_deferred("disabled",bay_is_open)
	bay_gate_body.visible = not bay_is_open
	bay_gate_sign.text = "BAY ROAD OPEN" if bay_is_open else "BAY GATE\nDiscover all 6 Ridge sites"
	var north_is_open := _north_open()
	north_gate_body.get_child(0).set_deferred("disabled",north_is_open)
	north_gate_body.visible = not north_is_open
	north_gate_sign.text = "NORTH HIGHWAY OPEN" if north_is_open else "NORTH GATE\nDiscover 3 Bay sites"
	var marina_is_open := _marina_open()
	marina_gate_body.get_child(0).set_deferred("disabled",marina_is_open)
	marina_gate_body.visible = not marina_is_open
	marina_gate_sign.text = "MARINA HEIGHTS OPEN" if marina_is_open else "MARINA HEIGHTS\nReach Level 5 to cross"
	var open := _ridge_open()
	gate_body.get_child(0).set_deferred("disabled",open)
	gate_body.visible = not open
	gate_sign.text = "RIDGE PASS OPEN" if open else "RIDGE GATE\nNeeds a Ridge Rover\n(Menu > Garage)"

func _slab(pos: Vector3, size: Vector3, tilt: float, color: Color) -> StaticBody3D:
	var body := StaticBody3D.new()
	body.position = pos
	body.rotation_degrees.z = tilt
	add_child(body)
	var collider := CollisionShape3D.new()
	var box := BoxShape3D.new()
	box.size = size
	collider.shape = box
	body.add_child(collider)
	var mesh := MeshInstance3D.new()
	var shape := BoxMesh.new()
	shape.size = size
	mesh.mesh = shape
	mesh.material_override = _material(color)
	body.add_child(mesh)
	return body

func _build_ridge() -> void:
	var grass := Color("78a06b")
	var rock := Color("8a8377")
	var asphalt := Color("4a5560")
	_slab(Vector3(66,-0.35,0),Vector3(20,0.6,12),0,grass)
	_box(self,Vector3(66,0.01,0),Vector3(20,0.08,7),asphalt)
	_slab(Vector3(93,-0.35,0),Vector3(34,0.6,46),0,grass)
	_box(self,Vector3(93,0.01,0),Vector3(34,0.08,7),asphalt)
	# Ramp up to the summit plateau.
	_slab(Vector3(117.7,2.51,0),Vector3(24,0.6,20),14.0,Color("93866f"))
	for z in [-10.25,10.25]:
		_slab(Vector3(117.5,3.38,z),Vector3(24,1.2,0.5),14.0,rock)
		_box(self,Vector3(142.3,6.3,z),Vector3(26,1.2,0.5),rock,true)
	_slab(Vector3(142.3,5.4,0),Vector3(26,0.6,20),0,grass)
	_box(self,Vector3(155.6,6.3,0),Vector3(0.5,1.2,20.5),rock,true)
	# Locked gate: a solid barrier until the player owns a Ridge Rover.
	gate_body = _slab(RIDGE_GATE+Vector3(0,2,0),Vector3(1,4,12),0,Color("c4473d"))
	_box(gate_body,Vector3(-0.52,1.0,0),Vector3(0.1,0.8,11),Color("fff3d0"))
	_box(gate_body,Vector3(-0.52,-0.8,0),Vector3(0.1,0.8,11),Color("fff3d0"))
	gate_sign = _sign("",Vector3(57,5.6,0),Color("ffd18a"),38)
	_sign("RIDGE PASS",Vector3(66,5.2,-2),Color("f7edd4"),48)
	# Scenery: pines, camp, mill, pool, standing stones, summit flag.
	for p in [Vector2(96,19),Vector2(106,20),Vector2(108,15),Vector2(98,21),Vector2(94,17),Vector2(80,-20),Vector2(84,-21),Vector2(78,20),Vector2(106,-20),Vector2(110,-14)]:
		_box(self,Vector3(p.x,0.8,p.y),Vector3(0.5,1.6,0.5),Color("7a5836"))
		_box(self,Vector3(p.x,2.2,p.y),Vector3(3,1.6,3),Color("3f7048"))
		_box(self,Vector3(p.x,3.4,p.y),Vector3(2.2,1.3,2.2),Color("4a8353"))
		_box(self,Vector3(p.x,4.4,p.y),Vector3(1.3,1.1,1.3),Color("57935f"))
	for t in [Vector3(77,1,17),Vector3(86,1,19)]:
		var tent := MeshInstance3D.new()
		var prism := PrismMesh.new()
		prism.size = Vector3(3.2,2,3)
		tent.mesh = prism
		tent.material_override = _material(Color("d9894a"))
		tent.position = t
		add_child(tent)
	_box(self,Vector3(86,0.25,12),Vector3(0.8,0.5,0.8),Color("d4572e"))
	_box(self,Vector3(90,2,-20),Vector3(6,4,5),Color("b98a5a"),true)
	_box(self,Vector3(90,4.3,-20),Vector3(6.6,0.6,5.6),Color("8e3f35"))
	_box(self,Vector3(86.6,1.8,-20),Vector3(0.4,3,3),Color("6d4a2a"))
	_box(self,Vector3(100,0.04,-20),Vector3(7,0.1,5),Color("4fc4d8"))
	_box(self,Vector3(68,0.7,-3.6),Vector3(1.4,1.4,1.4),rock)
	_box(self,Vector3(68,1.6,-3.6),Vector3(1,0.6,1),rock)
	_box(self,Vector3(150,7.7,0),Vector3(0.2,4,0.2),Color("d9d2c2"))
	_box(self,Vector3(150.8,9.1,0),Vector3(1.4,0.9,0.1),Color("e0584a"))
	# Discovery crystals (golden) for the Ridge sites.
	for site in RIDGE:
		var pos: Vector3 = site["pos"]
		var token := Node3D.new()
		token.position = pos+Vector3(0,1.7,0)
		add_child(token)
		var gem := MeshInstance3D.new()
		var crystal := PrismMesh.new()
		crystal.size = Vector3(0.9,1.3,0.9)
		gem.mesh = crystal
		var mat := _material(Color("f4c95a"))
		mat.emission_enabled = true
		mat.emission = Color("a8741c")
		gem.material_override = mat
		token.add_child(gem)
		ridge_nodes.append(token)
		_sign(str(site["name"]).to_upper(),pos+Vector3(0,4.4,0),Color("ffe7a3"),36)
		_box(self,pos+Vector3(0,0.1,0),Vector3(2.4,0.18,2.4),Color("6b5530"))

func _check_ridge() -> void:
	var body: CharacterBody3D = car if driving else player
	for i in RIDGE.size():
		var found := (ridge_mask & (1 << i)) != 0
		var pos: Vector3 = RIDGE[i]["pos"]
		ridge_nodes[i].visible = not found
		ridge_nodes[i].rotation.y = clock
		ridge_nodes[i].position.y = pos.y+1.7+sin(clock*2+i)*0.25
		if found:
			continue
		if Vector2(body.position.x-pos.x,body.position.z-pos.z).length() < 4.5 and absf(body.position.y-pos.y) < 3.5:
			_discover(i)

func _discover(i: int) -> void:
	if ridge_mask & (1 << i):
		return
	ridge_mask |= 1 << i
	var count := _ridge_count()
	var reward := int(RIDGE[i]["pay"])
	if count == RIDGE.size():
		reward += RIDGE_BONUS
	cash += reward
	ridge_nodes[i].hide()
	_update_gate()
	_save_progress()
	_show_toast("%s discovered!  %d/%d  +$%d%s" % [RIDGE[i]["name"],count,RIDGE.size(),reward,"  RIDGE COMPLETE!" if count == RIDGE.size() else ""])

func _mission_progress(i: int) -> Vector2i:
	match i:
		0:
			return Vector2i(mini(_owned_count()-1,1),1)
		1:
			return Vector2i(1 if _ridge_open() else 0,1)
		2:
			return Vector2i(mini(_ridge_count(),3),3)
		3:
			return Vector2i(1 if (ridge_mask & 32) != 0 else 0,1)
		4:
			return Vector2i(mini(int(best_kmh),85),85)
		5:
			return Vector2i(mini(deliveries,25),25)
		6:
			return Vector2i(_ridge_count(),RIDGE.size())
		7:
			var base_owned := 0
			for c in BASE_CARS:
				if owned_mask & (1 << c):
					base_owned += 1
			return Vector2i(base_owned,BASE_CARS)
		9:
			return Vector2i(_bay_count(),BAY.size())
		10:
			var base_done := 0
			for t in BASE_TRIALS:
				if trial_done & (1 << t):
					base_done += 1
			return Vector2i(base_done,BASE_TRIALS)
		12:
			return Vector2i(1 if (marina_mask & 1) != 0 else 0,1)
		13:
			var visited := 0
			for k in 3:
				if shop_visit_mask & (1 << k):
					visited += 1
			return Vector2i(visited,3)
		14:
			var premium_owned := 0
			for c in _premium_cars():
				if owned_mask & (1 << int(c)):
					premium_owned = 1
			return Vector2i(premium_owned,1)
		15:
			return Vector2i(_marina_count(),MARINA.size())
		16:
			return Vector2i(_downtown_count(),DOWNTOWN.size())
		17:
			return Vector2i(1 if (trial_done & (1 << 8)) != 0 else 0,1)
		11:
			return Vector2i(_north_count(),NORTH.size())
		8:
			var best := 0
			for c in CARS.size():
				var sum := 0
				for u in UPGRADES.size():
					sum += _tune_level(c,u)
				best = maxi(best,sum)
			return Vector2i(best,MAX_TUNE*UPGRADES.size())
	return Vector2i(0,1)

func _check_missions() -> void:
	for i in MISSIONS.size():
		if claimed_mask & (1 << i):
			continue
		var progress := _mission_progress(i)
		if progress.x >= progress.y:
			claimed_mask |= 1 << i
			cash += int(MISSIONS[i]["pay"])
			_save_progress()
			_show_toast("MISSION COMPLETE: %s  +$%d" % [MISSIONS[i]["name"],MISSIONS[i]["pay"]])

func _open_garage() -> void:
	garage_view = car_id
	_refresh_garage()
	_open_panel(garage)

func _open_journal() -> void:
	journal_page = 0
	_refresh_journal()
	_open_panel(journal)

func _close_sub() -> void:
	_open_panel(menu)

func _bar(value: float, top: float) -> String:
	var filled := clampi(int(round(value/top*10.0)),0,10)
	return "[" + "#".repeat(filled) + "-".repeat(10-filled) + "]"

func _refresh_garage() -> void:
	var spec: Dictionary = CARS[garage_view]
	var owned := (owned_mask & (1 << garage_view)) != 0
	var price := int(spec["price"])
	garage_title.text = "%s  (%d/%d)" % [spec["name"],garage_view+1,CARS.size()]
	garage_swatch.color = spec["color"]
	garage_stats.text = "%s\nTop speed  %s  %d km/h\nPickup       %s\nHandling    %s\nYour cash: $%d" % [spec["note"],_bar(_car_stats(garage_view).x,40.0),int(_car_stats(garage_view).x*3.6),_bar(_car_stats(garage_view).y,20.0),_bar(_car_stats(garage_view).z,6.5),cash]
	if garage_view == car_id:
		garage_state.text = "Currently driving"
		garage_button.text = "IN USE"
		garage_button.disabled = true
	elif owned:
		garage_state.text = "Owned"
		garage_button.text = "DRIVE THIS CAR"
		garage_button.disabled = false
	elif bool(spec.get("premium",false)):
		garage_state.text = "Showroom exclusive: Harbor Motors, Marina Heights (Level 5)  $%d" % price
		garage_button.text = "BUY AT THE SHOWROOM"
		garage_button.disabled = true
	else:
		garage_state.text = "Price $%d%s" % [price,"" if cash >= price else "  (need $%d more)" % (price-cash)]
		garage_button.text = "BUY  $%d" % price
		garage_button.disabled = false
	garage_tune.disabled = not owned

func _garage_step(step: int) -> void:
	garage_view = posmod(garage_view+step,CARS.size())
	_refresh_garage()

func _garage_action() -> void:
	var spec: Dictionary = CARS[garage_view]
	if not (owned_mask & (1 << garage_view)):
		if bool(spec.get("premium",false)):
			_show_toast("The %s is sold at the Harbor Motors showroom in Marina Heights." % spec["name"])
			return
		var price := int(spec["price"])
		if cash < price:
			_show_toast("Need $%d more for the %s." % [price-cash,spec["name"]])
			_refresh_garage()
			return
		cash -= price
		owned_mask |= 1 << garage_view
		_show_toast("Bought the %s!" % spec["name"])
	car_id = garage_view
	_apply_car()
	_update_gate()
	_save_progress()
	_refresh_garage()

func _refresh_journal() -> void:
	var lines: PackedStringArray = []
	if journal_page == 0:
		lines.append(_level_text()+"   (finds 20 XP, sites 25, trials 40, missions 60, jobs 10)")
		lines.append("")
		lines.append("CIVIC CENTER  %d/%d   (west of the waterfront: police, hospital, school, hotels, mall, park)" % [_civic_count(),CIVIC.size()])
		lines.append("RIDGE DISCOVERIES  %d/%d%s" % [_ridge_count(),RIDGE.size(),"" if _ridge_open() else "   (gate locked)"])
		var names: PackedStringArray = []
		for i in RIDGE.size():
			if ridge_mask & (1 << i):
				names.append(RIDGE[i]["name"])
		lines.append(", ".join(names) if names.size() > 0 else "None yet. Own a Ridge Rover to open the Ridge Gate.")
		lines.append("BAY DISCOVERIES  %d/%d%s" % [_bay_count(),BAY.size(),"" if _bay_open() else "   (gate locked: find all Ridge sites)"])
		lines.append("NORTH DISCOVERIES  %d/%d%s" % [_north_count(),NORTH.size(),"" if _north_open() else "   (gate locked: find 3 Bay sites)"])
		lines.append("SKYLINE DISCOVERIES  %d/%d%s" % [_downtown_count(),DOWNTOWN.size(),"   (west of the North Highway, or up from Bay Road)" if _downtown_open() else "   (open all Bay Road: find all Ridge sites)"])
		lines.append("MARINA DISCOVERIES  %d/%d%s" % [_marina_count(),MARINA.size(),"" if _marina_open() else "   (bridge locked: reach Level 5)"])
		lines.append("")
		lines.append("MARINA HEIGHTS (Level 5)")
		lines.append("Shops visited %d/3.  Showroom cars: %s." % [_visited_shops(),"owned" if _mission_progress(14).x > 0 else "none yet"])
		lines.append("Cross the bridge south of the Ferry Steps once you reach Level 5.")
		journal_next.text = "Next page: missions >"
	else:
		var half := (MISSIONS.size()+1)/2
		var first := 0 if journal_page == 1 else half
		var last := half if journal_page == 1 else MISSIONS.size()
		lines.append("MISSIONS  (%d-%d of %d)" % [first+1,last,MISSIONS.size()])
		for i in range(first,last):
			var progress := _mission_progress(i)
			var done := (claimed_mask & (1 << i)) != 0
			lines.append("%s  %s: %s  (+$%d)" % ["[DONE]" if done else "[%d/%d]" % [progress.x,progress.y],MISSIONS[i]["name"],MISSIONS[i]["desc"],MISSIONS[i]["pay"]])
		journal_next.text = "More missions >" if journal_page == 1 else "< First page"
	journal_label.text = "\n".join(lines)

func _visited_shops() -> int:
	var visited := 0
	for k in 3:
		if shop_visit_mask & (1 << k):
			visited += 1
	return visited

func _build_panels(root: Control) -> void:
	garage = PanelContainer.new()
	root.add_child(garage)
	garage.custom_minimum_size = Vector2(520,0)
	garage.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var g := VBoxContainer.new()
	g.add_theme_constant_override("separation",10)
	garage.add_child(g)
	g.add_child(_label("GARAGE",26,Color("f0bd62")))
	garage_title = _label("",24,Color.WHITE)
	g.add_child(garage_title)
	garage_swatch = ColorRect.new()
	garage_swatch.custom_minimum_size = Vector2(480,34)
	g.add_child(garage_swatch)
	garage_stats = _label("",18,Color("cbd8de"))
	g.add_child(garage_stats)
	garage_state = _label("",20,Color("8ddacb"))
	g.add_child(garage_state)
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation",12)
	g.add_child(row)
	var prev := _button("< Prev",_garage_step.bind(-1))
	prev.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(prev)
	var next := _button("Next >",_garage_step.bind(1))
	next.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(next)
	garage_button = _button("",_garage_action)
	g.add_child(garage_button)
	garage_tune = _button("Tune this car",_open_tune)
	g.add_child(garage_tune)
	g.add_child(_button("Back",_close_sub))
	garage.hide()
	journal = PanelContainer.new()
	root.add_child(journal)
	journal.custom_minimum_size = Vector2(660,0)
	journal.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var j := VBoxContainer.new()
	j.add_theme_constant_override("separation",10)
	journal.add_child(j)
	j.add_child(_label("JOURNAL",26,Color("f0bd62")))
	journal_label = _label("",17,Color("cbd8de"))
	journal_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	journal_label.custom_minimum_size.x = 620
	j.add_child(journal_label)
	journal_next = _button("Next page >",_journal_flip)
	j.add_child(journal_next)
	j.add_child(_button("Back",_close_sub))
	journal.hide()
	tune_panel = PanelContainer.new()
	root.add_child(tune_panel)
	tune_panel.custom_minimum_size = Vector2(600,0)
	tune_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var t := VBoxContainer.new()
	t.add_theme_constant_override("separation",10)
	tune_panel.add_child(t)
	tune_title = _label("",26,Color("f0bd62"))
	t.add_child(tune_title)
	tune_info = _label("",18,Color("cbd8de"))
	t.add_child(tune_info)
	for u in UPGRADES.size():
		var tune_button := _button("",_buy_tune.bind(u))
		tune_button.custom_minimum_size = Vector2(540,58)
		tune_buttons.append(tune_button)
		t.add_child(tune_button)
	t.add_child(_button("Back to garage",_back_to_garage))
	tune_panel.hide()
	trial_panel = PanelContainer.new()
	root.add_child(trial_panel)
	trial_panel.custom_minimum_size = Vector2(760,0)
	trial_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var r := VBoxContainer.new()
	r.add_theme_constant_override("separation",10)
	trial_panel.add_child(r)
	r.add_child(_label("TIME TRIALS & STREET EVENTS",26,Color("f0bd62")))
	trial_info = _label("",17,Color("cbd8de"))
	trial_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	trial_info.custom_minimum_size.x = 700
	r.add_child(trial_info)
	var grid := GridContainer.new()
	grid.columns = 2
	grid.add_theme_constant_override("h_separation",10)
	grid.add_theme_constant_override("v_separation",8)
	r.add_child(grid)
	for i in TRIALS.size():
		var trial_button := _button("",_start_trial.bind(i))
		trial_button.custom_minimum_size = Vector2(345,42)
		trial_button.add_theme_font_size_override("font_size",17)
		for state in ["normal","hover","pressed"]:
			var sb := trial_button.get_theme_stylebox(state).duplicate() as StyleBoxFlat
			sb.content_margin_top = 4
			sb.content_margin_bottom = 4
			trial_button.add_theme_stylebox_override(state,sb)
		trial_buttons.append(trial_button)
		grid.add_child(trial_button)
	var trial_row := HBoxContainer.new()
	trial_row.add_theme_constant_override("separation",10)
	r.add_child(trial_row)
	trial_cancel = _button("Cancel running trial",_cancel_trial)
	trial_cancel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	trial_row.add_child(trial_cancel)
	var trial_back := _button("Back",_close_sub)
	trial_back.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	trial_row.add_child(trial_back)
	trial_panel.hide()
	chase_panel = PanelContainer.new()
	root.add_child(chase_panel)
	chase_panel.custom_minimum_size = Vector2(620,0)
	chase_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var c := VBoxContainer.new()
	c.add_theme_constant_override("separation",10)
	chase_panel.add_child(c)
	c.add_child(_label("CHASE MODE",26,Color("f0bd62")))
	chase_info = _label("",17,Color("cbd8de"))
	chase_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	chase_info.custom_minimum_size.x = 560
	c.add_child(chase_info)
	c.add_child(_button("Be the THIEF (run from police)",_chase_start.bind(1)))
	c.add_child(_button("Be the POLICE (catch the thief)",_chase_start.bind(2)))
	c.add_child(_button("ONLINE: be THIEF (needs Online ON)",_orole_start.bind(1)))
	c.add_child(_button("ONLINE: be POLICE (needs Online ON)",_orole_start.bind(2)))
	chase_end_button = _button("End chase",_chase_end.bind("Chase ended.",0))
	c.add_child(chase_end_button)
	c.add_child(_button("Back",_close_sub))
	chase_panel.hide()
	shop_panel = PanelContainer.new()
	root.add_child(shop_panel)
	shop_panel.custom_minimum_size = Vector2(640,0)
	shop_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var sp := VBoxContainer.new()
	sp.add_theme_constant_override("separation",10)
	shop_panel.add_child(sp)
	shop_title = _label("",26,Color("f0bd62"))
	sp.add_child(shop_title)
	shop_info = _label("",17,Color("cbd8de"))
	shop_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	shop_info.custom_minimum_size.x = 580
	sp.add_child(shop_info)
	for ri in 3:
		var shop_row := HBoxContainer.new()
		shop_row.add_theme_constant_override("separation",10)
		var shop_prev := _button("<",_shop_step.bind(ri,-1))
		shop_prev.custom_minimum_size = Vector2(80,46)
		shop_row.add_child(shop_prev)
		var shop_label := _label("",19,Color.WHITE)
		shop_label.custom_minimum_size.x = 400
		shop_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		shop_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		shop_row.add_child(shop_label)
		var shop_next := _button(">",_shop_step.bind(ri,1))
		shop_next.custom_minimum_size = Vector2(80,46)
		shop_row.add_child(shop_next)
		shop_rows.append(shop_row)
		shop_row_labels.append(shop_label)
		sp.add_child(shop_row)
	shop_buy = _button("",_shop_action)
	sp.add_child(shop_buy)
	sp.add_child(_button("Leave shop",_shop_close))
	shop_panel.hide()

func _build_player() -> void:
	player = CharacterBody3D.new()
	player.name = "Player"
	player.position = Vector3(7,0.7,7)
	add_child(player)
	var collision := CollisionShape3D.new()
	var capsule := CapsuleShape3D.new()
	capsule.radius = 0.35
	capsule.height = 1.4
	collision.shape = capsule
	player.add_child(collision)
	hat_holder = Node3D.new()
	player.add_child(hat_holder)
	player_person = _make_person(player,0,{"Shirt":Color("f2b24a"),"Pants":Color("263d54"),"Skin":Color("ac7552"),"Hair":Color("2b1d14"),"Shoes":Color("eef1f2"),"Eye":Color("1c1c22")})
	if player_person.is_empty():
		shirt_mat = _box(player, Vector3(0,0,0),Vector3(0.65,0.85,0.4),Color("f2b24a")).material_override as StandardMaterial3D
		_box(player, Vector3(0,0.68,0),Vector3(0.46,0.46,0.46),Color("ac7552"))
		pants_mats.append(_box(player, Vector3(-0.18,-0.58,0),Vector3(0.22,0.55,0.26),Color("263d54")).material_override)
		pants_mats.append(_box(player, Vector3(0.18,-0.58,0),Vector3(0.22,0.55,0.26),Color("263d54")).material_override)
	else:
		player_person["base_y"] = -0.7
		(player_person["root"] as Node3D).position.y = -0.7
		shirt_mat = player_person["mats"]["Shirt"]
		pants_mats.append(player_person["mats"]["Pants"])
		hat_holder.position.y = 0.29
	# Real players stand on a glowing ring (yours gold, other players cyan); NPC walkers have none.
	my_ring = _player_ring(player,Color("ffcf4a"))
	my_ring.position.y = -0.66
	camera = Camera3D.new()
	camera.fov = 55
	camera.far = 340
	add_child(camera)
	camera.current = true
	_follow_camera(1.0)

func _build_car() -> void:
	car = CharacterBody3D.new()
	car.name = "Car"
	car.position = Vector3(1.7,0.8,4)
	add_child(car)
	var collision := CollisionShape3D.new()
	var box := BoxShape3D.new()
	box.size = Vector3(1.7,1.3,3.3)
	collision.shape = box
	car.add_child(collision)
	car.collision_mask |= HUB_CAR_LAYER
	car_boxes = Node3D.new()
	car.add_child(car_boxes)
	car_body_mat = _box(car_boxes,Vector3(0,0,0),Vector3(1.8,0.65,3.4),Color("438fd0")).material_override
	car_roof_mat = _box(car_boxes,Vector3(0,0.55,0.15),Vector3(1.45,0.65,1.6),Color("264d68")).material_override
	spoiler = _box(car_boxes,Vector3(0,0.78,1.62),Vector3(1.7,0.1,0.35),Color("1d2a35"))
	spoiler.hide()
	_box(car_boxes,Vector3(0,0.9,0.15),Vector3(1.5,0.12,1.7),Color("5aa4d5"))
	for x in [-0.91,0.91]:
		for z in [-1.05,1.05]:
			_box(car_boxes,Vector3(x,-0.27,z),Vector3(0.3,0.6,0.65),Color("172936"))
	for x in [-0.58,0.58]:
		_box(car_boxes,Vector3(x,0,-1.72),Vector3(0.4,0.22,0.05),Color("fff0b8"))
		_box(car_boxes,Vector3(x,0,1.72),Vector3(0.4,0.22,0.05),Color("e96963"))

func _try_model(path: String) -> Node3D:
	if not ResourceLoader.exists(path):
		return null
	var res = load(path)
	if res is PackedScene:
		return (res as PackedScene).instantiate() as Node3D
	return null

# ---------- v0.14.0: Blender-made people (player, pedestrians, online players on foot) ----------
func _make_person(parent: Node3D, variant: int, colors: Dictionary) -> Dictionary:
	var model := _try_model("res://models/person_%d.glb" % variant)
	if model == null:
		return {}
	parent.add_child(model)
	var mats := {}
	var stack: Array[Node] = [model]
	while stack.size() > 0:
		var n: Node = stack.pop_back()
		stack.append_array(n.get_children())
		if n is MeshInstance3D and (n as MeshInstance3D).mesh != null:
			var mi := n as MeshInstance3D
			for surface in mi.mesh.get_surface_count():
				var src := mi.mesh.surface_get_material(surface)
				var key := src.resource_name if src != null else ""
				if not colors.has(key):
					continue
				if not mats.has(key):
					var m := StandardMaterial3D.new()
					m.albedo_color = colors[key]
					m.roughness = 0.75
					mats[key] = m
				mi.set_surface_override_material(surface,mats[key])
	var limbs := {}
	for part in ["ArmL","ArmR","LegL","LegR","Head","ShinL","ShinR","ForeArmL","ForeArmR"]:
		limbs[part] = model.find_child(part,true,false)
	return {"root":model,"mats":mats,"limbs":limbs}

func _pose_person(person: Dictionary, phase: float, amount: float) -> void:
	if person.is_empty():
		return
	var limbs: Dictionary = person["limbs"]
	var swing := sin(phase)*amount
	for part in ["LegL","ArmR"]:
		if limbs[part] != null:
			(limbs[part] as Node3D).rotation.x = swing*(0.6 if part.begins_with("Leg") else 0.5)
	for part in ["LegR","ArmL"]:
		if limbs[part] != null:
			(limbs[part] as Node3D).rotation.x = -swing*(0.6 if part.begins_with("Leg") else 0.5)
	# Knees bend while the foot swings through; elbows stay a little bent and swing forward.
	var k := 0
	for part in ["ShinL","ShinR"]:
		if limbs.get(part) != null:
			var lift := maxf(0.0,-sin(phase+(0.0 if k == 0 else PI)-0.9))
			(limbs[part] as Node3D).rotation.x = -(0.06+0.95*lift)*amount
		k += 1
	k = 0
	for part in ["ForeArmL","ForeArmR"]:
		if limbs.get(part) != null:
			var fwd := maxf(0.0,sin(phase+(PI if k == 0 else 0.0)))
			(limbs[part] as Node3D).rotation.x = 0.12+(0.18+0.45*fwd)*amount
		k += 1
	(person["root"] as Node3D).position.y = (person.get("base_y",0.0) as float)+absf(cos(phase))*0.035*amount

func _cull_person(node: Node, distance: float, shadows := false) -> void:
	if node is GeometryInstance3D:
		(node as GeometryInstance3D).visibility_range_end = distance
		if not shadows:
			(node as GeometryInstance3D).cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	for child in node.get_children():
		_cull_person(child,distance,shadows)

func _recolor_car_model(node: Node) -> void:
	if node is MeshInstance3D:
		var mi := node as MeshInstance3D
		if mi.mesh != null:
			for surface in mi.mesh.get_surface_count():
				var m := mi.mesh.surface_get_material(surface)
				var mat_name := m.resource_name if m != null else ""
				if mat_name.begins_with("Body"):
					mi.set_surface_override_material(surface,car_body_mat)
				elif mat_name.begins_with("Cabin"):
					mi.set_surface_override_material(surface,car_roof_mat)
	for child in node.get_children():
		_recolor_car_model(child)

func _apply_car_model() -> void:
	if car_boxes == null:
		return
	if car_model != null and car_model_id == _model_key():
		_recolor_car_model(car_model)
		return
	if car_model != null:
		car.remove_child(car_model)
		car_model.free()
		car_model = null
	car_model_id = _model_key()
	var model := _try_model("res://models/car_%d.glb" % (4 if race_car else int(CARS[car_id].get("model",car_id))))
	if model == null:
		car_boxes.visible = true
		return
	car.add_child(model)
	car_model = model
	car_boxes.visible = false
	_recolor_car_model(model)

func _landmark(path: String, pos: Vector3, hide_meshes: Array) -> bool:
	var model := _try_model(path)
	if model == null:
		return false
	model.position = pos
	add_child(model)
	for mesh in hide_meshes:
		(mesh as MeshInstance3D).visible = false
	return true

func _label(text: String, size: int, color: Color) -> Label:
	var label := Label.new()
	label.text = text
	label.add_theme_font_size_override("font_size",size)
	label.add_theme_color_override("font_color",color)
	return label

func _button(text: String, pressed: Callable) -> Button:
	var button := Button.new()
	button.text = text
	button.custom_minimum_size = Vector2(170,58)
	button.add_theme_font_size_override("font_size",22)
	button.add_theme_stylebox_override("normal",_panel(Color("213d4f"),18))
	button.add_theme_stylebox_override("hover",_panel(Color("315b6b"),18))
	button.add_theme_stylebox_override("pressed",_panel(Color("176678"),18))
	button.pressed.connect(pressed)
	touch_buttons.append(button)
	return button

func _panel(color: Color, radius := 18) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.set_corner_radius_all(radius)
	style.content_margin_left = 20
	style.content_margin_right = 20
	style.content_margin_top = 14
	style.content_margin_bottom = 14
	return style

func _build_hud() -> void:
	hud = CanvasLayer.new()
	add_child(hud)
	var root := Control.new()
	root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud.add_child(root)
	root.size = get_viewport().get_visible_rect().size
	get_viewport().size_changed.connect(func(): root.size = get_viewport().get_visible_rect().size)
	var info := PanelContainer.new()
	info.position = Vector2(24,24)
	info.custom_minimum_size = Vector2(430,125)
	info.add_theme_stylebox_override("panel",_panel(Color(0.06,0.13,0.18,0.97)))
	root.add_child(info)
	hud_info = info
	var column := VBoxContainer.new()
	info.add_child(column)
	mission_label = _label("HARBOR CITY  /  CITY DISCOVERY",18,Color("8ddacb"))
	column.add_child(mission_label)
	objective = _label("",22,Color("fff5dc"))
	column.add_child(objective)
	balance_label = _label("",18,Color("cbd8de"))
	column.add_child(balance_label)
	compass = _label("",18,Color("f0bd62"))
	column.add_child(compass)
	speed_label = _label("",18,Color("8ddacb"))
	column.add_child(speed_label)
	var pause_button := _button("Menu",_toggle_menu)
	root.add_child(pause_button)
	pause_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	pause_button.position = Vector2(root.size.x-194,24)
	radio_button = _button("♪ Radio off",_radio_next)
	radio_button.custom_minimum_size = Vector2(170,48)
	radio_button.add_theme_font_size_override("font_size",20)
	root.add_child(radio_button)
	radio_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	radio_button.position = Vector2(root.size.x-194,92)
	radio_caption = _label("",17,Color("d6f3ee"))
	radio_caption.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	radio_caption.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	radio_caption.add_theme_constant_override("outline_size",4)
	radio_caption.add_theme_color_override("font_outline_color",Color("132b3a"))
	radio_caption.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var cap_style := _panel(Color(0.06,0.13,0.18,0.78),12)
	cap_style.content_margin_left = 10
	cap_style.content_margin_right = 10
	cap_style.content_margin_top = 6
	cap_style.content_margin_bottom = 6
	radio_caption.add_theme_stylebox_override("normal",cap_style)
	root.add_child(radio_caption)
	radio_caption.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	radio_caption.position = Vector2(root.size.x-394,150)
	radio_caption.size = Vector2(366,10)
	radio_caption.hide()
	online_button = _button("Online: OFF",_online_toggle)
	online_button.custom_minimum_size = Vector2(170,48)
	online_button.add_theme_font_size_override("font_size",20)
	root.add_child(online_button)
	online_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	online_button.position = Vector2(root.size.x-376,92)
	chase_label = _label("",22,Color("ffe29a"))
	chase_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	chase_label.add_theme_constant_override("outline_size",5)
	chase_label.add_theme_color_override("font_outline_color",Color("132b3a"))
	chase_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var chase_style := _panel(Color(0.06,0.13,0.18,0.82),14)
	chase_style.content_margin_left = 14
	chase_style.content_margin_right = 14
	chase_label.add_theme_stylebox_override("normal",chase_style)
	root.add_child(chase_label)
	chase_label.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	chase_label.position = Vector2(root.size.x/2-260,24)
	chase_label.size = Vector2(520,10)
	chase_label.hide()
	joystick = Control.new()
	joystick.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(joystick)
	joystick.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	joystick.position = Vector2(32,root.size.y-210)
	joystick.size = Vector2(180,180)
	joystick.draw.connect(_draw_joystick)
	action_button = _button("ENTER CAR",_interact)
	root.add_child(action_button)
	action_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	action_button.position = Vector2(root.size.x-248,root.size.y-124)
	action_button.size = Vector2(220,80)
	action_button.add_theme_stylebox_override("normal",_panel(Color("f0bd62"),24))
	action_button.add_theme_color_override("font_color",Color("182b38"))
	action_button.add_theme_color_override("font_hover_color",Color("182b38"))
	action_button.add_theme_color_override("font_pressed_color",Color("182b38"))
	action_button.add_theme_stylebox_override("hover",_panel(Color("ffd58c"),24))
	action_button.add_theme_stylebox_override("pressed",_panel(Color("dba54d"),24))
	_build_minimap(root)
	_build_view_controls(root)
	_build_level_fx(root)
	_build_guidance(root)
	_build_game_panel(root)
	_build_chat(root)
	_build_travel(root)
	_build_qr(root)
	_build_quest_list(root)
	_build_treasure(root)
	_build_feed(root)
	_build_raceway_ui(root)
	status_label = _label("",20,Color("fff1c9"))
	root.add_child(status_label)
	status_label.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	status_label.position = Vector2(root.size.x/2-340,root.size.y-48)
	status_label.size = Vector2(680,32)
	status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	status_label.add_theme_color_override("font_shadow_color",Color("132b3a"))
	status_label.add_theme_constant_override("shadow_offset_x",2)
	status_label.add_theme_constant_override("shadow_offset_y",2)
	status_label.add_theme_constant_override("outline_size",4)
	status_label.add_theme_color_override("font_outline_color",Color("132b3a"))
	status_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	menu = PanelContainer.new()
	root.add_child(menu)
	menu.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	menu.position = root.size/2-Vector2(250,235)
	menu.custom_minimum_size = Vector2(500,0)
	menu.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var items := VBoxContainer.new()
	items.add_theme_constant_override("separation",12)
	menu.add_child(items)
	items.add_child(_label("WELCOME TO HARBOR CITY",26,Color("f0bd62")))
	items.add_child(_label("Explore the city, earn money, upgrade your car.\nLeft stick: move • Right button: interact",18,Color("cbd8de")))
	collection_label = _label("",16,Color("8ddacb"))
	collection_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	collection_label.custom_minimum_size.x = 440
	items.add_child(collection_label)
	var shop_row := HBoxContainer.new()
	shop_row.add_theme_constant_override("separation",12)
	items.add_child(shop_row)
	var garage_open := _button("Garage",_open_garage)
	garage_open.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	shop_row.add_child(garage_open)
	var journal_open := _button("Journal",_open_journal)
	journal_open.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	shop_row.add_child(journal_open)
	var trials_open := _button("Trials",_open_trials)
	trials_open.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	shop_row.add_child(trials_open)
	var chase_open := _button("Chase",_chase_open)
	chase_open.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	shop_row.add_child(chase_open)
	mode_button = _button("Switch activity",_toggle_activity)
	nick_button = _button("Nickname: (not set)",_open_nick)
	time_button = _button("Time: Live day & night",_cycle_day_mode)
	# v0.29: with the clean screen, everything that used to sit on screen lives here.
	var row1 := HBoxContainer.new()
	row1.add_theme_constant_override("separation",10)
	items.add_child(row1)
	var row2 := HBoxContainer.new()
	row2.add_theme_constant_override("separation",10)
	items.add_child(row2)
	for e in [[row1,"Map",_open_map],[row1,"Quests",_open_quests],[row1,"Travel",_open_travel],[row1,"Call car",_menu_call_car],[row2,"Chat",_toggle_chat]]:
		var b := _button(String(e[1]),_menu_go.bind(e[2]))
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		(e[0] as HBoxContainer).add_child(b)
	menu_view_button = _button("View",_menu_stay.bind(_cycle_view))
	menu_radio_button = _button("Radio",_menu_stay.bind(_radio_next))
	menu_online_button = _button("Online",_menu_stay.bind(_online_toggle))
	for b in [menu_view_button,menu_radio_button,menu_online_button]:
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row2.add_child(b)
	var row3 := HBoxContainer.new()
	row3.add_theme_constant_override("separation",10)
	items.add_child(row3)
	menu_run_button = _button("Run: ON",_menu_stay.bind(_toggle_run))
	menu_screen_button = _button("Screen: Clean",_menu_stay.bind(_toggle_clean_hud))
	for b in [menu_run_button,menu_screen_button,time_button]:
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row3.add_child(b)
	var row4 := HBoxContainer.new()
	row4.add_theme_constant_override("separation",10)
	items.add_child(row4)
	for b in [mode_button,nick_button]:
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row4.add_child(b)
	var row5 := HBoxContainer.new()
	row5.add_theme_constant_override("separation",10)
	items.add_child(row5)
	for b in [_button("Continue",_toggle_menu),_button("Return to the car",_rescue)]:
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row5.add_child(b)
	items.add_child(_label("Built with Godot Engine • MIT license\nLicense and attribution: credits.txt in the project",14,Color("8ddacb")))
	_build_panels(root)
	_build_nick_panel(root)
	menu.hide()
	hud_pause_button = pause_button
	get_viewport().size_changed.connect(_relayout_hud)

# ---------- v0.29: clean screen (only the QR code and a small minimap; the rest is in the Menu) ----------
const CLEAN_MINI_SCALE := 0.68
var hud_clean := true
var hud_clean_applied := false
var hud_force_full := false

func _clean_on() -> bool:
	return hud_clean and not hud_force_full
var menu_view_button: Button
var menu_radio_button: Button
var menu_online_button: Button
var menu_run_button: Button
var menu_screen_button: Button

func _minimap_tap() -> void:
	# On the clean screen the minimap is the way into the Menu (the full map is the first Menu button).
	if _clean_on():
		_toggle_menu()
	else:
		_open_map()

func _menu_go(f: Callable) -> void:
	if paused and menu.visible:
		_toggle_menu()
	f.call()

func _menu_stay(f: Callable) -> void:
	f.call()
	_refresh_menu_buttons()

func _menu_call_car() -> void:
	if driving:
		_show_toast("You are already in your car.")
	elif not _call_car():
		_show_toast("Your car can't come here right now.")

func _toggle_clean_hud() -> void:
	hud_clean = not hud_clean
	_save_progress()
	_relayout_hud()
	_clean_hud_tick()

func _refresh_menu_buttons() -> void:
	if menu_view_button == null:
		return
	if view_button != null:
		menu_view_button.text = view_button.text
	menu_radio_button.text = radio_button.text
	menu_online_button.text = online_button.text
	menu_run_button.text = "Run: ON" if run_on else "Run: OFF"
	menu_screen_button.text = "Screen: Clean" if hud_clean else "Screen: Full"

func _clean_hud_tick() -> void:
	if hud == null or action_button == null:
		return
	if menu != null and menu.visible:
		_refresh_menu_buttons()
	if not _clean_on():
		if hud_clean_applied:
			hud_clean_applied = false
			# Things nothing else re-shows each frame come back by hand.
			for c in [hud_info,hud_pause_button,radio_button,online_button,view_button,chat_button,clock_label]:
				if c != null:
					(c as CanvasItem).visible = true
			if my_tag != null:
				my_tag.visible = true
			action_button.visible = true
			if quests_button != null:
				quests_button.text = "Quests"
		if minimap != null and minimap.scale != Vector2.ONE:
			_relayout_hud()
		return
	hud_clean_applied = true
	for c in [hud_info,hud_pause_button,radio_button,radio_caption,online_button,view_button,chat_button,travel_button,run_button,feed_box,hud_arrow,clock_label,treasure_label]:
		if c != null:
			(c as CanvasItem).visible = false
	if my_tag != null:
		my_tag.visible = false
	# The big button only shows when there is something to do right here (not the standing CALL CAR).
	action_button.visible = action_button.text != "CALL CAR"
	if qr_small != null:
		qr_small.position = Vector2(18,18)
	# v0.29.1: the one button kept on the clean screen: Quests, under the QR code.
	if quests_button != null:
		var qy := 18.0
		if qr_small != null and qr_small.visible:
			qy = qr_small.position.y+qr_small.size.y+10.0
		quests_button.position = Vector2(18,qy)
		quests_button.text = "QUESTS"
	if minimap != null and minimap.scale.x != CLEAN_MINI_SCALE:
		_relayout_hud()

func _draw_joystick() -> void:
	joystick.draw_circle(Vector2(90,90),86,Color(0.05,0.12,0.18,0.55))
	joystick.draw_arc(Vector2(90,90),85,0,TAU,64,Color(0.8,0.94,0.95,0.6),2,true)
	joystick.draw_circle(Vector2(90,90)+stick*58,32,Color(0.6,0.87,0.88,0.85))

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_F12:
			_capture_preview()
		elif event.keycode == KEY_ESCAPE:
			if map_open:
				_close_map()
			else:
				_toggle_menu()
		elif event.keycode == KEY_M and not paused:
			_open_map()
		elif event.keycode == KEY_V and not paused:
			_cycle_view()
		elif event.keycode == KEY_E and not paused:
			_interact()
	if event is InputEventScreenTouch:
		if event.pressed:
			# Godot mouse emulation handles only the first finger; dispatch touch UI explicitly.
			for button: Button in touch_buttons:
				if button.is_visible_in_tree() and not button.disabled and button.get_global_rect().has_point(event.position):
					var in_overlay := menu.is_ancestor_of(button) or garage.is_ancestor_of(button) or journal.is_ancestor_of(button) or tune_panel.is_ancestor_of(button) or trial_panel.is_ancestor_of(button) or (map_panel != null and map_panel.is_ancestor_of(button)) or (nick_panel != null and nick_panel.is_ancestor_of(button)) or (rw_panel != null and rw_panel.is_ancestor_of(button)) or (travel_panel != null and travel_panel.is_ancestor_of(button)) or (crate_root != null and crate_root.is_ancestor_of(button)) or (quest_panel != null and quest_panel.is_ancestor_of(button))
					if not paused and in_overlay:
						continue
					if paused and not in_overlay:
						continue
					button.pressed.emit()
					get_viewport().set_input_as_handled()
					return
		if event.pressed and touch_id == -1 and _stick_zone(event.position) and not paused:
			touch_id = event.index
			touch_origin = event.position
			stick = Vector2.ZERO
		elif event.pressed and look_id == -1 and (eye_view or follow_view) and not paused and not _stick_zone(event.position):
			look_id = event.index
		elif not event.pressed and event.index == touch_id:
			touch_id = -1
			stick = Vector2.ZERO
		elif not event.pressed and event.index == look_id:
			look_id = -1
	if event is InputEventScreenDrag and event.index == touch_id:
		stick = ((event.position-touch_origin)/65.0).limit_length()
	if event is InputEventScreenDrag and event.index == look_id and (eye_view or follow_view):
		_look(event.relative)
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and _stick_zone(event.position) and not paused:
			mouse_stick = true
			touch_origin = event.position
		elif event.pressed and (eye_view or follow_view) and not paused and event.device != InputEvent.DEVICE_ID_EMULATION:
			mouse_look = true
		elif not event.pressed and mouse_stick:
			mouse_stick = false
			stick = Vector2.ZERO
		elif not event.pressed and mouse_look:
			mouse_look = false
	if event is InputEventMouseMotion and mouse_stick:
		stick = ((event.position-touch_origin)/65.0).limit_length()
	if event is InputEventMouseMotion and mouse_look and (eye_view or follow_view):
		_look(event.relative)
	if joystick:
		joystick.queue_redraw()

func _stick_zone(point: Vector2) -> bool:
	var size := get_viewport().get_visible_rect().size
	return point.x < size.x*0.43 and point.y > size.y*0.45

func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		stick = Vector2.ZERO
		touch_id = -1
		mouse_stick = false
		if booted:
			_save_progress()
	if what == NOTIFICATION_WM_GO_BACK_REQUEST and booted:
		if map_open:
			_close_map()
		else:
			_toggle_menu()

func _physics_process(delta: float) -> void:
	if not booted or paused:
		return
	clock += delta
	_treasure_tick(delta)
	_fm_tick(delta)
	_update_peds(delta)
	var keyboard := Vector2(
		float(Input.is_physical_key_pressed(KEY_D) or Input.is_physical_key_pressed(KEY_RIGHT))-float(Input.is_physical_key_pressed(KEY_A) or Input.is_physical_key_pressed(KEY_LEFT)),
		float(Input.is_physical_key_pressed(KEY_S) or Input.is_physical_key_pressed(KEY_DOWN))-float(Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP)))
	var control := keyboard.limit_length() if keyboard.length() > 0 else stick
	if bus_riding or sky_riding or (race_car and rec_count > 0.0):
		control = Vector2.ZERO
	# Align movement to the camera's horizontal axes.
	var forward := -camera.global_basis.z
	forward.y = 0
	forward = forward.normalized()
	var right := camera.global_basis.x
	right.y = 0
	var direction := (right.normalized()*control.x-forward*control.y).limit_length()
	if seat_id >= 0:
		_seated_tick(delta)
	elif driving and in_car_view:
		# In-car: up/down is gas/brake (and reverse), left/right steers like a real car.
		# Thumbs are never perfectly straight: ignore small sideways input and ease steering in, so
		# pushing "up" drives straight instead of slowly curving.
		var throttle := -control.y
		if absf(throttle) < 0.15:
			throttle = 0.0
		var steer := 0.0
		if absf(control.x) > 0.25:
			steer = signf(control.x)*pow((absf(control.x)-0.25)/0.75,1.6)
		var target_speed := throttle*_eff_max() if throttle >= 0.0 else throttle*6.0
		var rate := _eff_accel() if absf(target_speed) > absf(car_speed) and signf(target_speed) == signf(car_speed) else _eff_accel()*1.8
		car_speed = move_toward(car_speed,target_speed,delta*rate)
		var grip := clampf(absf(car_speed)/5.0,0.0,1.0)*signf(car_speed)
		var speed_damp := lerpf(1.0,0.55,clampf((absf(car_speed)-12.0)/20.0,0.0,1.0))
		car.rotation.y -= steer*grip*speed_damp*car_turn*0.5*delta
		var drive := -car.global_basis.z*car_speed
		car.velocity.x = drive.x
		car.velocity.z = drive.z
		player.position = car.position
		if cockpit_wheel != null:
			cockpit_wheel.rotation.y = lerpf(cockpit_wheel.rotation.y,-steer*1.6,minf(delta*10.0,1.0))
	elif driving:
		car_speed = move_toward(car_speed,control.length()*_eff_max(),delta*_eff_accel())
		if direction.length() > 0.08:
			car.rotation.y = lerp_angle(car.rotation.y,atan2(-direction.x,-direction.z),delta*car_turn)
		var movement := -car.global_basis.z*car_speed
		car.velocity.x = movement.x
		car.velocity.z = movement.z
		player.position = car.position
	elif eye_view:
		# Eye view: up/down walks forward/back, left/right turns.
		player.rotation.y -= control.x*2.3*delta
		var walk := -player.global_basis.z*(-control.y)*(_walk_speed() if control.y < 0.0 else 3.0)*(0.0 if fm_hosting else 1.0)
		player.velocity.x = walk.x
		player.velocity.z = walk.z
		player.velocity.y -= 24*delta
		player.move_and_slide()
		var stepping := Vector2(player.velocity.x,player.velocity.z).length() > 0.4
		player_walk = move_toward(player_walk,1.0 if stepping else 0.0,delta*6.0)
		player_phase += delta*9.0*player_walk
		car.velocity.x = move_toward(car.velocity.x,0,delta*20)
		car.velocity.z = move_toward(car.velocity.z,0,delta*20)
	else:
		player.velocity.x = direction.x*_walk_speed()*(0.0 if fm_hosting else 1.0)
		player.velocity.z = direction.z*_walk_speed()*(0.0 if fm_hosting else 1.0)
		if direction.length() > 0.08:
			player.rotation.y = lerp_angle(player.rotation.y,atan2(-direction.x,-direction.z),delta*10)
		player.velocity.y -= 24*delta
		player.move_and_slide()
		var walking := Vector2(player.velocity.x,player.velocity.z).length() > 0.4
		player_walk = move_toward(player_walk,1.0 if walking else 0.0,delta*6.0)
		player_phase += delta*(12.5 if run_on else 9.0)*player_walk
		_pose_person(player_person,player_phase,player_walk*(1.35 if run_on else 1.0))
		if follow_view:
			# The camera slowly swings in behind you as you walk (not when you walk back towards it,
			# and not right after you dragged to look around).
			cam_hold = maxf(cam_hold-delta,0.0)
			if walking and cam_hold <= 0.0 and absf(angle_difference(cam_yaw,player.rotation.y)) < 1.9:
				cam_yaw = lerp_angle(cam_yaw,player.rotation.y,delta*1.4*clampf(control.length(),0.0,1.0))
		car.velocity.x = move_toward(car.velocity.x,0,delta*20)
		car.velocity.z = move_toward(car.velocity.z,0,delta*20)
	car.velocity.y -= 24*delta
	car.move_and_slide()
	if car.is_on_floor():
		car.velocity.y = 0
	_bus_tick(delta)
	_sky_tick(delta)
	_ap_tick(delta)
	_sea_tick(delta)
	if player.position.y < -5 or car.position.y < -5:
		_rescue()
	if driving:
		best_kmh = maxf(best_kmh,absf(car_speed)*3.6)
	_check_ridge()
	_check_bay()
	_check_north()
	_check_marina()
	_check_downtown()
	_check_civic()
	_check_checkpoints()
	_traffic_tick(delta)
	_check_trial()
	_chase_tick(delta)
	_orole_tick(delta)
	_online_tick(delta)
	_check_missions()
	_check_level()
	marker.visible = (race_car and rec_act > 0) or trial_active >= 0 or quick_on or (not exploring and not next_job_pending) or (exploring and (_nearest_find() >= 0 or _nearest_civic() >= 0 or not _ridge_open() or _nearest_ridge() >= 0 or _nearest_bay() >= 0 or (_north_open() and _nearest_north() >= 0) or (_downtown_open() and _nearest_downtown() >= 0) or (_marina_open() and _nearest_marina() >= 0)))
	for index in find_nodes.size():
		find_nodes[index].visible = not bool(found_mask & (1 << index))
		find_nodes[index].rotation.y += delta
		find_nodes[index].position.y = 1.7+sin(clock*2+index)*0.25
	marker.position = _destination()+Vector3(0,0.25+sin(clock*2)*0.12,0)
	marker.rotation.y += delta*0.4
	if (view_mode == 2 and driving) != in_car_view or (walk_view == 3 and not driving) != eye_view or (walk_view == 0 and not driving) != follow_view or (car_model != null and car_model.visible == in_car_view):
		_apply_view()
	_follow_camera(delta*(5.0+absf(car_speed)*0.15))
	_minimap_tick()
	_guidance_tick(delta)
	_hub_people_tick(delta)
	_hub_keep_cars_out()
	_race_keep_cars_out()
	_rw_tick(delta)
	_feed_tick()
	if not hub_welcomed and not driving and player.position.distance_to(HUB_C) < HUB_R-4.0:
		hub_welcomed = true
		_show_toast("Welcome to Harbor Dome! Sit at a table to play, or tap Chat to say hi.")
	_refresh_hud()
	if toast_time > 0:
		toast_time -= delta
		if toast_time <= 0:
			status_label.text = ""

var cam_lock := false

func _follow_camera(weight: float) -> void:
	if cam_lock:
		return
	if sky_riding and not sky_trains.is_empty():
		_sky_camera(weight)
		return
	if view_mode == 2 and driving:
		# Driver's eye, left seat, looking slightly down over the bonnet.
		camera.global_transform = car.global_transform*Transform3D(Basis.from_euler(Vector3(deg_to_rad(-6.0),0,0)),Vector3(-0.38,0.93,0.1))
		return
	if walk_view == 3 and not driving:
		# Eye view: from the player's head, looking where they face (drag to look up/down and around).
		var eye_y := 0.82 if seat_id < 0 else 0.82-(0.86-(float(hub_seats[seat_id]["h"])+0.06))
		camera.global_transform = player.global_transform*Transform3D(Basis.from_euler(Vector3(look_pitch,0,0)),Vector3(0,eye_y,-0.12))
		return
	if walk_view == 0 and not driving and seat_id < 0:
		_follow_walk_camera(weight)
		return
	var target: Vector3 = car.position if driving else player.position
	var far := view_mode == 0 if driving else walk_view != 2
	var offset := Vector3(11,17,19) if far else Vector3(5.2,7.0,8.6)
	# Inside Harbor Dome the camera eases in as you walk up to a table, the bar or the stage.
	var spot := _hub_focus()
	var want := 0.0
	if spot != Vector3.INF:
		hub_spot = spot
		want = 1.0 if seat_id >= 0 else clampf((7.0-Vector2(target.x-spot.x,target.z-spot.z).length())/5.0,0.0,1.0)
	hub_zoom = move_toward(hub_zoom,want,clampf(weight,0.0,1.0)*0.6) if weight < 1.0 else want
	var look := target+Vector3(0,0.5,0)
	if hub_zoom > 0.0:
		offset = offset.lerp(Vector3(2.4,3.2,4.0),smoothstep(0.0,1.0,hub_zoom))
		look = look.lerp((target+hub_spot)/2.0+Vector3(0,0.9,0),hub_zoom)
	camera.position = camera.position.lerp(target+offset,minf(weight,1.0))
	if camera.position.distance_to(look) > 0.05:
		camera.look_at(look)

func _follow_walk_camera(weight: float) -> void:
	# Street-level camera just behind the player's shoulder. Walls between it and the player pull it closer.
	var look := player.position+Vector3(0,0.75,0)
	var dir := Vector3(sin(cam_yaw)*cos(cam_pitch),sin(cam_pitch),cos(cam_yaw)*cos(cam_pitch))
	var want := look+dir*FOLLOW_DIST
	var query := PhysicsRayQueryParameters3D.create(look,look+dir*(FOLLOW_DIST+0.4),1)
	var skip: Array[RID] = [player.get_rid()]
	if car != null:
		skip.append(car.get_rid())
	for t in traffic:
		skip.append((t["node"] as CollisionObject3D).get_rid())
	query.exclude = skip
	var hit := get_world_3d().direct_space_state.intersect_ray(query)
	var blocked := not hit.is_empty()
	if blocked:
		want = look+dir*maxf(look.distance_to(hit["position"])-0.4,0.6)
	if weight >= 1.0 or (blocked and want.distance_to(look) < camera.position.distance_to(look)):
		camera.position = want
	else:
		camera.position = camera.position.lerp(want,minf(weight*1.6,1.0))
	if camera.position.distance_to(look) > 0.05:
		camera.look_at(look+Vector3(0,0.2,0))

func _interact() -> void:
	if paused:
		return
	if race_car:
		if rec_act > 0:
			_rec_stop()
			_show_toast("Event cancelled. Tap RACEWAY MENU for another one.")
		else:
			_rw_open()
		_refresh_hud()
		return
	if not driving and player.position.distance_to(RW_DESK) < 6.0:
		_rw_open()
		return
	if seat_id >= 0:
		_stand_up()
		_refresh_hud()
		return
	var near_seat := _nearest_seat()
	if near_seat >= 0:
		_sit(near_seat)
		_refresh_hud()
		return
	if trial_active >= 0:
		if driving:
			_show_toast("Trial running: drive through the golden rings, or Menu > Trials to cancel.")
			return
		trial_active = -1
		_show_toast("Trial ended.")
	var shop := _nearest_shop()
	if shop >= 0:
		_shop_open(shop)
		return
	if sky_riding or sky_wait >= 0:
		_sky_action()
		_refresh_hud()
		return
	var sky_i := _sky_near()
	if sky_i >= 0:
		_sky_enter(sky_i)
		_refresh_hud()
		return
	if bus_riding:
		_bus_alight()
		_refresh_hud()
		return
	if _bus_near():
		_bus_board()
		_refresh_hud()
		return
	var body: CharacterBody3D = car if driving else player
	if fm_hosting:
		_show_toast("You're hiding for FIND ME! Stay put until it ends.")
		return
	if quick_on and trial_active < 0:
		var qd := _destination()
		if Vector2(body.position.x-qd.x,body.position.z-qd.z).length() < (6.2 if driving else 4.8):
			_quick_complete()
			_refresh_hud()
			return
	if not exploring and not quick_on and next_job_pending:
		next_job_pending = false
		_save_progress()
		_show_toast("Next job: %s → %s  •  $%d" % [ROUTES[route_index]["from"],ROUTES[route_index]["to"],ROUTES[route_index]["pay"]])
		_refresh_hud()
		return
	var destination := _destination()
	var reach := 6.2 if driving and not exploring else 4.8
	var nearby := Vector2(body.position.x-destination.x,body.position.z-destination.z).length() < reach
	var find_index := _nearest_find() if exploring else -1
	if exploring and find_index >= 0 and nearby and not driving:
		_collect_find(find_index)
	elif not exploring and not quick_on and nearby:
		var route: Dictionary = ROUTES[route_index]
		if carrying:
			cash += int(route["pay"])
			deliveries += 1
			bonus_xp += 25
			carrying = false
			route_index = (route_index+1) % ROUTES.size()
			next_job_pending = true
			_save_progress()
			_show_toast("JOB COMPLETE  +$%d  •  Tap NEXT JOB or explore from Menu." % int(route["pay"]))
		else:
			carrying = true
			_show_toast("Parcel collected. Deliver to %s  •  $%d" % [route["to"],route["pay"]])
	elif driving:
		var candidates := [Vector3(2.5,0,0),Vector3(-2.5,0,0),Vector3(0,0,3.2)]
		var found := false
		for offset: Vector3 in candidates:
			var exit_position := car.position+car.global_basis*offset
			exit_position.y += 0.25
			var query := PhysicsShapeQueryParameters3D.new()
			query.shape = player.get_child(0).shape
			query.transform = Transform3D(Basis.IDENTITY,exit_position)
			query.exclude = [player.get_rid()]
			if get_world_3d().direct_space_state.intersect_shape(query,1).is_empty():
				player.position = exit_position
				found = true
				break
		if not found:
			_show_toast("Move the car to an open space before getting out.")
			return
		driving = false
		player.show()
		player.get_child(0).set_deferred("disabled",false)
		car_speed = 0
		car.velocity.x = 0
		car.velocity.z = 0
	elif player.position.distance_to(car.position) < 5.0:
		driving = true
		player.hide()
		player.get_child(0).set_deferred("disabled",true)
		_show_toast("Steer with the stick. Release it to brake.")
	else:
		_call_car()
	_refresh_hud()

func _refresh_hud() -> void:
	var body: CharacterBody3D = car if driving else player
	var destination := _destination()
	var distance := int(Vector2(body.position.x-destination.x,body.position.z-destination.z).length())
	var index := _nearest_find() if exploring else -1
	var count := _find_count()
	mission_label.text = "HARBOR CITY  /  CITY DISCOVERY" if exploring else "HARBOR CITY  /  JOB %d OF 6" % (route_index+1)
	if exploring:
		if index >= 0:
			objective.text = "Find " + str(FINDS[index]["name"])+"  ·  "+str(distance)+"m"
		elif _nearest_civic() >= 0:
			objective.text = "Discover " + str(CIVIC[_nearest_civic()]["name"])+"  ·  "+str(distance)+"m"
		elif not _ridge_open():
			objective.text = "Ridge Gate  ·  %dm  ·  needs a Ridge Rover" % distance
		elif _nearest_ridge() >= 0:
			objective.text = "Discover " + str(RIDGE[_nearest_ridge()]["name"])+"  ·  "+str(distance)+"m"
		elif _nearest_bay() >= 0:
			objective.text = "Discover " + str(BAY[_nearest_bay()]["name"])+"  ·  "+str(distance)+"m"
		elif _north_open() and _nearest_north() >= 0:
			objective.text = "Discover " + str(NORTH[_nearest_north()]["name"])+"  ·  "+str(distance)+"m"
		elif _downtown_open() and _nearest_downtown() >= 0:
			objective.text = "Discover " + str(DOWNTOWN[_nearest_downtown()]["name"])+"  ·  "+str(distance)+"m"
		elif _marina_open() and _nearest_marina() >= 0:
			objective.text = "Discover " + str(MARINA[_nearest_marina()]["name"])+"  ·  "+str(distance)+"m"
		else:
			objective.text = "Harbor City fully explored!"
	elif next_job_pending:
		objective.text = "Job complete! Tap NEXT JOB"
	else:
		objective.text = ("%s %s  ·  %dm" % ["Deliver to" if carrying else "Collect at",ROUTES[route_index]["to"] if carrying else ROUTES[route_index]["from"],distance])
	if trial_active >= 0:
		var running: Dictionary = TRIALS[trial_active]
		mission_label.text = "HARBOR CITY  /  TIME TRIAL"
		objective.text = "%s  ring %d/%d  ·  %.1fs / par %ds" % [running["name"],trial_cp+1,running["cps"].size(),clock-trial_start,int(running["par"])]
	if quick_on and trial_active < 0:
		var q: Dictionary = QUICK[quick_idx]
		mission_label.text = "HARBOR CITY  /  DAILY QUEST %d/%d" % [QUICK.size()-_quick_left()+1,QUICK.size()]
		objective.text = "%s  ·  %dm" % [q["task"],distance]
	mission_label.text += "  ·  LV %d" % _level()
	balance_label.text = "$%d  ·  %d/8 finds  ·  %d/%d sites  ·  %d jobs" % [cash,count,_civic_count()+_ridge_count()+_bay_count()+_north_count()+_marina_count()+_downtown_count(),CIVIC.size()+RIDGE.size()+BAY.size()+NORTH.size()+MARINA.size()+DOWNTOWN.size(),deliveries]
	var offset: Vector3 = destination-body.position
	var screen_right := camera.global_basis.x
	var screen_forward := -camera.global_basis.z
	screen_forward.y = 0
	var compass_angle := atan2(offset.dot(screen_right),offset.dot(screen_forward.normalized()))
	var arrows := ["↑","↗","→","↘","↓","↙","←","↖"]
	var arrow_index := posmod(int(round(compass_angle/(PI/4.0))),8)
	compass.text = "%s  %s" % [arrows[arrow_index],"Destination is here" if distance < 5 else "Follow the golden ring"]
	if exploring and index < 0 and _nearest_civic() < 0 and _ridge_open() and _nearest_ridge() < 0 and _nearest_bay() < 0 and not (_north_open() and _nearest_north() >= 0) and not (_downtown_open() and _nearest_downtown() >= 0) and not (_marina_open() and _nearest_marina() >= 0):
		compass.text = "Everything found! Free roam, or pick Jobs in Menu."
	elif exploring and index < 0 and _nearest_civic() < 0 and not _ridge_open():
		compass.text = "%s  Buy a Ridge Rover in Menu > Garage" % arrows[arrow_index]
	speed_label.text = "%d km/h  •  Release stick to brake" % int(Vector2(car.velocity.x,car.velocity.z).length()*3.6) if driving else "On foot  •  Tokens: collect  •  Ridge sites: just arrive"
	if in_car_view:
		speed_label.text = "%d km/h  •  Up: gas  •  Down: brake/reverse" % int(Vector2(car.velocity.x,car.velocity.z).length()*3.6)
	elif eye_view:
		speed_label.text = "Eye view  •  Stick: walk/turn  •  Drag right side: look"
	elif follow_view:
		speed_label.text = "On foot  •  Stick: walk  •  Drag right side: look around"
	action_button.disabled = false
	if bus_riding:
		objective.text = "Airport Line  ·  next: %s" % BUS_STOPS[bus_idx if bus_dwell > 0.0 else bus_next]["name"]
		speed_label.text = "On the bus  •  Tap GET OFF at a stop"
	if race_car:
		action_button.text = "QUIT EVENT" if rec_act > 0 else "RACEWAY MENU"
	elif not driving and player.position.distance_to(RW_DESK) < 6.0:
		action_button.text = "PIT DESK"
	elif seat_id >= 0:
		action_button.text = "STAND UP"
	elif not driving and _nearest_seat() >= 0:
		action_button.text = _seat_label(_nearest_seat())
	elif _sky_hud():
		pass
	elif bus_riding:
		action_button.text = "GET OFF" if bus_dwell > 0.0 else "RIDING…"
		action_button.disabled = bus_dwell <= 0.0
	elif _bus_near() and _nearest_shop() < 0:
		action_button.text = "BOARD BUS  $%d" % BUS_FARE
	elif not exploring and not quick_on and next_job_pending:
		action_button.text = "NEXT JOB"
	elif _nearest_shop() >= 0:
		action_button.text = "OPEN " + String(SHOPS[_nearest_shop()]["verb"])
	elif quick_on and trial_active < 0 and distance < (6 if driving else 5):
		action_button.text = "PICK UP  +$%d" % _quick_pay(quick_idx)
	elif exploring and not quick_on and index >= 0 and distance < 5 and not driving:
		action_button.text = "COLLECT TOKEN"
	elif not exploring and not quick_on and distance < (6 if driving else 5):
		action_button.text = "DELIVER +$%d" % int(ROUTES[route_index]["pay"]) if carrying else "PICK UP PARCEL"
	else:
		var far_car := not driving and player.position.distance_to(car.position) >= 5.0
		action_button.text = "EXIT CAR" if driving else ("CALL CAR" if far_car else "ENTER CAR")
	mode_button.text = "Switch to delivery jobs" if quick_on else ("Switch to quick quests" if exploring else "Switch to exploring")
	_rw_hud()
	_refresh_nick_button()
	var discovered: PackedStringArray = []
	for find_index in FINDS.size():
		if found_mask & (1 << find_index):
			discovered.append(FINDS[find_index]["name"])
	collection_label.text = "Found %d/8: %s\n%s" % [count,", ".join(discovered) if count > 0 else "Follow the golden ring to your first blue token.",_level_text()]

func _open_panel(panel: Control) -> void:
	menu.hide()
	garage.hide()
	journal.hide()
	tune_panel.hide()
	trial_panel.hide()
	chase_panel.hide()
	shop_panel.hide()
	if nick_panel != null:
		nick_panel.hide()
	if rw_panel != null:
		rw_panel.hide()
	if travel_panel != null:
		travel_panel.hide()
	if quest_panel != null:
		quest_panel.hide()
	panel.show()
	panel.reset_size()
	_layout_panels()

func _layout_panels() -> void:
	var view := get_viewport().get_visible_rect().size
	for panel: Control in [menu,garage,journal,tune_panel,trial_panel,chase_panel,shop_panel]:
		panel.position = Vector2((view.x-panel.size.x)/2.0,maxf(8.0,(view.y-panel.size.y)/2.0))
	if nick_panel != null:
		nick_panel.position = Vector2((view.x-nick_panel.size.x)/2.0,maxf(8.0,(view.y-nick_panel.size.y)/2.0-120.0))
	if rw_panel != null:
		rw_panel.position = Vector2((view.x-rw_panel.size.x)/2.0,maxf(8.0,(view.y-rw_panel.size.y)/2.0))
	if travel_panel != null:
		travel_panel.position = Vector2((view.x-travel_panel.size.x)/2.0,maxf(8.0,(view.y-travel_panel.size.y)/2.0))
	if quest_panel != null:
		quest_panel.position = Vector2((view.x-quest_panel.size.x)/2.0,maxf(8.0,(view.y-quest_panel.size.y)/2.0))

func _toggle_menu() -> void:
	if crate_open:
		return
	if shop_kind >= 0:
		shop_kind = -1
		_apply_car()
		_apply_avatar()
	paused = not paused
	garage.hide()
	journal.hide()
	tune_panel.hide()
	trial_panel.hide()
	chase_panel.hide()
	shop_panel.hide()
	if nick_panel != null:
		nick_panel.hide()
	if rw_panel != null:
		rw_panel.hide()
	if travel_panel != null:
		travel_panel.hide()
	if quest_panel != null:
		quest_panel.hide()
	if paused:
		_open_panel(menu)
	else:
		menu.hide()
	stick = Vector2.ZERO
	touch_id = -1
	mouse_stick = false
	joystick.queue_redraw()

func _rescue() -> void:
	if race_car:
		_race_car_end(true)
	bus_riding = false
	sky_riding = false
	sky_wait = -1
	safe_hist.clear()
	car.position = Vector3(1.7,0.8,4)
	car.rotation = Vector3.ZERO
	car.velocity = Vector3.ZERO
	car_speed = 0
	player.position = Vector3(4.6,0.9,5.2)
	if checkpoint_id >= 0:
		var spots := _checkpoint_spawn()
		player.position = spots[0]
		car.position = spots[1]
	player.velocity = Vector3.ZERO
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	trial_active = -1
	if chase_mode != 0 or online_role != 0:
		chase_mode = 0
		online_role = 0
		_chase_clear()
		chase_label.hide()
	if paused:
		_toggle_menu()
	_show_toast("Back at the waterfront. Tap ENTER CAR to drive. Your money is safe." if checkpoint_id < 0 else "Back at checkpoint %s. Tap ENTER CAR to drive. Your money is safe." % CHECKPOINTS[checkpoint_id]["name"])
	_refresh_hud()

func _show_toast(message: String) -> void:
	status_label.text = message
	toast_time = 6.0

func _save_progress() -> void:
	var file := ConfigFile.new()
	file.set_value("progress","cash",cash)
	file.set_value("progress","deliveries",deliveries)
	file.set_value("progress","found_mask",found_mask)
	file.set_value("progress","route_index",route_index)
	file.set_value("progress","exploring",exploring)
	file.set_value("progress","next_job_pending",next_job_pending)
	file.set_value("progress","owned_mask",owned_mask)
	file.set_value("progress","car_id",car_id)
	file.set_value("progress","ridge_mask",ridge_mask)
	file.set_value("progress","claimed_mask",claimed_mask)
	file.set_value("progress","best_kmh",best_kmh)
	file.set_value("progress","tunes",tunes)
	file.set_value("progress","bay_mask",bay_mask)
	file.set_value("progress","north_mask",north_mask)
	file.set_value("progress","trial_done",trial_done)
	file.set_value("progress","best_times",best_times)
	file.set_value("progress","radio",radio_station)
	file.set_value("progress","online_name",online_name)
	file.set_value("progress","nick_chosen",nick_chosen)
	file.set_value("progress","chase_wins",chase_wins)
	file.set_value("progress","marina_mask",marina_mask)
	file.set_value("progress","downtown_mask",downtown_mask)
	file.set_value("progress","civic_mask",civic_mask)
	file.set_value("progress","boosts",boosts)
	file.set_value("progress","spikes",spikes)
	file.set_value("progress","rw_best",[rw_best_lap,rw_best_gp,rw_best_jump,rw_best_drag])
	file.set_value("progress","checkpoint",checkpoint_id)
	file.set_value("progress","shop_visit",shop_visit_mask)
	file.set_value("progress","car_paint",car_paint)
	file.set_value("progress","av_look",[av_shirt,av_pants,av_hat])
	file.set_value("progress","av_own",av_own)
	file.set_value("progress","crate_done",crate_done)
	file.set_value("progress","bonus_xp",bonus_xp)
	file.set_value("progress","quick_on",quick_on)
	file.set_value("progress","quick_idx",quick_idx)
	file.set_value("progress","quick_done",quick_done)
	file.set_value("progress","quick_day",quick_day)
	file.set_value("progress","quick_got",quick_got)
	file.set_value("progress","day_mode",day_mode)
	file.set_value("progress","hud_clean",hud_clean)
	file.set_value("progress","tour_day",tour_day)
	file.set_value("progress","tour_got",tour_got)
	file.set_value("progress","treasure_got",treasure_got)
	file.set_value("progress","treasure_count",treasure_count)
	file.set_value("progress","fm_refund",fm_refund)
	file.save(SAVE_PATH)

func _load_progress() -> void:
	var file := ConfigFile.new()
	if file.load(SAVE_PATH) == OK:
		crate_done = bool(file.get_value("progress","crate_done",false))
		bonus_xp = maxi(0,int(file.get_value("progress","bonus_xp",0)))
		quick_on = bool(file.get_value("progress","quick_on",true))
		quick_idx = posmod(int(file.get_value("progress","quick_idx",0)),QUICK.size())
		quick_done = maxi(0,int(file.get_value("progress","quick_done",0)))
		quick_day = String(file.get_value("progress","quick_day",""))
		quick_got = int(file.get_value("progress","quick_got",0)) & ((1 << QUICK.size())-1)
		day_mode = clampi(int(file.get_value("progress","day_mode",0)),0,DAY_MODES.size()-1)
		hud_clean = bool(file.get_value("progress","hud_clean",true))
		tour_day = String(file.get_value("progress","tour_day",""))
		tour_got = int(file.get_value("progress","tour_got",0)) & ((1 << SKY_STATIONS.size())-1)
		treasure_got = int(file.get_value("progress","treasure_got",-1))
		treasure_count = maxi(0,int(file.get_value("progress","treasure_count",0)))
		var refund := maxi(0,int(file.get_value("progress","fm_refund",0)))
		if refund > 0 and not fm_hosting:
			cash += refund
			fm_refund = 0
		if legacy_rules:
			quick_on = false
		cash = maxi(0,int(file.get_value("progress","cash",0)))
		deliveries = maxi(0,int(file.get_value("progress","deliveries",0)))
		found_mask = int(file.get_value("progress","found_mask",0)) & 255
		route_index = posmod(int(file.get_value("progress","route_index",deliveries)),ROUTES.size())
		exploring = bool(file.get_value("progress","exploring",true))
		next_job_pending = bool(file.get_value("progress","next_job_pending",false))
		owned_mask = (int(file.get_value("progress","owned_mask",1)) & ((1 << CARS.size())-1)) | 1
		car_id = clampi(int(file.get_value("progress","car_id",0)),0,CARS.size()-1)
		if not (owned_mask & (1 << car_id)):
			car_id = 0
		ridge_mask = int(file.get_value("progress","ridge_mask",0)) & ((1 << RIDGE.size())-1)
		claimed_mask = int(file.get_value("progress","claimed_mask",0)) & ((1 << MISSIONS.size())-1)
		best_kmh = maxf(0.0,float(file.get_value("progress","best_kmh",0.0)))
		bay_mask = int(file.get_value("progress","bay_mask",0)) & ((1 << BAY.size())-1)
		north_mask = int(file.get_value("progress","north_mask",0)) & ((1 << NORTH.size())-1)
		trial_done = int(file.get_value("progress","trial_done",0)) & ((1 << TRIALS.size())-1)
		radio_station = clampi(int(file.get_value("progress","radio",0)),0,RADIO.size()-1)
		online_name = String(file.get_value("progress","online_name",""))
		nick_chosen = bool(file.get_value("progress","nick_chosen",false))
		if online_name != "" and _clean_nick(online_name) == "":
			online_name = ""
		chase_wins = maxi(0,int(file.get_value("progress","chase_wins",0)))
		marina_mask = int(file.get_value("progress","marina_mask",0)) & ((1 << MARINA.size())-1)
		downtown_mask = int(file.get_value("progress","downtown_mask",0)) & ((1 << DOWNTOWN.size())-1)
		civic_mask = int(file.get_value("progress","civic_mask",0)) & ((1 << CIVIC.size())-1)
		boosts = clampi(int(file.get_value("progress","boosts",0)),0,5)
		spikes = clampi(int(file.get_value("progress","spikes",0)),0,5)
		var rb = file.get_value("progress","rw_best",[0.0,0.0,0.0,0.0])
		if rb is Array and rb.size() == 4:
			rw_best_lap = maxf(0.0,float(rb[0]))
			rw_best_gp = maxf(0.0,float(rb[1]))
			rw_best_jump = maxf(0.0,float(rb[2]))
			rw_best_drag = maxf(0.0,float(rb[3]))
		_rw_refresh_board()
		checkpoint_id = int(file.get_value("progress","checkpoint",-1))
		if checkpoint_id < -1 or checkpoint_id >= CHECKPOINTS.size():
			checkpoint_id = -1
		shop_visit_mask = int(file.get_value("progress","shop_visit",0)) & 7
		var saved_paint = file.get_value("progress","car_paint",[])
		car_paint.fill(0)
		if saved_paint is Array:
			for i in mini(saved_paint.size(),car_paint.size()):
				car_paint[i] = clampi(int(saved_paint[i]),0,PAINTS.size()-1)
		var saved_look = file.get_value("progress","av_look",[0,0,0])
		var saved_own = file.get_value("progress","av_own",[1,1,1])
		var own_limits := [SHIRTS.size(),PANTS.size(),HATS.size()]
		av_own = [1,1,1]
		if saved_own is Array and saved_own.size() >= 3:
			for r in 3:
				av_own[r] = (int(saved_own[r]) & ((1 << int(own_limits[r]))-1)) | 1
		if saved_look is Array and saved_look.size() >= 3:
			av_shirt = clampi(int(saved_look[0]),0,SHIRTS.size()-1)
			av_pants = clampi(int(saved_look[1]),0,PANTS.size()-1)
			av_hat = clampi(int(saved_look[2]),0,HATS.size()-1)
			if not (int(av_own[0]) & (1 << av_shirt)):
				av_shirt = 0
			if not (int(av_own[1]) & (1 << av_pants)):
				av_pants = 0
			if not (int(av_own[2]) & (1 << av_hat)):
				av_hat = 0
		var saved_times = file.get_value("progress","best_times",[])
		best_times = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
		if saved_times is Array:
			for i in mini(saved_times.size(),best_times.size()):
				best_times[i] = maxf(0.0,float(saved_times[i]))
		var saved_tunes = file.get_value("progress","tunes",[])
		tunes.fill(0)
		if saved_tunes is Array:
			for i in mini(saved_tunes.size(),tunes.size()):
				tunes[i] = clampi(int(saved_tunes[i]),0,MAX_TUNE)

# ---------- v0.5.0: original synthesized radio and ambient pedestrians ----------
func _midi(m: float) -> float:
	return 440.0*pow(2.0,(m-69.0)/12.0)

func _radio_voice(buf: PackedFloat32Array, start: float, dur: float, freq: float, vol: float, kind: int) -> void:
	var total := buf.size()
	var s0 := int(start*RADIO_SR)
	var n := int(dur*RADIO_SR)
	var ph := 0.0
	var step := freq/float(RADIO_SR)
	for i in n:
		var t := float(i)/float(RADIO_SR)
		var v := 0.0
		match kind:
			0:
				ph += step
				v = (sin(TAU*ph)+0.5*sin(TAU*ph*2.0)+0.25*sin(TAU*ph*3.0))*exp(-t*7.0)*minf(t*200.0,1.0)
			1:
				ph += step
				v = (sin(TAU*ph)+0.45*sin(TAU*ph*2.0))*exp(-t*3.2)*minf(t*150.0,1.0)
			2:
				ph += step
				v = (sin(TAU*ph)+0.35*sin(TAU*ph*2.0))*minf(t/0.5,1.0)*minf((dur-t)/0.7,1.0)
			3:
				ph += (45.0+120.0*exp(-t*28.0))/float(RADIO_SR)
				v = sin(TAU*ph)*exp(-t*14.0)
			4:
				v = (randf()*2.0-1.0)*exp(-t*70.0)*0.5
			5:
				ph += step
				v = (sin(TAU*ph)+0.4*sin(TAU*ph*2.76))*exp(-t*2.2)*minf(t*300.0,1.0)
		var idx := (s0+i) % total
		buf[idx] += v*vol
		if i % 4096 == 4095 and Time.get_ticks_msec()-radio_t0 > 8:
			await get_tree().process_frame
			radio_t0 = Time.get_ticks_msec()

func _radio_make(station: int) -> AudioStreamWAV:
	radio_t0 = Time.get_ticks_msec()
	var bpm := 124.0
	var bars := 4
	var gain := 0.5
	if station == 2:
		bpm = 76.0
	elif station == 3:
		bpm = 96.0
		bars = 2
	var beat := 60.0/bpm
	var total := int(float(bars*4)*beat*float(RADIO_SR))
	var buf := PackedFloat32Array()
	buf.resize(total)
	buf.fill(0.0)
	if station == 1:
		# Harbor FM: A minor synth-pop loop (Am F C G).
		var chords := [[57,60,64],[53,57,60],[48,52,55],[55,59,62]]
		var roots := [45,41,36,43]
		for bar in 4:
			var b0 := float(bar*4)*beat
			var chord: Array = chords[bar]
			for k in 4:
				await _radio_voice(buf,b0+float(k)*beat,0.2,_midi(36.0),0.9,3)
				await _radio_voice(buf,b0+(float(k)+0.5)*beat,0.05,0.0,0.18,4)
			for bt in [0.0,1.5,2.0,3.5]:
				await _radio_voice(buf,b0+bt*beat,0.42,_midi(float(roots[bar])),0.45,1)
			var pattern := [0,1,2,1,0,1,2,1]
			for e in 8:
				var note := float(chord[pattern[e]]+(24 if e == 4 or e == 7 else 12))
				await _radio_voice(buf,b0+float(e)*beat*0.5,0.28,_midi(note),0.3,0)
	elif station == 2:
		# Bay Waves: slow coastal pads and bells (Cmaj7 Am7 Fmaj7 G6).
		var pads := [[60,64,71],[57,64,67],[53,60,64],[55,62,64]]
		var lows := [36,33,29,31]
		var bells := [[76,79,84],[81,79,76],[72,76,79],[79,74,71]]
		for bar in 4:
			var b0 := float(bar*4)*beat
			for note in pads[bar]:
				await _radio_voice(buf,b0,4.4*beat,_midi(float(note)),0.16,2)
			await _radio_voice(buf,b0,4.4*beat,_midi(float(lows[bar])),0.3,2)
			var b_notes: Array = bells[bar]
			for k in 3:
				await _radio_voice(buf,b0+float([0.0,1.5,2.75][k])*beat,1.4,_midi(float(b_notes[k])),0.22,5)
		gain = 0.85
	else:
		# Talk 88: quiet studio bed under the captions (Dm7 G7 pads with soft chimes).
		var pads := [[62,65,69],[59,65,67]]
		for bar in 2:
			var b0 := float(bar*4)*beat
			for note in pads[bar]:
				await _radio_voice(buf,b0,4.4*beat,_midi(float(note)),0.12,2)
			await _radio_voice(buf,b0+2.0*beat,1.2,_midi(81.0 if bar == 0 else 79.0),0.2,5)
		gain = 0.8
	var bytes := PackedByteArray()
	bytes.resize(total*2)
	for i in total:
		bytes.encode_s16(i*2,int(clampf(buf[i]*gain,-1.0,1.0)*30000.0))
		if i % 8192 == 8191 and Time.get_ticks_msec()-radio_t0 > 8:
			await get_tree().process_frame
			radio_t0 = Time.get_ticks_msec()
	var wav := AudioStreamWAV.new()
	wav.format = AudioStreamWAV.FORMAT_16_BITS
	wav.mix_rate = RADIO_SR
	wav.stereo = false
	wav.data = bytes
	wav.loop_mode = AudioStreamWAV.LOOP_FORWARD
	wav.loop_begin = 0
	wav.loop_end = total
	return wav

func _radio_set(station: int) -> void:
	radio_station = clampi(station,0,RADIO.size()-1)
	radio_line_time = 0.0
	radio_line += 1
	_radio_refresh()
	if radio_station == 0:
		radio_player.stop()
		return
	if radio_streams.has(radio_station):
		_radio_play(radio_station)
		return
	radio_player.stop()
	if radio_busy.has(radio_station):
		return
	var wanted := radio_station
	radio_busy[wanted] = true
	var stream: AudioStreamWAV = await _radio_make(wanted)
	radio_streams[wanted] = stream
	radio_busy.erase(wanted)
	if radio_station == wanted:
		_radio_play(wanted)

func _radio_play(station: int) -> void:
	radio_player.stream = radio_streams[station]
	radio_player.play()
	_radio_refresh()

func _radio_next() -> void:
	_radio_set((radio_station+1) % RADIO.size())
	_save_progress()

func _radio_talk_line() -> String:
	var lines: Array[String] = [
		"Talk 88: Traffic is light on the waterfront. Seagulls report no delays.",
		"Caller says the clocktower is always wrong. It reads 12:00. Always 12:00.",
		"Pizza rush at Sunset Market, folks. Drive safe, tip well.",
		"The gates open for the curious: Ridge to the east, Bay to the west.",
		"Forecast: sunny, with a gentle chance of seagulls.",
		"Tune your car, then tune your radio. Good habits.",
	]
	if cash >= 3000:
		lines.append("Rumour has it somebody in town is sitting on a pile of cash.")
	if not _ridge_open():
		lines.append("The east gate is still shut. They say a Ridge Rover has the key.")
	elif not _bay_open():
		lines.append("Ridge sites are filling up. Find all six and the Bay Gate opens.")
	else:
		lines.append("Bay Road is open! The lighthouse view is worth the drive.")
	if best_kmh >= 85.0:
		lines.append("Someone topped 85 km/h downtown. The harbour master is not amused.")
	return lines[radio_line % lines.size()]

func _radio_caption() -> String:
	if radio_station == 0:
		return ""
	if radio_station == 3:
		return _radio_talk_line()
	var tracks: Array = ["Dockside Drive","Neon Harbour","Salt and Chrome","Midnight Ferry"] if radio_station == 1 else ["Low Tide Lights","Pearl Water","Slow Current","Morning Haze"]
	return "♪ %s  ·  %s" % [RADIO[radio_station]["name"],tracks[radio_line % tracks.size()]]

func _radio_refresh() -> void:
	if radio_button == null:
		return
	var loading := radio_station > 0 and not radio_streams.has(radio_station)
	if radio_station == 0:
		radio_button.text = "♪ Radio off"
	elif loading:
		radio_button.text = "♪ Tuning..."
	else:
		radio_button.text = "♪ %s" % RADIO[radio_station]["name"]
	radio_caption.text = _radio_caption()
	radio_caption.visible = radio_station > 0 and not loading

func _process(delta: float) -> void:
	_daynight_tick(delta)
	_level_fx_tick(delta)
	_hud_v23_tick()
	_my_tag_tick()
	_clean_hud_tick()
	if radio_station > 0 and radio_streams.has(radio_station):
		radio_line_time += delta
		if radio_line_time > 9.0:
			radio_line_time = 0.0
			radio_line += 1
			_radio_refresh()

func _build_peds() -> void:
	var shirts := [Color("e07a5f"),Color("3d84a8"),Color("f2cc8f"),Color("81b29a"),Color("9a6fb0"),Color("d4a373")]
	var skins := [Color("f0c9a4"),Color("c68a60"),Color("8d5a3b"),Color("e3b58b")]
	var legs_col := Color("34495e")
	var pants := [Color("34495e"),Color("263d54"),Color("b89a64"),Color("3b3f45"),Color("5c4b3a"),Color("e9edef")]
	var hairs := [Color("2b1d14"),Color("1a1a1a"),Color("6b4423"),Color("c9a25f"),Color("8a8a8a"),Color("9c3d22")]
	var shoes := [Color("2b2b2b"),Color("eef1f2"),Color("6b4423"),Color("3d84a8")]
	var lines := [
		[Vector3(6,0,-40),Vector3(6,0,40)],[Vector3(-6,0,-40),Vector3(-6,0,40)],
		[Vector3(26.5,0,-40),Vector3(26.5,0,40)],[Vector3(-26.5,0,-40),Vector3(-26.5,0,40)],
		[Vector3(38.5,0,-40),Vector3(38.5,0,40)],
		[Vector3(-44,0,6),Vector3(44,0,6)],[Vector3(-44,0,-26.5),Vector3(44,0,-26.5)],
		[Vector3(-44,0,-37.5),Vector3(44,0,-37.5)],
	]
	lines.append([Vector3(-38.5,0,-40),Vector3(-38.5,0,40)])
	lines.append([Vector3(-44,0,26.5),Vector3(44,0,26.5)])
	var plan: Array = []
	for i in 36:
		plan.append([lines[i % lines.size()][0],lines[i % lines.size()][1],false])
	# Skyline District sidewalks (7.8 m from the road centre) and people standing around.
	var dt_lines: Array = []
	for x in [-140.0,-300.0,-620.0]:
		for sx in [-12.6,12.6]:
			dt_lines.append([Vector3(x+sx,0,-76),Vector3(x+sx,0,-444)])
	for z in [-140.0,-300.0]:
		for sz in [-12.6,12.6]:
			dt_lines.append([Vector3(-126,0,z+sz),Vector3(-646,0,z+sz)])
	for i in 36:
		plan.append([dt_lines[i % dt_lines.size()][0],dt_lines[i % dt_lines.size()][1],false])
	# v0.29: North Highway pavements (12.6 m from the road centre) and people at the park, skate plaza and yard.
	var nm_lines: Array = []
	for sx in [-12.6,12.6]:
		nm_lines.append([Vector3(sx,0,-66),Vector3(sx,0,-446)])
	for z in [-220.0,-300.0]:
		for sz in [-12.6,12.6]:
			nm_lines.append([Vector3(-104,0,z+sz),Vector3(104,0,z+sz)])
	for i in 14:
		plan.append([nm_lines[i % nm_lines.size()][0],nm_lines[i % nm_lines.size()][1],false])
	for spot in [Vector3(-85,0,-283),Vector3(-95,0,-283),Vector3(84,0,-254),Vector3(96,0,-254),Vector3(-70,0,-104),Vector3(48,0,-399)]:
		plan.append([spot,spot,true])
	# Civic Center sidewalks (6.2 m from the road centre) and people at the school, park and mall.
	var civ_lines := [[Vector3(-60,0,25.8),Vector3(-238,0,25.8)],[Vector3(-62,0,38.2),Vector3(-238,0,38.2)],[Vector3(-62,0,65.8),Vector3(-238,0,65.8)],[Vector3(-62,0,78.2),Vector3(-238,0,78.2)]]
	for i in 16:
		plan.append([civ_lines[i % civ_lines.size()][0],civ_lines[i % civ_lines.size()][1],false])
	# v0.26: Sunset Beach (street sidewalks, the beach road and the boardwalk) and Westside.
	var sb_lines: Array = []
	for z in SB_STREETS:
		for s in [-7.8,7.8]:
			sb_lines.append([Vector3(SB_X0+6.0,0,float(z)+s),Vector3(SB_X1-6.0,0,float(z)+s)])
	sb_lines.append([Vector3(SB_X0+12.0,0,SB_BEACH_ROAD-7.8),Vector3(SB_X1-12.0,0,SB_BEACH_ROAD-7.8)])
	sb_lines.append([Vector3(SB_X0+12.0,0,SB_BEACH_ROAD+11.0),Vector3(SB_X1-12.0,0,SB_BEACH_ROAD+11.0)])
	sb_lines.append([Vector3(SB_X0+30.0,0,SB_BEACH_ROAD+11.0),Vector3(SB_X1-30.0,0,SB_BEACH_ROAD+11.0)])
	for i in 22:
		plan.append([sb_lines[i % sb_lines.size()][0],sb_lines[i % sb_lines.size()][1],false])
	for spot in [Vector3(372,0,352),Vector3(374,0,354),Vector3(500,0,360),Vector3(520,0,348),Vector3(SB_PIER_X+2.0,0,SB_Z1+30.0),Vector3(SB_PIER_X-2.0,0,SB_Z1+33.0)]:
		plan.append([spot,spot,true])
	var ws_lines: Array = []
	for z in WS_STREETS:
		for s in [-7.8,7.8]:
			ws_lines.append([Vector3(WS_X0+8.0,0,float(z)+s),Vector3(WS_X1-4.0,0,float(z)+s)])
	for i in 18:
		plan.append([ws_lines[i % ws_lines.size()][0],ws_lines[i % ws_lines.size()][1],false])
	for spot in [WS_MARKET+Vector3(-15,0,-14),WS_MARKET+Vector3(0,0,-14),WS_MARKET+Vector3(15,0,14),WS_MARKET+Vector3(-14,0,6),WS_MARKET+Vector3(14,0,-5)]:
		plan.append([spot,spot,true])
	for spot in [Vector3(-204,0,58),Vector3(-211,0,58),Vector3(-203,0,84),Vector3(-145,0,76.5)]:
		plan.append([spot,spot,true])
	for spot in [Vector3(-335,0,-92),Vector3(-347,0,-104),Vector3(-331,0,-106),Vector3(-349,0,-90),Vector3(-442,0,-204),Vector3(-478,0,-238),Vector3(-206,0,-317),Vector3(-234,0,-317),Vector3(-15,0,35),Vector3(15,0,35)]:
		plan.append([spot,spot,true])
	plan.append_array(_airport_ped_plan())
	var rng := RandomNumberGenerator.new()
	rng.seed = 5150
	for i in plan.size():
		var line: Array = plan[i]
		# v0.27.1: people standing around never stand in a traffic lane (cars would wait for them forever).
		if bool(line[2]) and _on_road(line[0]):
			var spot := _ped_curb(line[0])
			line = [spot,spot,true]+line.slice(3)
		var node := Node3D.new()
		add_child(node)
		var shirt_col: Color = shirts[rng.randi() % shirts.size()]
		if line.size() > 3:
			shirt_col = line[3]
		var skin_col: Color = skins[rng.randi() % skins.size()]
		var person := _make_person(node,i % 4,{"Shirt":shirt_col,"Skin":skin_col,"Pants":pants[rng.randi() % pants.size()],"Hair":hairs[rng.randi() % hairs.size()],"Shoes":shoes[rng.randi() % shoes.size()],"Eye":Color("1c1c22")})
		var leg_nodes: Array[Node3D] = []
		if person.is_empty():
			_box(node,Vector3(0,1.05,0),Vector3(0.55,0.75,0.32),shirt_col)
			_box(node,Vector3(0,1.62,0),Vector3(0.34,0.34,0.34),skin_col)
			for side in [-0.14,0.14]:
				var hip := Node3D.new()
				hip.position = Vector3(side,0.68,0)
				node.add_child(hip)
				_box(hip,Vector3(0,-0.34,0),Vector3(0.2,0.68,0.22),legs_col)
				leg_nodes.append(hip)
		else:
			# Models face -Z; pedestrians are steered with +Z forward.
			(person["root"] as Node3D).rotation.y = PI
		if not person.is_empty():
			_cull_person(person["root"],95.0)
		peds.append({"node":node,"a":line[0],"b":line[1],"t":rng.randf(),"dir":1.0 if rng.randf() < 0.5 else -1.0,"speed":rng.randf_range(1.1,1.8),"off":Vector3.ZERO,"phase":rng.randf()*TAU,"legs":leg_nodes,"person":person,"idle":line[2],"yaw":rng.randf()*TAU})
	_update_peds(0.0)

func _update_peds(delta: float) -> void:
	# v0.26: people far from you move in coarse steps and don't animate (they're out of sight).
	var me: Vector3 = car.position if driving else player.position
	for p in peds:
		var far := delta > 0.0 and absf((p["node"] as Node3D).position.x-me.x)+absf((p["node"] as Node3D).position.z-me.z) > 150.0
		var step := delta
		if far:
			p["acc"] = float(p.get("acc",0.0))+delta
			if float(p["acc"]) < 0.5:
				continue
			step = float(p["acc"])
		p["acc"] = 0.0
		_update_ped(p,step,far)

func _update_ped(p: Dictionary, delta: float, far: bool) -> void:
	if true:
		var a: Vector3 = p["a"]
		var b: Vector3 = p["b"]
		var seg := b-a
		var seg_len := maxf(seg.length(),0.001)
		var idle := bool(p.get("idle",false))
		if not idle:
			p["t"] = float(p["t"])+float(p["dir"])*float(p["speed"])*delta/seg_len
		if float(p["t"]) >= 1.0:
			p["t"] = 1.0
			p["dir"] = -1.0
		elif float(p["t"]) <= 0.0:
			p["t"] = 0.0
			p["dir"] = 1.0
		var base := a.lerp(b,float(p["t"]))
		var target := Vector3.ZERO
		var threat_pos: Vector3 = car.position if driving else player.position
		var away := Vector3(base.x-threat_pos.x,0,base.z-threat_pos.z)
		var radius := 5.0 if driving and absf(car_speed) > 1.5 else 1.4
		if away.length() < radius:
			if away.length() < 0.05:
				away = Vector3(1,0,0)
			target = away.normalized()*(radius-away.length()+0.6)
		p["off"] = (p["off"] as Vector3).move_toward(target,7.0*delta)
		var node: Node3D = p["node"]
		node.position = base+(p["off"] as Vector3)
		if idle:
			node.rotation.y = float(p["yaw"])
			if not far and not bool(p.get("posed",false)):
				_pose_person(p["person"],0.0,0.0)
				p["posed"] = true
			return
		var heading := seg.normalized()*float(p["dir"])
		node.rotation.y = atan2(heading.x,heading.z)
		if far:
			return
		p["phase"] = float(p["phase"])+delta*float(p["speed"])*4.5
		var legs: Array = p["legs"]
		if legs.size() == 2:
			legs[0].rotation.x = sin(float(p["phase"]))*0.6
			legs[1].rotation.x = -sin(float(p["phase"]))*0.6
		_pose_person(p["person"],float(p["phase"]),1.0)

func _smoke_test() -> void:
	# Exercise the actual mission and driving transitions; preserve the player's save.
	var saved_checkpoint := checkpoint_id
	checkpoint_id = -1
	# The older checks look at the full HUD; the clean screen is checked at the end.
	hud_force_full = true
	_clean_hud_tick()
	_relayout_hud()
	# The older checks were written for the locked towns, 5 levels and no quick quests.
	legacy_rules = true
	var saved_quick := [quick_on,quick_idx,quick_done,bonus_xp]
	quick_on = false
	_update_gate()
	# Older checks steer on foot with the fixed far camera; the follow camera has its own test.
	walk_view = 1
	_apply_view()
	await get_tree().physics_frame
	assert(action_button.position.x > 0 and action_button.position.y > 0,"Action button outside screen")
	assert(joystick.position.y > 0,"Joystick outside screen")
	var original_cash := cash
	var original_deliveries := deliveries
	var original_mask := found_mask
	var original_route := route_index
	var original_exploring := exploring
	var original_pending := next_job_pending
	var original_owned := owned_mask
	var original_car := car_id
	var original_ridge := ridge_mask
	var original_claimed := claimed_mask
	var original_tunes := tunes.duplicate()
	var original_bay := bay_mask
	var original_north := north_mask
	var original_trials := trial_done
	var original_times := best_times.duplicate()
	var original_best := best_kmh
	claimed_mask = (1 << MISSIONS.size())-1
	var save_existed := FileAccess.file_exists(SAVE_PATH)
	var save_bytes := FileAccess.get_file_as_bytes(SAVE_PATH) if save_existed else PackedByteArray()
	exploring = false
	route_index = 0
	next_job_pending = false
	player.position = car.position+Vector3(2,0,0)
	var left_touch := InputEventScreenTouch.new()
	left_touch.index = 0
	left_touch.pressed = true
	left_touch.position = joystick.position+Vector2(90,90)
	_input(left_touch)
	var action_touch := InputEventScreenTouch.new()
	action_touch.index = 1
	action_touch.pressed = true
	action_touch.position = action_button.position+action_button.size/2
	_refresh_hud()
	_input(action_touch)
	assert(driving and touch_id == 0,"Second-finger car entry failed")
	var start_position := car.position
	stick = Vector2(0,-1)
	for frame in 90:
		await get_tree().physics_frame
	assert(car.position.distance_to(start_position) > 2,"Car did not move under stick input")
	stick = Vector2.ZERO
	touch_id = -1
	await get_tree().physics_frame
	car.position = PICKUP+Vector3(0,0.8,0)
	_interact()
	assert(carrying,"Parcel pickup failed")
	car.position = DROPOFF+Vector3(0,0.8,0)
	_interact()
	assert(not carrying and cash == original_cash+150,"Delivery reward failed")
	assert(next_job_pending and route_index == 1,"Next job did not advance or wait for confirmation")
	_interact()
	assert(not next_job_pending,"Next-job confirmation failed")
	# Verify all routes have distinct endpoints and exact payouts.
	for job in range(1,ROUTES.size()):
		var before := cash
		car.position = ROUTES[job]["pickup"]+Vector3(0,0.8,0)
		_interact()
		assert(carrying,"Route pickup failed")
		car.position = ROUTES[job]["dropoff"]+Vector3(0,0.8,0)
		_interact()
		assert(not carrying and cash == before+int(ROUTES[job]["pay"]),"Route payout failed")
		assert(next_job_pending,"Route auto-started unexpectedly")
		_interact()
	# All collectible positions must have room for a player capsule above ground.
	exploring = true
	found_mask = 0
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	await get_tree().physics_frame
	var collection_cash := cash
	for index in FINDS.size():
		var pos: Vector3 = FINDS[index]["pos"]
		var query := PhysicsShapeQueryParameters3D.new()
		query.shape = player.get_child(0).shape
		query.transform = Transform3D(Basis.IDENTITY,pos+Vector3(0,1.2,0))
		query.exclude = [player.get_rid(),car.get_rid()]
		assert(get_world_3d().direct_space_state.intersect_shape(query,1).is_empty(),"Collectible is blocked")
		player.position = pos+Vector3(0,1.0,0)
		_interact()
		assert(found_mask & (1 << index),"Collectible interaction failed")
		var after := cash
		_collect_find(index)
		assert(cash == after,"Duplicate collectible paid twice")
	assert(_find_count() == 8 and cash == collection_cash+550,"Collection bonuses failed")
	_save_progress()
	found_mask = 0
	cash = 0
	_load_progress()
	assert(found_mask == 255 and cash == collection_cash+550,"Collection persistence failed")
	_refresh_hud()
	assert(objective.text.begins_with("Discover") and CIVIC.any(func(c): return objective.text.contains(c["name"])),"After the tokens, Civic Center comes next: "+objective.text)
	var saved_civic := civic_mask
	civic_mask = (1 << CIVIC.size())-1
	_refresh_hud()
	assert(objective.text.begins_with("Ridge Gate"),"Collection end state failed: "+objective.text)
	civic_mask = saved_civic
	exploring = false
	next_job_pending = false
	_rescue()
	for frame in 30:
		await get_tree().physics_frame
	player.position = car.position+Vector3(2.5,0.2,0)
	_interact()
	await get_tree().physics_frame
	_interact()
	assert(not driving,"Vehicle exit failed in an open area")
	await _smoke_garage_ridge()
	await _smoke_radio_peds()
	await _smoke_chase()
	await _smoke_orole()
	_smoke_levels()
	_smoke_marina()
	_smoke_downtown()
	await _smoke_views()
	_smoke_level_fx()
	await _smoke_stadium_eye()
	await _smoke_follow_call()
	_smoke_travel()
	_smoke_qr()
	_smoke_crate()
	_smoke_bus()
	_smoke_chase_extras()
	_smoke_models()
	legacy_rules = false
	_update_gate()
	quick_on = saved_quick[0]
	quick_idx = saved_quick[1]
	quick_done = saved_quick[2]
	bonus_xp = saved_quick[3]
	_smoke_quick()
	_smoke_quests()
	_smoke_treasure()
	_smoke_findme()
	await _smoke_v27()
	_my_tag_tick()
	assert(my_tag != null and my_tag.text.contains("Lv ") and my_tag.text.begins_with(_my_name()),"Your name tag shows name and level")
	cash = original_cash
	deliveries = original_deliveries
	found_mask = original_mask
	route_index = original_route
	exploring = original_exploring
	next_job_pending = original_pending
	owned_mask = original_owned
	car_id = original_car
	ridge_mask = original_ridge
	claimed_mask = original_claimed
	tunes = original_tunes
	bay_mask = original_bay
	north_mask = original_north
	trial_done = original_trials
	best_times = original_times
	trial_active = -1
	best_kmh = original_best
	_apply_car()
	_update_gate()
	if save_existed:
		var restored := FileAccess.open(SAVE_PATH,FileAccess.WRITE)
		restored.store_buffer(save_bytes)
		restored.close()
	elif FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(SAVE_PATH)
	_smoke_hub()
	await _smoke_raceway()
	_smoke_sites_reachable()
	_smoke_nick()
	await _smoke_guidance_checkpoints()
	checkpoint_id = saved_checkpoint
	_refresh_checkpoints()
	_save_progress()
	# v0.29: clean screen: only the QR code, a small minimap and the stick are left; tapping the minimap opens the Menu.
	hud_force_full = false
	var saved_clean := hud_clean
	hud_clean = true
	_relayout_hud()
	_clean_hud_tick()
	assert(not hud_info.visible and not hud_pause_button.visible and not radio_button.visible and not online_button.visible and not view_button.visible and not chat_button.visible and not travel_button.visible and not run_button.visible and not treasure_label.visible,"Clean screen hides the panels and buttons")
	assert(quests_button.visible and quests_button.position.x < 30.0,"Quests button stays on the clean screen, under the QR code")
	assert(minimap.visible and is_equal_approx(minimap.scale.x,CLEAN_MINI_SCALE) and minimap.position.y < 30.0,"Small minimap in the top right")
	assert(qr_small == null or is_equal_approx(qr_small.position.x,18.0),"QR code in the top left")
	if not paused:
		_minimap_tap()
	assert(paused and menu.visible,"Tapping the minimap opens the Menu")
	_toggle_menu()
	assert(run_on,"Running is on by default")
	hud_clean = saved_clean
	_relayout_hud()
	print("HARBOR_SMOKE_OK: Harbor International Airport, no walls and joined roads, sea tow, Harbor Loop sky train, City Tour, day and night, find me, treasure hunt, player rings, name tag, quests list, quick quests, 20 levels, all towns open, starter crate, QR join code, graphics, RUN, fast travel, roadside job stops, follow camera on foot, Call Car, Harbor Raceway (inside parking, pit lane, 1.4 km circuit, identical race cars for players and AI, GP, time attack, boosters, spikes, online race), Civic Center, nicknames, Harbor Dome hub (tables, show, chat), quest arrows, checkpoints, walk-in stadium, eye view, level-up celebration, minimap and map, camera views and in-car driving, Skyline District, traffic and signals, two-finger input, driving, chase mode, online roles, player levels, Marina Heights shops, six routes, eight collectibles, no duplicate rewards, save persistence, exit, rescue, legacy save, garage, tuning, ridge gate/ramp/sites, bay road, time trials, street events, missions, radio stations, pedestrians, Blender models")
	get_tree().quit()



func _smoke_chase() -> void:
	var before := cash
	_rescue()
	car.position = Vector3(1.7,0.8,4)
	_chase_start(1)
	assert(chase_mode == 1 and chase_units.size() == CHASE_COPS and driving,"Thief chase should spawn police")
	for i in 40:
		await get_tree().physics_frame
	assert(chase_t > 0.3,"Chase timer should run")
	for u in chase_units:
		assert((u["node"] as Node3D).position.y > -5.0,"Police fell out of the world")
	for i in 220:
		(chase_units[0]["node"] as Node3D).position = car.position+Vector3(0,0,3)
		await get_tree().physics_frame
		if chase_mode == 0:
			break
	assert(chase_mode == 0 and chase_units.is_empty(),"Police should bust the thief")
	assert(cash == before,"Being busted must not cost money")
	_chase_start(2)
	assert(chase_mode == 2 and chase_units.size() == 1,"Police chase should spawn one thief")
	for i in 220:
		(chase_units[0]["node"] as Node3D).position = car.position+Vector3(0,0,3)
		await get_tree().physics_frame
		if chase_mode == 0:
			break
	assert(chase_mode == 0 and cash == before+CHASE_PAY,"Arresting the thief should pay")
	_chase_start(1)
	driving = false
	await get_tree().physics_frame
	assert(chase_mode == 0,"Leaving the car ends the chase")
	cash = before
	_rescue()

func _smoke_orole() -> void:
	var before := cash
	orole_test = true
	_rescue()
	var spot := Vector3(1.7,0.8,4)
	_orole_start(1)
	assert(online_role == 1 and driving,"Online thief role should start")
	for i in 220:
		_online_peer_update({"i":"cop1","n":"Cop","x":car.position.x,"y":car.position.y,"z":car.position.z+3.0,"r":0.0,"c":0,"d":1,"t":2})
		await get_tree().physics_frame
		if online_role == 0:
			break
	assert(online_role == 0 and cash == before,"Police player should bust the online thief without money loss")
	_orole_start(2)
	assert(online_role == 2,"Online police role should start")
	for i in 220:
		_online_peer_update({"i":"rob1","n":"Rob","x":car.position.x,"y":car.position.y,"z":car.position.z+3.0,"r":0.0,"c":0,"d":1,"t":1})
		await get_tree().physics_frame
		if cash > before:
			break
	assert(cash == before+ORO_POLICE_PAY,"Online arrest should pay the police player")
	assert(int(online_peers["rob1"]["role"]) == 1 and int(online_peers["cop1"]["role"]) == 2,"Peer roles should be stored")
	assert(_online_pos_frame()["payload"]["payload"]["t"] == 2,"Position frame should carry the role")
	_orole_end("done",0)
	_online_clear_peers()
	orole_test = false
	cash = before
	_rescue()

func _smoke_levels() -> void:
	var saved := [found_mask,ridge_mask,bay_mask,north_mask,trial_done,claimed_mask,deliveries,marina_mask]
	var saved_dt := downtown_mask
	var saved_civ := civic_mask
	downtown_mask = 0
	civic_mask = 0
	found_mask = 0
	ridge_mask = 0
	bay_mask = 0
	north_mask = 0
	trial_done = 0
	claimed_mask = 0
	deliveries = 0
	marina_mask = 0
	assert(_xp() == 0 and _level() == 1,"Fresh player is level 1")
	assert(_level_for(149) == 1 and _level_for(150) == 2 and _level_for(449) == 2 and _level_for(450) == 3 and _level_for(1499) == 4 and _level_for(1500) == 5 and _level_for(99999) == 5,"Level thresholds")
	found_mask = 255
	assert(_xp() == 160 and _level() == 2,"Finds give XP")
	ridge_mask = (1 << RIDGE.size())-1
	bay_mask = (1 << BAY.size())-1
	north_mask = (1 << NORTH.size())-1
	marina_mask = (1 << MARINA.size())-1
	downtown_mask = (1 << DOWNTOWN.size())-1
	civic_mask = (1 << CIVIC.size())-1
	trial_done = (1 << TRIALS.size())-1
	claimed_mask = (1 << MISSIONS.size())-1
	deliveries = 50
	var total := 160+(CIVIC.size()+RIDGE.size()+BAY.size()+NORTH.size()+MARINA.size()+DOWNTOWN.size())*25+TRIALS.size()*40+MISSIONS.size()*60+ROUTES.size()*10
	assert(_xp() == total and _level() == 5,"Completing everything reaches level 5")
	assert(_level_text().contains("MAX"),"Max level text")
	assert(_online_pos_frame()["payload"]["payload"]["l"] == 5,"Position frame carries the level")
	found_mask = saved[0]
	ridge_mask = saved[1]
	bay_mask = saved[2]
	north_mask = saved[3]
	trial_done = saved[4]
	claimed_mask = saved[5]
	deliveries = saved[6]
	downtown_mask = saved_dt
	civic_mask = saved_civ

func _smoke_bus() -> void:
	var saved := [found_mask,ridge_mask,bay_mask,north_mask,trial_done,claimed_mask,deliveries,marina_mask,cash,driving,player.position,exploring]
	found_mask = 0
	ridge_mask = 0
	bay_mask = 0
	north_mask = 0
	trial_done = 0
	claimed_mask = 0
	deliveries = 0
	marina_mask = 0
	_check_level()
	_update_gate()
	assert(not _marina_open() and not _north_open(),"Bus test starts with Marina and North closed")
	assert(_bus_first() == 1 and _bus_last() == 3,"Bus runs Waterfront to North Gate while the areas are closed")
	_bus_reset()
	for i in 600:
		_bus_tick(0.25)
		assert(bus_z > -49.0 and bus_z < 46.0,"Bus must stay inside the city while Marina and North are closed")
	assert(not (bus_stop_nodes[0] as Node3D).visible,"Marina bus stop is hidden below level 5")
	bay_mask = (1 << BAY.size())-1
	_update_gate()
	assert(_bus_last() == BUS_STOPS.size()-1,"Bus reaches the airfield once the highway is open")
	found_mask = 255
	ridge_mask = (1 << RIDGE.size())-1
	north_mask = (1 << NORTH.size())-1
	trial_done = (1 << BASE_TRIALS)-1
	claimed_mask = (1 << 12)-1
	deliveries = 6
	_check_level()
	_update_gate()
	assert(_marina_open() and _bus_first() == 0,"Bus serves Marina Heights at level 5")
	_bus_tick(0.1)
	assert((bus_stop_nodes[0] as Node3D).visible,"Marina bus stop shows at level 5")
	_bus_reset()
	assert(bus_idx == 0 and absf(bus_z-150.0) < 0.01,"Bus starts at the Marina stop")
	exploring = true
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	cash = 100
	player.position = bus.position+Vector3(5,0.9,2)
	assert(_bus_near(),"Player is near the waiting bus")
	_interact()
	assert(bus_riding and cash == 100-BUS_FARE,"BOARD BUS charges the fare")
	var reached := false
	for i in 600:
		_bus_tick(0.25)
		if bus_idx == 1 and bus_dwell > 0.0:
			reached = true
			break
	assert(reached,"Bus never reached the Waterfront")
	assert(player.position.distance_to(bus.position) < 3.0,"Rider moves with the bus")
	_interact()
	assert(not bus_riding and player.visible,"GET OFF at a stop did not work")
	assert(absf(player.position.z-bus.position.z) < 6.0,"Player hops off next to the stop")
	cash = 5
	player.position = bus.position+Vector3(5,0.9,2)
	_interact()
	assert(not bus_riding and cash == 5,"No ride without the fare")
	var seen := {}
	for i in 8000:
		_bus_tick(0.25)
		seen[bus_idx] = true
		if seen.size() == BUS_STOPS.size() and not bus_fwd and bus_dwell <= 0.0 and bus_idx == BUS_STOPS.size()-1:
			break
	assert(seen.size() == BUS_STOPS.size(),"Bus visits every stop from Marina to the airfield")
	found_mask = saved[0]
	ridge_mask = saved[1]
	bay_mask = saved[2]
	north_mask = saved[3]
	trial_done = saved[4]
	claimed_mask = saved[5]
	deliveries = saved[6]
	marina_mask = saved[7]
	cash = saved[8]
	driving = saved[9]
	player.position = saved[10]
	exploring = saved[11]
	_check_level()
	_update_gate()
	_bus_reset()
	if driving:
		player.hide()
		player.get_child(0).set_deferred("disabled",true)

func _smoke_chase_extras() -> void:
	var before := cash
	_rescue()
	car.position = Vector3(-30,0.8,0)
	car.rotation = Vector3(0,-PI/2.0,0)
	_chase_start(1)
	var saw_block := false
	var saw_heli := false
	for i in 200:
		for u in chase_units:
			(u["node"] as Node3D).position = car.position+Vector3(0,0.3,80)
		_chase_tick(0.5)
		if chase_mode == 0:
			break
		if chase_blocks.size() > 0:
			saw_block = true
		if chase_heli != null:
			saw_heli = true
		if chase_t > 56.0:
			break
	assert(saw_block,"Police roadblock appears during a thief chase")
	assert(saw_heli,"Police helicopter appears during a thief chase")
	assert(chase_heli == null,"Police helicopter leaves after its patrol")
	_chase_end("test",0)
	assert(chase_blocks.is_empty() and chase_heli == null,"Chase cleanup removes helicopter and roadblocks")
	cash = before
	_rescue()

func _smoke_marina() -> void:
	var saved := [found_mask,ridge_mask,bay_mask,north_mask,trial_done,claimed_mask,deliveries,marina_mask,shop_visit_mask,owned_mask,car_id,cash,av_shirt,av_pants,av_hat,av_own.duplicate(),car_paint.duplicate(),driving]
	found_mask = 0
	ridge_mask = 0
	bay_mask = 0
	north_mask = 0
	trial_done = 0
	claimed_mask = 0
	deliveries = 0
	marina_mask = 0
	shop_visit_mask = 0
	_check_level()
	_update_gate()
	assert(not _marina_open() and not _area_open(4),"Marina is locked below level 5")
	assert(marina_gate_body.visible,"Marina gate is closed below level 5")
	found_mask = 255
	ridge_mask = (1 << RIDGE.size())-1
	bay_mask = (1 << BAY.size())-1
	north_mask = (1 << NORTH.size())-1
	trial_done = (1 << BASE_TRIALS)-1
	claimed_mask = (1 << 12)-1
	deliveries = 6
	_update_gate()
	assert(_level() == 5 and _marina_open() and _area_open(4),"The original content alone reaches level 5 and opens Marina Heights")
	assert(not marina_gate_body.visible,"Marina gate opens at level 5")
	driving = true
	car.position = (MARINA[0]["pos"] as Vector3)+Vector3(0,0.8,0)
	var before := cash
	_check_marina()
	assert((marina_mask & 1) != 0 and cash == before+int(MARINA[0]["pay"]),"Marina site pays once")
	_check_marina()
	assert(cash == before+int(MARINA[0]["pay"]),"Marina site does not pay twice")
	car.position = (SHOPS[0]["pos"] as Vector3)+Vector3(0,0.8,0)
	assert(_nearest_shop() == 0,"Showroom door is detected when driving")
	_shop_open(0)
	assert(paused and shop_kind == 0,"Showroom opens and pauses")
	cash = 8000
	shop_sel[0] = 0
	_shop_action()
	var first_premium: int = _premium_cars()[0]
	assert((owned_mask & (1 << first_premium)) != 0 and car_id == first_premium and cash == 500,"Showroom purchase")
	assert(car_max > 30.0,"Showroom car is fast")
	_shop_close()
	assert(not paused,"Leaving the shop resumes")
	car.position = (SHOPS[2]["pos"] as Vector3)+Vector3(0,0.8,0)
	assert(_nearest_shop() == 2,"Paint shop door is detected")
	_shop_open(2)
	cash = 1000
	shop_sel[0] = 3
	_shop_action()
	assert(int(car_paint[car_id]) == 3 and cash == 1000-PAINT_PRICE and car_body_mat.albedo_color == (PAINTS[3]["color"] as Color),"Paint purchase")
	_shop_close()
	assert(car_body_mat.albedo_color == (PAINTS[3]["color"] as Color),"Paint persists after the shop")
	driving = false
	player.position = (SHOPS[1]["pos"] as Vector3)+Vector3(0,0.7,0)
	assert(_nearest_shop() == 1,"Style shop door is detected on foot")
	_shop_open(1)
	cash = 1000
	shop_sel = [1,1,2]
	_shop_action()
	assert(av_shirt == 1 and av_pants == 1 and av_hat == 2 and cash == 1000-120-100-300,"Style purchase")
	assert(hat_holder.get_child_count() > 0,"Hat is worn")
	_shop_close()
	driving = true
	car.position = (SHOPS[1]["pos"] as Vector3)+Vector3(0,0.8,0)
	assert(_nearest_shop() == -1,"Style shop needs the player on foot")
	_save_progress()
	av_shirt = 0
	av_hat = 0
	car_paint.fill(0)
	marina_mask = 0
	_load_progress()
	assert(av_shirt == 1 and av_hat == 2 and int(car_paint[first_premium]) == 3 and (marina_mask & 1) != 0 and shop_visit_mask == 7,"Marina progress persists")
	journal_page = 2
	_refresh_journal()
	assert(journal_label.text.contains("Marina Arrival") and journal_label.text.contains("Rush Hour"),"Journal second missions page lists Marina and Skyline quests")
	journal_page = 0
	_refresh_journal()
	assert(journal_label.text.contains("MARINA"),"Journal discoveries page lists Marina")
	found_mask = saved[0]
	ridge_mask = saved[1]
	bay_mask = saved[2]
	north_mask = saved[3]
	trial_done = saved[4]
	claimed_mask = saved[5]
	deliveries = saved[6]
	marina_mask = saved[7]
	shop_visit_mask = saved[8]
	owned_mask = saved[9]
	car_id = saved[10]
	cash = saved[11]
	av_shirt = saved[12]
	av_pants = saved[13]
	av_hat = saved[14]
	av_own = saved[15]
	car_paint = saved[16]
	driving = saved[17]
	_apply_car()
	_apply_avatar()
	_update_gate()
	_check_level()

func _blocked_at(pos: Vector3, radius := 0.5) -> bool:
	var query := PhysicsShapeQueryParameters3D.new()
	var sphere := SphereShape3D.new()
	sphere.radius = radius
	query.shape = sphere
	query.transform = Transform3D(Basis.IDENTITY,pos)
	var skip: Array[RID] = [player.get_rid(),car.get_rid()]
	if blocked_skip_traffic:
		for t in traffic:
			skip.append((t["node"] as CollisionObject3D).get_rid())
	query.exclude = skip
	return not get_world_3d().direct_space_state.intersect_shape(query,1).is_empty()

func _blocker(pos: Vector3, radius: float) -> String:
	var query := PhysicsShapeQueryParameters3D.new()
	var sphere := SphereShape3D.new()
	sphere.radius = radius
	query.shape = sphere
	query.transform = Transform3D(Basis.IDENTITY,pos)
	query.exclude = [player.get_rid(),car.get_rid()]
	var hits := get_world_3d().direct_space_state.intersect_shape(query,1)
	if hits.is_empty():
		return "nothing"
	var obj: Object = hits[0]["collider"]
	return "%s at %s" % [obj.get_class(),str((obj as Node3D).global_position) if obj is Node3D else "?"]

func _on_screen(panel: Control) -> bool:
	var rect := panel.get_global_rect()
	var view := get_viewport().get_visible_rect().size
	return rect.position.x >= 0 and rect.position.y >= 0 and rect.end.x <= view.x and rect.end.y <= view.y

func _wait_radio(station: int) -> void:
	var waited := 0
	while not radio_streams.has(station) and waited < 6000:
		await get_tree().process_frame
		waited += 1
	assert(radio_streams.has(station),"Radio station %d did not generate" % station)

func _smoke_radio_peds() -> void:
	assert(peds.size() == 208,"Pedestrians missing: %d" % peds.size())
	assert(not player_person.is_empty() and player_person["mats"].has("Shirt"),"Player person model missing")
	for p in peds:
		assert(not (p["person"] as Dictionary).is_empty(),"Pedestrian person model missing")
	var leg: Node3D = (peds[0]["person"] as Dictionary)["limbs"]["LegL"]
	var leg_before := leg.rotation.x
	_update_peds(0.3)
	assert(absf(leg.rotation.x-leg_before) > 0.01,"Pedestrian legs do not swing")
	for p in peds:
		var a: Vector3 = p["a"]
		var b: Vector3 = p["b"]
		for k in 11:
			var pt := a.lerp(b,float(k)/10.0)+Vector3(0,1.0,0)
			assert(not _blocked_at(pt,0.3),"Pedestrian path blocked at %s" % str(pt))
	var before: Vector3 = (peds[0]["node"] as Node3D).position
	_update_peds(1.0)
	assert((peds[0]["node"] as Node3D).position.distance_to(before) > 0.5,"Pedestrians do not walk")
	var was_driving := driving
	var was_speed := car_speed
	var was_car := car.position
	driving = true
	car_speed = 8.0
	car.position = (peds[0]["node"] as Node3D).position+Vector3(0.6,0,0)
	for i in 10:
		_update_peds(0.2)
	var gap := Vector2((peds[0]["node"] as Node3D).position.x-car.position.x,(peds[0]["node"] as Node3D).position.z-car.position.z).length()
	assert(gap > 2.5,"Pedestrian did not step away from the car (gap %.2f)" % gap)
	driving = was_driving
	car_speed = was_speed
	car.position = was_car
	assert(radio_station == 0,"Radio should start off")
	assert(_on_screen(radio_button),"Radio button off screen")
	var tap := InputEventScreenTouch.new()
	tap.index = 0
	tap.pressed = true
	tap.position = radio_button.get_global_rect().get_center()
	_input(tap)
	assert(radio_station == 1,"Touching the radio button did not tune Harbor FM")
	for station in [1,2,3]:
		_radio_set(station)
		await _wait_radio(station)
		await get_tree().process_frame
		var wav: AudioStreamWAV = radio_streams[station]
		assert(wav.loop_mode == AudioStreamWAV.LOOP_FORWARD and wav.data.size() == wav.loop_end*2,"Radio loop malformed")
		assert(radio_player.playing and radio_player.stream == wav,"Radio is not playing station %d" % station)
		var peak := 0
		for i in range(0,wav.loop_end,97):
			peak = maxi(peak,absi(wav.data.decode_s16(i*2)))
		assert(peak > 2500 and peak < 32000,"Radio station %d level wrong (%d)" % [station,peak])
		assert(radio_caption.visible and radio_caption.text != "","Radio caption missing")
		assert(_on_screen(radio_caption),"Radio caption off screen")
		print("radio station %d ok: %.1fs peak %d | %s" % [station,float(wav.loop_end)/float(RADIO_SR),peak,radio_caption.text])
	radio_station = 2
	_save_progress()
	radio_station = 0
	_load_progress()
	assert(radio_station == 2,"Radio station did not persist")
	_radio_set(0)
	assert(not radio_player.playing and not radio_caption.visible,"Radio did not switch off")

func _smoke_models() -> void:
	for id in CARS.size():
		car_id = id
		_apply_car()
		assert(car_model != null and not car_boxes.visible,"Car model %d not shown" % id)
		var surfaces := 0
		var tinted := 0
		var stack: Array = [car_model]
		while not stack.is_empty():
			var n: Node = stack.pop_back()
			if n is MeshInstance3D:
				var mi := n as MeshInstance3D
				surfaces += mi.mesh.get_surface_count()
				for k in mi.mesh.get_surface_count():
					if mi.get_surface_override_material(k) == car_body_mat or mi.get_surface_override_material(k) == car_roof_mat:
						tinted += 1
			stack.append_array(n.get_children())
		assert(surfaces >= 15 and tinted >= 2,"Car model %d has no tintable body (%d/%d)" % [id,tinted,surfaces])
	assert(ResourceLoader.exists("res://models/lighthouse.glb") and ResourceLoader.exists("res://models/windmill.glb"),"Landmark models missing")
	car_id = 0
	_apply_car()
	print("models ok")

func _smoke_garage_ridge() -> void:
	# This older test predates the Civic Center: treat its sites as found here.
	var saved_civic_all := civic_mask
	civic_mask = (1 << CIVIC.size())-1
	# A v0.2.0 save has no garage fields: progress must be kept and defaults applied.
	var legacy := ConfigFile.new()
	legacy.set_value("progress","cash",3550)
	legacy.set_value("progress","deliveries",18)
	legacy.set_value("progress","found_mask",255)
	legacy.set_value("progress","route_index",0)
	legacy.set_value("progress","exploring",true)
	legacy.set_value("progress","next_job_pending",false)
	legacy.save(SAVE_PATH)
	cash = 0
	owned_mask = 31
	car_id = 4
	_load_progress()
	assert(cash == 3550 and deliveries == 18 and found_mask == 255,"Legacy progress lost")
	assert(owned_mask == 1 and car_id == 0 and ridge_mask == 0 and claimed_mask == 0,"Legacy defaults wrong")
	assert(civic_mask == 0,"Old saves start with no Civic Center sites")
	civic_mask = (1 << CIVIC.size())-1
	_apply_car()
	_update_gate()
	claimed_mask = (1 << MISSIONS.size())-1
	await get_tree().physics_frame
	await get_tree().physics_frame
	assert(_blocked_at(RIDGE_GATE+Vector3(0,2,0)),"Ridge gate should be closed by default")
	exploring = true
	assert(_destination().is_equal_approx(RIDGE_GATE),"Guidance should point at the closed gate")
	# Garage purchases.
	cash = 100
	garage_view = 1
	_garage_action()
	assert(owned_mask == 1 and cash == 100 and car_id == 0,"Bought a car without enough cash")
	cash = 3000
	_garage_action()
	assert(owned_mask == 3 and cash == 2500 and car_id == 1 and is_equal_approx(car_max,21.0),"Car purchase failed")
	garage_view = 0
	_garage_action()
	assert(car_id == 0 and is_equal_approx(car_max,18.0) and cash == 2500,"Selecting an owned car failed")
	garage_view = 1
	_garage_action()
	_save_progress()
	owned_mask = 1
	car_id = 0
	_load_progress()
	assert(owned_mask == 3 and car_id == 1,"Garage ownership not saved")
	for i in range(1,CARS.size()):
		assert(float(CARS[i]["speed"]) > float(CARS[0]["speed"]) or float(CARS[i]["turn"]) > float(CARS[0]["turn"]),"Car has no advantage")
	# Garage and journal through the real touch dispatch on a 1280x720 screen.
	_toggle_menu()
	_open_garage()
	await get_tree().process_frame
	await get_tree().process_frame
	assert(_on_screen(garage),"Garage panel off screen")
	garage_view = 2
	_refresh_garage()
	cash = 1400
	_refresh_garage()
	var tap := InputEventScreenTouch.new()
	tap.index = 0
	tap.pressed = true
	tap.position = garage_button.get_global_rect().get_center()
	_input(tap)
	assert((owned_mask & 4) != 0 and cash == 0 and car_id == 2,"Touch purchase in the garage failed")
	_open_journal()
	await get_tree().process_frame
	await get_tree().process_frame
	assert(_on_screen(journal),"Journal panel off screen")
	_close_sub()
	await get_tree().process_frame
	await get_tree().process_frame
	assert(_on_screen(menu),"Menu panel off screen")
	_toggle_menu()
	# Gate opens with the Ridge Rover.
	await get_tree().physics_frame
	await get_tree().physics_frame
	assert(not _blocked_at(RIDGE_GATE+Vector3(0,2,0)),"Ridge gate did not open")
	# Terrain: every Ridge site has ground and clear space.
	for i in RIDGE.size():
		var pos: Vector3 = RIDGE[i]["pos"]
		assert(not _blocked_at(pos+Vector3(0,1.4,0)),"Ridge site blocked: "+str(RIDGE[i]["name"]))
		var ray := PhysicsRayQueryParameters3D.create(pos+Vector3(0,3,0),pos+Vector3(0,-3,0))
		assert(not get_world_3d().direct_space_state.intersect_ray(ray).is_empty(),"No ground at "+str(RIDGE[i]["name"]))
	# Drive east through the gate, over the plaza and up the ramp.
	var cash_before_drive := cash
	car.position = Vector3(50,0.8,0)
	car.rotation = Vector3(0,-PI/2.0,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	driving = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	for frame in 480:
		var fwd := -camera.global_basis.z
		fwd.y = 0
		fwd = fwd.normalized()
		var rgt := camera.global_basis.x
		rgt.y = 0
		rgt = rgt.normalized()
		stick = Vector2(Vector3.RIGHT.dot(rgt),-Vector3.RIGHT.dot(fwd))
		await get_tree().physics_frame
	stick = Vector2.ZERO
	assert(car.position.x > 125 and car.position.y > 4.5,"Car could not climb to the summit: %s" % str(car.position))
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	_rescue()
	assert(best_kmh > 60.0,"Speed was not tracked")
	ridge_mask = 0
	cash = cash_before_drive
	# Discoveries pay once; completing all six adds the bonus.
	var expected := RIDGE_BONUS
	for i in RIDGE.size():
		expected += int(RIDGE[i]["pay"])
		player.position = RIDGE[i]["pos"]+Vector3(0,0.9,0)
		_check_ridge()
		assert((ridge_mask & (1 << i)) != 0,"Ridge discovery failed: "+str(RIDGE[i]["name"]))
	assert(cash == cash_before_drive+expected and _ridge_count() == RIDGE.size(),"Ridge rewards wrong")
	var settled := cash
	for i in RIDGE.size():
		_discover(i)
	assert(cash == settled,"Ridge site paid twice")
	assert(_nearest_bay() >= 0 and _destination().is_equal_approx(BAY[_nearest_bay()]["pos"]),"Guidance should lead to the Bay")
	# Bay Road: opens after all Ridge sites, grounded sites, drivable, pays once.
	ridge_mask = 0
	_update_gate()
	await get_tree().physics_frame
	await get_tree().physics_frame
	assert(_blocked_at(BAY_GATE+Vector3(0,2,0)),"Bay gate should start closed")
	ridge_mask = 63
	_update_gate()
	await get_tree().physics_frame
	await get_tree().physics_frame
	assert(not _blocked_at(BAY_GATE+Vector3(0,2,0)),"Bay gate did not open")
	for i in BAY.size():
		var bay_pos: Vector3 = BAY[i]["pos"]
		assert(not _blocked_at(bay_pos+Vector3(0,1.4,0)),"Bay site blocked: "+str(BAY[i]["name"]))
		var bay_ray := PhysicsRayQueryParameters3D.create(bay_pos+Vector3(0,3,0),bay_pos+Vector3(0,-3,0))
		assert(not get_world_3d().direct_space_state.intersect_ray(bay_ray).is_empty(),"No ground at "+str(BAY[i]["name"]))
	var cash_before_bay := cash
	car.position = Vector3(-50,0.8,0)
	car.rotation = Vector3(0,PI/2.0,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	driving = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	for frame in 420:
		var bay_fwd := -camera.global_basis.z
		bay_fwd.y = 0
		bay_fwd = bay_fwd.normalized()
		var bay_rgt := camera.global_basis.x
		bay_rgt.y = 0
		bay_rgt = bay_rgt.normalized()
		stick = Vector2(Vector3.LEFT.dot(bay_rgt),-Vector3.LEFT.dot(bay_fwd))
		await get_tree().physics_frame
	stick = Vector2.ZERO
	assert(car.position.x < -140,"Car could not drive the Bay Road: %s" % str(car.position))
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	_rescue()
	bay_mask = 0
	cash = cash_before_bay
	var bay_expected := BAY_BONUS
	for i in BAY.size():
		bay_expected += int(BAY[i]["pay"])
		player.position = BAY[i]["pos"]+Vector3(0,0.9,0)
		_check_bay()
		assert((bay_mask & (1 << i)) != 0,"Bay discovery failed: "+str(BAY[i]["name"]))
	assert(cash == cash_before_bay+bay_expected and _bay_count() == BAY.size(),"Bay rewards wrong")
	var bay_settled := cash
	for i in BAY.size():
		_discover_bay(i)
	assert(cash == bay_settled,"Bay site paid twice")
	# North districts: open after 3 Bay sites, 8 sites, 2 trials.
	bay_mask = 3
	assert(not _north_open(),"North opened too early")
	bay_mask = 7
	assert(_north_open(),"North did not open")
	_update_gate()
	assert(north_gate_body.visible == false,"North gate still closed")
	north_mask = 0
	driving = false
	player.show()
	var cash_north := cash
	var north_expected := NORTH_BONUS
	for i in NORTH.size():
		north_expected += int(NORTH[i]["pay"])
		var npos: Vector3 = NORTH[i]["pos"]
		assert(not _blocked_at(npos+Vector3(0,1.0,0),0.6),"North site blocked: "+str(NORTH[i]["name"]))
		player.position = npos+Vector3(0,0.9,0)
		_check_north()
		assert((north_mask & (1 << i)) != 0,"North discovery failed: "+str(NORTH[i]["name"]))
	assert(cash == cash_north+north_expected and _north_count() == NORTH.size(),"North rewards wrong")
	var north_settled := cash
	for i in NORTH.size():
		_discover_north(i)
	assert(cash == north_settled,"North site paid twice")
	trial_done = 0
	for ti in [5,6]:
		assert(_start_trial(ti),"North trial did not start")
		var cash_nt := cash
		for cp in TRIALS[ti]["cps"]:
			assert(not _blocked_at(cp+Vector3(0,1.0,0),0.6),"North trial ring blocked at %s" % str(cp))
			car.position = cp+Vector3(0,0.8,0)
			_check_trial()
		assert(trial_active == -1 and cash == cash_nt+int(TRIALS[ti]["pay"])*3/2,"North trial reward wrong")
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	_rescue()
	# Time trials: locked until the area opens, pay full once then 25%.
	ridge_mask = 0
	owned_mask = 31
	assert(not _start_trial(2),"Locked trial started")
	ridge_mask = 63
	trial_done = 0
	best_times = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
	assert(_start_trial(0) and trial_active == 0 and driving,"City trial did not start")
	var cash_trial := cash
	for cp in TRIALS[0]["cps"]:
		car.position = cp+Vector3(0,0.8,0)
		_check_trial()
	assert(trial_active == -1 and cash == cash_trial+450 and (trial_done & 1) != 0,"First trial reward wrong")
	assert(float(best_times[0]) >= 0.0,"Best time missing")
	assert(_start_trial(0))
	cash_trial = cash
	for cp in TRIALS[0]["cps"]:
		car.position = cp+Vector3(0,0.8,0)
		_check_trial()
	assert(cash == cash_trial+75,"Repeat trial reward wrong")
	assert(_start_trial(1) and _start_trial(2),"Open-area trials did not start")
	assert(_start_trial(0))
	_rescue()
	assert(trial_active == -1 and not driving,"Rescue did not end the running trial")
	assert(player.position.distance_to(car.position) < 5.0,"Player is out of enter range after Return to the car")
	_interact()
	assert(driving,"ENTER CAR did not work right after Return to the car")
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	assert(_start_trial(0))
	driving = false
	player.show()
	player.position = car.position+Vector3(2,0,0)
	_interact()
	assert(trial_active == -1 and driving,"Could not re-enter the car after a trial was abandoned on foot")
	for ev in [3,4]:
		assert(TRIALS[ev]["cps"].size() >= 3 and _start_trial(ev),"Street event %d did not start" % ev)
		var cash_ev := cash
		var done_before := trial_done
		for cp in TRIALS[ev]["cps"]:
			assert(not _blocked_at(cp+Vector3(0,1.0,0),0.6),"Street event ring blocked at %s" % str(cp))
			car.position = cp+Vector3(0,0.8,0)
			_check_trial()
		assert(trial_active == -1 and cash == cash_ev+int(TRIALS[ev]["pay"])+int(TRIALS[ev]["pay"])/2 and (trial_done & (1 << ev)) != 0 and (done_before & (1 << ev)) == 0,"Street event %d reward wrong" % ev)
	assert(best_times.size() == TRIALS.size(),"best_times size mismatch")
	assert(_trial_count() >= 2,"Street events not counted")
	trial_active = -1
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	_rescue()
	_toggle_menu()
	_open_trials()
	await get_tree().process_frame
	await get_tree().process_frame
	assert(_on_screen(trial_panel),"Trials panel off screen")
	_toggle_menu()
	bay_mask = 0
	# Tuning: costs, caps, effects, persistence and touch UI.
	tunes.fill(0)
	owned_mask = 31
	car_id = 0
	garage_view = 0
	cash = 100
	assert(not _buy_tune(0) and cash == 100 and _tune_level(0,0) == 0,"Tune bought without cash")
	cash = 100000
	var base_speed := float(CARS[0]["speed"])
	for level in MAX_TUNE:
		var paid := cash
		assert(_buy_tune(0),"Tune purchase failed")
		assert(paid-cash == int(UPGRADE_COSTS[level]),"Tune cost wrong")
	assert(_tune_level(0,0) == MAX_TUNE and is_equal_approx(car_max,base_speed*(1.0+0.06*MAX_TUNE)),"Engine tune effect wrong")
	cash = 100000
	assert(not _buy_tune(0) and cash == 100000,"Tune exceeded the maximum")
	garage_view = 3
	var before_tune := cash
	assert(_buy_tune(1) and before_tune-cash == int(round(300.0*2.5)),"Tune price scaling wrong")
	_save_progress()
	tunes.fill(0)
	_load_progress()
	assert(_tune_level(0,0) == MAX_TUNE and _tune_level(3,1) == 1,"Tunes not saved")
	_toggle_menu()
	garage_view = 0
	_open_garage()
	_open_tune()
	await get_tree().process_frame
	await get_tree().process_frame
	assert(_on_screen(tune_panel),"Tune panel off screen")
	cash = 100000
	var tap_tune := InputEventScreenTouch.new()
	tap_tune.index = 0
	tap_tune.pressed = true
	tap_tune.position = tune_buttons[1].get_global_rect().get_center()
	_input(tap_tune)
	assert(_tune_level(0,1) == 1,"Touch tune purchase failed")
	_toggle_menu()
	# Missions pay exactly once.
	tunes.fill(0)
	cash = 0
	north_mask = 0
	claimed_mask = 0
	owned_mask = 1
	deliveries = 18
	best_kmh = 0.0
	ridge_mask = 0
	_check_missions()
	assert(cash == 0 and claimed_mask == 0,"Missions claimed too early")
	owned_mask = 31
	deliveries = 25
	best_kmh = 90.0
	ridge_mask = 63
	bay_mask = 63
	north_mask = 255
	trial_done = (1 << TRIALS.size())-1
	for u in UPGRADES.size():
		tunes[u] = MAX_TUNE
	marina_mask = (1 << MARINA.size())-1
	shop_visit_mask = 7
	owned_mask = 31 | (1 << 5)
	var saved_dt_missions := downtown_mask
	downtown_mask = (1 << DOWNTOWN.size())-1
	_check_missions()
	downtown_mask = saved_dt_missions
	var total := 0
	for m in MISSIONS:
		total += int(m["pay"])
	assert(claimed_mask == (1 << MISSIONS.size())-1 and cash == total,"Mission rewards wrong")
	_check_missions()
	assert(cash == total,"Mission paid twice")
	marina_mask = 0
	shop_visit_mask = 0
	owned_mask = 31
	journal_page = 1
	journal_page = 1
	_refresh_journal()
	assert("[DONE]" in journal_label.text,"Journal did not show progress")
	journal_page = 0
	journal_page = 0
	# Online: offline-safe message handling (no network used).
	online_id = "me"
	online_name = "Tester"
	var frame := _online_pos_frame()
	assert(frame["event"] == "broadcast" and frame["payload"]["event"] == "pos" and frame["payload"]["payload"]["i"] == "me","Online frame wrong")
	assert(JSON.parse_string(JSON.stringify(frame)) is Dictionary,"Online frame not JSON")
	assert(_online_join_frame()["event"] == "phx_join","Join frame wrong")
	var incoming := {"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"pos","payload":{"i":"p1","n":"Rival\n\u00e9","x":12.5,"y":0.0,"z":-80.0,"r":1.0,"c":2,"d":1}}}
	_online_handle(JSON.stringify(incoming))
	assert(online_peers.size() == 1 and online_peers.has("p1"),"Online peer not created")
	assert(online_peers["p1"]["name"] == "Rival","Online name not cleaned: "+str(online_peers["p1"]["name"]))
	_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"pos","payload":{"i":"me","x":1,"y":0,"z":1}}}))
	_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"pos","payload":{"i":"far","x":99999,"y":0,"z":1}}}))
	_online_handle("not json")
	assert(online_peers.size() == 1,"Online accepted own or invalid peer")
	_online_update_peers(0.5)
	assert((online_peers["p1"]["node"] as Node3D).position.distance_to(Vector3(12.5,0,-80)) < 0.1,"Online peer did not move")
	online_peers["p1"]["seen"] = Time.get_ticks_msec()/1000.0-100.0
	_online_update_peers(0.1)
	assert(online_peers.is_empty(),"Stale online peer not removed")
	assert(not online_on and online_ws == null,"Online must start off")
	_rescue()

	civic_mask = saved_civic_all
func _save_shot(name: String) -> void:
	for i in 6:
		await get_tree().process_frame
	await RenderingServer.frame_post_draw
	var folder := OS.get_environment("HC_SHOTS")
	if folder == "":
		folder = ProjectSettings.globalize_path("user://screenshots")
	DirAccess.make_dir_recursive_absolute(folder)
	get_viewport().get_texture().get_image().save_png(folder.path_join(name+".png"))

func _people_shots() -> void:
	# Developer-only: close-up frames of the player and pedestrians. Never saves.
	player.position = Vector3(6.5,0.7,-12)
	player.rotation.y = 0.6
	av_hat = 1
	_apply_avatar()
	for i in 4:
		peds[i]["t"] = 0.36+0.02*i
	for i in 30:
		await get_tree().physics_frame
	var ped: Node3D = peds[0]["node"]
	player.position = ped.position+Vector3(1.2,0.7,0.6)
	paused = true
	camera.position = ped.position+Vector3(2.2,1.7,2.6)
	camera.look_at(ped.position+Vector3(0.6,0.9,0))
	await _save_shot("people-close")
	paused = false
	_follow_camera(1.0)
	await _save_shot("people-game-camera")
	# v0.22 line-up: the four body styles, standing and mid-stride.
	var base := Vector3(2.0,0,24)
	var looks := [[Color("d6453d"),Color("2d3e57"),Color("f0c9a4"),Color("2b1d14")],[Color("3f8fd2"),Color("38302a"),Color("c68a60"),Color("1a1a1a")],[Color("5fbf7f"),Color("23324a"),Color("8d5a3b"),Color("1a1a1a")],[Color("f2b24a"),Color("4a4f57"),Color("e2b48e"),Color("7a4a26")]]
	var lineup: Array = []
	for v in 4:
		var n := Node3D.new()
		add_child(n)
		n.position = base+Vector3(float(v)*0.95,0,0)
		n.rotation.y = PI+(0.35 if v % 2 == 1 else -0.2)
		var c: Array = looks[v]
		var pp := _make_person(n,v,{"Shirt":c[0],"Pants":c[1],"Skin":c[2],"Hair":c[3],"Shoes":Color("2b2b2b"),"Eye":Color("1c1c22")})
		_pose_person(pp,1.3 if v % 2 == 1 else 0.0,1.0 if v % 2 == 1 else 0.0)
		lineup.append(n)
	paused = true
	camera.position = base+Vector3(1.43,1.15,3.4)
	camera.look_at(base+Vector3(1.43,0.88,0))
	await _save_shot("people-lineup")
	camera.position = base+Vector3(0.05,1.55,0.62)
	camera.look_at(base+Vector3(0,1.5,0))
	await _save_shot("people-face")
	get_tree().quit()

func _shots() -> void:
	# Developer-only: captures real rendered gameplay frames from a scripted profile, then quits.
	cash = 4820
	deliveries = 25
	found_mask = 255
	owned_mask = 31
	car_id = 3
	ridge_mask = 63
	bay_mask = 7
	claimed_mask = 1023
	best_kmh = 95.0
	trial_done = 3
	best_times = [31.4,12.9,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
	for u in UPGRADES.size():
		tunes[3*UPGRADES.size()+u] = 2+u
	_apply_car()
	_update_gate()
	car.position = Vector3(-112,0.8,0)
	car.rotation = Vector3(0,PI/2.0,0)
	driving = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	for i in 100:
		await get_tree().physics_frame
	await _save_shot("bay-road")
	car.position = Vector3(-163,0.8,1)
	car.rotation = Vector3(0,PI/2.0,0)
	for i in 40:
		await get_tree().physics_frame
	await _save_shot("lighthouse-windmill")
	car.position = Vector3(-112,0.8,0)
	for i in 40:
		await get_tree().physics_frame
	_toggle_menu()
	garage_view = 3
	_open_garage()
	await _save_shot("garage")
	_open_tune()
	await _save_shot("tune")
	_open_panel(menu)
	_open_trials()
	await _save_shot("trials")
	_open_journal()
	await _save_shot("journal")
	_toggle_menu()
	_start_trial(1)
	for i in 70:
		await get_tree().physics_frame
	await _save_shot("trial-running")
	_cancel_trial()
	car.position = Vector3(0,0.8,-20)
	car.rotation = Vector3.ZERO
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	peds[0]["t"] = 0.34
	peds[1]["t"] = 0.38
	peds[2]["t"] = 0.34
	peds[5]["t"] = 0.5
	_radio_set(3)
	await _wait_radio(3)
	radio_line = 1
	_radio_refresh()
	for i in 50:
		await get_tree().physics_frame
	await _save_shot("city-radio")
	bay_mask = 7
	north_mask = 0
	_update_gate()
	await _shot_car(Vector3(3,0.8,-96),0.0)
	await _save_shot("north-industrial")
	await _shot_car(Vector3(0,0.8,-212),0.0)
	await _save_shot("north-suburbs")
	await _shot_car(Vector3(-5,0.8,-330),0.0)
	await _save_shot("north-airfield")
	await _shot_car(Vector3(172,6.4,-270),-PI/2.0)
	await _save_shot("north-pass")
	await _shot_car(Vector3(-40,0.8,-33),0.0)
	await _save_shot("city-buildings")
	await _shot_car(Vector3(-32,0.8,32),0.0)
	_chase_start(1)
	for i in chase_units.size():
		(chase_units[i]["node"] as Node3D).position = car.position+Vector3(-5.0+i*5.0,0.0,14.0+i*5.0)
	for i in 25:
		await get_tree().physics_frame
	await _save_shot("chase-thief")
	chase_mode = 0
	_chase_clear()
	chase_label.hide()
	await _shot_car(Vector3(-8,0.8,136),0.0)
	await _save_shot("marina-showroom")
	_shop_open(0)
	shop_sel[0] = 1
	_refresh_shop()
	await get_tree().process_frame
	await _save_shot("marina-showroom-menu")
	_shop_close()
	await _shot_car(Vector3(0,0.8,96),0.0)
	await _save_shot("marina-bridge")
	await _shot_car(Vector3(-4,0.8,176),0.0)
	await _save_shot("marina-plaza")
	_shop_open(2)
	shop_sel[0] = 7
	_refresh_shop()
	await get_tree().process_frame
	await _save_shot("marina-paint")
	_shop_close()
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	player.position = Vector3(18,0.8,134)
	car.position = Vector3(8,0.8,128)
	for i in 40:
		await get_tree().physics_frame
	_shop_open(1)
	shop_sel = [2,3,4]
	_refresh_shop()
	await get_tree().process_frame
	await _save_shot("marina-style")
	_shop_close()
	# v0.14 bus line
	bay_mask = (1 << BAY.size())-1
	_update_gate()
	_bus_reset()
	bus_dwell = 30.0
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	player.position = Vector3(5.2,0.9,47.0)
	player.velocity = Vector3.ZERO
	car.position = Vector3(-30,0.8,10)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	camera.position = player.position+Vector3(11,17,19)
	for i in 40:
		await get_tree().physics_frame
	await _save_shot("bus-stop")
	_interact()
	bus_dwell = 0.0
	bus_next = 4
	bus_idx = 3
	bus_z = -60.0
	bus_fwd = true
	bus.position = Vector3(BUS_LANE,0,-60.0)
	for i in 120:
		await get_tree().physics_frame
	await _save_shot("bus-ride")
	bus_idx = 5
	bus_next = 6
	bus_z = -250.0
	for i in 200:
		await get_tree().physics_frame
	await _save_shot("bus-airfield")
	north_mask = (1 << NORTH.size())-1
	trial_done = (1 << BASE_TRIALS)-1
	claimed_mask = (1 << 12)-1
	deliveries = 25
	_check_level()
	_update_gate()
	_bus_alight(true)
	_bus_reset()
	bus_dwell = 40.0
	player.position = Vector3(5.2,0.9,153.0)
	player.velocity = Vector3.ZERO
	camera.position = player.position+Vector3(11,17,19)
	for i in 50:
		await get_tree().physics_frame
	await _save_shot("bus-marina")
	driving = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	car.position = Vector3(0,0.8,-70)
	car.rotation = Vector3.ZERO
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	camera.position = car.position+Vector3(11,17,19)
	_chase_start(1)
	chase_t = 11.9
	for i in 20:
		await get_tree().physics_frame
	if chase_blocks.size() > 0:
		(chase_blocks[0]["node"] as Node3D).position = car.position+Vector3(0,0,-16)
	for i in 30:
		await get_tree().physics_frame
	await _save_shot("chase-roadblock")
	chase_t = 31.0
	for i in 10:
		await get_tree().physics_frame
	if chase_heli != null:
		chase_heli.position = car.position+Vector3(4,13,-6)
	for i in 5:
		await get_tree().physics_frame
	await _save_shot("chase-heli")
	get_tree().quit()

func _shot_car(pos: Vector3, yaw: float) -> void:
	car.position = pos
	car.rotation = Vector3(0,yaw,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	driving = true
	player.hide()
	for i in 45:
		await get_tree().physics_frame

func _capture_preview() -> void:
	await RenderingServer.frame_post_draw
	var folder := ProjectSettings.globalize_path("user://screenshots")
	DirAccess.make_dir_recursive_absolute(folder)
	var image := get_viewport().get_texture().get_image()
	image.save_png(folder.path_join("harbor-city-gameplay.png"))
	_show_toast("Gameplay screenshot saved.")

# ---------- v0.16.0: Skyline District (big downtown), traffic with signals, busier streets ----------
# v0.28: big-city scale. 20 m four-lane roads on an 80 m grid; the airport road (z -458) is the northern street
# and Westside Boulevard (z -56) the southern one.
const DT_AVES := [-140.0,-220.0,-300.0,-380.0,-460.0,-540.0,-620.0]
const DT_STREETS := [-140.0,-220.0,-300.0,-380.0]
const DT_EAST := -110.5
const DT_WEST := -660.0
const DT_NORTH := -61.5
const DT_SOUTH := -458.0
const DT_ROAD := 20.0
const DT_BLOCK := 80.0
const DT_TOWER_SCALE := 1.7
const DT_SHOP_SCALE := 1.4
const DT_MALL := Vector3(-540,0,-98)
const DT_STATION := Vector3(-220,0,-340)
const DT_PARK := Vector3(-460,0,-220)
const DT_PLAZA := Vector3(-340,0,-98)
# Road pieces removed where blocks are merged (stadium, station, park, mall): [fixed coordinate, from, to].
const DT_AVE_GAPS := [[-460.0,-290.0,-150.0],[-540.0,-457.5,-310.0],[-540.0,-130.0,-62.0],[-220.0,-370.0,-310.0]]
const DT_STREET_GAPS := [[-220.0,-530.0,-390.0],[-380.0,-610.0,-470.0]]
const DT_SIZES := {"tower_0":Vector3(16,50,16),"tower_1":Vector3(18,58,18),"tower_2":Vector3(24,34,12),"tower_3":Vector3(14,41,14),"tower_4":Vector3(20,90,20),"shops_0":Vector3(24,9,10),"shops_1":Vector3(24,9,10),"garage":Vector3(24,14,24),"police":Vector3(30,9,18),"mall":Vector3(72,14,30.6),"station":Vector3(56,10,18),"hospital":Vector3(30,13,22),"school":Vector3(30,10,14),"hotel":Vector3(30,15,16),"bank":Vector3(30,13,22),"fire_station":Vector3(24,9,14),"library":Vector3(30,12,18)}
const DOWNTOWN := [
	{"name":"Police HQ","pos":Vector3(-180,0,-152),"pay":600},
	{"name":"City Hall","pos":Vector3(-180,0,-232),"pay":600},
	{"name":"Harbor Tower","pos":Vector3(-260,0,-232),"pay":900},
	{"name":"Times Plaza","pos":Vector3(-340,0,-106),"pay":700},
	{"name":"Grand Mall","pos":Vector3(-540,0,-70),"pay":700},
	{"name":"Central Park Fountain","pos":Vector3(-460,0,-234),"pay":800},
	{"name":"Harbor Stadium","pos":Vector3(-540,0,-322),"pay":900},
	{"name":"Union Station","pos":Vector3(-220,0,-316),"pay":800},
]
const DOWNTOWN_BONUS := 4000
const LIGHT_CYCLE := 20.0
const ADS := ["HARBOR FM 101\nHits all day","NIGHT COMET\nFeel the speed","PIZZA RUSH\nHot in 38 seconds","VISIT MARINA\nHEIGHTS","MINT CRUISER\nSmooth city rides","GRAND MALL\nOpen late","STADIUM\nGame night!","AIRPORT LINE\nOnly $15"]
const TRAFFIC_LOOPS := [
	{"lane":6.0,"speed":12.0,"cars":6,"pts":[Vector2(-140,-140),Vector2(-380,-140),Vector2(-380,-380),Vector2(-140,-380)]},
	{"lane":6.0,"speed":11.0,"cars":4,"pts":[Vector2(-140,-220),Vector2(-300,-220),Vector2(-300,-300),Vector2(-140,-300)]},
	{"lane":6.0,"speed":12.0,"cars":4,"pts":[Vector2(-380,-140),Vector2(-620,-140),Vector2(-620,-300),Vector2(-380,-300)]},
	{"lane":6.0,"speed":11.0,"cars":3,"pts":[Vector2(-140,-56),Vector2(-300,-56),Vector2(-300,-140),Vector2(-140,-140)]},
	{"lane":6.0,"speed":12.0,"cars":5,"pts":[Vector2(60,-140),Vector2(-60,-140),Vector2(-60,-300),Vector2(60,-300)]},
	{"lane":6.0,"speed":11.0,"cars":3,"pts":[Vector2(0,-300),Vector2(-60,-300),Vector2(-60,-380),Vector2(0,-380)]},
	{"lane":2.3,"speed":8.0,"cars":3,"pts":[Vector2(-32,-32),Vector2(32,-32),Vector2(32,32),Vector2(-32,32)]},
	{"lane":2.3,"speed":8.0,"cars":3,"pts":[Vector2(-32,-32),Vector2(-32,32),Vector2(32,32),Vector2(32,-32)]},
	{"lane":2.5,"speed":9.0,"cars":4,"pts":[Vector2(-95,32),Vector2(-230,32),Vector2(-230,72),Vector2(-95,72)]},
	{"lane":2.5,"speed":9.0,"cars":3,"pts":[Vector2(330,150),Vector2(530,150),Vector2(530,250),Vector2(330,250)]},
	{"lane":2.5,"speed":9.0,"cars":3,"pts":[Vector2(-300,0),Vector2(-420,0),Vector2(-420,150),Vector2(-300,150)]},
]
const TRAFFIC_COLORS := [Color("d33a3a"),Color("eef1f2"),Color("23262b"),Color("2f5fd0"),Color("f2d046"),Color("7ac74f"),Color("9aa3aa"),Color("f07f2e"),Color("22b5c9")]
var downtown_mask := 0
var downtown_nodes: Array[Node3D] = []
var traffic: Array = []
var traffic_paths: Array = []
var traffic_on := true
var light_spots: Array = []
var light_ns_mat: StandardMaterial3D
var light_ew_mat: StandardMaterial3D
var light_state := -1
var blocked_skip_traffic := false

func _downtown_open() -> bool:
	return _bay_open()

func _downtown_count() -> int:
	var n := 0
	for i in DOWNTOWN.size():
		if downtown_mask & (1 << i):
			n += 1
	return n

func _nearest_downtown() -> int:
	var closest := -1
	var best := INF
	var body: CharacterBody3D = car if driving else player
	for i in DOWNTOWN.size():
		if downtown_mask & (1 << i):
			continue
		var pos: Vector3 = DOWNTOWN[i]["pos"]
		var d := Vector2(body.position.x-pos.x,body.position.z-pos.z).length()
		if d < best:
			best = d
			closest = i
	return closest

func _check_downtown() -> void:
	var body: CharacterBody3D = car if driving else player
	for i in DOWNTOWN.size():
		var found := (downtown_mask & (1 << i)) != 0
		var pos: Vector3 = DOWNTOWN[i]["pos"]
		downtown_nodes[i].visible = not found
		downtown_nodes[i].rotation.y = clock
		downtown_nodes[i].position.y = pos.y+1.7+sin(clock*2+i)*0.25
		if found:
			continue
		if Vector2(body.position.x-pos.x,body.position.z-pos.z).length() < 4.5 and absf(body.position.y-pos.y) < 3.5:
			_discover_downtown(i)

func _discover_downtown(i: int) -> void:
	if downtown_mask & (1 << i):
		return
	downtown_mask |= 1 << i
	var count := _downtown_count()
	var reward := int(DOWNTOWN[i]["pay"])
	if count == DOWNTOWN.size():
		reward += DOWNTOWN_BONUS
	cash += reward
	downtown_nodes[i].hide()
	_save_progress()
	_show_toast("%s discovered!  %d/%d  +$%d%s" % [DOWNTOWN[i]["name"],count,DOWNTOWN.size(),reward,"  SKYLINE COMPLETE!" if count == DOWNTOWN.size() else ""])

# Batched drawing: one draw call per colour or model, which keeps a big district cheap on the phone.
func _box_batch(color: Color, items: Array) -> MultiMeshInstance3D:
	if items.is_empty():
		return null
	var multi := MultiMesh.new()
	multi.transform_format = MultiMesh.TRANSFORM_3D
	multi.mesh = BoxMesh.new()
	multi.instance_count = items.size()
	for i in items.size():
		var it: Array = items[i]
		multi.set_instance_transform(i,Transform3D(Basis.from_scale(it[1]),it[0]))
		_note_road(it[0],it[1],0.0,color)
	var inst := MultiMeshInstance3D.new()
	inst.multimesh = multi
	inst.material_override = _material(color)
	add_child(inst)
	return inst

func _model_batch(path: String, items: Array, recolor := {}, use_local := false) -> MultiMeshInstance3D:
	# items: [Vector3 position, float yaw, float scale]. recolor: material-name prefix -> Color.
	if items.is_empty():
		return null
	var model := _try_model(path)
	if model == null:
		return null
	var source := _first_mesh(model)
	if source == null:
		model.free()
		return null
	var mesh: Mesh = source.mesh
	if not recolor.is_empty():
		mesh = source.mesh.duplicate()
		for s in mesh.get_surface_count():
			var m := mesh.surface_get_material(s)
			var key := m.resource_name if m != null else ""
			for prefix in recolor:
				if key.begins_with(prefix):
					mesh.surface_set_material(s,_material(recolor[prefix]))
	# v0.26.2: some models (the houses) place their mesh with its own transform inside the file.
	var local := Transform3D.IDENTITY
	if use_local:
		var n: Node = source
		while n != null:
			if n is Node3D:
				local = (n as Node3D).transform*local
			if n == model:
				break
			n = n.get_parent()
	if path.ends_with("/lamp.glb"):
		for it in items:
			lamp_spots.append([it[0],float(it[1])])
		model.free()
		_city_lamps(items)
		return null
	if path.ends_with("/traffic_light.glb"):
		model.free()
		_city_signals(items)
		return null
	var multi := MultiMesh.new()
	multi.transform_format = MultiMesh.TRANSFORM_3D
	multi.mesh = mesh
	multi.instance_count = items.size()
	for i in items.size():
		var it: Array = items[i]
		var s := float(it[2]) if it.size() > 2 else 1.0
		multi.set_instance_transform(i,Transform3D(Basis(Vector3.UP,float(it[1])).scaled(Vector3(s,s,s)*_prop_stretch(path)),it[0])*local)
	var inst := MultiMeshInstance3D.new()
	inst.multimesh = multi
	add_child(inst)
	model.free()
	return inst

func _cut_ranges(ranges: Array, lo: float, hi: float) -> Array:
	var out := []
	for r in ranges:
		if hi <= float(r[0]) or lo >= float(r[1]):
			out.append(r)
		else:
			if lo > float(r[0]):
				out.append([r[0],lo])
			if hi < float(r[1]):
				out.append([hi,r[1]])
	return out

func _dt_ranges(is_ave: bool, c: float) -> Array:
	var ranges := [[DT_SOUTH+0.5,DT_NORTH-0.5]] if is_ave else [[DT_WEST,DT_EAST]]
	for g in (DT_AVE_GAPS if is_ave else DT_STREET_GAPS):
		if is_equal_approx(float(g[0]),c):
			ranges = _cut_ranges(ranges,float(g[1]),float(g[2]))
	return ranges

func _dt_has(is_ave: bool, c: float, t: float) -> bool:
	for r in _dt_ranges(is_ave,c):
		if t >= float(r[0])-0.01 and t <= float(r[1])+0.01:
			return true
	return false

func _dt_near_cross(is_ave: bool, t: float, margin: float) -> bool:
	for c in (DT_STREETS if is_ave else DT_AVES):
		if absf(t-float(c)) < margin:
			return true
	return false

func _place(items: Dictionary, name: String, pos: Vector3, yaw: float, scale := 1.0, solid := true) -> void:
	if not items.has(name):
		items[name] = []
	items[name].append([pos,yaw,scale])
	if solid and DT_SIZES.has(name):
		var size: Vector3 = DT_SIZES[name]*scale
		if absf(sin(yaw)) > 0.7:
			size = Vector3(size.z,size.y,size.x)
		_collider(self,pos+Vector3(0,size.y/2.0,0),size)

func _signal_pole(poles: Array, ns_caps: Array, ew_caps: Array, corner: Vector3, yaw: float, ns: bool, reach := 3.9) -> void:
	# v0.30: tall mast-arm signals. 4-lane roads get two lights hanging over the lanes, narrow roads one.
	var heads: Array = [5.1,10.1] if reach > 3.8 else [reach+0.3]
	poles.append([corner,yaw,heads])
	var b := Basis(Vector3.UP,yaw)
	var size := Vector3(0.06,0.36,0.36) if absf(sin(yaw)) > 0.7 else Vector3(0.36,0.36,0.06)
	for r in heads:
		var h := corner+b*Vector3(float(r),0,0)+Vector3(0,SIG_HEAD_Y,0)
		for f in [-1.0,1.0]:
			(ns_caps if ns else ew_caps).append([h+b*Vector3(0,0,f*0.23),size])

const SIG_POLE_H := 7.4
const SIG_ARM_Y := 7.1
const SIG_HEAD_Y := 6.0
const LAMP_H := 8.8
const LAMP_ARM := 3.2

func _cyl_batch(color: Color, items: Array, top := 0.8) -> MultiMeshInstance3D:
	# items: [position (centre), radius, height]
	if items.is_empty():
		return null
	var cm := CylinderMesh.new()
	cm.top_radius = top
	cm.bottom_radius = 1.0
	cm.height = 1.0
	cm.radial_segments = 8
	cm.rings = 1
	var multi := MultiMesh.new()
	multi.transform_format = MultiMesh.TRANSFORM_3D
	multi.mesh = cm
	multi.instance_count = items.size()
	for i in items.size():
		var it: Array = items[i]
		var r := float(it[1])
		multi.set_instance_transform(i,Transform3D(Basis.from_scale(Vector3(r,float(it[2]),r)),it[0]))
	var inst := MultiMeshInstance3D.new()
	inst.multimesh = multi
	inst.material_override = _material(color)
	add_child(inst)
	return inst

func _city_signals(items: Array) -> void:
	# items: [corner, yaw, head distances along the arm]. A slim grey pole, a long arm over the road,
	# dark light housings (the lit middle lamp is drawn from the signal caps), and a walk signal.
	var poles := []
	var bases := []
	var arms := []
	var housings := []
	var hangers := []
	var reds := []
	var greens := []
	var walks := []
	for it in items:
		var c: Vector3 = it[0]
		var b := Basis(Vector3.UP,float(it[1]))
		var heads: Array = it[2]
		var far := float(heads.max())
		poles.append([c+Vector3(0,SIG_POLE_H/2.0,0),0.15,SIG_POLE_H])
		bases.append([c+Vector3(0,0.3,0),0.3,0.6])
		arms.append([c+b*Vector3((far+0.5)/2.0,0,0)+Vector3(0,SIG_ARM_Y,0),Vector3(far+0.5,0.18,0.18),float(it[1])])
		walks.append([c+b*Vector3(0,0,0.32)+Vector3(0,3.0,0),Vector3(0.38,0.55,0.3),float(it[1])])
		for r in heads:
			var h := c+b*Vector3(float(r),0,0)+Vector3(0,SIG_HEAD_Y,0)
			housings.append([h,Vector3(0.5,1.45,0.4),float(it[1])])
			hangers.append([h+Vector3(0,0.9,0),Vector3(0.08,0.5,0.08),float(it[1])])
			for f in [-1.0,1.0]:
				reds.append([h+b*Vector3(0,0.46,f*0.215),Vector3(0.3,0.3,0.04),float(it[1])])
				greens.append([h+b*Vector3(0,-0.46,f*0.215),Vector3(0.3,0.3,0.04),float(it[1])])
	_cyl_batch(Color("5b6066"),poles,0.75)
	_cyl_batch(Color("4a4f55"),bases,0.8)
	_box_batch_rot(Color("5b6066"),arms)
	_box_batch_rot(Color("5b6066"),hangers)
	_box_batch_rot(Color("1d2023"),housings)
	_box_batch_rot(Color("1d2023"),walks)
	_box_batch_rot(Color("4a1712"),reds)
	_box_batch_rot(Color("123a1f"),greens)

var lamp_glow_mat: StandardMaterial3D

func _city_lamps(items: Array) -> void:
	# items: [position, yaw, scale]. A 9 m street lamp; its arm (local +x) reaches out over the road.
	if lamp_glow_mat == null:
		lamp_glow_mat = StandardMaterial3D.new()
		lamp_glow_mat.resource_name = "LampGlow"
		lamp_glow_mat.albedo_color = Color("f1ecdc")
		lamp_glow_mat.emission_enabled = true
		lamp_glow_mat.emission = Color("ffe2a0")
		lamp_glow_mat.emission_energy_multiplier = 0.3
		if not night_lamps.has(lamp_glow_mat):
			night_lamps.append(lamp_glow_mat)
	var poles := []
	var bases := []
	var arms := []
	var heads := []
	for it in items:
		var p: Vector3 = it[0]
		var a := float(it[1])
		var s := float(it[2]) if it.size() > 2 else 1.0
		var b := Basis(Vector3.UP,a)
		var h := LAMP_H*s
		poles.append([p+Vector3(0,h/2.0,0),0.13,h])
		bases.append([p+Vector3(0,0.45,0),0.22,0.9])
		arms.append([p+b*Vector3(LAMP_ARM/2.0,0,0)+Vector3(0,h-0.15,0),Vector3(LAMP_ARM,0.13,0.13),a])
		heads.append([p+b*Vector3(LAMP_ARM-0.1,0,0)+Vector3(0,h-0.3,0),Vector3(1.15,0.22,0.5),a])
	_cyl_batch(Color("5d6266"),poles,0.7)
	_cyl_batch(Color("4c5156"),bases,0.8)
	_box_batch_rot(Color("5d6266"),arms)
	var inst := _box_batch_rot(Color("f1ecdc"),heads)
	if inst != null:
		inst.material_override = lamp_glow_mat

func _build_downtown() -> void:
	# v0.28: big-city scale. 4-lane avenues and streets (20 m) on an 80 m grid, 5 m pavements,
	# towers about 1.7x bigger.
	var asphalt := Color("394552")
	var walk := Color("8f8d86")
	var line := Color("e7d9a4")
	var cx := (DT_WEST+DT_EAST)/2.0
	var cz := (DT_NORTH+DT_SOUTH)/2.0
	var half := DT_ROAD/2.0
	_slab(Vector3(cx,-0.35,cz),Vector3(DT_EAST-DT_WEST,0.6,DT_NORTH-DT_SOUTH),0,walk)
	# Link road from Bay Road up to the district (avenue -140 carries on south to the Civic Center).
	_slab(Vector3(-140,-0.35,-38.5),Vector3(16,0.6,46),0,walk)
	_box(self,Vector3(-140,0.01,-38.5),Vector3(12,0.08,46),asphalt)
	# Roads, centre lines, lane lines, crosswalks, signals.
	var roads := []
	var yellow := []
	var dashes := []
	var zebra := []
	var curbs := []
	for x in DT_AVES:
		for r in _dt_ranges(true,x):
			var z0 := float(r[0])
			var z1 := float(r[1])
			roads.append([Vector3(x,0.01,(z0+z1)/2.0),Vector3(DT_ROAD,0.08,z1-z0)])
			for s in [-1.0,1.0]:
				curbs.append([Vector3(x+s*(half+0.2),0.06,(z0+z1)/2.0),Vector3(0.4,0.12,z1-z0)])
			var z := z0+4.0
			while z < z1-2.0:
				if not _dt_near_cross(true,z,half+3.0):
					yellow.append([Vector3(x-0.25,0.06,z),Vector3(0.16,0.02,4.2)])
					yellow.append([Vector3(x+0.25,0.06,z),Vector3(0.16,0.02,4.2)])
					for s in [-5.0,5.0]:
						dashes.append([Vector3(x+s,0.06,z),Vector3(0.18,0.02,3)])
				z += 8.0
	for z in DT_STREETS:
		for r in _dt_ranges(false,z):
			var x0 := float(r[0])
			var x1 := float(r[1])
			roads.append([Vector3((x0+x1)/2.0,0.012,z),Vector3(x1-x0,0.08,DT_ROAD)])
			for s in [-1.0,1.0]:
				curbs.append([Vector3((x0+x1)/2.0,0.062,z+s*(half+0.2)),Vector3(x1-x0,0.12,0.4)])
			var x := x0+4.0
			while x < x1-2.0:
				if not _dt_near_cross(false,x,half+3.0):
					yellow.append([Vector3(x,0.062,z-0.25),Vector3(4.2,0.02,0.16)])
					yellow.append([Vector3(x,0.062,z+0.25),Vector3(4.2,0.02,0.16)])
					for s in [-5.0,5.0]:
						dashes.append([Vector3(x,0.062,z+s),Vector3(3,0.02,0.18)])
				x += 8.0
	roads.append([Vector3(-140,0.013,-50),Vector3(12,0.08,24)])
	var poles := []
	var ns_caps := []
	var ew_caps := []
	for x in DT_AVES:
		for z in DT_STREETS:
			if not (_dt_has(true,x,z) and _dt_has(false,z,x)):
				continue
			light_spots.append(Vector3(x,0,z))
			for s in [-1.0,1.0]:
				if _dt_has(true,x,z+s*(half+2.0)):
					for k in 12:
						zebra.append([Vector3(x-8.8+1.6*k,0.065,z+s*(half+2.0)),Vector3(0.7,0.02,3.0)])
				if _dt_has(false,z,x+s*(half+2.0)):
					for k in 12:
						zebra.append([Vector3(x+s*(half+2.0),0.067,z-8.8+1.6*k),Vector3(3.0,0.02,0.7)])
			var c := half+2.6
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x+c,0,z+c),PI,true)
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x-c,0,z-c),0.0,true)
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x-c,0,z+c),PI/2.0,false)
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x+c,0,z-c),-PI/2.0,false)
	_box_batch(asphalt,roads)
	_box_batch(Color("f2c230"),yellow)
	_box_batch(Color("eef0ec"),dashes)
	_box_batch(Color("eef0ec"),zebra)
	_box_batch(Color("b3b0a8"),curbs)
	# Blocks: [model, column 0..5 (east to west), row 0..4 (south to north)].
	var items := {}
	var plates := []
	var plan := [["shops",0,0],["tower_2",1,0],["tower_0",3,0],
		["police",0,1],["tower_3",1,1],["tower_0",2,1],["tower_1",5,1],
		["tower_1",0,2],["tower_4",1,2],["tower_2",2,2],["tower_3",5,2],
		["garage",2,3],["tower_0",3,3],
		["tower_3",0,4],["shops",1,4],["tower_1",2,4],["tower_2",3,4]]
	var billboards := []
	for entry in plan:
		var c := _dt_block(int(entry[1]),int(entry[2]))
		plates.append([c+Vector3(0,0.03,0),Vector3(50,0.06,50)])
		if entry[0] == "shops":
			_place(items,"shops_0",c+Vector3(0,0,14),0.0,DT_SHOP_SCALE)
			_place(items,"shops_1",c+Vector3(0,0,-14),PI,DT_SHOP_SCALE)
			billboards.append([c+Vector3(0,13.0,14),0.0])
		elif entry[0] == "police":
			_place(items,"police",c,0.0,1.5)
		elif entry[0] == "garage":
			_place(items,"garage",c,0.0,1.6)
		else:
			_place(items,entry[0],c,0.0,DT_TOWER_SCALE)
	# Shops along the west edge, facing the last avenue.
	var west_x := (DT_AVES[DT_AVES.size()-1] as float)-half-12.5
	for z in [-100.0,-180.0,-260.0,-340.0,-420.0]:
		_place(items,"shops_%d" % (int(-z) % 2),Vector3(west_x,0,z),PI/2.0,DT_SHOP_SCALE)
	# Landmarks.
	_place(items,"mall",DT_MALL,0.0,1.35)
	_place(items,"stadium",STADIUM_POS,0.0,STADIUM_SCALE,false)
	_build_stadium_walls()
	_place(items,"station",DT_STATION,0.0,1.4)
	_collider(self,DT_STATION+Vector3(0,3.1,-16.8*1.4),Vector3(54*1.4,6.2,4.5))
	for key in items:
		_model_batch("res://models/%s.glb" % key,items[key])
	_box_batch(Color("a19c90"),plates)
	_sign("SKYLINE DISTRICT",Vector3(-120,8.5,-140),Color("ffe9b8"),56)
	_sign("SKYLINE DISTRICT",Vector3(-120,8.5,-300),Color("ffe9b8"),56)
	_sign("SKYLINE DISTRICT",Vector3(-140,7.0,-24),Color("ffe9b8"),52)
	var b0 := _dt_block(0,2)
	var b1 := _dt_block(1,2)
	_sign("CITY HALL",b0+Vector3(0,58*DT_TOWER_SCALE+6.0,0),Color("ffe2a8"),90)
	_sign("HARBOR TOWER",b1+Vector3(0,98*DT_TOWER_SCALE+8.0,0),Color("bff4f0"),110)
	_sign("POLICE HQ",_dt_block(0,1)+Vector3(0,16,22),Color("cfe2ff"),60)
	_sign("GRAND MALL",DT_MALL+Vector3(0,23,10),Color("ffd6e0"),80)
	_sign("HARBOR STADIUM",STADIUM_POS+Vector3(0,18,44),Color("fff3c9"),80)
	_sign("UNION STATION",DT_STATION+Vector3(0,20,14),Color("e8f0ff"),72)
	_sign("CENTRAL PARK",DT_PARK+Vector3(0,7,72),Color("d8f5c8"),64)
	_sign("TIMES PLAZA",DT_PLAZA+Vector3(0,10,26),Color("ffe9b8"),64)
	_build_park(DT_PARK,136.0)
	_build_plaza(DT_PLAZA,billboards,50.0)
	# Street furniture on the pavements.
	var lamps := []
	var trees := []
	var benches := []
	var bins := []
	var hydrants := []
	var lamp_off := half+1.4
	var tree_off := half+3.6
	for x in DT_AVES:
		for r in _dt_ranges(true,x):
			var z := float(r[0])+14.0
			while z < float(r[1])-8.0:
				if not _dt_near_cross(true,z,half+4.0):
					lamps.append([Vector3(x+lamp_off,0,z),PI])
					lamps.append([Vector3(x-lamp_off,0,z+13.0),0.0])
					if not _dt_near_cross(true,z+6.5,half+4.0):
						trees.append([Vector3(x+tree_off,0,z+6.5),0.0,0.7])
						trees.append([Vector3(x-tree_off,0,z-6.5),1.0,0.68])
				z += 26.0
	for z in DT_STREETS:
		for r in _dt_ranges(false,z):
			var x := float(r[0])+14.0
			while x < float(r[1])-8.0:
				if not _dt_near_cross(false,x,half+4.0):
					lamps.append([Vector3(x,0,z+lamp_off),PI/2.0])
					lamps.append([Vector3(x+13.0,0,z-lamp_off),-PI/2.0])
					if not _dt_near_cross(false,x+6.5,half+4.0):
						trees.append([Vector3(x+6.5,0,z+tree_off),2.0,0.68])
						trees.append([Vector3(x-6.5,0,z-tree_off),3.0,0.7])
						benches.append([Vector3(x+2.0,0,z+tree_off+0.3),PI])
				x += 26.0
	for spot in light_spots:
		if (spot as Vector3).x < DT_EAST:
			hydrants.append([spot+Vector3(half+1.6,0,half+5.0),0.0])
			bins.append([spot+Vector3(-half-1.6,0,-half-5.0),0.0])
	_model_batch("res://models/lamp.glb",lamps)
	_model_batch("res://models/tree_round.glb",trees)
	_model_batch("res://models/bench.glb",benches)
	_model_batch("res://models/bin.glb",bins)
	_model_batch("res://models/hydrant.glb",hydrants)
	_model_batch("res://models/traffic_light.glb",poles)
	if light_ns_mat == null:
		light_ns_mat = _material(Color("4fd36a"))
		light_ew_mat = _material(Color("e04a3a"))
		for m in [light_ns_mat,light_ew_mat]:
			m.emission_enabled = true
			m.emission_energy_multiplier = 1.4
	var ns_inst := _box_batch(Color.WHITE,ns_caps)
	var ew_inst := _box_batch(Color.WHITE,ew_caps)
	if ns_inst != null:
		ns_inst.material_override = light_ns_mat
	if ew_inst != null:
		ew_inst.material_override = light_ew_mat
	# Billboards with original ads.
	var boards := []
	for i in billboards.size():
		var b: Array = billboards[i]
		boards.append([b[0],b[1],1.0])
		var ad := Label3D.new()
		ad.text = ADS[i % ADS.size()]
		ad.font_size = 64
		ad.pixel_size = 0.02
		ad.modulate = Color("23262b")
		ad.outline_size = 0
		ad.position = (b[0] as Vector3)+Basis(Vector3.UP,float(b[1]))*Vector3(0,7.3,0.32)
		ad.rotation.y = float(b[1])
		add_child(ad)
	_model_batch("res://models/billboard.glb",boards)
	# Discovery sites.
	for site in DOWNTOWN:
		downtown_nodes.append(_downtown_token(site["pos"],site["name"]))

func _dt_block(col: int, row: int) -> Vector3:
	# Centre of a city block: columns run west from the first avenue, rows run north from the boulevard.
	var x := float(DT_AVES[col])-DT_BLOCK/2.0
	var z := -98.0 if row == 0 else (-421.5 if row == 4 else float(DT_STREETS[row-1])-DT_BLOCK/2.0)
	return Vector3(x,0,z)

func _downtown_token(pos: Vector3, label: String) -> Node3D:
	var token := Node3D.new()
	token.position = pos+Vector3(0,1.7,0)
	add_child(token)
	var gem := MeshInstance3D.new()
	var crystal := PrismMesh.new()
	crystal.size = Vector3(0.9,1.3,0.9)
	gem.mesh = crystal
	var mat := _material(Color("ff6fb0"))
	mat.emission_enabled = true
	mat.emission = Color("a8285e")
	gem.material_override = mat
	token.add_child(gem)
	_sign(label.to_upper(),pos+Vector3(0,4.4,0),Color("ffd0e6"),36)
	_box(self,pos+Vector3(0,0.1,0),Vector3(2.4,0.18,2.4),Color("5a2640"))
	return token

func _build_park(c: Vector3, size: float) -> void:
	var k := size/86.0
	var h := size/2.0
	_box_batch(Color("74b062"),[[c+Vector3(0,0.035,0),Vector3(size,0.06,size)]])
	_box_batch(Color("e3cfa3"),[[c+Vector3(0,0.07,0),Vector3(size-2.0,0.04,5)],[c+Vector3(0,0.072,0),Vector3(5,0.04,size-2.0)]])
	_box_batch(Color("2f86a8"),[[c+Vector3(22,0.08,22)*k,Vector3(22,0.05,14)*k]])
	_prop("res://models/fountain.glb",c,Vector3(14,1.2,14),0.0,Color("b9bcbd"))
	var rng := RandomNumberGenerator.new()
	rng.seed = 2800
	var trees := []
	var pines := []
	var benches := []
	for gx in range(-int(h)+4,int(h)-3,8):
		for gz in range(-int(h)+4,int(h)-3,8):
			var p := Vector3(float(gx)+rng.randf_range(-2.0,2.0),0,float(gz)+rng.randf_range(-2.0,2.0))
			if absf(p.x) < 5.0 or absf(p.z) < 5.0 or p.length() < 12.0:
				continue
			if p.x > 9.0*k and p.x < 35.0*k and p.z > 13.0*k and p.z < 31.0*k:
				continue
			if rng.randf() < 0.65:
				(pines if rng.randf() < 0.3 else trees).append([c+p,rng.randf()*TAU,rng.randf_range(0.8,1.15)])
	for d in [-30.0*k,-18.0*k,18.0*k,30.0*k]:
		benches.append([c+Vector3(d,0,3.2),PI])
		benches.append([c+Vector3(3.2,0,d),-PI/2.0])
	_model_batch("res://models/tree_round.glb",trees)
	_model_batch("res://models/tree_pine.glb",pines)
	_model_batch("res://models/bench.glb",benches)
	_model_batch("res://models/kiosk.glb",[[c+Vector3(-8,0,6),0.4],[c+Vector3(7,0,-8),2.0]])

func _build_plaza(c: Vector3, billboards: Array, size := 36.0) -> void:
	var k := size/36.0
	_box_batch(Color("c9b48c"),[[c+Vector3(0,0.035,0),Vector3(size,0.06,size)]])
	var planters := []
	for a in 8:
		var ang := TAU*float(a)/8.0
		planters.append([c+Vector3(cos(ang)*9.0,0,sin(ang)*9.0)*k,0.0])
	_model_batch("res://models/planter.glb",planters)
	_model_batch("res://models/kiosk.glb",[[c+Vector3(-12,0,-12)*k,0.8],[c+Vector3(12,0,12)*k,3.9]])
	_model_batch("res://models/bench.glb",[[c+Vector3(-6,0,12)*k,0.0],[c+Vector3(6,0,-12)*k,PI]])
	billboards.append([c+Vector3(-14,0,-15)*k,0.6])
	billboards.append([c+Vector3(14,0,-15)*k,-0.6])
	billboards.append([c+Vector3(-15,0,14)*k,2.4])
	billboards.append([c+Vector3(15,0,14)*k,-2.4])

# ---------- old city and Bay details ----------
func _build_city_detail() -> void:
	var walk := Color("9c9a92")
	var strips := []
	for lane in [-32.0,0.0,32.0]:
		for s in [-1.0,1.0]:
			strips.append([Vector3(lane+s*5.75,0.02,0),Vector3(2.5,0.04,104)])
			strips.append([Vector3(0,0.021,lane+s*5.75),Vector3(104,0.04,2.5)])
	_box_batch(walk,strips)
	var zebra := []
	var poles := []
	var ns_caps := []
	var ew_caps := []
	for x in [-32.0,0.0,32.0]:
		for z in [-32.0,0.0,32.0]:
			light_spots.append(Vector3(x,0,z))
			for s in [-1.0,1.0]:
				for k in 5:
					zebra.append([Vector3(x-3.2+1.6*k,0.066,z+s*6.3),Vector3(0.7,0.02,2.4)])
					zebra.append([Vector3(x+s*6.3,0.068,z-3.2+1.6*k),Vector3(2.4,0.02,0.7)])
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x+5.9,0,z+5.9),PI,true,3.7)
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x-5.9,0,z-5.9),0.0,true,3.7)
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x-5.9,0,z+5.9),PI/2.0,false,3.7)
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x+5.9,0,z-5.9),-PI/2.0,false,3.7)
	_box_batch(Color("eef0ec"),zebra)
	_model_batch("res://models/traffic_light.glb",poles)
	var ns_inst := _box_batch(Color.WHITE,ns_caps)
	var ew_inst := _box_batch(Color.WHITE,ew_caps)
	if ns_inst != null:
		ns_inst.material_override = light_ns_mat
	if ew_inst != null:
		ew_inst.material_override = light_ew_mat
	# Shop rows in the two big lawns north of the main street, plus furniture and planters.
	var items := {}
	for sx in [-1.0,1.0]:
		_place(items,"shops_%d" % (0 if sx < 0 else 1),Vector3(sx*16.0,0,-8.6),0.0,0.55)
	for key in items:
		_model_batch("res://models/%s.glb" % key,items[key],{})
	var benches := []
	var bins := []
	var hydrants := []
	var planters := []
	for bx in [-17.0,17.0,-46.0,46.0]:
		for bz in [-46.0,-17.0,17.0]:
			if bz == -17.0 and absf(bx) < 20.0:
				continue
			planters.append([Vector3(bx-4.0,0,bz+7.2),0.0])
			planters.append([Vector3(bx+4.0,0,bz+7.2),0.0])
	for x in [-32.0,0.0,32.0]:
		for z in [-32.0,0.0,32.0]:
			hydrants.append([Vector3(x+5.3,0,z+8.5),0.0])
			bins.append([Vector3(x-5.3,0,z-8.5),0.0])
	for x in [-44.0,-22.0,22.0,44.0]:
		benches.append([Vector3(x,0,9.6),PI])
	_model_batch("res://models/bench.glb",benches)
	_model_batch("res://models/bin.glb",bins)
	_model_batch("res://models/hydrant.glb",hydrants)
	_model_batch("res://models/planter.glb",planters)
	# Rooftop billboards on the old city buildings.
	var boards := []
	var heights := [4.0,6.2,8.4,10.6]
	var count := 0
	var ad_i := 3
	for x in [-46.0,-17.0,17.0,46.0]:
		for z in [-46.0,-17.0,17.0]:
			if count % 3 == 1:
				var y := float(heights[count % 4])+0.35
				boards.append([Vector3(x,y,z),0.0,0.75])
				var ad := Label3D.new()
				ad.text = ADS[ad_i % ADS.size()]
				ad_i += 1
				ad.font_size = 64
				ad.pixel_size = 0.015
				ad.modulate = Color("23262b")
				ad.outline_size = 0
				ad.position = Vector3(x,y+7.3*0.75,z+0.25)
				add_child(ad)
			count += 1
	_model_batch("res://models/billboard.glb",boards)
	# Palms along the beach and Bay Road (the old cross-shaped palms are replaced).
	var palms := []
	for x in [-38.0,-26.0,-14.0,12.0,24.0,36.0]:
		palms.append([Vector3(x,0,51.5),x*0.37,0.9])
	for x in [-80.0,-98.0,-116.0,-134.0,-150.0,-166.0]:
		palms.append([Vector3(x,0,13.4),x*0.21,0.85])
	for x in [-84.0,-96.0,-118.0,-152.0,-162.0]:
		palms.append([Vector3(x,0,-13.4),x*0.17,0.85])
	_model_batch("res://models/palm.glb",palms)

# ---------- traffic ----------
func _build_traffic() -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = 1616
	for li in TRAFFIC_LOOPS.size():
		var loop: Dictionary = TRAFFIC_LOOPS[li]
		var pts: Array = loop["pts"]
		var lane := float(loop["lane"])
		var n := pts.size()
		var way: Array = []
		for i in n:
			var p: Vector2 = pts[i]
			var din: Vector2 = (p-(pts[(i-1+n) % n] as Vector2)).normalized()
			var dout: Vector2 = ((pts[(i+1) % n] as Vector2)-p).normalized()
			way.append(p+Vector2(-din.y,din.x)*lane+Vector2(-dout.y,dout.x)*lane)
		var cum: Array = [0.0]
		for i in n:
			cum.append(float(cum[i])+(way[(i+1) % n] as Vector2).distance_to(way[i]))
		var stops: Array = []
		for i in n:
			var a: Vector2 = way[i]
			var b: Vector2 = way[(i+1) % n]
			var d := (b-a).normalized()
			for spot in light_spots:
				var l := Vector2((spot as Vector3).x,(spot as Vector3).z)
				var along := (l-a).dot(d)
				var lat := absf((l-a).cross(d))
				if along > lane+0.5 and along <= a.distance_to(b)+0.5 and lat < lane+1.5:
					stops.append([float(cum[i])+along,0 if absf(d.y) > absf(d.x) else 1])
		traffic_paths.append({"way":way,"cum":cum,"total":cum[n],"stops":stops,"stopline":lane*2.0+1.6,"speed":float(loop["speed"])})
		for k in int(loop["cars"]):
			var node := AnimatableBody3D.new()
			node.sync_to_physics = false
			add_child(node)
			var shape := CollisionShape3D.new()
			var box := BoxShape3D.new()
			box.size = Vector3(1.8,1.3,3.6)
			shape.shape = box
			shape.position.y = 0.8
			node.add_child(shape)
			var model := _try_model("res://models/car_%d.glb" % (rng.randi() % 5))
			if model != null:
				model.position.y = 0.8
				node.add_child(model)
				_online_tint(model,TRAFFIC_COLORS[rng.randi() % TRAFFIC_COLORS.size()])
				_cull_person(model,150.0,true)
			else:
				_box(node,Vector3(0,0.8,0),Vector3(1.8,0.9,3.6),TRAFFIC_COLORS[rng.randi() % TRAFFIC_COLORS.size()])
			var path: Dictionary = traffic_paths[li]
			var s := float(path["total"])*float(k)/float(loop["cars"])+rng.randf_range(0.0,4.0)
			traffic.append({"node":node,"path":li,"s":s,"v":0.0,"pos":Vector2.ZERO,"dir":Vector2(0,-1)})
	for t in traffic:
		_traffic_place(t,1.0)

func _path_sample(path: Dictionary, s: float) -> Array:
	var way: Array = path["way"]
	var cum: Array = path["cum"]
	var n := way.size()
	s = fposmod(s,float(path["total"]))
	for i in n:
		if s <= float(cum[i+1]):
			var a: Vector2 = way[i]
			var b: Vector2 = way[(i+1) % n]
			var seg := float(cum[i+1])-float(cum[i])
			var t := (s-float(cum[i]))/maxf(seg,0.001)
			return [a.lerp(b,t),(b-a).normalized()]
	return [way[0],((way[1] as Vector2)-(way[0] as Vector2)).normalized()]

func _light_green(axis: int) -> bool:
	var t := fposmod(clock,LIGHT_CYCLE)
	return t < 9.0 if axis == 0 else (t >= 10.0 and t < 19.0)

func _traffic_place(t: Dictionary, weight: float) -> void:
	var sample := _path_sample(traffic_paths[int(t["path"])],float(t["s"]))
	t["pos"] = sample[0]
	t["dir"] = sample[1]
	var node: Node3D = t["node"]
	node.position = Vector3((sample[0] as Vector2).x,0,(sample[0] as Vector2).y)
	var dir: Vector2 = sample[1]
	node.rotation.y = lerp_angle(node.rotation.y,atan2(-dir.x,-dir.y),clampf(weight,0.0,1.0))

func _traffic_blocked_by(pos: Vector2, dir: Vector2, other: Vector2) -> float:
	# Distance to an obstacle in our lane ahead, or INF.
	var rel := other-pos
	var fwd := rel.dot(dir)
	if fwd <= 0.6 or fwd > 11.0:
		return INF
	if absf(rel.cross(dir)) > 2.3:
		return INF
	return fwd

const TRAFFIC_PED_PATIENCE := 4.0

func _traffic_tick(delta: float) -> void:
	var state := (1 if _light_green(0) else 0)+(2 if _light_green(1) else 0)
	if state != light_state and light_ns_mat != null:
		light_state = state
		light_ns_mat.albedo_color = Color("4fd36a") if _light_green(0) else Color("e04a3a")
		light_ns_mat.emission = light_ns_mat.albedo_color
		light_ew_mat.albedo_color = Color("4fd36a") if _light_green(1) else Color("e04a3a")
		light_ew_mat.emission = light_ew_mat.albedo_color
	if not traffic_on:
		return
	var others: Array = [Vector2(car.position.x,car.position.z)]
	if not driving:
		others.append(Vector2(player.position.x,player.position.z))
	if bus != null:
		others.append(Vector2(bus.position.x,bus.position.z))
	for u in chase_units:
		var b: Node3D = u["node"]
		others.append(Vector2(b.position.x,b.position.z))
	for i in traffic.size():
		var t: Dictionary = traffic[i]
		var path: Dictionary = traffic_paths[int(t["path"])]
		var pos: Vector2 = t["pos"]
		var dir: Vector2 = t["dir"]
		var target := float(path["speed"])
		for o in others:
			var d := _traffic_blocked_by(pos,dir,o)
			if d < INF:
				target = minf(target,maxf(0.0,(d-5.0)*1.6))
		# Wait for people crossing; if someone stays in the lane, edge past after a few seconds.
		if float(t.get("ped_skip",0.0)) > 0.0:
			t["ped_skip"] = float(t["ped_skip"])-delta
		else:
			var ped_target := INF
			for p in peds:
				var pn: Node3D = p["node"]
				var pp := Vector2(pn.position.x,pn.position.z)
				if pp.distance_squared_to(pos) < 150.0:
					var d := _traffic_blocked_by(pos,dir,pp)
					if d < INF:
						ped_target = minf(ped_target,maxf(0.0,(d-3.5)*1.6))
			if ped_target < 0.5 and float(t["v"]) < 0.5:
				t["ped_wait"] = float(t.get("ped_wait",0.0))+delta
				if float(t["ped_wait"]) > TRAFFIC_PED_PATIENCE:
					t["ped_wait"] = 0.0
					t["ped_skip"] = 3.0
			else:
				t["ped_wait"] = 0.0
			target = minf(target,ped_target)
		for j in traffic.size():
			if j == i:
				continue
			var o: Dictionary = traffic[j]
			var d := _traffic_blocked_by(pos,dir,o["pos"])
			if d == INF:
				continue
			# Mutual blocking (crossing paths): the lower index goes first.
			if _traffic_blocked_by(o["pos"],o["dir"],pos) < INF and i < j:
				continue
			target = minf(target,maxf(0.0,(d-5.5)*1.6))
		var total := float(path["total"])
		for stop in path["stops"]:
			if _light_green(int(stop[1])):
				continue
			var dist := fposmod(float(stop[0])-float(t["s"]),total)
			var to_line := dist-float(path["stopline"])
			if to_line > -0.4 and to_line < 16.0:
				target = minf(target,maxf(0.0,to_line*1.3))
		var v := float(t["v"])
		v = move_toward(v,target,delta*(5.0 if target > v else 14.0))
		t["v"] = v
		t["s"] = fposmod(float(t["s"])+v*delta,total)
		_traffic_place(t,delta*7.0)

func _smoke_downtown() -> void:
	assert(downtown_nodes.size() == DOWNTOWN.size(),"Skyline sites built")
	for site in DOWNTOWN:
		assert(not _blocked_at((site["pos"] as Vector3)+Vector3(0,1.0,0),0.6),"Skyline site blocked: "+str(site["name"]))
	for pt in [Vector3(-110.5,1.0,-140),Vector3(-110.5,1.0,-300),Vector3(-140,1.0,-15.5),Vector3(-140,1.0,-61.5),Vector3(-140,1.0,-38)]:
		assert(not _blocked_at(pt,0.8),"Skyline entrance blocked at %s" % str(pt))
	# v0.27: the district walls are gone; buildings are still solid.
	for pt in [Vector3(-260,1.0,-260),Vector3(-180,1.0,-180),DT_STATION+Vector3(0,1,0)]:
		assert(_blocked_at(pt,0.3),"Building missing at %s" % str(pt))
	# Every road lane in the district is drivable (no building or prop collider on it). Traffic is moved aside.
	blocked_skip_traffic = true
	for x in DT_AVES:
		for r in _dt_ranges(true,x):
			var z := float(r[0])+3.0
			while z < float(r[1])-3.0:
				for lane in [-6.25,-2.75,2.75,6.25]:
					assert(not _blocked_at(Vector3(x+lane,1.0,z),0.7),"Avenue blocked at %s by %s" % [str(Vector3(x+lane,0,z)),_blocker(Vector3(x+lane,1.0,z),0.7)])
				z += 6.0
	for z in DT_STREETS:
		for r in _dt_ranges(false,z):
			var x := float(r[0])+3.0
			while x < float(r[1])-3.0:
				for lane in [-6.25,-2.75,2.75,6.25]:
					assert(not _blocked_at(Vector3(x,1.0,z+lane),0.7),"Street blocked at %s" % str(Vector3(x,0,z+lane)))
				x += 6.0
	# v0.29: the North Highway district's lanes too (sky-train pillars stand in the median, not in a lane).
	for r in _nm_roads():
		var a: Vector2 = r[0]
		var b: Vector2 = r[1]
		var w: float = r[2]
		var l := a.distance_to(b)
		var d := (b-a)/l
		var n := Vector2(-d.y,d.x)
		var t := 3.0
		while t < l-3.0:
			for lane in ([-6.25,-2.75,2.75,6.25] if w >= 20.0 else [-2.5,2.5]):
				var q: Vector2 = a+d*t+n*lane
				var pos := Vector3(q.x,1.0,q.y)
				assert(not _blocked_at(pos,0.7),"North road blocked at %s by %s" % [str(pos),_blocker(pos,0.7)])
			t += 6.0
	for pt in [Vector3(-90,1.0,-340),Vector3(31,1.0,-380),Vector3(-52,1.0,-75)]:
		assert(_blocked_at(pt,0.3),"North building missing at %s" % str(pt))
	assert(_on_road(Vector3(9,0,-200)) and _on_road(Vector3(-100,0,-145)) and not _on_road(Vector3(13,0,-200)),"North Highway is 4 lanes")
	blocked_skip_traffic = false
	# Discovery pays once.
	var saved_mask := downtown_mask
	var saved_cash := cash
	var was_driving := driving
	var was_pos := player.position
	downtown_mask = 0
	driving = false
	player.position = (DOWNTOWN[0]["pos"] as Vector3)+Vector3(0,0.7,0)
	_check_downtown()
	assert((downtown_mask & 1) != 0 and cash == saved_cash+int(DOWNTOWN[0]["pay"]),"Skyline site pays once")
	_check_downtown()
	assert(cash == saved_cash+int(DOWNTOWN[0]["pay"]),"Skyline site paid twice")
	assert(_area_open(5) == _bay_open(),"Skyline trial area follows the Bay")
	downtown_mask = saved_mask
	cash = saved_cash
	player.position = was_pos
	driving = was_driving
	# Traffic: built, moves, stops at a red light and behind an obstacle.
	assert(traffic.size() == 41 and light_spots.size() >= 51,"Traffic %d / signals %d" % [traffic.size(),light_spots.size()])
	var was_car := car.position
	var was_clock := clock
	car.position = Vector3(400,0.8,400)
	traffic_on = true
	var starts: Array = []
	for t in traffic:
		starts.append(float(t["s"]))
	for i in 240:
		clock += 1.0/30.0
		_traffic_tick(1.0/30.0)
	var moved := 0
	for k in traffic.size():
		var total := float(traffic_paths[int(traffic[k]["path"])]["total"])
		if fposmod(float(traffic[k]["s"])-float(starts[k]),total) > 8.0:
			moved += 1
	assert(moved >= 16,"Traffic is not moving (%d moved)" % moved)
	var t0: Dictionary = traffic[0]
	var path0: Dictionary = traffic_paths[int(t0["path"])]
	var stop: Array = path0["stops"][0]
	clock = 12.0 if int(stop[1]) == 0 else 3.0
	assert(not _light_green(int(stop[1])),"Test light should be red")
	t0["s"] = fposmod(float(stop[0])-float(path0["stopline"])-14.0,float(path0["total"]))
	t0["v"] = 9.0
	for k in range(1,traffic.size()):
		if int(traffic[k]["path"]) == int(t0["path"]):
			traffic[k]["s"] = fposmod(float(stop[0])+60.0+float(k)*12.0,float(path0["total"]))
	for i in 150:
		_traffic_tick(1.0/30.0)
	var left := fposmod(float(stop[0])-float(t0["s"]),float(path0["total"]))-float(path0["stopline"])
	assert(left > -0.6 and left < 3.0 and float(t0["v"]) < 0.5,"Car did not stop at the red light (%.2f m, %.2f m/s)" % [left,float(t0["v"])])
	clock = 3.0 if int(stop[1]) == 0 else 12.0
	for i in 60:
		_traffic_tick(1.0/30.0)
	assert(float(t0["v"]) > 2.0,"Car did not go on green")
	var pos: Vector2 = t0["pos"]
	var dir: Vector2 = t0["dir"]
	car.position = Vector3(pos.x+dir.x*7.0,0.8,pos.y+dir.y*7.0)
	for i in 90:
		_traffic_tick(1.0/30.0)
	var gap := Vector2(car.position.x,car.position.z).distance_to(t0["pos"])
	assert(gap > 3.5 and float(t0["v"]) < 0.5,"Traffic hit the player car (gap %.2f)" % gap)
	traffic_on = false
	car.position = was_car
	clock = was_clock

func _skyline_shot(name: String, at: Vector3, from: Vector3) -> void:
	paused = true
	camera.position = from
	camera.look_at(at)
	await _save_shot(name)
	print("SHOT %s draw_calls=%d objects=%d primitives=%d" % [name,Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME),Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME),Performance.get_monitor(Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME)])
	paused = false

func _skyline_shots() -> void:
	# Developer-only: renders the Skyline District and the busier old city. Never saves.
	driving = true
	player.hide()
	car.position = Vector3(-134,0.8,-160)
	car.rotation = Vector3.ZERO
	for i in 200:
		await get_tree().physics_frame
	await _skyline_shot("skyline-aerial",Vector3(-400,0,-260),Vector3(-110,170,-20))
	await _skyline_shot("skyline-street",Vector3(-260,10,-300),Vector3(-140,6,-300))
	await _skyline_shot("skyline-park",Vector3(-460,0,-220),Vector3(-390,60,-150))
	await _skyline_shot("skyline-stadium",STADIUM_POS+Vector3(0,5,0),Vector3(-450,75,-290))
	await _skyline_shot("city-detail",Vector3(0,0,0),Vector3(30,40,45))
	await _skyline_shot("city-street",Vector3(10,1,-10),Vector3(28,10,10))
	await _skyline_shot("bay-palms",Vector3(-120,1,0),Vector3(-95,14,22))
	car.position = Vector3(-214,0.8,-170)
	for i in 30:
		await get_tree().physics_frame
	_follow_camera(1.0)
	paused = true
	await _save_shot("skyline-game-camera")
	print("SHOT game-camera draw_calls=%d objects=%d primitives=%d" % [Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME),Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME),Performance.get_monitor(Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME)])
	car.position = Vector3(1.7,0.8,4)
	for i in 30:
		await get_tree().physics_frame
	_follow_camera(1.0)
	await _save_shot("city-game-camera")
	print("SHOT city-game-camera draw_calls=%d objects=%d primitives=%d" % [Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME),Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME),Performance.get_monitor(Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME)])
	paused = false
	_toggle_menu()
	_open_trials()
	await _save_shot("menu-trials")
	_open_journal()
	await _save_shot("menu-journal")
	_journal_flip()
	await _save_shot("menu-missions")
	get_tree().quit()

# ---------- v0.17.0: minimap, full map and camera views (Far / Close / In-car) ----------
const MAP_CENTER := Vector2(-25.0,-185.0)
const MAP_SIZE := 1360.0
const MAP_PATH := "res://map/world_map.png"
const MINI_SIZE := 190.0
const MINI_SPAN := 150.0
const VIEW_NAMES := ["Far","Close","In-car"]
const MAP_LABELS := [["OLD CITY",Vector2(0,0)],["RIDGE",Vector2(105,12)],["BAY ROAD",Vector2(-126,22)],["NORTH HIGHWAY",Vector2(0,-130)],["MAPLE SUBURBS",Vector2(0,-228)],["AIRFIELD",Vector2(62,-380)],["MIDTOWN",Vector2(-60,-410)],["SUMMIT PASS",Vector2(170,-290)],["SKYLINE DISTRICT",Vector2(-400,-262)],["MARINA HEIGHTS",Vector2(0,175)],["HARBOR DOME",Vector2(210,32)],["CIVIC CENTER",Vector2(-150,60)],["HARBOR RACEWAY",Vector2(420,-230)],["SUNSET BEACH",Vector2(440,200)],["WESTSIDE",Vector2(-355,150)]]
const MINIMAP_SHADER := """
shader_type canvas_item;
uniform vec2 center = vec2(0.5);
uniform float span = 0.2;
uniform float angle = 0.0;
uniform vec4 sea : source_color = vec4(0.51,0.75,0.78,1.0);
void fragment() {
	vec2 p = UV - vec2(0.5);
	float r = length(p);
	if (r > 0.5) { discard; }
	float c = cos(angle);
	float s = sin(angle);
	vec2 q = vec2(c*p.x - s*p.y, s*p.x + c*p.y) * span + center;
	vec4 col = sea;
	if (q.x >= 0.0 && q.y >= 0.0 && q.x <= 1.0 && q.y <= 1.0) { col = texture(TEXTURE, q); }
	float ring = smoothstep(0.455, 0.475, r);
	COLOR = mix(col, vec4(0.07,0.15,0.2,1.0), ring);
}
"""
var map_tex: Texture2D
var minimap: Control
var minimap_mat: ShaderMaterial
var minimap_overlay: Control
var minimap_button: Button
var map_panel: PanelContainer
var map_overlay: Control
var map_open := false
var view_mode := 0
var view_button: Button
var cockpit: Node3D
var cockpit_wheel: Node3D
var world_env_res: Environment
# v0.25.1: the browser runs single-threaded WebGL at full screen density, so it gets a lighter setup.
var sun_light: DirectionalLight3D
var web_lite := false
var fps_label: Label
const WEB_3D_PIXELS := 1100000.0

func _web_perf_setup() -> void:
	if "--bench" in OS.get_cmdline_user_args():
		# Desktop check: average frame rate over 8 seconds of normal play, then quit.
		get_tree().create_timer(4.0).timeout.connect(func():
			var f0 := Engine.get_process_frames()
			var t0 := Time.get_ticks_msec()
			get_tree().create_timer(8.0).timeout.connect(func():
				print("HC_BENCH fps=%.1f lite=%s scale=%.2f" % [float(Engine.get_process_frames()-f0)*1000.0/float(Time.get_ticks_msec()-t0),str(web_lite),get_viewport().scaling_3d_scale])
				get_tree().quit()))
	web_lite = OS.has_feature("web") or "--web-lite" in OS.get_cmdline_user_args()
	if not web_lite:
		return
	if sun_light != null:
		# One shadow split and a shorter shadow range: much cheaper, still has shadows near you.
		sun_light.directional_shadow_mode = DirectionalLight3D.SHADOW_ORTHOGONAL
		sun_light.directional_shadow_max_distance = 55.0
	RenderingServer.directional_shadow_atlas_set_size(2048,true)
	get_viewport().size_changed.connect(_web_scale)
	_web_scale()
	var show_fps := "--web-lite" in OS.get_cmdline_user_args()
	if OS.has_feature("web"):
		var search = JavaScriptBridge.eval("window.location.search",true)
		show_fps = typeof(search) == TYPE_STRING and String(search).contains("fps=1")
	if show_fps:
		fps_label = Label.new()
		fps_label.add_theme_font_size_override("font_size",18)
		fps_label.add_theme_color_override("font_color",Color("9cff9c"))
		fps_label.add_theme_color_override("font_outline_color",Color.BLACK)
		fps_label.add_theme_constant_override("outline_size",6)
		fps_label.position = Vector2(8,4)
		fps_label.z_index = 100
		var layer := CanvasLayer.new()
		layer.layer = 100
		add_child(layer)
		layer.add_child(fps_label)

func _web_scale() -> void:
	# Draw the 3D world at about 1.1 million pixels (menus and text stay sharp).
	var vp := get_viewport()
	var px := float(vp.get_visible_rect().size.x*vp.get_visible_rect().size.y)
	var real := Vector2(get_window().size)
	if real.x*real.y > 0.0:
		px = real.x*real.y
	vp.scaling_3d_mode = Viewport.SCALING_3D_MODE_BILINEAR
	vp.scaling_3d_scale = clampf(sqrt(WEB_3D_PIXELS/maxf(px,1.0)),0.5,1.0)

func _web_fps_tick() -> void:
	if fps_label != null:
		fps_label.text = "%d fps  ·  3D %d%%" % [Engine.get_frames_per_second(),int(get_viewport().scaling_3d_scale*100.0)]
var in_car_view := false
var eye_view := false
var look_pitch := 0.0
# v0.22: on foot the camera has its own views; Follow (behind the shoulder) is the default.
const WALK_VIEWS := ["Follow","Far","Close","Eye"]
const FOLLOW_DIST := 4.6
var walk_view := 0
var follow_view := false
var cam_yaw := 0.0
var cam_pitch := 0.3
var cam_hold := 0.0
var look_id := -1
var mouse_look := false

func _world_to_uv(w: Vector3) -> Vector2:
	return Vector2((w.x-MAP_CENTER.x)/MAP_SIZE+0.5,(w.z-MAP_CENTER.y)/MAP_SIZE+0.5)

func _map_angle() -> float:
	var f := -camera.global_basis.z
	var f2 := Vector2(f.x,f.z)
	if f2.length() < 0.01:
		f2 = Vector2(-camera.global_basis.y.x,-camera.global_basis.y.z)
	f2 = f2.normalized()
	return atan2(f2.x,-f2.y)

func _build_minimap(root: Control) -> void:
	if ResourceLoader.exists(MAP_PATH):
		map_tex = load(MAP_PATH)
	if map_tex == null:
		return
	minimap = Control.new()
	minimap.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(minimap)
	minimap.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	minimap.position = Vector2(root.size.x-218,154)
	minimap.size = Vector2(MINI_SIZE,MINI_SIZE)
	var rect := TextureRect.new()
	rect.texture = map_tex
	rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	rect.stretch_mode = TextureRect.STRETCH_SCALE
	rect.size = Vector2(MINI_SIZE,MINI_SIZE)
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var shader := Shader.new()
	shader.code = MINIMAP_SHADER
	minimap_mat = ShaderMaterial.new()
	minimap_mat.shader = shader
	minimap_mat.set_shader_parameter("span",MINI_SPAN/MAP_SIZE)
	rect.material = minimap_mat
	minimap.add_child(rect)
	minimap_overlay = Control.new()
	minimap_overlay.size = Vector2(MINI_SIZE,MINI_SIZE)
	minimap_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	minimap_overlay.draw.connect(_draw_minimap)
	minimap.add_child(minimap_overlay)
	minimap_button = _button("",_minimap_tap)
	minimap_button.flat = true
	for state in ["normal","hover","pressed","focus"]:
		minimap_button.add_theme_stylebox_override(state,StyleBoxEmpty.new())
	minimap_button.custom_minimum_size = Vector2(MINI_SIZE,MINI_SIZE)
	minimap_button.size = Vector2(MINI_SIZE,MINI_SIZE)
	minimap.add_child(minimap_button)
	# The radio caption moves left so it does not cover the minimap.
	radio_caption.position = Vector2(root.size.x-604,150)
	# Full map panel.
	map_panel = PanelContainer.new()
	root.add_child(map_panel)
	map_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),20))
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation",18)
	map_panel.add_child(row)
	var box := Control.new()
	box.custom_minimum_size = Vector2(560,560)
	row.add_child(box)
	var big := TextureRect.new()
	big.texture = map_tex
	big.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	big.stretch_mode = TextureRect.STRETCH_SCALE
	big.size = Vector2(560,560)
	big.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(big)
	map_overlay = Control.new()
	map_overlay.size = Vector2(560,560)
	map_overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	map_overlay.draw.connect(_draw_full_map)
	box.add_child(map_overlay)
	var side := VBoxContainer.new()
	side.add_theme_constant_override("separation",12)
	side.custom_minimum_size = Vector2(230,0)
	row.add_child(side)
	side.add_child(_label("HARBOR CITY MAP",24,Color("f0bd62")))
	var legend := _label("▲  You\n●  Golden ring\n●  Undiscovered sites\n◆  Checkpoint (green = saved)\n\nNorth is up.",17,Color("cbd8de"))
	side.add_child(legend)
	var spacer := Control.new()
	spacer.size_flags_vertical = Control.SIZE_EXPAND_FILL
	side.add_child(spacer)
	side.add_child(_button("Close map",_close_map))
	map_panel.hide()

func _open_map() -> void:
	if paused or map_tex == null:
		return
	paused = true
	map_open = true
	map_panel.show()
	map_panel.reset_size()
	var view := get_viewport().get_visible_rect().size
	map_panel.position = Vector2((view.x-map_panel.size.x)/2.0,maxf(8.0,(view.y-map_panel.size.y)/2.0))
	map_overlay.queue_redraw()

func _close_map() -> void:
	map_open = false
	map_panel.hide()
	paused = false
	stick = Vector2.ZERO
	touch_id = -1

func _mini_point(w: Vector3, me: Vector2, cs: float, sn: float) -> Vector2:
	var d := (Vector2(w.x,w.z)-me)/MINI_SPAN
	return Vector2(cs*d.x+sn*d.y,-sn*d.x+cs*d.y)

func _site_markers() -> Array:
	# [world position, colour] for every undiscovered site in an open area.
	var out := []
	if exploring:
		for i in FINDS.size():
			if not (found_mask & (1 << i)):
				out.append([FINDS[i]["pos"],Color("5ce6ed")])
	for i in CIVIC.size():
		if not (civic_mask & (1 << i)):
			out.append([CIVIC[i]["pos"],Color("8fe36b")])
	if _ridge_open():
		for i in RIDGE.size():
			if not (ridge_mask & (1 << i)):
				out.append([RIDGE[i]["pos"],Color("8be37a")])
	if _bay_open():
		for i in BAY.size():
			if not (bay_mask & (1 << i)):
				out.append([BAY[i]["pos"],Color("c78cff")])
	if _north_open():
		for i in NORTH.size():
			if not (north_mask & (1 << i)):
				out.append([NORTH[i]["pos"],Color("ffb35c")])
	if _downtown_open():
		for i in DOWNTOWN.size():
			if not (downtown_mask & (1 << i)):
				out.append([DOWNTOWN[i]["pos"],Color("ff6fb0")])
	if _marina_open():
		for i in MARINA.size():
			if not (marina_mask & (1 << i)):
				out.append([MARINA[i]["pos"],Color("7fc8ff")])
	return out

func _draw_arrow(ctl: Control, at: Vector2, dir: Vector2, size: float) -> void:
	var perp := Vector2(-dir.y,dir.x)
	var pts := PackedVector2Array([at+dir*size,at-dir*size*0.65+perp*size*0.7,at-dir*size*0.3,at-dir*size*0.65-perp*size*0.7])
	ctl.draw_colored_polygon(pts,Color("fff5dc"))
	pts.append(pts[0])
	ctl.draw_polyline(pts,Color("132b3a"),2.0,true)

func _draw_minimap() -> void:
	var ctl := minimap_overlay
	var c := Vector2(MINI_SIZE,MINI_SIZE)/2.0
	var ang := _map_angle()
	var cs := cos(ang)
	var sn := sin(ang)
	var body: Node3D = car if driving else player
	var me := Vector2(body.position.x,body.position.z)
	var limit := 0.43
	for m in _site_markers():
		var p := _mini_point(m[0],me,cs,sn)
		if p.length() < limit:
			ctl.draw_circle(c+p*MINI_SIZE,4.5,Color("132b3a"))
			ctl.draw_circle(c+p*MINI_SIZE,3.2,m[1])
	if quick_on:
		# v0.24.1: every quick quest nearby shows as a small orange dot.
		for i in QUICK.size():
			if i == quick_idx or _quick_is_done(i):
				continue
			var qp := _mini_point(QUICK[i]["pos"],me,cs,sn)
			if qp.length() < limit:
				ctl.draw_circle(c+qp*MINI_SIZE,5.0,Color("132b3a"))
				ctl.draw_circle(c+qp*MINI_SIZE,3.6,Color("ff9a3a"))
	for u in chase_units:
		var p := _mini_point((u["node"] as Node3D).position,me,cs,sn)
		if p.length() < limit:
			ctl.draw_circle(c+p*MINI_SIZE,4.0,Color("e04a3a"))
	for i in CHECKPOINTS.size():
		var p := _mini_point(CHECKPOINTS[i]["pos"],me,cs,sn)
		if p.length() < limit:
			_draw_checkpoint_icon(ctl,c+p*MINI_SIZE,5.0,i == checkpoint_id)
	if marker.visible:
		var p := _mini_point(_destination(),me,cs,sn)
		if p.length() > limit:
			p = p.normalized()*limit
		ctl.draw_circle(c+p*MINI_SIZE,7.0,Color("132b3a"))
		ctl.draw_circle(c+p*MINI_SIZE,5.5,Color("f4d06c"))
	var h := -body.global_basis.z
	var hd := _mini_point(body.position+Vector3(h.x,0,h.z)*MINI_SPAN,me,cs,sn)
	_draw_arrow(ctl,c,hd.normalized() if hd.length() > 0.001 else Vector2(0,-1),10.0)
	var n := _mini_point(body.position+Vector3(0,0,-1)*MINI_SPAN,me,cs,sn).normalized()
	var font := ThemeDB.fallback_font
	ctl.draw_circle(c+n*MINI_SIZE*0.47,9.0,Color("132b3a"))
	ctl.draw_string(font,c+n*MINI_SIZE*0.47+Vector2(-5,5),"N",HORIZONTAL_ALIGNMENT_LEFT,-1,14,Color("f0bd62"))

func _draw_full_map() -> void:
	var ctl := map_overlay
	var size := 560.0
	var font := ThemeDB.fallback_font
	for l in MAP_LABELS:
		var p: Vector2 = _world_to_uv(Vector3((l[1] as Vector2).x,0,(l[1] as Vector2).y))*size
		var w := font.get_string_size(l[0],HORIZONTAL_ALIGNMENT_LEFT,-1,15).x
		ctl.draw_string_outline(font,p-Vector2(w/2.0,0),l[0],HORIZONTAL_ALIGNMENT_LEFT,-1,15,5,Color("132b3a"))
		ctl.draw_string(font,p-Vector2(w/2.0,0),l[0],HORIZONTAL_ALIGNMENT_LEFT,-1,15,Color("fff5dc"))
	for i in CHECKPOINTS.size():
		_draw_checkpoint_icon(ctl,_world_to_uv(CHECKPOINTS[i]["pos"])*size,6.0,i == checkpoint_id)
	for m in _site_markers():
		var p: Vector2 = _world_to_uv(m[0])*size
		ctl.draw_circle(p,5.0,Color("132b3a"))
		ctl.draw_circle(p,3.6,m[1])
	if marker.visible:
		var p: Vector2 = _world_to_uv(_destination())*size
		ctl.draw_circle(p,8.0,Color("132b3a"))
		ctl.draw_circle(p,6.0,Color("f4d06c"))
	var body: Node3D = car if driving else player
	var h := -body.global_basis.z
	_draw_arrow(ctl,_world_to_uv(body.position)*size,Vector2(h.x,h.z).normalized() if Vector2(h.x,h.z).length() > 0.01 else Vector2(0,-1),11.0)

func _minimap_tick() -> void:
	if minimap == null:
		return
	var body: Node3D = car if driving else player
	minimap_mat.set_shader_parameter("center",_world_to_uv(body.position))
	minimap_mat.set_shader_parameter("angle",_map_angle())
	minimap_overlay.queue_redraw()

# ---------- camera views ----------
func _build_view_controls(root: Control) -> void:
	view_button = _button("View: Far",_cycle_view)
	view_button.custom_minimum_size = Vector2(170,48)
	view_button.add_theme_font_size_override("font_size",20)
	root.add_child(view_button)
	view_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	view_button.position = Vector2(root.size.x-194,356)
	# Simple cockpit, only shown in the in-car view (the car model is hidden there).
	cockpit = Node3D.new()
	car.add_child(cockpit)
	var bonnet := MeshInstance3D.new()
	var bonnet_mesh := BoxMesh.new()
	bonnet_mesh.size = Vector3(1.9,0.3,1.25)
	bonnet.mesh = bonnet_mesh
	bonnet.position = Vector3(0,0.1,-1.25)
	bonnet.material_override = car_body_mat
	cockpit.add_child(bonnet)
	var dark := Color("23292f")
	_box(cockpit,Vector3(0,0.36,-0.55),Vector3(1.9,0.24,0.42),dark)
	_box(cockpit,Vector3(0,0.49,-0.67),Vector3(1.86,0.03,0.2),Color("3b444c"))
	for sx in [-0.92,0.92]:
		var pillar := _box(cockpit,Vector3(sx*1.12,0.9,-0.56),Vector3(0.05,0.85,0.05),dark)
		pillar.rotation_degrees.x = -30.0
	_box(cockpit,Vector3(0,1.38,-0.62),Vector3(1.9,0.06,0.1),dark)
	cockpit_wheel = Node3D.new()
	cockpit_wheel.position = Vector3(-0.38,0.53,-0.36)
	cockpit_wheel.rotation_degrees.x = 62.0
	cockpit.add_child(cockpit_wheel)
	var ring := MeshInstance3D.new()
	var torus := TorusMesh.new()
	torus.inner_radius = 0.15
	torus.outer_radius = 0.185
	torus.rings = 20
	torus.ring_segments = 8
	ring.mesh = torus
	ring.material_override = _material(Color("15191d"))
	cockpit_wheel.add_child(ring)
	_box(cockpit_wheel,Vector3(0,0,0),Vector3(0.32,0.03,0.04),Color("15191d"))
	_box(cockpit_wheel,Vector3(0,0,0.06),Vector3(0.04,0.03,0.14),Color("15191d"))
	_cull_person(cockpit,1000.0)
	cockpit.hide()

func _cycle_view() -> void:
	# Driving and walking remember their own view: the button changes the one you are using now.
	if driving:
		view_mode = (view_mode+1) % VIEW_NAMES.size()
	else:
		walk_view = (walk_view+1) % WALK_VIEWS.size()
	look_pitch = 0.0
	_apply_view()
	_follow_camera(1.0)

func _apply_view() -> void:
	in_car_view = view_mode == 2 and driving
	eye_view = walk_view == 3 and not driving
	var was_follow := follow_view
	follow_view = walk_view == 0 and not driving
	if follow_view and not was_follow:
		# Start behind wherever the camera already is, so the stick keeps pointing the same way.
		var back := camera.global_position-player.global_position
		cam_yaw = atan2(back.x,back.z) if Vector2(back.x,back.z).length() > 0.5 else player.rotation.y
		cam_pitch = 0.3
		cam_hold = 0.0
	var close_up := in_car_view or eye_view
	if view_button != null:
		view_button.text = "View: %s" % (VIEW_NAMES[view_mode] if driving else WALK_VIEWS[walk_view])
	camera.fov = 72.0 if close_up else (64.0 if follow_view else 55.0)
	camera.far = 150.0 if close_up else (200.0 if follow_view else 340.0)
	camera.near = 0.05
	if not player_person.is_empty():
		(player_person["root"] as Node3D).visible = not eye_view
	if hat_holder != null:
		hat_holder.visible = not eye_view
	if my_ring != null:
		my_ring.visible = not eye_view
	if world_env_res != null:
		# Haze always on, ending at the far clip so the city fades into the sky instead of popping.
		world_env_res.fog_enabled = true
		world_env_res.fog_mode = Environment.FOG_MODE_DEPTH
		world_env_res.fog_light_color = haze_now
		world_env_res.fog_depth_begin = 60.0 if close_up else (75.0 if follow_view else 120.0)
		world_env_res.fog_depth_end = camera.far-4.0
		world_env_res.fog_density = 1.0
	if cockpit != null:
		cockpit.visible = in_car_view
	if car_model != null:
		car_model.visible = not in_car_view
	elif car_boxes != null:
		car_boxes.visible = not in_car_view

func _hide_labels(node: Node) -> void:
	for child in node.get_children():
		if child is Label3D:
			(child as Label3D).hide()
		_hide_labels(child)

func _bake_map() -> void:
	# Developer-only: renders the whole world from straight above into res://map/world_map.png.
	# Run with a square window:  Godot --path game --resolution 1024x1024 -- --bake-map
	paused = true
	day_hour_override = 13.0
	_daynight_apply(true)
	if ap_plane != null:
		ap_plane.hide()
	for v in ap_vehicles:
		(v["node"] as Node3D).hide()
	for cars in sky_trains:
		for c: Node3D in cars:
			c.hide()
	hud.hide()
	_hide_labels(self)
	for n in [player,car,marker,bus]:
		if n != null:
			(n as Node3D).hide()
	for p in peds:
		(p["node"] as Node3D).hide()
	for t in traffic:
		(t["node"] as Node3D).hide()
	for arr in [find_nodes,ridge_nodes,bay_nodes,north_nodes,marina_nodes,downtown_nodes]:
		for n in arr:
			(n as Node3D).hide()
	for g in [gate_body,bay_gate_body,north_gate_body,marina_gate_body]:
		if g != null:
			g.hide()
	camera.projection = Camera3D.PROJECTION_ORTHOGONAL
	camera.size = MAP_SIZE
	camera.near = 1.0
	camera.far = 600.0
	if world_env_res != null:
		world_env_res.fog_enabled = false
	camera.global_transform = Transform3D(Basis.from_euler(Vector3(-PI/2.0,0,0)),Vector3(MAP_CENTER.x,300,MAP_CENTER.y))
	for i in 8:
		await get_tree().process_frame
	await RenderingServer.frame_post_draw
	var img := get_viewport().get_texture().get_image()
	var side := mini(img.get_width(),img.get_height())
	img = img.get_region(Rect2i((img.get_width()-side)/2,(img.get_height()-side)/2,side,side))
	if side != 1024:
		img.resize(1024,1024,Image.INTERPOLATE_LANCZOS)
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("res://map"))
	img.save_png(ProjectSettings.globalize_path(MAP_PATH))
	print("MAP_BAKED %dx%d" % [img.get_width(),img.get_height()])
	get_tree().quit()

func _shot_stats(name: String) -> void:
	print("SHOT %s draw_calls=%d objects=%d primitives=%d" % [name,Performance.get_monitor(Performance.RENDER_TOTAL_DRAW_CALLS_IN_FRAME),Performance.get_monitor(Performance.RENDER_TOTAL_OBJECTS_IN_FRAME),Performance.get_monitor(Performance.RENDER_TOTAL_PRIMITIVES_IN_FRAME)])

func _view_shots() -> void:
	# Developer-only: minimap, full map and the three camera views. Never saves.
	driving = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	car.position = Vector3(20,0.8,2.3)
	car.rotation = Vector3(0,PI/2.0,0)
	for i in 120:
		await get_tree().physics_frame
	await _save_shot("view-far")
	_shot_stats("view-far")
	_cycle_view()
	for i in 30:
		await get_tree().physics_frame
	await _save_shot("view-close")
	_shot_stats("view-close")
	_cycle_view()
	for i in 30:
		await get_tree().physics_frame
	await _save_shot("view-incar-city")
	_shot_stats("view-incar-city")
	car.position = Vector3(-134,0.8,-112)
	car.rotation = Vector3.ZERO
	for i in 40:
		await get_tree().physics_frame
	await _save_shot("view-incar-skyline")
	_shot_stats("view-incar-skyline")
	car.position = Vector3(-214,0.8,-260)
	car.rotation = Vector3(0,PI,0)
	for i in 40:
		await get_tree().physics_frame
	await _save_shot("view-incar-skyline2")
	_shot_stats("view-incar-skyline2")
	_cycle_view()
	for i in 30:
		await get_tree().physics_frame
	_open_map()
	await _save_shot("view-full-map")
	_close_map()
	get_tree().quit()

func _smoke_views() -> void:
	assert(map_tex != null and minimap != null and map_panel != null and view_button != null,"Minimap, map and View button built")
	assert(_world_to_uv(Vector3(MAP_CENTER.x,0,MAP_CENTER.y)).distance_to(Vector2(0.5,0.5)) < 0.001,"Map centre maps to the middle")
	assert(_world_to_uv(Vector3(DT_WEST,0,DT_SOUTH)).x > 0.0 and _world_to_uv(Vector3(190,0,242)).y < 1.0,"Whole world fits the map")
	_open_map()
	assert(paused and map_open and map_panel.visible,"Tapping the minimap opens the map")
	_close_map()
	assert(not paused and not map_open and not map_panel.visible,"Close map resumes")
	var was := [driving,car.position,car.rotation,view_mode,car_speed,player.position]
	var col: CollisionShape3D = player.get_child(0)
	await get_tree().process_frame
	col.disabled = true
	driving = true
	car.position = Vector3(20,0.8,2.3)
	car.rotation = Vector3(0,PI/2.0,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	view_mode = 1
	_cycle_view()
	assert(view_mode == 2 and in_car_view and cockpit.visible,"In-car view is on")
	assert(car_model == null or not car_model.visible,"Car body hidden from inside")
	assert(camera.global_position.distance_to(car.global_position) < 1.5 and camera.far < 200.0,"Camera sits in the driver's seat")
	car.velocity = Vector3(0,0,6)  # sideways leftover motion must not carry over
	var p0 := car.global_position
	var fwd0 := -car.global_basis.z
	stick = Vector2(0,-1)
	for i in 45:
		await get_tree().physics_frame
	assert(car_speed > 3.0,"Gas drives forward (%.1f)" % car_speed)
	var moved := car.global_position-p0
	assert(moved.dot(fwd0) > 2.0 and absf(moved.dot(car.global_basis.x)) < 0.6,"The car really moves forward, no sideways drift (moved %s)" % str(moved))
	var heading := car.rotation.y
	stick = Vector2(0.2,-0.98)
	for i in 60:
		await get_tree().physics_frame
	assert(absf(angle_difference(heading,car.rotation.y)) < 0.02,"A slightly sideways thumb still drives straight (turned %.3f rad)" % angle_difference(heading,car.rotation.y))
	var yaw := car.rotation.y
	stick = Vector2(1,-1).normalized()
	for i in 20:
		await get_tree().physics_frame
	assert(car.rotation.y < yaw-0.05,"Right steers right")
	var dir_before := -car.global_basis.z
	var vel_dir := Vector2(car.velocity.x,car.velocity.z).normalized()
	assert(vel_dir.dot(Vector2(dir_before.x,dir_before.z)) > 0.98,"After steering the car travels where it points")
	stick = Vector2(0,1)
	for i in 120:
		await get_tree().physics_frame
	assert(car_speed < -0.5,"Down brakes then reverses (%.1f)" % car_speed)
	assert(Vector2(car.velocity.x,car.velocity.z).dot(Vector2(-car.global_basis.z.x,-car.global_basis.z.z)) < -0.3,"Reverse really moves backwards")
	stick = Vector2.ZERO
	_cycle_view()
	assert(view_mode == 0 and not in_car_view and not cockpit.visible and (car_model == null or car_model.visible),"Back to the far view")
	driving = was[0]
	car.position = was[1]
	car.rotation = was[2]
	car_speed = was[4]
	car.velocity = Vector3.ZERO
	player.position = was[5]
	col.disabled = driving
	_apply_view()

# ---------- v0.17.0: level-up celebration ----------
var lvl_root: Control
var lvl_flash: ColorRect
var lvl_rays: Control
var lvl_title: Label
var lvl_sub: Label
var lvl_tween: Tween
var lvl_spin := 0.0
var fx_player: AudioStreamPlayer
var lvl_sound: AudioStreamWAV

func _build_level_fx(root: Control) -> void:
	lvl_flash = ColorRect.new()
	lvl_flash.color = Color(1.0,0.86,0.45,0.0)
	lvl_flash.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lvl_flash.size = root.size
	root.add_child(lvl_flash)
	lvl_root = Control.new()
	lvl_root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lvl_root.size = Vector2(620,260)
	lvl_root.position = Vector2(root.size.x/2.0-310.0,root.size.y*0.3-130.0)
	lvl_root.pivot_offset = lvl_root.size/2.0
	root.add_child(lvl_root)
	lvl_rays = Control.new()
	lvl_rays.mouse_filter = Control.MOUSE_FILTER_IGNORE
	lvl_rays.size = lvl_root.size
	lvl_rays.draw.connect(_draw_level_rays)
	lvl_root.add_child(lvl_rays)
	lvl_title = _label("LEVEL UP!",76,Color("ffd86a"))
	lvl_title.add_theme_constant_override("outline_size",14)
	lvl_title.add_theme_color_override("font_outline_color",Color("5a3410"))
	lvl_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lvl_title.size = Vector2(620,100)
	lvl_title.position = Vector2(0,48)
	lvl_root.add_child(lvl_title)
	lvl_sub = _label("",30,Color("fff5dc"))
	lvl_sub.add_theme_constant_override("outline_size",9)
	lvl_sub.add_theme_color_override("font_outline_color",Color("132b3a"))
	lvl_sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lvl_sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	lvl_sub.size = Vector2(620,80)
	lvl_sub.position = Vector2(0,148)
	lvl_root.add_child(lvl_sub)
	lvl_root.hide()
	fx_player = AudioStreamPlayer.new()
	fx_player.volume_db = -3.0
	add_child(fx_player)

func _draw_level_rays() -> void:
	var c := lvl_rays.size/2.0+Vector2(0,-10)
	for i in 14:
		var a := lvl_spin+TAU*float(i)/14.0
		var w := 0.09
		var r := 300.0 if i % 2 == 0 else 220.0
		var col := Color(1.0,0.84,0.4,0.28) if i % 2 == 0 else Color(1.0,0.95,0.75,0.2)
		lvl_rays.draw_colored_polygon(PackedVector2Array([c,c+Vector2(cos(a-w),sin(a-w))*r,c+Vector2(cos(a+w),sin(a+w))*r]),col)
	lvl_rays.draw_circle(c,70.0,Color(1.0,0.9,0.55,0.22))

func _level_fx_tick(delta: float) -> void:
	if lvl_root != null and lvl_root.visible:
		lvl_spin += delta*0.9
		lvl_rays.queue_redraw()

func _level_sound() -> AudioStreamWAV:
	if lvl_sound != null:
		return lvl_sound
	var sr := 22050
	var total := int(sr*1.25)
	var buf := PackedFloat32Array()
	buf.resize(total)
	# Rising arpeggio C5 E5 G5 C6, then a bright chord with a little shimmer.
	var notes := [[0.0,72.0,0.5],[0.09,76.0,0.5],[0.18,79.0,0.55],[0.27,84.0,0.95],[0.27,88.0,0.95],[0.27,91.0,0.95]]
	for n in notes:
		var start := int(float(n[0])*sr)
		var freq := 440.0*pow(2.0,(float(n[1])-69.0)/12.0)
		var length := int(float(n[2])*sr)
		for i in length:
			var k := start+i
			if k >= total:
				break
			var t := float(i)/sr
			var env := minf(1.0,t*60.0)*exp(-t*4.2)
			buf[k] += (sin(TAU*freq*t)+0.35*sin(TAU*freq*2.0*t)+0.12*sin(TAU*freq*3.0*t))*env*0.2
	var rng := RandomNumberGenerator.new()
	rng.seed = 99
	for s in 26:
		var start := int((0.3+rng.randf()*0.75)*sr)
		var freq := rng.randf_range(2400.0,4200.0)
		for i in int(0.08*sr):
			var k := start+i
			if k >= total:
				break
			var t := float(i)/sr
			buf[k] += sin(TAU*freq*t)*exp(-t*55.0)*0.05
	var bytes := PackedByteArray()
	bytes.resize(total*2)
	for i in total:
		bytes.encode_s16(i*2,int(clampf(buf[i],-1.0,1.0)*30000.0))
	lvl_sound = AudioStreamWAV.new()
	lvl_sound.format = AudioStreamWAV.FORMAT_16_BITS
	lvl_sound.mix_rate = sr
	lvl_sound.stereo = false
	lvl_sound.data = bytes
	return lvl_sound

func _fx_material(color: Color, alpha: float) -> StandardMaterial3D:
	var m := StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_color = Color(color.r,color.g,color.b,alpha)
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	return m

func _level_up_fx(lv: int) -> void:
	# Banner.
	if lvl_root != null:
		lvl_sub.text = ("You reached Level %d (MAX)\nHarbor City legend!" % lv) if lv >= _level_table().size() else "You are now Level %d" % lv
		lvl_root.show()
		lvl_root.scale = Vector2(0.25,0.25)
		lvl_root.modulate = Color(1,1,1,0)
		lvl_flash.color.a = 0.0
		if lvl_tween != null and lvl_tween.is_valid():
			lvl_tween.kill()
		lvl_tween = create_tween()
		lvl_tween.set_parallel(true)
		lvl_tween.tween_property(lvl_flash,"color:a",0.42,0.08)
		lvl_tween.tween_property(lvl_root,"modulate:a",1.0,0.15)
		lvl_tween.tween_property(lvl_root,"scale",Vector2(1.12,1.12),0.28).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		lvl_tween.chain().tween_property(lvl_flash,"color:a",0.0,0.5)
		lvl_tween.tween_property(lvl_root,"scale",Vector2.ONE,0.2)
		lvl_tween.chain().tween_interval(2.3)
		lvl_tween.chain().tween_property(lvl_root,"modulate:a",0.0,0.6)
		lvl_tween.chain().tween_callback(lvl_root.hide)
	# Sound.
	if fx_player != null and "--smoke-test" not in OS.get_cmdline_user_args():
		fx_player.stream = _level_sound()
		fx_player.play()
	# Light pillar, ground ring and confetti at the player (or the car).
	var body: Node3D = car if driving else player
	var fx := Node3D.new()
	add_child(fx)
	fx.global_position = Vector3(body.global_position.x,0.1,body.global_position.z)
	var pillar := MeshInstance3D.new()
	var cyl := CylinderMesh.new()
	cyl.top_radius = 1.3
	cyl.bottom_radius = 1.9
	cyl.height = 40.0
	cyl.radial_segments = 16
	cyl.cap_top = false
	cyl.cap_bottom = false
	pillar.mesh = cyl
	pillar.material_override = _fx_material(Color("ffd86a"),0.45)
	pillar.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	pillar.position.y = 20.0
	pillar.scale = Vector3(1,0.05,1)
	fx.add_child(pillar)
	# From the driver's seat you would be standing inside the pillar, so it is left out there.
	pillar.visible = not in_car_view
	var ring := MeshInstance3D.new()
	var torus := TorusMesh.new()
	torus.inner_radius = 1.7
	torus.outer_radius = 2.2
	torus.rings = 32
	torus.ring_segments = 6
	ring.mesh = torus
	ring.material_override = _fx_material(Color("fff2b0"),0.85)
	ring.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	ring.scale = Vector3(1,0.2,1)
	fx.add_child(ring)
	var sparks := CPUParticles3D.new()
	sparks.one_shot = true
	sparks.explosiveness = 0.92
	sparks.amount = 90
	sparks.lifetime = 2.4
	sparks.local_coords = false
	var bit := BoxMesh.new()
	bit.size = Vector3(0.22,0.22,0.06)
	var bit_mat := StandardMaterial3D.new()
	bit_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	bit_mat.vertex_color_use_as_albedo = true
	bit.material = bit_mat
	sparks.mesh = bit
	sparks.position.y = 1.2
	sparks.direction = Vector3.UP
	sparks.spread = 55.0
	sparks.initial_velocity_min = 7.0
	sparks.initial_velocity_max = 14.0
	sparks.gravity = Vector3(0,-9.0,0)
	sparks.angular_velocity_min = -540.0
	sparks.angular_velocity_max = 540.0
	sparks.damping_min = 1.0
	sparks.damping_max = 2.5
	var colors := Gradient.new()
	colors.offsets = PackedFloat32Array([0.0,0.25,0.5,0.75,1.0])
	colors.colors = PackedColorArray([Color("ffd86a"),Color("5ce6ed"),Color("ff6fb0"),Color("8be37a"),Color("fff5dc")])
	sparks.color_initial_ramp = colors
	fx.add_child(sparks)
	sparks.emitting = true
	var tw := create_tween()
	tw.set_parallel(true)
	tw.tween_property(pillar,"scale",Vector3(1,1,1),0.45).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tw.tween_property(ring,"scale",Vector3(7,0.2,7),1.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tw.tween_property(ring.material_override,"albedo_color:a",0.0,1.1)
	tw.tween_property(pillar.material_override,"albedo_color:a",0.0,1.6).set_delay(0.9)
	tw.chain().tween_interval(1.0)
	tw.chain().tween_callback(fx.queue_free)

func _smoke_level_fx() -> void:
	var before := get_child_count()
	_level_up_fx(3)
	assert(lvl_root.visible and lvl_sub.text.contains("Level 3"),"Level-up banner shows")
	assert(get_child_count() == before+1,"Level-up world effect spawned")
	_level_up_fx(5)
	assert(lvl_sub.text.contains("MAX") and lvl_sub.text.contains("legend"),"Max level banner shows")
	assert(_level_sound().data.size() > 40000,"Level-up jingle generated")

func _levelup_shots() -> void:
	# Developer-only: the level-up celebration on foot and from the driver's seat. Never saves.
	player.position = Vector3(20,0.7,2.3)
	for i in 30:
		await get_tree().physics_frame
	_level_up_fx(3)
	await get_tree().create_timer(0.3).timeout
	await _save_shot("levelup-foot-a")
	await get_tree().create_timer(0.6).timeout
	await _save_shot("levelup-foot-b")
	await get_tree().create_timer(3.5).timeout
	driving = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	car.position = Vector3(20,0.8,2.3)
	car.rotation = Vector3(0,PI/2.0,0)
	view_mode = 1
	_cycle_view()
	for i in 20:
		await get_tree().physics_frame
	_level_up_fx(5)
	await get_tree().create_timer(0.5).timeout
	await _save_shot("levelup-incar")
	get_tree().quit()

# ---------- v0.18.0: walk-in stadium ----------
const STADIUM_POS := Vector3(-540,0,-381.5)
const STADIUM_SCALE := 1.45
const STADIUM_GAP := [20,21]

func _collider_yaw(pos: Vector3, size: Vector3, yaw: float) -> void:
	var body := StaticBody3D.new()
	var shape := CollisionShape3D.new()
	var box := BoxShape3D.new()
	box.size = size
	shape.shape = box
	body.position = pos
	body.rotation.y = yaw
	body.add_child(shape)
	add_child(body)

func _build_stadium_walls() -> void:
	# Mirrors the stand segments in blender-src/make_downtown.py (ellipse 38 x 28, 28 segments), leaving the
	# two street-side segments open as the entrance. Blender (x, y) is (x, -z) in the game.
	var rx := 38.0
	var ry := 28.0
	var n := 28
	for i in n:
		if i in STADIUM_GAP:
			continue
		var a := TAU*float(i)/float(n)
		var a2 := TAU*float(i+1)/float(n)
		var p1 := Vector2(cos(a)*rx,sin(a)*ry)
		var p2 := Vector2(cos(a2)*rx,sin(a2)*ry)
		var mid := (p1+p2)/2.0
		var seg := p1.distance_to(p2)+0.6
		var ang := atan2(p2.y-p1.y,p2.x-p1.x)
		_collider_yaw(STADIUM_POS+Vector3(mid.x,6.0,-mid.y)*STADIUM_SCALE,Vector3(seg,12.0,9.0)*STADIUM_SCALE,ang)
	for x in [-9.0,9.0]:
		_collider(self,STADIUM_POS+Vector3(x,4.5,ry+4.5)*STADIUM_SCALE,Vector3(1.6,9,1.6)*STADIUM_SCALE)
	var board := Label3D.new()
	board.text = "HARBOR CITY  2 - 1  BAY ROVERS\n78:12"
	board.font_size = 72
	board.pixel_size = 0.02
	board.modulate = Color("ffd86a")
	board.outline_size = 0
	board.position = STADIUM_POS+Vector3(0,16.0,-(ry+2.7))*STADIUM_SCALE
	add_child(board)

func _look(rel: Vector2) -> void:
	if follow_view:
		cam_yaw -= rel.x*0.006
		cam_pitch = clampf(cam_pitch+rel.y*0.004,0.05,1.1)
		cam_hold = 1.5
		return
	player.rotation.y -= rel.x*0.006
	look_pitch = clampf(look_pitch-rel.y*0.004,-1.1,0.95)

func _smoke_stadium_eye() -> void:
	# The street-side entrance is open all the way to the centre spot; the stands around it are solid.
	for k in 13:
		var pt := STADIUM_POS+Vector3(0,1.0,39.0-float(k)*3.0)
		assert(not _blocked_at(pt,0.8),"Stadium entrance blocked at %s by %s" % [str(pt),_blocker(pt,0.8)])
	for pt in [STADIUM_POS+Vector3(38*STADIUM_SCALE,3,0),STADIUM_POS+Vector3(-38*STADIUM_SCALE,3,0),STADIUM_POS+Vector3(0,3,-28*STADIUM_SCALE)]:
		assert(_blocked_at(pt,0.5),"Stadium stand missing at %s" % str(pt))
	# Eye view on foot.
	var was := [driving,player.position,player.rotation,walk_view]
	driving = false
	player.position = STADIUM_POS+Vector3(0,0.75,8)
	player.rotation = Vector3.ZERO
	walk_view = 2
	_cycle_view()
	assert(eye_view and not in_car_view and view_button.text == "View: Eye","Eye view is on when walking")
	assert(not (player_person["root"] as Node3D).visible,"Own body hidden in eye view")
	_follow_camera(1.0)
	assert(camera.global_position.distance_to(player.global_position+Vector3(0,0.82,0)) < 0.4,"Camera at the player's eyes")
	var start := player.position
	stick = Vector2(0,-1)
	for i in 40:
		await get_tree().physics_frame
	stick = Vector2.ZERO
	assert(player.position.z < start.z-3.0 and absf(player.position.x-start.x) < 0.5,"Eye view walks forward (moved %s)" % str(player.position-start))
	var yaw := player.rotation.y
	_look(Vector2(100,-500))
	assert(player.rotation.y < yaw and look_pitch > 0.9 and look_pitch <= 0.95,"Drag turns and looks up (clamped)")
	_cycle_view()
	assert(not eye_view and follow_view and (player_person["root"] as Node3D).visible,"Back to the follow view")
	look_pitch = 0.0
	driving = was[0]
	player.position = was[1]
	player.rotation = was[2]
	walk_view = was[3]
	_apply_view()

func _stadium_shots() -> void:
	# Developer-only: walking into the stadium in eye view. Never saves.
	player.position = STADIUM_POS+Vector3(0,0.75,46)
	player.rotation = Vector3.ZERO
	for i in 30:
		await get_tree().physics_frame
	await _save_shot("stadium-outside")
	walk_view = 2
	_cycle_view()
	for i in 10:
		await get_tree().physics_frame
	await _save_shot("stadium-entrance-eye")
	player.position = STADIUM_POS+Vector3(0,0.75,4)
	look_pitch = 0.18
	for i in 10:
		await get_tree().physics_frame
	await _save_shot("stadium-inside-eye")
	player.rotation.y = PI*0.75
	for i in 10:
		await get_tree().physics_frame
	await _save_shot("stadium-stands-eye")
	_shot_stats("stadium-stands-eye")
	player.position = Vector3(4,0.7,-12)
	player.rotation.y = 0.0
	look_pitch = 0.05
	for i in 10:
		await get_tree().physics_frame
	await _save_shot("city-eye")
	_shot_stats("city-eye")
	get_tree().quit()

# ---------- v0.18.0: guidance arrows and checkpoints ----------
const CHECKPOINTS := [
	{"name":"Harbor Waterfront","pos":Vector3(10,0,27)},
	{"name":"Ridge Trailhead","pos":Vector3(74,0,4)},
	{"name":"Bay Promenade","pos":Vector3(-100,0,9)},
	{"name":"North Highway","pos":Vector3(12,0,-72)},
	{"name":"Maple Suburbs","pos":Vector3(12,0,-206)},
	{"name":"Harbor Airfield","pos":Vector3(13,0,-318)},
	{"name":"Central Park","pos":Vector3(-430,0,-206)},
	{"name":"Union Station","pos":Vector3(-196,0,-317)},
	{"name":"Marina Heights","pos":Vector3(-10,0,116)},
	{"name":"Harbor Dome","pos":Vector3(148,0,36)},
	{"name":"Civic Center","pos":Vector3(-150,0,23)},
	{"name":"Harbor Raceway","pos":Vector3(170,0,-150)},
	{"name":"Sunset Beach","pos":Vector3(300,0,158)},
	{"name":"Westside","pos":Vector3(-270,0,80)},
	{"name":"Harbor Airport","pos":Vector3(52,0,-470)},
]
var checkpoint_id := -1
var checkpoint_nodes: Array = []
var checkpoint_mats: Array = []
var guide_arrow: Node3D
var goal_arrow: Node3D
var hud_arrow: Control
var guide_target_pos := Vector3.ZERO
var guide_has_target := false

func _arrow_mesh(parent: Node3D, color: Color, length: float, width: float) -> void:
	# An arrow lying flat, pointing along -Z.
	var mat := _material(color)
	mat.emission_enabled = true
	mat.emission = color.darkened(0.25)
	var shaft := MeshInstance3D.new()
	var shaft_mesh := BoxMesh.new()
	shaft_mesh.size = Vector3(width*0.38,width*0.2,length*0.55)
	shaft.mesh = shaft_mesh
	shaft.position = Vector3(0,0,length*0.2)
	shaft.material_override = mat
	shaft.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	parent.add_child(shaft)
	var head := MeshInstance3D.new()
	var prism := PrismMesh.new()
	prism.size = Vector3(width,length*0.45,width*0.2)
	head.mesh = prism
	head.rotation_degrees.x = -90.0
	head.position = Vector3(0,0,-length*0.27)
	head.material_override = mat
	head.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	parent.add_child(head)

func _build_guidance(root: Control) -> void:
	guide_arrow = Node3D.new()
	add_child(guide_arrow)
	_arrow_mesh(guide_arrow,Color("ffcf4a"),2.2,1.2)
	guide_arrow.hide()
	# A big bouncing arrow over the golden ring, pointing down at it.
	goal_arrow = Node3D.new()
	marker.add_child(goal_arrow)
	var down := Node3D.new()
	down.rotation_degrees.x = -90.0
	goal_arrow.add_child(down)
	_arrow_mesh(down,Color("ffcf4a"),3.2,2.2)
	goal_arrow.position.y = 7.0
	# Screen arrow for the In-car and Eye views (the floating arrow is behind the camera there).
	hud_arrow = Control.new()
	hud_arrow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(hud_arrow)
	hud_arrow.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	hud_arrow.size = Vector2(140,110)
	hud_arrow.position = Vector2(root.size.x/2.0-70.0,96)
	hud_arrow.draw.connect(_draw_hud_arrow)
	hud_arrow.hide()

func _guide_target() -> Variant:
	if bus_riding or sky_riding or online_role != 0 or chase_mode == 1:
		return null
	if chase_mode == 2:
		for u in chase_units:
			if not u["cop"]:
				return (u["node"] as Node3D).position
		return null
	if not marker.visible:
		return null
	return _destination()

func _guidance_tick(delta: float) -> void:
	if guide_arrow == null:
		return
	var target = _guide_target()
	guide_has_target = target != null
	var body: Node3D = car if driving else player
	var dist := 0.0
	if guide_has_target:
		guide_target_pos = target
		dist = Vector2(guide_target_pos.x-body.position.x,guide_target_pos.z-body.position.z).length()
	# v0.24: the street-level Follow view uses the screen arrow too (a 3D arrow there either
	# fills the screen or hides behind your character).
	var first_person := in_car_view or eye_view or (follow_view and not driving)
	guide_arrow.visible = guide_has_target and dist > 6.0 and not first_person
	if guide_arrow.visible:
		var lift := 3.0 if driving else 2.3
		guide_arrow.scale = Vector3.ONE
		guide_arrow.position = body.position+Vector3(0,lift+sin(clock*3.0)*0.18,0)
		var look := Vector3(guide_target_pos.x,guide_arrow.position.y,guide_target_pos.z)
		if look.distance_to(guide_arrow.position) > 0.1:
			guide_arrow.look_at(look,Vector3.UP)
	goal_arrow.position.y = 7.0+sin(clock*3.0)*0.6
	hud_arrow.visible = guide_has_target and dist > 6.0 and first_person
	if hud_arrow.visible:
		hud_arrow.queue_redraw()

func _draw_hud_arrow() -> void:
	var body: Node3D = car if driving else player
	var d := Vector2(guide_target_pos.x-body.position.x,guide_target_pos.z-body.position.z)
	var f := Vector2(-camera.global_basis.z.x,-camera.global_basis.z.z).normalized()
	var r := Vector2(camera.global_basis.x.x,camera.global_basis.x.z).normalized()
	var dir := Vector2(d.dot(r),-d.dot(f)).normalized()
	var c := Vector2(70,42)
	hud_arrow.draw_circle(c,34.0,Color(0.07,0.15,0.2,0.75))
	var pts := PackedVector2Array()
	var perp := Vector2(-dir.y,dir.x)
	for p in [c+dir*24.0,c-dir*16.0+perp*17.0,c-dir*7.0,c-dir*16.0-perp*17.0]:
		pts.append(p)
	hud_arrow.draw_colored_polygon(pts,Color("ffcf4a"))
	pts.append(pts[0])
	hud_arrow.draw_polyline(pts,Color("5a3410"),2.0,true)
	var font := ThemeDB.fallback_font
	var txt := "%d m" % int(d.length())
	var w := font.get_string_size(txt,HORIZONTAL_ALIGNMENT_LEFT,-1,20).x
	hud_arrow.draw_string_outline(font,Vector2(70.0-w/2.0,100),txt,HORIZONTAL_ALIGNMENT_LEFT,-1,20,6,Color("132b3a"))
	hud_arrow.draw_string(font,Vector2(70.0-w/2.0,100),txt,HORIZONTAL_ALIGNMENT_LEFT,-1,20,Color("ffcf4a"))

# ---------- checkpoints ----------
func _build_checkpoints() -> void:
	for i in CHECKPOINTS.size():
		var pos: Vector3 = CHECKPOINTS[i]["pos"]
		var node := Node3D.new()
		node.position = pos
		add_child(node)
		var pad := MeshInstance3D.new()
		var cyl := CylinderMesh.new()
		cyl.top_radius = 2.4
		cyl.bottom_radius = 2.6
		cyl.height = 0.16
		cyl.radial_segments = 20
		pad.mesh = cyl
		pad.position.y = 0.08
		var mat := _material(Color("3fb6e8"))
		mat.emission_enabled = true
		mat.emission = Color("1d6f99")
		pad.material_override = mat
		node.add_child(pad)
		checkpoint_mats.append(mat)
		var ring := MeshInstance3D.new()
		var torus := TorusMesh.new()
		torus.inner_radius = 2.0
		torus.outer_radius = 2.25
		torus.rings = 24
		torus.ring_segments = 6
		ring.mesh = torus
		ring.position.y = 0.2
		ring.material_override = _material(Color("e8f7ff"))
		node.add_child(ring)
		_box(node,Vector3(-2.2,1.6,0),Vector3(0.14,3.2,0.14),Color("d8dde0"))
		_box(node,Vector3(-1.75,2.85,0),Vector3(0.8,0.55,0.05),Color("3fb6e8"))
		var label := Label3D.new()
		label.text = "CHECKPOINT\n" + str(CHECKPOINTS[i]["name"]).to_upper()
		label.font_size = 40
		label.pixel_size = 0.013
		label.modulate = Color("cfefff")
		label.outline_size = 8
		label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		label.position = Vector3(0,4.0,0)
		node.add_child(label)
		checkpoint_nodes.append(node)
	_refresh_checkpoints()

func _refresh_checkpoints() -> void:
	for i in checkpoint_mats.size():
		var m: StandardMaterial3D = checkpoint_mats[i]
		m.albedo_color = Color("5fe08a") if i == checkpoint_id else Color("3fb6e8")
		m.emission = Color("2a8f4f") if i == checkpoint_id else Color("1d6f99")

func _check_checkpoints() -> void:
	var body: Node3D = car if driving else player
	for i in CHECKPOINTS.size():
		if i == checkpoint_id:
			continue
		var pos: Vector3 = CHECKPOINTS[i]["pos"]
		if Vector2(body.position.x-pos.x,body.position.z-pos.z).length() < 3.2 and absf(body.position.y-pos.y) < 3.0:
			_activate_checkpoint(i)
			return

func _activate_checkpoint(i: int) -> void:
	checkpoint_id = i
	_refresh_checkpoints()
	_save_progress()
	_show_toast("CHECKPOINT SAVED: %s. You will start here next time." % CHECKPOINTS[i]["name"])
	var fx := Node3D.new()
	add_child(fx)
	fx.global_position = (CHECKPOINTS[i]["pos"] as Vector3)+Vector3(0,0.3,0)
	var ring := MeshInstance3D.new()
	var torus := TorusMesh.new()
	torus.inner_radius = 2.0
	torus.outer_radius = 2.4
	ring.mesh = torus
	ring.material_override = _fx_material(Color("9fe9ff"),0.9)
	fx.add_child(ring)
	var tw := create_tween()
	tw.set_parallel(true)
	tw.tween_property(ring,"scale",Vector3(3.5,1,3.5),0.8).set_ease(Tween.EASE_OUT)
	tw.tween_property(ring.material_override,"albedo_color:a",0.0,0.8)
	tw.chain().tween_callback(fx.queue_free)

func _checkpoint_spawn() -> Array:
	# [player position, car position] for the saved checkpoint.
	var pos: Vector3 = CHECKPOINTS[checkpoint_id]["pos"]
	return [pos+Vector3(0,0.75,0),pos+Vector3(4.5,0.8,0)]

func _spawn_at_checkpoint() -> void:
	if checkpoint_id < 0 or checkpoint_id >= CHECKPOINTS.size():
		checkpoint_id = -1
		return
	var spots := _checkpoint_spawn()
	driving = false
	player.position = spots[0]
	player.velocity = Vector3.ZERO
	car.position = spots[1]
	car.rotation = Vector3.ZERO
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	_follow_camera(1.0)

func _draw_checkpoint_icon(ctl: Control, at: Vector2, r: float, saved: bool) -> void:
	var pts := PackedVector2Array([at+Vector2(0,-r-1.5),at+Vector2(r+1.5,0),at+Vector2(0,r+1.5),at+Vector2(-r-1.5,0)])
	ctl.draw_colored_polygon(pts,Color("132b3a"))
	pts = PackedVector2Array([at+Vector2(0,-r),at+Vector2(r,0),at+Vector2(0,r),at+Vector2(-r,0)])
	ctl.draw_colored_polygon(pts,Color("5fe08a") if saved else Color("3fb6e8"))

func _smoke_guidance_checkpoints() -> void:
	var was := [driving,player.position,player.rotation,view_mode,exploring,trial_active,checkpoint_id,car.position]
	driving = false
	exploring = true
	view_mode = 0
	_apply_view()
	player.position = Vector3(10,0.75,10)
	marker.visible = true
	_guidance_tick(0.016)
	var target := _destination()
	assert(guide_has_target and guide_arrow.visible,"Floating arrow shows for the current quest")
	var aim := Vector2(target.x-guide_arrow.position.x,target.z-guide_arrow.position.z).normalized()
	var points := Vector2(-guide_arrow.global_basis.z.x,-guide_arrow.global_basis.z.z).normalized()
	assert(aim.dot(points) > 0.97,"Arrow points at the goal")
	walk_view = 3
	_apply_view()
	_guidance_tick(0.016)
	assert(hud_arrow.visible and not guide_arrow.visible,"Screen arrow replaces it in eye view")
	walk_view = 1
	_apply_view()
	trial_active = 0
	trial_cp = 1
	assert((_guide_target() as Vector3).distance_to(TRIALS[0]["cps"][1]) < 0.01,"Arrow follows the next trial ring")
	trial_active = -1
	# Checkpoints: open pads and spawn spots, save, reload, rescue.
	for i in CHECKPOINTS.size():
		checkpoint_id = i
		var spots := _checkpoint_spawn()
		assert(not _blocked_at((spots[0] as Vector3)+Vector3(0,0.6,0),0.5),"Checkpoint %s: player spot blocked by %s" % [CHECKPOINTS[i]["name"],_blocker((spots[0] as Vector3)+Vector3(0,0.6,0),0.5)])
		assert(not _blocked_at((spots[1] as Vector3)+Vector3(0,0.5,0),1.0),"Checkpoint %s: car spot blocked by %s" % [CHECKPOINTS[i]["name"],_blocker((spots[1] as Vector3)+Vector3(0,0.5,0),1.0)])
	checkpoint_id = -1
	player.position = (CHECKPOINTS[2]["pos"] as Vector3)+Vector3(0.5,0.75,0)
	_check_checkpoints()
	assert(checkpoint_id == 2,"Walking onto a pad saves that checkpoint")
	checkpoint_id = -1
	_load_progress()
	assert(checkpoint_id == 2,"Checkpoint survives a reload")
	_rescue()
	assert(player.position.distance_to((CHECKPOINTS[2]["pos"] as Vector3)+Vector3(0,0.75,0)) < 0.5 and car.position.distance_to(_checkpoint_spawn()[1]) < 0.5,"Rescue returns to the checkpoint")
	driving = was[0]
	player.position = was[1]
	player.rotation = was[2]
	view_mode = was[3]
	exploring = was[4]
	car.position = was[7]
	_apply_view()

func _guide_shots() -> void:
	# Developer-only: quest arrow, goal arrow, screen arrow and a checkpoint. Never saves.
	exploring = true
	player.position = (CHECKPOINTS[0]["pos"] as Vector3)+Vector3(-6,0.75,4)
	for i in 40:
		await get_tree().physics_frame
	walk_view = 1
	_apply_view()
	await _save_shot("guide-far")
	walk_view = 3
	_apply_view()
	for i in 10:
		await get_tree().physics_frame
	await _save_shot("guide-eye")
	walk_view = 1
	_apply_view()
	checkpoint_id = 0
	_refresh_checkpoints()
	player.position = (CHECKPOINTS[0]["pos"] as Vector3)+Vector3(0,0.75,9)
	for i in 30:
		await get_tree().physics_frame
	await _save_shot("checkpoint")
	_open_map()
	await _save_shot("checkpoint-map")
	get_tree().quit()

# ---------- v0.18.0: Harbor Dome social hub ----------
const HubJokes := preload("res://hub_jokes.gd")
const HUB_C := Vector3(210,0,32)
const HUB_R := 46.0
const HUB_JOKE_PRICE := 5
const HUB_JOKE_SET := 5
const TTT_PRICE := 10
const RPS_PRICE := 5
const HUB_PHRASES := ["Hi!","Hello everyone!","Wanna play?","Good game!","Nice one!","Haha!","Thanks!","See you!"]
const HUB_EMOTES := ["Wave","Clap","Dance","Cheer"]
const RPS_NAMES := ["ROCK","PAPER","SCISSORS"]
const TTT_TABLES := [Vector3(194,0,14),Vector3(206,0,9),Vector3(218,0,14),Vector3(206,0,21)]
const RPS_TABLES := [Vector3(194,0,50),Vector3(206,0,55),Vector3(218,0,50),Vector3(206,0,43)]
const HUB_STAGE := Vector3(236,0,32)
const HUB_CAR_LAYER := 2
const HUB_BARRIER_X := 161.5
const HUB_PARK := Vector3(155,0.8,32)
var hub_seats: Array = []
var seat_id := -1
var hub_bots: Array = []
var hub_bubbles: Array = []
var hub_emotes: Array = []
var hub_tiles: Array = []
var hub_tile_t := 0.0
var hub_welcomed := false
var ttt: Array = []
var rps: Array = []
var game_panel: PanelContainer
var game_title: Label
var game_status: Label
var ttt_grid: GridContainer
var ttt_buttons: Array = []
var rps_row: HBoxContainer
var show_row: HBoxContainer
var game_robot_button: Button
var robot_node: Node3D
var joke_label: Label3D
var joke_left := 0
var joke_idx := 0
var joke_timer := 0.0
var joke_phase := 0
var rimshot: AudioStreamWAV
var chat_button: Button
var chat_panel: PanelContainer
var my_bubble_n := 0
var my_bubble := -1
var my_emote_n := 0
var my_emote := -1
var bot_chat_t := 4.0

func _hub_seat(pos: Vector3, face: float, kind: String, table: int, side: int, h: float) -> int:
	hub_seats.append({"pos":pos,"face":face,"kind":kind,"table":table,"side":side,"h":h,"bot":false})
	return hub_seats.size()-1

func _build_hub() -> void:
	var walk := Color("b9b6ad")
	var water := Color("248caa")
	_box(self,Vector3(150,-0.65,40),Vector3(220,0.3,150),water)
	# Causeway from the old city's waterfront street (z = 32) to the dome entrance.
	_slab(Vector3(110.25,-0.35,32),Vector3(108.5,0.6,14),0,walk)
	_box(self,Vector3(110.25,0.012,32),Vector3(108.5,0.08,9),Color("394552"))
	var dashes := []
	for x in range(60,162,8):
		dashes.append([Vector3(float(x),0.06,32),Vector3(3,0.02,0.18)])
	_box_batch(Color("e7d9a4"),dashes)
	_box(self,Vector3(110.25,0.55,32-7.2),Vector3(108.5,1.1,0.4),Color("dfe3e6"),true)
	# v0.26: gap in the south railing for the Sunset Beach road (x 123..137).
	_box(self,Vector3((56.0+122.8)/2.0,0.55,32+7.2),Vector3(122.8-56.0,1.1,0.4),Color("dfe3e6"),true)
	_box(self,Vector3((137.2+164.5)/2.0,0.55,32+7.2),Vector3(164.5-137.2,1.1,0.4),Color("dfe3e6"),true)
	var lamps := []
	for x in range(64,162,16):
		if absf(float(x)-130.0) > 9.0:
			lamps.append([Vector3(float(x),0,32+6.4),PI/2.0])
		lamps.append([Vector3(float(x)+8.0,0,32-6.4),-PI/2.0])
	_model_batch("res://models/lamp.glb",lamps)
	_sign("HARBOR DOME  →",Vector3(62,6.5,32),Color("e6d9ff"),56)
	# The dome is for people only: bollards that stop cars (collision layer 2) but not people, and parking.
	var barrier := StaticBody3D.new()
	barrier.collision_layer = HUB_CAR_LAYER
	barrier.collision_mask = 0
	barrier.position = Vector3(HUB_BARRIER_X,1.0,32)
	add_child(barrier)
	var bshape := CollisionShape3D.new()
	var bbox := BoxShape3D.new()
	bbox.size = Vector3(0.6,2.0,14)
	bshape.shape = bbox
	barrier.add_child(bshape)
	var posts := []
	for k in 11:
		posts.append([Vector3(HUB_BARRIER_X,0.45,26.0+float(k)*1.2),Vector3(0.28,0.9,0.28)])
	_box_batch(Color("f2c94c"),posts)
	var bays := []
	for k in 6:
		var z := 26.6+float(k)*2.2
		bays.append([Vector3(HUB_PARK.x,0.065,z-1.1),Vector3(5.0,0.02,0.12)])
	bays.append([Vector3(HUB_PARK.x,0.065,26.6+6.0*2.2-1.1),Vector3(5.0,0.02,0.12)])
	_box_batch(Color("f4f1e8"),bays)
	_sign("NO CARS PAST THIS POINT\nPARK HERE · WALK IN",Vector3(HUB_BARRIER_X-0.5,4.2,32),Color("ffe9b8"),40)
	# Round floor (cylinder collider) with rings and a dance floor in the middle.
	var floor_body := StaticBody3D.new()
	floor_body.position = HUB_C+Vector3(0,-0.35,0)
	add_child(floor_body)
	var fshape := CollisionShape3D.new()
	var fcyl := CylinderShape3D.new()
	fcyl.radius = HUB_R+2.0
	fcyl.height = 0.6
	fshape.shape = fcyl
	floor_body.add_child(fshape)
	var fmesh := MeshInstance3D.new()
	var disc := CylinderMesh.new()
	disc.top_radius = HUB_R+2.0
	disc.bottom_radius = HUB_R+2.0
	disc.height = 0.6
	disc.radial_segments = 48
	fmesh.mesh = disc
	fmesh.material_override = _material(Color("b8b0c8"))
	floor_body.add_child(fmesh)
	for ring_r in [14.0,30.0]:
		var ring := MeshInstance3D.new()
		var torus := TorusMesh.new()
		torus.inner_radius = ring_r-0.5
		torus.outer_radius = ring_r+0.5
		torus.rings = 48
		torus.ring_segments = 4
		ring.mesh = torus
		ring.scale = Vector3(1,0.05,1)
		ring.position = HUB_C+Vector3(0,0.0,0)
		ring.material_override = _material(Color("b9a6e6"))
		add_child(ring)
	var tile_cols := [Color("ff6fb0"),Color("5ce6ed"),Color("ffd86a")]
	var tile_sets := [[],[],[]]
	for gx in 6:
		for gz in 6:
			tile_sets[(gx+gz) % 3].append([HUB_C+Vector3(-5.0+float(gx)*2.0,0.03,-5.0+float(gz)*2.0),Vector3(1.9,0.05,1.9)])
	for k in 3:
		var inst := _box_batch(tile_cols[k],tile_sets[k])
		var m := _material(tile_cols[k])
		m.emission_enabled = true
		m.emission = tile_cols[k]
		m.emission_energy_multiplier = 0.4
		inst.material_override = m
		hub_tiles.append(m)
	# Dome shell (glass visible from inside too) and its wall: a ring of colliders with the west entrance open.
	var dome := _try_model("res://models/dome_shell.glb")
	if dome != null:
		dome.position = HUB_C
		dome.rotation.y = -PI/2.0
		add_child(dome)
		_hub_glass(dome)
	var n := 40
	for i in n:
		var a := TAU*(float(i)+0.5)/float(n)
		if absf(angle_difference(a,PI)) < deg_to_rad(13.5):
			continue
		var p := HUB_C+Vector3(cos(a),0,sin(a))*(HUB_R+0.4)
		_collider_yaw(p+Vector3(0,3,0),Vector3(TAU*(HUB_R+0.4)/float(n)+0.4,6,1.0),-a-PI/2.0)
	var holo := _sign("HARBOR DOME",HUB_C+Vector3(0,20,0),Color("e6d9ff"),110)
	holo.outline_size = 14
	_sign("COMEDY STAGE",HUB_STAGE+Vector3(0,11,0),Color("ffd86a"),60)
	_sign("TIC-TAC-TOE  $%d" % TTT_PRICE,Vector3(206,5.5,15),Color("bff4f0"),48)
	_sign("ROCK PAPER SCISSORS  $%d" % RPS_PRICE,Vector3(206,5.5,49),Color("ffd0e6"),48)
	_sign("LOUNGE",Vector3(180,4.5,51),Color("e8f7ff"),44)
	# Comedy stage, robot, audience sofas.
	var stage := Node3D.new()
	add_child(stage)
	var st := _try_model("res://models/stage.glb")
	if st != null:
		st.position = HUB_STAGE
		st.rotation.y = -PI/2.0
		add_child(st)
	var sbody := StaticBody3D.new()
	sbody.position = HUB_STAGE+Vector3(0,0.47,0)
	add_child(sbody)
	var scol := CollisionShape3D.new()
	var scyl := CylinderShape3D.new()
	scyl.radius = 7.6
	scyl.height = 0.95
	scol.shape = scyl
	sbody.add_child(scol)
	robot_node = Node3D.new()
	robot_node.position = HUB_STAGE+Vector3(-0.4,0.98,0)
	robot_node.rotation.y = -PI/2.0
	add_child(robot_node)
	var rb := _try_model("res://models/robot.glb")
	if rb != null:
		robot_node.add_child(rb)
	joke_label = Label3D.new()
	joke_label.font_size = 40
	joke_label.pixel_size = 0.012
	joke_label.width = 900.0
	joke_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	joke_label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	joke_label.outline_size = 10
	joke_label.modulate = Color("fff5dc")
	joke_label.position = HUB_STAGE+Vector3(-1.0,5.2,0)
	joke_label.text = "Sit on a sofa and tap START SHOW ($%d)" % HUB_JOKE_PRICE
	add_child(joke_label)
	var sofas := []
	for row in [[222.0,0],[216.0,1]]:
		for z in [24.0,32.0,40.0]:
			var pos := Vector3(float(row[0]),0,z)
			sofas.append([pos,PI/2.0])
			for lx in [-0.6,0.6]:
				_hub_seat(pos+Vector3(0.05,0,lx),-PI/2.0,"show",0,0,0.42)
	_model_batch("res://models/sofa.glb",sofas)
	# Game tables with two chairs each (x axis). Tables 0-1 have a robot in chair B, 2-3 are for players.
	var tables := []
	var chairs := []
	for kind in ["ttt","rps"]:
		var spots: Array = TTT_TABLES if kind == "ttt" else RPS_TABLES
		for t in spots.size():
			var tp: Vector3 = spots[t]
			tables.append([tp,0.0])
			_collider(self,tp+Vector3(0,0.45,0),Vector3(1.9,0.9,1.9))
			chairs.append([tp+Vector3(-1.5,0,0),PI/2.0])
			chairs.append([tp+Vector3(1.5,0,0),-PI/2.0])
			_hub_seat(tp+Vector3(-1.45,0,0),-PI/2.0,kind,t,0,0.46)
			var b := _hub_seat(tp+Vector3(1.45,0,0),PI/2.0,kind,t,1,0.46)
			if t < 2:
				hub_seats[b]["bot"] = true
			if kind == "ttt":
				ttt.append({"b":[0,0,0,0,0,0,0,0,0],"turn":1,"over":false,"paid":false,"bot":t < 2,"reset":0.0,"botwait":0.0,"msg":""})
			else:
				rps.append({"me":-1,"them":-1,"round":0,"bot":t < 2,"msg":"","reset":0.0})
			var tag := _sign(("VS ROBOT" if t < 2 else "PLAYER VS PLAYER"),tp+Vector3(0,2.6,0),Color("cfe2ff") if t < 2 else Color("ffe9b8"),30)
			tag.pixel_size = 0.012
	_model_batch("res://models/game_table.glb",tables)
	_model_batch("res://models/chair.glb",chairs)
	# Lounge and cafe.
	var bags := []
	for p in [Vector3(176,0,54),Vector3(180,0,49),Vector3(184,0,55),Vector3(172,0,49)]:
		bags.append([p,0.0])
		_hub_seat(p,0.0,"lounge",0,0,0.35)
	_model_batch("res://models/beanbag.glb",bags)
	var lounge_sofa := Vector3(180,0,60)
	_model_batch("res://models/sofa.glb",[[lounge_sofa,PI]])
	for lx in [-0.6,0.6]:
		_hub_seat(lounge_sofa+Vector3(lx,0,-0.05),0.0,"lounge",0,0,0.42)
	_prop("res://models/hub_counter.glb",Vector3(180,0,10),Vector3(6.2,1.2,1.4),0.0,Color("22b5c9"))
	_collider(self,Vector3(180,1.3,8.4),Vector3(6.2,2.6,0.4))
	_sign("DOME CAFE",Vector3(180,4.2,8.6),Color("bff4f0"),44)
	var palms := []
	for k in 10:
		var a := TAU*float(k)/10.0+0.3
		if absf(angle_difference(a,PI)) < 0.45 or absf(angle_difference(a,0.0)) < 0.45:
			continue
		palms.append([HUB_C+Vector3(cos(a),0,sin(a))*41.0,a,0.9])
	_model_batch("res://models/palm.glb",palms)
	_build_hub_bots()

func _hub_glass(node: Node) -> void:
	if node is MeshInstance3D and (node as MeshInstance3D).mesh != null:
		var mi := node as MeshInstance3D
		for s in mi.mesh.get_surface_count():
			var m := mi.mesh.surface_get_material(s)
			if m != null and m.resource_name.begins_with("DomeGlass"):
				var g := StandardMaterial3D.new()
				g.albedo_color = Color(0.66,0.86,0.94,0.22)
				g.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
				g.cull_mode = BaseMaterial3D.CULL_DISABLED
				g.roughness = 0.05
				g.metallic = 0.2
				mi.set_surface_override_material(s,g)
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	for child in node.get_children():
		_hub_glass(child)

# ---------- people: sitting pose, bots, bubbles, emotes ----------
func _sit_pose(person: Dictionary, h: float, base_y: float) -> void:
	if person.is_empty():
		return
	var limbs: Dictionary = person["limbs"]
	for part in ["LegL","LegR"]:
		if limbs[part] != null:
			(limbs[part] as Node3D).rotation = Vector3(1.45,0,0)
	for part in ["ArmL","ArmR"]:
		if limbs[part] != null:
			(limbs[part] as Node3D).rotation = Vector3(0.55,0,0)
	# Lower legs hang down from the seat, forearms rest forward.
	for part in ["ShinL","ShinR"]:
		if limbs.get(part) != null:
			(limbs[part] as Node3D).rotation = Vector3(-1.45,0,0)
	for part in ["ForeArmL","ForeArmR"]:
		if limbs.get(part) != null:
			(limbs[part] as Node3D).rotation = Vector3(0.7,0,0)
	(person["root"] as Node3D).position.y = base_y-(0.86-(h+0.06))

func _build_hub_bots() -> void:
	var names := ["Robo-Bob","Chip","Bolt","Sprocket","Pixel","Gizmo"]
	var shirts := [Color("e07a5f"),Color("3d84a8"),Color("81b29a"),Color("9a6fb0"),Color("f2cc8f"),Color("d4a373")]
	var spots := []
	for i in hub_seats.size():
		if hub_seats[i]["bot"]:
			spots.append(i)
	spots.append(_seat_of("lounge",0,0,0))
	spots.append(_seat_of("lounge",0,0,2))
	for k in spots.size():
		var seat: Dictionary = hub_seats[spots[k]]
		var node := Node3D.new()
		add_child(node)
		node.position = seat["pos"]
		node.rotation.y = float(seat["face"])
		var person := _make_person(node,k % 4,{"Shirt":shirts[k % shirts.size()],"Pants":Color("263d54"),"Skin":[Color("f0c9a4"),Color("c68a60"),Color("8d5a3b")][k % 3],"Hair":[Color("2b1d14"),Color("c9a25f"),Color("1a1a1a")][k % 3],"Shoes":Color("2b2b2b"),"Eye":Color("1c1c22")})
		_cull_person(node,95.0)
		_sit_pose(person,float(seat["h"]),0.0)
		var tag := Label3D.new()
		tag.text = "%s · BOT" % names[k % names.size()]
		tag.font_size = 32
		tag.pixel_size = 0.01
		tag.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		tag.outline_size = 8
		tag.modulate = Color("cfe2ff")
		tag.position = Vector3(0,2.0,0)
		node.add_child(tag)
		seat["bot"] = true
		hub_bots.append({"node":node,"person":person,"seat":spots[k],"name":names[k % names.size()]})

func _seat_of(kind: String, table: int, side: int, nth := 0) -> int:
	var count := 0
	for i in hub_seats.size():
		var s: Dictionary = hub_seats[i]
		if s["kind"] == kind and int(s["table"]) == table and (kind == "lounge" or kind == "show" or int(s["side"]) == side):
			if count == nth:
				return i
			count += 1
	return -1

func _bubble(parent: Node3D, text: String, height: float) -> void:
	var lab := Label3D.new()
	lab.text = text
	lab.font_size = 44
	lab.pixel_size = 0.012
	lab.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	lab.outline_size = 12
	lab.outline_modulate = Color("132b3a")
	lab.modulate = Color("fff5dc")
	lab.position = Vector3(0,height,0)
	lab.no_depth_test = true
	parent.add_child(lab)
	hub_bubbles.append({"label":lab,"until":clock+4.0})

func _emote(person: Dictionary, kind: int) -> void:
	if person.is_empty():
		return
	for e in hub_emotes:
		if e["person"] == person:
			e["kind"] = kind
			e["until"] = clock+3.2
			return
	var root: Node3D = person["root"]
	hub_emotes.append({"person":person,"kind":kind,"until":clock+3.2,"root_y":root.position.y,"root_rot":root.rotation.y})

func _hub_people_tick(delta: float) -> void:
	for i in range(hub_bubbles.size()-1,-1,-1):
		var b: Dictionary = hub_bubbles[i]
		if clock > float(b["until"]) or not is_instance_valid(b["label"]):
			if is_instance_valid(b["label"]):
				(b["label"] as Node).queue_free()
			hub_bubbles.remove_at(i)
	for i in range(hub_emotes.size()-1,-1,-1):
		var e: Dictionary = hub_emotes[i]
		var person: Dictionary = e["person"]
		var limbs: Dictionary = person["limbs"]
		var root: Node3D = person["root"]
		if clock > float(e["until"]):
			for part in ["ArmL","ArmR"]:
				if limbs[part] != null:
					(limbs[part] as Node3D).rotation = Vector3.ZERO
			root.rotation.y = float(e["root_rot"])
			root.position.y = float(e["root_y"])
			hub_emotes.remove_at(i)
			continue
		var t := clock*10.0
		var arm_l: Node3D = limbs["ArmL"]
		var arm_r: Node3D = limbs["ArmR"]
		match int(e["kind"]):
			0:
				arm_r.rotation = Vector3(-2.7,0,sin(t)*0.45)
			1:
				arm_l.rotation = Vector3(1.25,0,-0.35-0.3*sin(t*1.4))
				arm_r.rotation = Vector3(1.25,0,0.35+0.3*sin(t*1.4))
			2:
				arm_l.rotation = Vector3(-2.2+sin(t*0.6)*0.6,0,0)
				arm_r.rotation = Vector3(-2.2-sin(t*0.6)*0.6,0,0)
				root.rotation.y = float(e["root_rot"])+sin(t*0.3)*0.6
				root.position.y = float(e["root_y"])+absf(sin(t*0.6))*0.12
			3:
				arm_l.rotation = Vector3(-2.9,0,-0.3)
				arm_r.rotation = Vector3(-2.9,0,0.3)
				root.position.y = float(e["root_y"])+absf(sin(t*0.5))*0.25
	# Robot regulars chat now and then.
	bot_chat_t -= delta
	if bot_chat_t <= 0.0 and not hub_bots.is_empty():
		bot_chat_t = randf_range(5.0,9.0)
		var bot: Dictionary = hub_bots[randi() % hub_bots.size()]
		if (bot["node"] as Node3D).global_position.distance_to(camera.global_position) < 80.0:
			_bubble(bot["node"],HUB_PHRASES[randi() % HUB_PHRASES.size()],2.5)
			if randf() < 0.4:
				_emote(bot["person"],randi() % 2)
	hub_tile_t += delta
	if hub_tile_t > 0.5 and not hub_tiles.is_empty():
		hub_tile_t = 0.0
		var first: StandardMaterial3D = hub_tiles[0]
		var keep := first.albedo_color
		for k in hub_tiles.size()-1:
			(hub_tiles[k] as StandardMaterial3D).albedo_color = (hub_tiles[k+1] as StandardMaterial3D).albedo_color
		(hub_tiles[hub_tiles.size()-1] as StandardMaterial3D).albedo_color = keep
		for m in hub_tiles:
			(m as StandardMaterial3D).emission = (m as StandardMaterial3D).albedo_color

# ---------- seats ----------
func _seat_taken(i: int) -> bool:
	if hub_seats[i]["bot"]:
		return true
	for id in online_peers:
		if int(online_peers[id].get("seat",-1)) == i:
			return true
	return false

func _nearest_seat() -> int:
	if driving or hub_seats.is_empty() or player.position.distance_to(HUB_C) > HUB_R+2.0:
		return -1
	var best := -1
	var best_d := 1.8
	for i in hub_seats.size():
		var d := Vector2(player.position.x-(hub_seats[i]["pos"] as Vector3).x,player.position.z-(hub_seats[i]["pos"] as Vector3).z).length()
		if d < best_d and not _seat_taken(i):
			best_d = d
			best = i
	return best

func _seat_label(i: int) -> String:
	match String(hub_seats[i]["kind"]):
		"ttt":
			return "SIT · TIC-TAC-TOE"
		"rps":
			return "SIT · ROCK PAPER SCISSORS"
		"show":
			return "SIT · COMEDY SHOW"
	return "SIT DOWN"

func _sit(i: int) -> void:
	seat_id = i
	var seat: Dictionary = hub_seats[i]
	player.position = (seat["pos"] as Vector3)+Vector3(0,0.7,0)
	player.rotation.y = float(seat["face"])
	player.velocity = Vector3.ZERO
	player.get_child(0).set_deferred("disabled",true)
	_sit_pose(player_person,float(seat["h"]),-0.7)
	if hat_holder != null:
		hat_holder.position.y = 0.29-(0.86-(float(seat["h"])+0.06))
	var kind := String(seat["kind"])
	var t := int(seat["table"])
	if kind == "ttt":
		var g: Dictionary = ttt[t]
		g["b"] = [0,0,0,0,0,0,0,0,0]
		g["turn"] = 1
		g["over"] = false
		g["paid"] = false
		g["bot"] = t < 2
		g["msg"] = ""
	elif kind == "rps":
		var g: Dictionary = rps[t]
		g["me"] = -1
		g["them"] = -1
		g["bot"] = t < 2
		g["msg"] = ""
	_open_game_panel()

func _stand_up() -> void:
	if seat_id < 0:
		return
	var seat: Dictionary = hub_seats[seat_id]
	if String(seat["kind"]) == "show" and joke_left > 0:
		joke_left = 0
		DisplayServer.tts_stop()
		joke_label.text = "Sit on a sofa and tap START SHOW ($%d)" % HUB_JOKE_PRICE
	var dir := Vector3(-sin(float(seat["face"])),0,-cos(float(seat["face"])))
	player.position = (seat["pos"] as Vector3)-dir*1.1+Vector3(0,0.75,0)
	seat_id = -1
	player.get_child(0).set_deferred("disabled",false)
	_pose_person(player_person,0.0,0.0)
	if hat_holder != null:
		hat_holder.position.y = 0.29
	game_panel.hide()

func _seated_tick(delta: float) -> void:
	player.velocity = Vector3.ZERO
	var seat: Dictionary = hub_seats[seat_id]
	var kind := String(seat["kind"])
	if kind == "ttt":
		_ttt_tick(int(seat["table"]),delta)
	elif kind == "rps":
		_rps_tick(int(seat["table"]),delta)
	elif kind == "show":
		_joke_tick(delta)

# ---------- game panel ----------
func _build_game_panel(root: Control) -> void:
	game_panel = PanelContainer.new()
	game_panel.add_theme_stylebox_override("panel",_panel(Color(0.07,0.15,0.2,0.94),20))
	root.add_child(game_panel)
	game_panel.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	game_panel.position = Vector2(24,212)
	var col := VBoxContainer.new()
	col.add_theme_constant_override("separation",10)
	game_panel.add_child(col)
	game_title = _label("",24,Color("f0bd62"))
	col.add_child(game_title)
	game_status = _label("",18,Color("cbd8de"))
	game_status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	game_status.custom_minimum_size = Vector2(360,0)
	col.add_child(game_status)
	ttt_grid = GridContainer.new()
	ttt_grid.columns = 3
	ttt_grid.add_theme_constant_override("h_separation",8)
	ttt_grid.add_theme_constant_override("v_separation",8)
	col.add_child(ttt_grid)
	for c in 9:
		var b := _button("",_ttt_tap.bind(c))
		b.custom_minimum_size = Vector2(112,74)
		b.add_theme_font_size_override("font_size",40)
		b.add_theme_color_override("font_disabled_color",Color("fff5dc"))
		ttt_grid.add_child(b)
		ttt_buttons.append(b)
	rps_row = HBoxContainer.new()
	rps_row.add_theme_constant_override("separation",8)
	col.add_child(rps_row)
	for k in 3:
		var b := _button(RPS_NAMES[k],_rps_pick.bind(k))
		b.custom_minimum_size = Vector2(116,64)
		b.add_theme_font_size_override("font_size",19)
		rps_row.add_child(b)
	show_row = HBoxContainer.new()
	col.add_child(show_row)
	var start := _button("START SHOW  $%d" % HUB_JOKE_PRICE,_joke_start)
	start.custom_minimum_size = Vector2(360,58)
	show_row.add_child(start)
	game_invite_button = _button("LOOKING FOR PLAYERS",_send_lfp)
	game_invite_button.custom_minimum_size = Vector2(360,52)
	game_invite_button.add_theme_font_size_override("font_size",18)
	game_invite_button.add_theme_stylebox_override("normal",_panel(Color("8a5a12"),18))
	col.add_child(game_invite_button)
	game_robot_button = _button("PLAY THE ROBOT INSTEAD",_play_robot)
	game_robot_button.custom_minimum_size = Vector2(360,52)
	game_robot_button.add_theme_font_size_override("font_size",18)
	col.add_child(game_robot_button)
	var stand := _button("STAND UP",_stand_up)
	stand.custom_minimum_size = Vector2(360,52)
	col.add_child(stand)
	game_panel.hide()

func _open_game_panel() -> void:
	var seat: Dictionary = hub_seats[seat_id]
	var kind := String(seat["kind"])
	if kind == "lounge":
		game_panel.hide()
		_show_toast("Relaxing in the lounge. Tap Chat to say hi, or STAND UP to leave.")
		return
	game_title.text = {"ttt":"TIC-TAC-TOE  ·  $%d to play, win $%d" % [TTT_PRICE,TTT_PRICE*2],"rps":"ROCK PAPER SCISSORS  ·  $%d a round, win $%d" % [RPS_PRICE,RPS_PRICE*2],"show":"COMEDY SHOW  ·  $%d for %d jokes" % [HUB_JOKE_PRICE,HUB_JOKE_SET]}[kind]
	ttt_grid.visible = kind == "ttt"
	rps_row.visible = kind == "rps"
	show_row.visible = kind == "show"
	game_panel.show()
	game_panel.reset_size()
	_refresh_game_panel()

func _refresh_game_panel() -> void:
	if seat_id < 0 or not game_panel.visible:
		return
	var seat: Dictionary = hub_seats[seat_id]
	var kind := String(seat["kind"])
	var t := int(seat["table"])
	game_robot_button.visible = false
	game_invite_button.visible = false
	if kind == "ttt":
		var g: Dictionary = ttt[t]
		var mine := int(seat["side"])+1
		ttt_grid.visible = _ttt_ready(t)
		for c in 9:
			var v := int(g["b"][c])
			ttt_buttons[c].text = ["","X","O"][v]
			ttt_buttons[c].disabled = v != 0 or bool(g["over"]) or int(g["turn"]) != mine or not _ttt_ready(t)
		if not _ttt_ready(t):
			game_status.text = "Waiting for another player to sit opposite you…"
			game_robot_button.visible = true
			game_invite_button.visible = true
		elif String(g["msg"]) != "":
			game_status.text = g["msg"]
		else:
			game_status.text = ("Your turn: you are %s." % ["","X","O"][mine]) if int(g["turn"]) == mine else "%s is thinking…" % _opponent_name(t,"ttt")
	elif kind == "rps":
		var g: Dictionary = rps[t]
		rps_row.visible = _rps_ready(t)
		for b in rps_row.get_children():
			(b as Button).disabled = int(g["me"]) >= 0 or not _rps_ready(t)
		if not _rps_ready(t):
			game_status.text = "Waiting for another player to sit opposite you…"
			game_robot_button.visible = true
			game_invite_button.visible = true
		elif String(g["msg"]) != "":
			game_status.text = g["msg"]
		else:
			game_status.text = "Pick one! ($%d)" % RPS_PRICE if int(g["me"]) < 0 else "You picked %s. Waiting for %s…" % [RPS_NAMES[int(g["me"])],_opponent_name(t,"rps")]
	elif kind == "show":
		game_status.text = ("Show in progress: %d jokes to go." % joke_left) if joke_left > 0 else "Sit back and enjoy the robot comedian."
		for b in show_row.get_children():
			(b as Button).disabled = joke_left > 0
	game_panel.reset_size()

func _play_robot() -> void:
	if seat_id < 0:
		return
	var seat: Dictionary = hub_seats[seat_id]
	if String(seat["kind"]) == "ttt":
		ttt[int(seat["table"])]["bot"] = true
	elif String(seat["kind"]) == "rps":
		rps[int(seat["table"])]["bot"] = true
	_refresh_game_panel()

func _peer_at(kind: String, table: int, side: int) -> String:
	var want := _seat_of(kind,table,side)
	for id in online_peers:
		if int(online_peers[id].get("seat",-1)) == want and not bool(online_peers[id]["driving"]):
			return id
	return ""

func _opponent_name(t: int, kind: String) -> String:
	var g: Dictionary = ttt[t] if kind == "ttt" else rps[t]
	if g["bot"]:
		return "the robot"
	var side := 1-int(hub_seats[seat_id]["side"])
	var id := _peer_at(kind,t,side)
	return String(online_peers[id]["name"]) if id != "" else "the other player"

func _pay(price: int) -> bool:
	if cash < price:
		_show_toast("You need $%d to play. Do a delivery job first!" % price)
		return false
	cash -= price
	_save_progress()
	return true

# ---------- tic-tac-toe ----------
const TTT_LINES := [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

func _ttt_ready(t: int) -> bool:
	var g: Dictionary = ttt[t]
	if g["bot"]:
		return true
	return _peer_at("ttt",t,1-int(hub_seats[seat_id]["side"])) != ""

func _ttt_winner(b: Array) -> int:
	for l in TTT_LINES:
		var v := int(b[l[0]])
		if v != 0 and v == int(b[l[1]]) and v == int(b[l[2]]):
			return v
	for v in b:
		if int(v) == 0:
			return 0
	return 3

func _ttt_bot_move(b: Array, me: int) -> int:
	var them := 3-me
	var free: Array = []
	for c in 9:
		if int(b[c]) == 0:
			free.append(c)
	if free.is_empty():
		return -1
	if randf() < 0.22:
		return free[randi() % free.size()]
	for who in [me,them]:
		for c in free:
			var test := b.duplicate()
			test[c] = who
			if _ttt_winner(test) == who:
				return c
	if 4 in free:
		return 4
	var corners: Array = []
	for c in [0,2,6,8]:
		if c in free:
			corners.append(c)
	if not corners.is_empty():
		return corners[randi() % corners.size()]
	return free[randi() % free.size()]

func _ttt_tap(c: int) -> void:
	if seat_id < 0 or String(hub_seats[seat_id]["kind"]) != "ttt":
		return
	var t := int(hub_seats[seat_id]["table"])
	var g: Dictionary = ttt[t]
	var mine := int(hub_seats[seat_id]["side"])+1
	if bool(g["over"]) or int(g["turn"]) != mine or int(g["b"][c]) != 0 or not _ttt_ready(t):
		return
	if not g["paid"]:
		if not _pay(TTT_PRICE):
			return
		g["paid"] = true
	g["b"][c] = mine
	g["turn"] = 3-mine
	g["botwait"] = 0.7
	if not g["bot"]:
		_online_game_send({"k":"t","tb":t,"b":_ttt_code(g["b"]),"n":int(g["turn"])})
	_ttt_check(t)
	_refresh_game_panel()

func _ttt_code(b: Array) -> String:
	var out := ""
	for v in b:
		out += str(int(v))
	return out

func _ttt_check(t: int) -> void:
	var g: Dictionary = ttt[t]
	var w := _ttt_winner(g["b"])
	if w == 0:
		return
	var mine := int(hub_seats[seat_id]["side"])+1
	g["over"] = true
	g["reset"] = 3.5
	if w == 3:
		if g["paid"]:
			cash += TTT_PRICE
		g["msg"] = "Draw! Your $%d is back." % TTT_PRICE
	elif w == mine:
		if g["paid"]:
			cash += TTT_PRICE*2
		g["msg"] = "You win! +$%d" % (TTT_PRICE*2)
		_emote(player_person,3)
	else:
		g["msg"] = "%s wins this one. Try again!" % _opponent_name(t,"ttt").capitalize()
	g["paid"] = false
	_save_progress()

func _ttt_tick(t: int, delta: float) -> void:
	var g: Dictionary = ttt[t]
	var mine := int(hub_seats[seat_id]["side"])+1
	if bool(g["over"]):
		g["reset"] = float(g["reset"])-delta
		if float(g["reset"]) <= 0.0:
			g["b"] = [0,0,0,0,0,0,0,0,0]
			g["turn"] = 1
			g["over"] = false
			g["msg"] = ""
			_refresh_game_panel()
		return
	if g["bot"] and int(g["turn"]) != mine:
		g["botwait"] = float(g["botwait"])-delta
		if float(g["botwait"]) <= 0.0:
			if not g["paid"] and _ttt_code(g["b"]) == "000000000":
				# The robot opens when you are O: you pay as the round starts.
				if not _pay(TTT_PRICE):
					return
				g["paid"] = true
			var c := _ttt_bot_move(g["b"],3-mine)
			if c >= 0:
				g["b"][c] = 3-mine
				g["turn"] = mine
				_ttt_check(t)
			_refresh_game_panel()

# ---------- rock paper scissors ----------
func _rps_ready(t: int) -> bool:
	var g: Dictionary = rps[t]
	if g["bot"]:
		return true
	return _peer_at("rps",t,1-int(hub_seats[seat_id]["side"])) != ""

func _rps_pick(k: int) -> void:
	if seat_id < 0 or String(hub_seats[seat_id]["kind"]) != "rps":
		return
	var t := int(hub_seats[seat_id]["table"])
	var g: Dictionary = rps[t]
	if int(g["me"]) >= 0 or not _rps_ready(t):
		return
	if not _pay(RPS_PRICE):
		return
	g["me"] = k
	g["msg"] = ""
	if g["bot"]:
		g["them"] = randi() % 3
	else:
		_online_game_send({"k":"r","tb":t,"v":k,"rd":int(g["round"])})
	_rps_resolve(t)
	_refresh_game_panel()

func _rps_resolve(t: int) -> void:
	var g: Dictionary = rps[t]
	var me := int(g["me"])
	var them := int(g["them"])
	if me < 0 or them < 0:
		return
	var who := _opponent_name(t,"rps")
	var res := (me-them+3) % 3
	if res == 0:
		cash += RPS_PRICE
		g["msg"] = "You: %s · %s: %s · Draw, $%d back." % [RPS_NAMES[me],who.capitalize(),RPS_NAMES[them],RPS_PRICE]
	elif res == 1:
		cash += RPS_PRICE*2
		g["msg"] = "You: %s · %s: %s · You win! +$%d" % [RPS_NAMES[me],who.capitalize(),RPS_NAMES[them],RPS_PRICE*2]
		_emote(player_person,3)
	else:
		g["msg"] = "You: %s · %s: %s · %s wins." % [RPS_NAMES[me],who.capitalize(),RPS_NAMES[them],who.capitalize()]
	g["me"] = -1
	g["them"] = -1
	g["round"] = int(g["round"])+1
	g["reset"] = 0.0
	_save_progress()

func _rps_tick(_t: int, _delta: float) -> void:
	pass

# ---------- online table messages ----------
func _online_game_send(payload: Dictionary) -> void:
	if not online_on or online_state != 3 or online_ws == null:
		return
	payload["i"] = online_id
	_online_send({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"gm","payload":payload},"ref":str(_online_next_ref()),"join_ref":"1"})

func _hub_game_msg(p: Dictionary) -> void:
	var from := String(p.get("i",""))
	if from == "" or from == online_id or not online_peers.has(from) or seat_id < 0:
		return
	var seat: Dictionary = hub_seats[seat_id]
	var t := int(p.get("tb",-1))
	if t != int(seat["table"]):
		return
	var side := 1-int(seat["side"])
	if String(p.get("k","")) == "t" and String(seat["kind"]) == "ttt" and _peer_at("ttt",t,side) == from:
		var code := String(p.get("b",""))
		if code.length() != 9:
			return
		var g: Dictionary = ttt[t]
		if g["bot"]:
			return
		if code == "000000000" or _ttt_code(g["b"]) == "000000000":
			if not g["paid"] and code != "000000000":
				if not _pay(TTT_PRICE):
					return
				g["paid"] = true
		var b: Array = []
		for ch in code:
			b.append(clampi(int(ch),0,2))
		g["b"] = b
		g["turn"] = clampi(int(p.get("n",1)),1,2)
		_ttt_check(t)
		_refresh_game_panel()
	elif String(p.get("k","")) == "r" and String(seat["kind"]) == "rps" and _peer_at("rps",t,side) == from:
		var g: Dictionary = rps[t]
		if g["bot"]:
			return
		g["them"] = clampi(int(p.get("v",0)),0,2)
		_rps_resolve(t)
		_refresh_game_panel()

# ---------- comedy show ----------
func _joke_start() -> void:
	if seat_id < 0 or String(hub_seats[seat_id]["kind"]) != "show" or joke_left > 0:
		return
	if not _pay(HUB_JOKE_PRICE):
		return
	joke_left = HUB_JOKE_SET
	joke_idx = randi() % HubJokes.JOKES.size()
	joke_phase = 0
	joke_timer = 0.3
	_refresh_game_panel()

func _joke_tick(delta: float) -> void:
	if joke_left <= 0:
		return
	joke_timer -= delta
	if robot_node != null:
		robot_node.position.y = HUB_STAGE.y+0.98+absf(sin(clock*6.0))*0.06
	if joke_timer > 0.0:
		return
	if joke_phase == 0:
		var text: String = HubJokes.JOKES[joke_idx % HubJokes.JOKES.size()]
		joke_idx += 1
		joke_label.text = text
		_show_toast(text)
		_speak(text)
		joke_timer = 2.0+float(text.length())*0.065
		joke_phase = 1
	else:
		joke_label.text = "Ba-dum-tss!"
		_play_rimshot()
		joke_left -= 1
		joke_timer = 2.2
		joke_phase = 0
		if joke_left <= 0:
			joke_label.text = "Thanks, you've been great! Another show? $%d" % HUB_JOKE_PRICE
		_refresh_game_panel()

func _speak(text: String) -> void:
	if "--smoke-test" in OS.get_cmdline_user_args() or not ProjectSettings.get_setting("audio/general/text_to_speech",false):
		return
	var voices := DisplayServer.tts_get_voices_for_language("en")
	if voices.is_empty():
		return
	DisplayServer.tts_stop()
	DisplayServer.tts_speak(text,voices[0],70,0.95,1.05)

func _play_rimshot() -> void:
	if fx_player == null or "--smoke-test" in OS.get_cmdline_user_args():
		return
	if rimshot == null:
		var sr := 22050
		var total := int(sr*1.2)
		var bytes := PackedByteArray()
		bytes.resize(total*2)
		var rng := RandomNumberGenerator.new()
		rng.seed = 7
		for i in total:
			var t := float(i)/sr
			var v := 0.0
			for hit in [0.0,0.16]:
				if t >= hit:
					var u: float = t-hit
					v += (rng.randf_range(-1.0,1.0)*0.5+sin(TAU*190.0*u)*0.5)*exp(-u*28.0)*0.5
			if t >= 0.34:
				var u := t-0.34
				v += rng.randf_range(-1.0,1.0)*exp(-u*4.0)*0.22*(0.6+0.4*sin(TAU*6100.0*u))
			bytes.encode_s16(i*2,int(clampf(v,-1.0,1.0)*28000.0))
		rimshot = AudioStreamWAV.new()
		rimshot.format = AudioStreamWAV.FORMAT_16_BITS
		rimshot.mix_rate = sr
		rimshot.data = bytes
	fx_player.stream = rimshot
	fx_player.play()

# ---------- quick chat and emotes ----------
func _build_chat(root: Control) -> void:
	chat_button = _button("Chat",_toggle_chat)
	chat_button.custom_minimum_size = Vector2(170,48)
	chat_button.add_theme_font_size_override("font_size",20)
	root.add_child(chat_button)
	chat_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	chat_button.position = Vector2(root.size.x-194,412)
	chat_panel = PanelContainer.new()
	chat_panel.add_theme_stylebox_override("panel",_panel(Color(0.07,0.15,0.2,0.94),18))
	root.add_child(chat_panel)
	chat_panel.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	var grid := GridContainer.new()
	grid.columns = 3
	grid.add_theme_constant_override("h_separation",8)
	grid.add_theme_constant_override("v_separation",8)
	chat_panel.add_child(grid)
	for k in HUB_PHRASES.size():
		var b := _button(HUB_PHRASES[k],_say.bind(k))
		b.custom_minimum_size = Vector2(170,50)
		b.add_theme_font_size_override("font_size",18)
		grid.add_child(b)
	var lfp := _button("Looking for players!",_send_lfp)
	lfp_button = lfp
	lfp.custom_minimum_size = Vector2(170,50)
	lfp.add_theme_font_size_override("font_size",16)
	lfp.add_theme_stylebox_override("normal",_panel(Color("8a5a12"),18))
	grid.add_child(lfp)
	for k in HUB_EMOTES.size():
		var b := _button("★ "+HUB_EMOTES[k],_do_emote.bind(k))
		b.custom_minimum_size = Vector2(170,50)
		b.add_theme_font_size_override("font_size",18)
		b.add_theme_stylebox_override("normal",_panel(Color("4a3d7a"),18))
		grid.add_child(b)
	chat_panel.reset_size()
	chat_panel.position = Vector2(root.size.x-chat_panel.size.x-212,150)
	chat_panel.hide()

func _toggle_chat() -> void:
	if paused:
		return
	chat_panel.visible = not chat_panel.visible
	if lfp_button != null:
		var ok := _at_pvp_table()
		lfp_button.disabled = not ok
		lfp_button.text = "Looking for players!" if ok else "Invite: sit at a\nPvP table first"

func _say(k: int) -> void:
	chat_panel.hide()
	my_bubble = k
	my_bubble_n += 1
	_bubble(player if not driving else car,HUB_PHRASES[k],2.6 if not driving else 3.2)

func _do_emote(k: int) -> void:
	chat_panel.hide()
	if driving:
		_show_toast("Get out of the car to do emotes.")
		return
	my_emote = k
	my_emote_n += 1
	_emote(player_person,k)

func _smoke_hub() -> void:
	# Causeway and entrance are open; the dome wall is solid elsewhere.
	for x in range(56,170,6):
		for lane in [-2.3,2.3]:
			assert(not _blocked_at(Vector3(float(x),1.0,32.0+lane),0.6),"Causeway blocked at x=%d by %s" % [x,_blocker(Vector3(float(x),1.0,32.0+lane),0.6)])
	for x in range(166,200,4):
		assert(not _blocked_at(Vector3(float(x),1.0,32.0),0.6),"Dome entrance path blocked at x=%d by %s" % [x,_blocker(Vector3(float(x),1.0,32.0),0.6)])
	for a in [0.0,PI/2.0,-PI/2.0,PI*0.75]:
		var pt := HUB_C+Vector3(cos(a),0,sin(a))*(HUB_R+0.4)+Vector3(0,1.5,0)
		assert(_blocked_at(pt,0.4),"Dome wall missing at angle %.2f" % a)
	assert(hub_bots.size() >= 6 and hub_seats.size() >= 30,"Dome seats and robot regulars built")
	# People walk in; cars are stopped by the bollards and evicted if they get inside anyway.
	var q := PhysicsShapeQueryParameters3D.new()
	var sph := SphereShape3D.new()
	sph.radius = 0.5
	q.shape = sph
	q.transform = Transform3D(Basis.IDENTITY,Vector3(HUB_BARRIER_X,1.0,30.0))
	q.exclude = [player.get_rid(),car.get_rid()]
	q.collision_mask = car.collision_mask
	assert(not get_world_3d().direct_space_state.intersect_shape(q,1).is_empty(),"Bollards stop cars")
	q.collision_mask = player.collision_mask
	assert(get_world_3d().direct_space_state.intersect_shape(q,1).is_empty(),"Bollards let people through")
	var was_car := [car.position,driving,cash]
	car.position = HUB_C+Vector3(0,0.8,5)
	_hub_keep_cars_out()
	assert(car.position.distance_to(HUB_PARK) < 0.1,"A car inside the dome is parked outside")
	car.position = was_car[0]
	driving = was_car[1]
	var was := [player.position,player.rotation,driving,cash,view_mode,walk_view]
	driving = false
	walk_view = 1
	_apply_view()
	# Walking up to a table zooms the camera in.
	player.position = HUB_C+Vector3(0,0.75,0)
	_follow_camera(1.0)
	var far_d := camera.global_position.distance_to(player.global_position)
	player.position = (TTT_TABLES[0] as Vector3)+Vector3(-2.2,0.75,0)
	_follow_camera(1.0)
	var near_d := camera.global_position.distance_to(player.global_position)
	assert(near_d < far_d*0.5,"Camera zooms in near a table (%.1f vs %.1f)" % [near_d,far_d])
	# Tic-tac-toe against the robot, played to the end.
	cash = 100
	var s0 := _seat_of("ttt",0,0)
	player.position = (hub_seats[s0]["pos"] as Vector3)+Vector3(0.3,0.75,0.3)
	assert(_nearest_seat() == s0,"Standing by a table offers its chair")
	_interact()
	assert(seat_id == s0 and game_panel.visible and ttt_grid.visible,"Sitting opens the tic-tac-toe board")
	var g: Dictionary = ttt[0]
	for step in 20:
		if bool(g["over"]):
			break
		if int(g["turn"]) == 1:
			for c in 9:
				if int(g["b"][c]) == 0:
					_ttt_tap(c)
					break
		else:
			_ttt_tick(0,1.0)
	assert(bool(g["over"]),"Tic-tac-toe game finished")
	assert(cash == 90 or cash == 100 or cash == 110,"Tic-tac-toe pays out correctly (cash %d)" % cash)
	_interact()
	assert(seat_id < 0 and not game_panel.visible,"STAND UP leaves the table")
	# Rock paper scissors against the robot.
	cash = 100
	var r0 := _seat_of("rps",0,0)
	player.position = (hub_seats[r0]["pos"] as Vector3)+Vector3(0.3,0.75,0)
	_interact()
	_rps_pick(0)
	assert(cash == 95 or cash == 100 or cash == 105,"Rock paper scissors pays out correctly (cash %d)" % cash)
	assert(String(rps[0]["msg"]).contains("ROCK"),"Result shows both picks")
	_stand_up()
	# Online match against a simulated player at a player-vs-player table.
	cash = 100
	var mine := _seat_of("ttt",2,0)
	var theirs := _seat_of("ttt",2,1)
	var peer_pos: Vector3 = hub_seats[theirs]["pos"]
	_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"pos","payload":{"i":"p2","n":"Mia","x":peer_pos.x,"y":0.0,"z":peer_pos.z,"r":0.0,"c":1,"d":0,"s":theirs,"qn":1,"q":0}}}))
	assert(online_peers.has("p2") and int(online_peers["p2"]["seat"]) == theirs,"Peer is seated")
	assert(_seat_taken(theirs),"A seated player's chair is taken")
	player.position = (hub_seats[mine]["pos"] as Vector3)+Vector3(0.3,0.75,0)
	_interact()
	assert(seat_id == mine and _ttt_ready(2),"Match starts when both players sit")
	var gm := func(code: String, turn: int) -> void:
		_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"gm","payload":{"i":"p2","k":"t","tb":2,"b":code,"n":turn}}}))
	_ttt_tap(0)
	assert(cash == 90 and _ttt_code(ttt[2]["b"]) == "100000000","First move pays $%d" % TTT_PRICE)
	gm.call("100200000",1)
	assert(_ttt_code(ttt[2]["b"]) == "100200000" and int(ttt[2]["turn"]) == 1,"Opponent move received")
	_ttt_tap(1)
	gm.call("110220000",1)
	_ttt_tap(2)
	assert(bool(ttt[2]["over"]) and cash == 110,"Winning an online match pays $%d (cash %d)" % [TTT_PRICE*2,cash])
	_stand_up()
	# Comedy show.
	cash = 100
	var show := _seat_of("show",0,0)
	player.position = (hub_seats[show]["pos"] as Vector3)+Vector3(0.2,0.75,0)
	_interact()
	assert(seat_id == show and show_row.visible,"Sofa opens the comedy show")
	_joke_start()
	assert(cash == 100-HUB_JOKE_PRICE and joke_left == HUB_JOKE_SET,"Show costs $%d" % HUB_JOKE_PRICE)
	_joke_tick(0.5)
	assert(HubJokes.JOKES.has(joke_label.text),"Robot tells a joke from the bank")
	for k in 30:
		_joke_tick(20.0)
	assert(joke_left == 0 and joke_label.text.contains("Another show"),"Show ends after %d jokes" % HUB_JOKE_SET)
	assert(HubJokes.JOKES.size() >= 90,"Joke bank is big enough")
	_stand_up()
	# Quick chat and emotes, for us and for a peer.
	var bubbles := hub_bubbles.size()
	_say(1)
	assert(hub_bubbles.size() == bubbles+1 and _online_pos_frame()["payload"]["payload"]["qn"] == my_bubble_n,"Quick chat shows a bubble and is sent online")
	_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"pos","payload":{"i":"p2","n":"Mia","x":peer_pos.x,"y":0.0,"z":peer_pos.z,"r":0.0,"c":1,"d":0,"s":-1,"qn":2,"q":3,"en":1,"e":2}}}))
	assert(hub_bubbles.size() == bubbles+2,"Peer chat bubble appears")
	assert(hub_emotes.any(func(e): return e["person"] == online_peers["p2"]["person"]),"Peer emote plays")
	_do_emote(0)
	assert(hub_emotes.any(func(e): return e["person"] == player_person),"Our emote plays")
	# Looking for players: an invite shows in the chat feed with ACCEPT, which teleports to the dome.
	assert(feed.any(func(f): return String(f["text"]).begins_with("Mia: ")),"Peer quick chat shows in the main chat")
	# Invites: Mia sits at player-vs-player tic-tac-toe table 3 and invites; ACCEPT seats us opposite her.
	var her_seat := _seat_of("ttt",3,1)
	var her_pos: Vector3 = hub_seats[her_seat]["pos"]
	_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"pos","payload":{"i":"p2","n":"Mia","x":her_pos.x,"y":0.0,"z":her_pos.z,"r":0.0,"c":1,"d":0,"s":her_seat,"qn":2,"q":3,"en":1,"e":2}}}))
	_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"lfp","payload":{"i":"p2","n":"Mia","k":"ttt","tb":3,"s":her_seat}}}))
	assert(feed.any(func(f): return f["from"] == "p2" and String(f["text"]).contains("tic-tac-toe")),"Invite appears in the main chat with the game")
	var accept_found := false
	for row in feed_box.get_children():
		for sub in row.get_children():
			if sub is Button and (sub as Button).text == "ACCEPT":
				accept_found = true
	assert(accept_found,"Invite has an ACCEPT button")
	driving = true
	car.position = Vector3(20,0.8,2.3)
	_accept_invite("p2")
	assert(not driving and seat_id == _seat_of("ttt",3,0) and car.position.distance_to(HUB_PARK) < 0.1,"ACCEPT seats us opposite the inviter, car parked outside")
	assert(_ttt_ready(3) and game_panel.visible and ttt_grid.visible,"The match is ready to play")
	assert(not feed.any(func(f): return f["from"] == "p2"),"Accepted invite leaves the chat")
	_stand_up()
	# An invite from someone who already stood up does not teleport.
	_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"lfp","payload":{"i":"p2","n":"Mia","k":"ttt","tb":3,"s":her_seat}}}))
	online_peers["p2"]["seat"] = -1
	var before_pos := player.position
	_accept_invite("p2")
	assert(seat_id < 0 and player.position == before_pos,"Stale invite does not teleport")
	# Looking for players needs a player-vs-player seat.
	lfp_last = -1000.0
	_send_lfp()
	assert(lfp_last < 0.0,"Invites need a player-vs-player table")
	player.position = (hub_seats[_seat_of("ttt",0,0)]["pos"] as Vector3)+Vector3(0.3,0.75,0)
	_interact()
	assert(not _at_pvp_table(),"Robot tables are not player-vs-player")
	_send_lfp()
	assert(lfp_last < 0.0,"No invites from robot tables")
	_stand_up()
	player.position = (hub_seats[_seat_of("ttt",2,0)]["pos"] as Vector3)+Vector3(0.3,0.75,0)
	_interact()
	assert(_at_pvp_table() and game_invite_button.visible,"Waiting at a PvP table shows LOOKING FOR PLAYERS")
	_send_lfp()
	assert(lfp_last < 0.0,"Looking for players still needs Online on")
	_stand_up()
	(online_peers["p2"]["node"] as Node3D).queue_free()
	online_peers.erase("p2")
	hub_emotes.clear()
	_pose_person(player_person,0.0,0.0)
	player.position = was[0]
	player.rotation = was[1]
	driving = was[2]
	cash = was[3]
	walk_view = was[5]
	view_mode = was[4]
	_apply_view()

func _hub_shots() -> void:
	# Developer-only: Harbor Dome from outside and inside, a game, the comedy show and chat. Never saves.
	player.position = Vector3(150,0.75,32)
	player.rotation.y = -PI/2.0
	for i in 30:
		await get_tree().physics_frame
	await _skyline_shot("hub-aerial",HUB_C,HUB_C+Vector3(-95,70,60))
	await _save_shot("hub-causeway")
	player.position = Vector3(185,0.75,32)
	walk_view = 3
	_apply_view()
	look_pitch = 0.12
	for i in 15:
		await get_tree().physics_frame
	await _save_shot("hub-inside-eye")
	_shot_stats("hub-inside-eye")
	walk_view = 2
	_apply_view()
	look_pitch = 0.0
	walk_view = 1
	_apply_view()
	player.position = (RPS_TABLES[1] as Vector3)+Vector3(0,0.75,9)
	for i in 30:
		await get_tree().physics_frame
	await _save_shot("hub-zoom-far")
	player.position = (RPS_TABLES[1] as Vector3)+Vector3(0,0.75,2.4)
	for i in 60:
		await get_tree().physics_frame
	await _save_shot("hub-zoom-near")
	walk_view = 2
	_apply_view()
	var s0 := _seat_of("ttt",0,0)
	player.position = (hub_seats[s0]["pos"] as Vector3)+Vector3(0.3,0.75,0)
	_interact()
	_ttt_tap(4)
	_ttt_tick(0,1.0)
	_ttt_tap(0)
	for i in 20:
		await get_tree().physics_frame
	await _save_shot("hub-tictactoe")
	print("ZOOM_SHOT")
	_stand_up()
	player.position = (hub_seats[_seat_of("ttt",2,0)]["pos"] as Vector3)+Vector3(0.3,0.75,0)
	_interact()
	for i in 10:
		await get_tree().physics_frame
	await _save_shot("hub-pvp-waiting")
	_stand_up()
	var show := _seat_of("show",0,1)
	player.position = (hub_seats[show]["pos"] as Vector3)+Vector3(0.2,0.75,0)
	_interact()
	_joke_start()
	walk_view = 3
	_apply_view()
	for i in 30:
		await get_tree().physics_frame
	await _save_shot("hub-comedy")
	_stand_up()
	walk_view = 2
	_apply_view()
	player.position = HUB_C+Vector3(-3,0.75,6)
	for i in 10:
		await get_tree().physics_frame
	_feed_add("Mia: Hi!","")
	_feed_add("Mia is looking for players at Harbor Dome!","p9")
	_say(0)
	_do_emote(2)
	_toggle_chat()
	for i in 20:
		await get_tree().physics_frame
	await _save_shot("hub-chat")
	get_tree().quit()

func _hub_keep_cars_out() -> void:
	# Cars never belong inside the dome (old saves, rescues or pushes): park them outside.
	if Vector2(car.position.x-HUB_C.x,car.position.z-HUB_C.z).length() > HUB_R-0.5:
		return
	if driving:
		driving = false
		player.position = Vector3(168,0.75,32)
		player.rotation.y = -PI/2.0
		player.show()
		player.get_child(0).set_deferred("disabled",false)
		_apply_view()
	car.position = HUB_PARK
	car.rotation = Vector3(0,PI/2.0,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	_show_toast("Harbor Dome is for people only. Your car is parked just outside the entrance.")

# ---------- v0.18.1: main chat feed and "looking for players" invites ----------
const LFP_COOLDOWN := 30.0
const INVITE_TIME := 30.0
var feed_box: VBoxContainer
var feed: Array = []
var lfp_last := -1000.0
var lfp_button: Button
var game_invite_button: Button

func _build_feed(root: Control) -> void:
	feed_box = VBoxContainer.new()
	feed_box.add_theme_constant_override("separation",4)
	feed_box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(feed_box)
	feed_box.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	feed_box.position = Vector2(root.size.x/2.0-330.0,root.size.y-250.0)
	feed_box.custom_minimum_size = Vector2(660,0)

func _feed_add(text: String, invite_from: String, invite := {}) -> void:
	feed.append({"text":text,"until":clock+(INVITE_TIME if invite_from != "" else 12.0),"from":invite_from,"invite":invite})
	while feed.size() > 4:
		feed.pop_front()
	_feed_render()

func _feed_render() -> void:
	if feed_box == null:
		return
	for child in feed_box.get_children():
		if child is Button:
			touch_buttons.erase(child)
		for sub in child.get_children():
			if sub is Button:
				touch_buttons.erase(sub)
		child.queue_free()
	for item in feed:
		var row := HBoxContainer.new()
		row.add_theme_constant_override("separation",8)
		row.mouse_filter = Control.MOUSE_FILTER_IGNORE
		feed_box.add_child(row)
		var lab := _label(String(item["text"]),18,Color("fff5dc") if item["from"] == "" else Color("ffd86a"))
		lab.add_theme_constant_override("outline_size",6)
		lab.add_theme_color_override("font_outline_color",Color("132b3a"))
		lab.add_theme_stylebox_override("normal",_panel(Color(0.06,0.13,0.18,0.72),10))
		row.add_child(lab)
		if item["from"] != "":
			var accept := _button("JOIN" if (item.get("invite",{}) as Dictionary).has("race") else "ACCEPT",_accept_invite.bind(String(item["from"])))
			accept.custom_minimum_size = Vector2(120,40)
			accept.add_theme_font_size_override("font_size",18)
			accept.add_theme_stylebox_override("normal",_panel(Color("f0bd62"),12))
			accept.add_theme_color_override("font_color",Color("182b38"))
			row.add_child(accept)

func _feed_tick() -> void:
	var changed := false
	for i in range(feed.size()-1,-1,-1):
		if clock > float(feed[i]["until"]):
			feed.remove_at(i)
			changed = true
	if changed:
		_feed_render()

func _online_event_send(event: String, payload: Dictionary) -> void:
	if not online_on or online_state != 3 or online_ws == null:
		return
	payload["i"] = online_id
	payload["n"] = online_name
	_online_send({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":event,"payload":payload},"ref":str(_online_next_ref()),"join_ref":"1"})

func _at_pvp_table() -> bool:
	if seat_id < 0:
		return false
	var seat: Dictionary = hub_seats[seat_id]
	var kind := String(seat["kind"])
	return (kind == "ttt" or kind == "rps") and int(seat["table"]) >= 2

func _game_name(kind: String) -> String:
	return "tic-tac-toe" if kind == "ttt" else "rock paper scissors"

func _send_lfp() -> void:
	chat_panel.hide()
	if not _at_pvp_table():
		_show_toast("Sit at a PLAYER VS PLAYER table in Harbor Dome first, then invite players.")
		return
	if not online_on or online_state != 3:
		_show_toast("Turn Online on first (top right), then look for players.")
		return
	if clock-lfp_last < LFP_COOLDOWN:
		_show_toast("Invite sent recently. Try again in %d s." % int(LFP_COOLDOWN-(clock-lfp_last)))
		return
	lfp_last = clock
	var seat: Dictionary = hub_seats[seat_id]
	_online_event_send("lfp",{"k":seat["kind"],"tb":int(seat["table"]),"s":seat_id})
	_feed_add("You invited players to %s…" % _game_name(String(seat["kind"])),"")
	_bubble(player,"Looking for players!",2.0)

func _lfp_msg(event: String, p: Dictionary) -> void:
	var from := String(p.get("i",""))
	if from == "" or from == online_id or from.length() > 24:
		return
	var nm := _online_clean_name(String(p.get("n","Player")))
	if event == "lfp":
		var kind := String(p.get("k",""))
		var seat := int(p.get("s",-1))
		if (kind != "ttt" and kind != "rps") or seat < 0 or seat >= hub_seats.size() or String(hub_seats[seat]["kind"]) != kind:
			return
		var invite := {"k":kind,"tb":int(hub_seats[seat]["table"]),"s":seat}
		for item in feed:
			if item["from"] == from:
				item["until"] = clock+INVITE_TIME
				item["invite"] = invite
				return
		_feed_add("%s wants to play %s at Harbor Dome!" % [nm,_game_name(kind)],from,invite)
	elif event == "lfa" and String(p.get("to","")) == online_id:
		_feed_add("%s accepted! Taking the seat opposite you." % nm,"")
		_show_toast("%s accepted your invite!" % nm)

func _accept_invite(from: String) -> void:
	if paused:
		return
	if trial_active >= 0 or chase_mode != 0 or online_role != 0 or bus_riding or sky_riding or sky_wait >= 0:
		_show_toast("Finish your trial, chase or bus ride first, then accept.")
		return
	var invite := {}
	for i in range(feed.size()-1,-1,-1):
		if feed[i]["from"] == from:
			invite = feed[i]["invite"]
			feed.remove_at(i)
	_feed_render()
	if invite.is_empty():
		return
	if invite.has("race"):
		_join_race(from,invite)
		return
	if race_car:
		_race_car_end(true)
	var nm := String(online_peers[from]["name"]) if online_peers.has(from) else "The other player"
	var their_seat := int(invite["s"])
	if online_peers.has(from) and int(online_peers[from].get("seat",-1)) != their_seat:
		_show_toast("%s has already left the table." % nm)
		return
	var target := _seat_of(String(invite["k"]),int(invite["tb"]),1-int(hub_seats[their_seat]["side"]))
	if target < 0 or (_seat_taken(target) and target != seat_id):
		_show_toast("Someone already took that seat. Try the next invite!")
		return
	if seat_id >= 0:
		_stand_up()
	if driving:
		driving = false
		player.show()
	car.position = HUB_PARK
	car.rotation = Vector3(0,PI/2.0,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	_sit(target)
	_apply_view()
	_follow_camera(1.0)
	_online_event_send("lfa",{"to":from})
	_show_toast("You joined %s at %s. Have fun!" % [nm,_game_name(String(invite["k"]))])
	_refresh_hud()

# ---------- v0.18.2: nickname and HUD relayout ----------
const NICK_MIN := 3
const NICK_MAX := 14
const NICK_BLOCK := ["fuck","fuk","shit","bitch","cunt","dick","cock","pussy","nigg","fag","whore","slut","rape","nazi","hitler","asshole","bastard","porn","penis","vagina","retard","wank","twat"]
var nick_chosen := false
var nick_from_online := false
var nick_button: Button
var nick_panel: PanelContainer
var nick_edit: LineEdit
var nick_info: Label
var hud_pause_button: Button

func _nick_rude(name: String) -> bool:
	var squash := ""
	for ch in name.to_lower():
		if ch >= "a" and ch <= "z":
			squash += ch
	var leet := name.to_lower().replace("0","o").replace("1","i").replace("3","e").replace("4","a").replace("5","s").replace("7","t").replace("@","a").replace("$","s")
	var leet_squash := ""
	for ch in leet:
		if ch >= "a" and ch <= "z":
			leet_squash += ch
	for w in NICK_BLOCK:
		if squash.contains(w) or leet_squash.contains(w):
			return true
	return false

func _clean_nick(raw: String) -> String:
	# Returns the cleaned nickname, or "" if it is not allowed.
	var out := ""
	for ch in raw.strip_edges():
		var ok := (ch >= "a" and ch <= "z") or (ch >= "A" and ch <= "Z") or (ch >= "0" and ch <= "9") or ch == " " or ch == "_" or ch == "-"
		if ok and not (ch == " " and out.ends_with(" ")):
			out += ch
	out = out.strip_edges()
	if out.length() < NICK_MIN or out.length() > NICK_MAX or _nick_rude(out):
		return ""
	return out

func _build_nick_panel(root: Control) -> void:
	nick_panel = PanelContainer.new()
	root.add_child(nick_panel)
	nick_panel.custom_minimum_size = Vector2(520,0)
	nick_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var col := VBoxContainer.new()
	col.add_theme_constant_override("separation",12)
	nick_panel.add_child(col)
	col.add_child(_label("YOUR NICKNAME",26,Color("f0bd62")))
	var help := _label("Other online players see it on your name tag, in chat and in invites.\n%d-%d letters, numbers, spaces, - or _." % [NICK_MIN,NICK_MAX],17,Color("cbd8de"))
	help.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	help.custom_minimum_size.x = 470
	col.add_child(help)
	nick_edit = LineEdit.new()
	nick_edit.max_length = NICK_MAX
	nick_edit.placeholder_text = "Type a nickname"
	nick_edit.custom_minimum_size = Vector2(470,60)
	nick_edit.add_theme_font_size_override("font_size",26)
	nick_edit.virtual_keyboard_enabled = true
	nick_edit.virtual_keyboard_type = LineEdit.KEYBOARD_TYPE_DEFAULT
	nick_edit.text_submitted.connect(func(_t): _save_nick())
	col.add_child(nick_edit)
	nick_info = _label("",17,Color("ff9a8a"))
	col.add_child(nick_info)
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation",12)
	col.add_child(row)
	var save := _button("Save",_save_nick)
	save.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(save)
	var random := _button("Random",_random_nick)
	random.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(random)
	var back := _button("Back",_close_nick)
	back.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(back)
	nick_panel.hide()

func _open_nick() -> void:
	if not paused:
		_toggle_menu()
	nick_edit.text = online_name if nick_chosen else ""
	nick_info.text = ""
	_open_panel(nick_panel)
	nick_edit.grab_focus()
	nick_edit.select_all()

func _random_nick() -> void:
	var a := ["Swift","Lucky","Harbor","Neon","Sunny","Turbo","Misty","Rocket","Coral","Pixel"]
	var b := ["Fox","Racer","Gull","Comet","Tiger","Otter","Rider","Wave","Star","Panda"]
	nick_edit.text = "%s%s%d" % [a[randi() % a.size()],b[randi() % b.size()],randi() % 90+10]
	nick_info.text = ""

func _save_nick() -> void:
	var nick := _clean_nick(nick_edit.text)
	if nick == "":
		var raw := nick_edit.text.strip_edges()
		nick_info.text = "Please use %d-%d characters." % [NICK_MIN,NICK_MAX] if raw.length() < NICK_MIN or raw.length() > NICK_MAX else "That name is not allowed. Try another one."
		return
	online_name = nick
	nick_chosen = true
	_save_progress()
	_refresh_nick_button()
	nick_edit.release_focus()
	DisplayServer.virtual_keyboard_hide()
	_show_toast("Nickname saved: %s" % nick)
	if nick_from_online:
		nick_from_online = false
		_toggle_menu()
	else:
		_close_sub()

func _close_nick() -> void:
	nick_edit.release_focus()
	DisplayServer.virtual_keyboard_hide()
	if nick_from_online:
		nick_from_online = false
		_toggle_menu()
	else:
		_close_sub()

func _refresh_nick_button() -> void:
	if nick_button != null:
		nick_button.text = "Nickname: %s" % (online_name if nick_chosen and online_name != "" else "(not set)")

func _relayout_hud() -> void:
	var view := get_viewport().get_visible_rect().size
	if hud_pause_button != null:
		hud_pause_button.position = Vector2(view.x-194,24)
	radio_button.position = Vector2(view.x-194,92)
	online_button.position = Vector2(view.x-376,92)
	radio_caption.position = Vector2(view.x-(604 if minimap != null else 394),150)
	chase_label.position = Vector2(view.x/2-260,24)
	joystick.position = Vector2(32,view.y-210)
	action_button.position = Vector2(view.x-248,view.y-124)
	status_label.position = Vector2(view.x/2-340,view.y-48)
	if minimap != null:
		if _clean_on():
			minimap.scale = Vector2.ONE*CLEAN_MINI_SCALE
			minimap.position = Vector2(view.x-MINI_SIZE*CLEAN_MINI_SCALE-18.0,18)
		else:
			minimap.scale = Vector2.ONE
			minimap.position = Vector2(view.x-218,154)
	if view_button != null:
		view_button.position = Vector2(view.x-194,356)
	if chat_button != null:
		chat_button.position = Vector2(view.x-194,412)
	if travel_button != null:
		travel_button.position = Vector2(view.x-194,480)
	if chat_panel != null:
		chat_panel.position = Vector2(view.x-chat_panel.size.x-212,150)
	if feed_box != null:
		feed_box.position = Vector2(view.x/2.0-330.0,view.y-250.0)
	if hud_arrow != null:
		hud_arrow.position = Vector2(view.x/2.0-70.0,96)
	if lvl_root != null:
		lvl_root.position = Vector2(view.x/2.0-310.0,view.y*0.3-130.0)
		lvl_flash.size = view
	_rw_layout(view)
	_layout_panels()

func _smoke_nick() -> void:
	assert(_clean_nick("  Koko  ") == "Koko" and _clean_nick("Night  Rider_7") == "Night Rider_7","Nicknames are tidied")
	assert(_clean_nick("ab") == "" and _clean_nick("abcdefghijklmnop") == "","Nickname length 3-14")
	assert(_clean_nick("K<o>k!o") == "Koko","Odd symbols are removed")
	assert(_clean_nick("BigShit") == "" and _clean_nick("sh1t head") == "" and _clean_nick("Hitler99") == "","Rude names are refused")
	assert(_online_clean_name("f.u.c.k") == "Player" and _online_clean_name("Mia") == "Mia","Rude names from other players are hidden")
	var was := [online_name,nick_chosen,paused]
	_open_nick()
	assert(paused and nick_panel.visible and not menu.visible,"Nickname panel opens from the menu")
	nick_edit.text = "x"
	_save_nick()
	assert(nick_panel.visible and nick_info.text.contains("3-14"),"Too-short name explains the rule")
	nick_edit.text = "Captain Koko"
	_save_nick()
	assert(online_name == "Captain Koko" and nick_chosen and menu.visible,"Nickname saved, back to the menu")
	assert(nick_button.text == "Nickname: Captain Koko","Menu shows the nickname")
	assert(_online_pos_frame()["payload"]["payload"]["n"] == "Captain Koko","Nickname is sent to other players")
	online_name = "Someone"
	_load_progress()
	assert(online_name == "Captain Koko" and nick_chosen,"Nickname survives a reload")
	nick_from_online = true
	_open_nick()
	nick_edit.text = "Racer_9"
	_save_nick()
	assert(not paused and not nick_panel.visible,"First-time prompt returns straight to the game")
	online_name = was[0]
	nick_chosen = was[1]
	_save_progress()
	_refresh_nick_button()
	if paused != was[2]:
		_toggle_menu()

func _nick_shots() -> void:
	# Developer-only: the nickname panel. Never saves.
	for i in 20:
		await get_tree().physics_frame
	_open_nick()
	nick_edit.text = "Captain Koko"
	for i in 5:
		await get_tree().process_frame
	await _save_shot("nickname")
	_close_nick()
	if paused:
		_toggle_menu()
	DisplayServer.window_set_size(Vector2i(1843,720))
	for i in 20:
		await get_tree().process_frame
	await _save_shot("relayout-wide")
	get_tree().quit()

func _smoke_sites_reachable() -> void:
	# Every discovery site must stand on open ground at walking height (players cannot jump).
	blocked_skip_traffic = true
	var groups := [["find",FINDS],["civic",CIVIC],["ridge",RIDGE],["bay",BAY],["north",NORTH],["marina",MARINA],["skyline",DOWNTOWN]]
	for g in groups:
		for site in g[1]:
			var pos: Vector3 = site["pos"]
			assert(not _blocked_at(pos+Vector3(0,1.0,0),0.4),"%s site %s is inside something (%s)" % [g[0],site["name"],_blocker(pos+Vector3(0,1.0,0),0.4)])
			var ray := PhysicsRayQueryParameters3D.create(pos+Vector3(0,2.5,0),pos+Vector3(0,-1.5,0))
			var skip: Array[RID] = [player.get_rid(),car.get_rid()]
			for t in traffic:
				skip.append((t["node"] as CollisionObject3D).get_rid())
			ray.exclude = skip
			var hit := get_world_3d().direct_space_state.intersect_ray(ray)
			assert(not hit.is_empty() and absf((hit["position"] as Vector3).y-pos.y) < 0.4,"%s site %s is not on walkable ground (ground at %s)" % [g[0],site["name"],str(hit.get("position","none"))])
	for x in CIV_AVES:
		for r in _civ_ranges(true,x):
			var z := float(r[0])+3.0
			while z < float(r[1])-3.0:
				for lane in [-2.5,2.5]:
					assert(not _blocked_at(Vector3(x+lane,1.0,z),0.7),"Civic avenue blocked at %s by %s" % [str(Vector3(x+lane,0,z)),_blocker(Vector3(x+lane,1.0,z),0.7)])
				z += 6.0
	for z in CIV_STREETS:
		for r in _civ_ranges(false,z):
			var x := float(r[0])+3.0
			while x < float(r[1])-1.0:
				for lane in [-2.5,2.5]:
					assert(not _blocked_at(Vector3(x,1.0,z+lane),0.7),"Civic street blocked at %s by %s" % [str(Vector3(x,0,z+lane)),_blocker(Vector3(x,1.0,z+lane),0.7)])
				x += 6.0
	blocked_skip_traffic = false

# ---------- v0.19.0: Civic Center (bigger starting area: police, hospital, school, hotels, mall, park) ----------
const CIV_AVES := [-95.0,-140.0,-185.0,-230.0]
const CIV_STREETS := [32.0,72.0,112.0]
const CIV_SOUTH := 152.0
const CIV_SOUTH_EAST := -109.5
const CIV_X0 := -246.0
const CIV_X1 := -55.5
const CIV_Z0 := 17.0
const CIV_Z1 := 106.0
const CIV_AVE_GAPS := [[-140.0,77.0,107.0]]
const CIVIC := [
	{"name":"Police Station","pos":Vector3(-74,0,39.5),"pay":300},
	{"name":"Harbor Hospital","pos":Vector3(-114,0,38.5),"pay":300},
	{"name":"Grand Hotel","pos":Vector3(-162.5,0,39),"pay":350},
	{"name":"Harbor High School","pos":Vector3(-207.5,0,39),"pay":350},
	{"name":"Seaside Hotel","pos":Vector3(-74,0,80),"pay":300},
	{"name":"Civic Mall","pos":Vector3(-140,0,74.5),"pay":400},
	{"name":"Civic Park","pos":Vector3(-207.5,0,81),"pay":300},
	{"name":"Harbor Bank","pos":Vector3(-162.5,0,119.5),"pay":400},
	{"name":"Fire Station","pos":Vector3(-212,0,119.5),"pay":350},
	{"name":"City Library","pos":Vector3(-123.5,0,119.5),"pay":300},
]
const CIVIC_BONUS := 1500
var civic_mask := 0
var civic_nodes: Array[Node3D] = []

func _civic_count() -> int:
	var n := 0
	for i in CIVIC.size():
		if civic_mask & (1 << i):
			n += 1
	return n

func _nearest_civic() -> int:
	var closest := -1
	var best := INF
	var body: CharacterBody3D = car if driving else player
	for i in CIVIC.size():
		if civic_mask & (1 << i):
			continue
		var pos: Vector3 = CIVIC[i]["pos"]
		var d := Vector2(body.position.x-pos.x,body.position.z-pos.z).length()
		if d < best:
			best = d
			closest = i
	return closest

func _check_civic() -> void:
	var body: CharacterBody3D = car if driving else player
	for i in CIVIC.size():
		var found := (civic_mask & (1 << i)) != 0
		var pos: Vector3 = CIVIC[i]["pos"]
		civic_nodes[i].visible = not found
		civic_nodes[i].rotation.y = clock
		civic_nodes[i].position.y = pos.y+1.7+sin(clock*2+i)*0.25
		if found:
			continue
		if Vector2(body.position.x-pos.x,body.position.z-pos.z).length() < 4.5 and absf(body.position.y-pos.y) < 3.5:
			_discover_civic(i)

func _discover_civic(i: int) -> void:
	if civic_mask & (1 << i):
		return
	civic_mask |= 1 << i
	var count := _civic_count()
	var reward := int(CIVIC[i]["pay"])
	if count == CIVIC.size():
		reward += CIVIC_BONUS
	cash += reward
	civic_nodes[i].hide()
	_save_progress()
	_show_toast("%s discovered!  %d/%d  +$%d%s" % [CIVIC[i]["name"],count,CIVIC.size(),reward,"  CIVIC CENTER COMPLETE!" if count == CIVIC.size() else ""])

func _civ_ranges(is_ave: bool, c: float) -> Array:
	var ranges: Array
	if is_ave:
		ranges = [[CIV_Z0,(CIV_Z1 if c > CIV_SOUTH_EAST else CIV_SOUTH)]]
	elif is_equal_approx(c,112.0):
		ranges = [[CIV_X0,CIV_SOUTH_EAST]]
	else:
		ranges = [[CIV_X0,(-52.0 if is_equal_approx(c,32.0) else CIV_X1)]]
	if is_ave:
		for g in CIV_AVE_GAPS:
			if is_equal_approx(float(g[0]),c):
				ranges = _cut_ranges(ranges,float(g[1]),float(g[2]))
	return ranges

func _civ_has(is_ave: bool, c: float, t: float) -> bool:
	for r in _civ_ranges(is_ave,c):
		if t >= float(r[0])-0.01 and t <= float(r[1])+0.01:
			return true
	return false

func _civ_near_cross(is_ave: bool, t: float, margin: float) -> bool:
	for c in (CIV_STREETS if is_ave else CIV_AVES):
		if absf(t-float(c)) < margin:
			return true
	return false

func _build_civic() -> void:
	var walk := Color("a9a69e")
	var asphalt := Color("394552")
	var rock := Color("8a8377")
	var cx := (CIV_X0+CIV_X1)/2.0
	var cz := (CIV_Z0+CIV_Z1)/2.0
	_slab(Vector3(cx,-0.35,cz),Vector3(CIV_X1-CIV_X0,0.6,CIV_Z1-CIV_Z0),0,walk)
	# South row (bank, fire station, library) beyond the mall and park. v0.27: no walls around the Civic Center.
	_slab(Vector3((CIV_X0+CIV_SOUTH_EAST)/2.0,-0.35,(CIV_Z1+CIV_SOUTH)/2.0),Vector3(CIV_SOUTH_EAST-CIV_X0,0.6,CIV_SOUTH-CIV_Z1),0,walk)
	var roads := []
	var dashes := []
	var zebra := []
	var poles := []
	var ns_caps := []
	var ew_caps := []
	for x in CIV_AVES:
		for r in _civ_ranges(true,x):
			roads.append([Vector3(x,0.01,(float(r[0])+float(r[1]))/2.0),Vector3(10,0.08,float(r[1])-float(r[0]))])
			var z := float(r[0])+4.0
			while z < float(r[1])-2.0:
				if not _civ_near_cross(true,z,7.0):
					dashes.append([Vector3(x,0.06,z),Vector3(0.18,0.02,3)])
				z += 8.0
	for z in CIV_STREETS:
		for r in _civ_ranges(false,z):
			roads.append([Vector3((float(r[0])+float(r[1]))/2.0,0.012,z),Vector3(float(r[1])-float(r[0]),0.08,10)])
			var x := float(r[0])+4.0
			while x < float(r[1])-2.0:
				if not _civ_near_cross(false,x,7.0):
					dashes.append([Vector3(x,0.062,z),Vector3(3,0.02,0.18)])
				x += 8.0
	for x in CIV_AVES:
		for z in CIV_STREETS:
			if not (_civ_has(true,x,z) and _civ_has(false,z,x)):
				continue
			light_spots.append(Vector3(x,0,z))
			for s in [-1.0,1.0]:
				if _civ_has(true,x,z+s*8.0):
					for k in 6:
						zebra.append([Vector3(x-4.0+1.6*k,0.065,z+s*7.2),Vector3(0.7,0.02,2.6)])
				if _civ_has(false,z,x+s*8.0):
					for k in 6:
						zebra.append([Vector3(x+s*7.2,0.067,z-4.0+1.6*k),Vector3(2.6,0.02,0.7)])
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x+6.2,0,z+6.2),PI,true,3.7)
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x-6.2,0,z-6.2),0.0,true,3.7)
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x-6.2,0,z+6.2),PI/2.0,false,3.7)
			_signal_pole(poles,ns_caps,ew_caps,Vector3(x+6.2,0,z-6.2),-PI/2.0,false,3.7)
	_box_batch(asphalt,roads)
	_box_batch(Color("e7d9a4"),dashes)
	_box_batch(Color("eef0ec"),zebra)
	_model_batch("res://models/traffic_light.glb",poles)
	var ns_inst := _box_batch(Color.WHITE,ns_caps)
	var ew_inst := _box_batch(Color.WHITE,ew_caps)
	if ns_inst != null:
		ns_inst.material_override = light_ns_mat
	if ew_inst != null:
		ew_inst.material_override = light_ew_mat
	# Landmark buildings (fronts face the street to the north, so yaw PI).
	var items := {}
	_place(items,"police",Vector3(-74,0,52),PI,0.9)
	_place(items,"hospital",Vector3(-114,0,52),PI,0.85)
	_collider(self,Vector3(-114-19.0*0.85,2.1*0.85,52+2.0*0.85),Vector3(8,4.2,7)*0.85)
	_place(items,"tower_1",Vector3(-162.5,0,52),PI)
	_place(items,"school",Vector3(-207.5,0,48),PI)
	_place(items,"hotel",Vector3(-74,0,93),PI)
	_place(items,"mall",Vector3(-140,0,93),PI,0.8)
	_place(items,"bank",Vector3(-162.5,0,134),PI)
	_place(items,"fire_station",Vector3(-207.5,0,134),PI)
	_collider(self,Vector3(-200,1.4,120.4),Vector3(2.6,2.8,9.6))
	_place(items,"library",Vector3(-123.5,0,134),PI,0.7)
	for key in items:
		_model_batch("res://models/%s.glb" % key,items[key])
	_box_batch(Color("b9b4a8"),[[Vector3(-74,0.03,52),Vector3(30,0.06,28)],[Vector3(-117.5,0.03,52),Vector3(33,0.06,28)],[Vector3(-162.5,0.03,52),Vector3(33,0.06,28)],[Vector3(-74,0.03,91.5),Vector3(30,0.06,27)],[Vector3(-140,0.03,91.5),Vector3(78,0.06,27)]])
	# School basketball court and the park.
	_box_batch(Color("c96a3f"),[[Vector3(-207.5,0.04,61.5),Vector3(18,0.06,9)]])
	_box_batch(Color("f4f1e8"),[[Vector3(-207.5,0.075,61.5),Vector3(0.15,0.02,9)],[Vector3(-207.5,0.075,57.1),Vector3(18,0.02,0.15)],[Vector3(-207.5,0.075,65.9),Vector3(18,0.02,0.15)]])
	for hx in [-216.0,-199.0]:
		_box(self,Vector3(hx,1.6,61.5),Vector3(0.12,3.2,0.12),Color("3b444c"))
		_box(self,Vector3(hx+(0.3 if hx < -207.5 else -0.3),3.1,61.5),Vector3(0.1,0.9,1.4),Color("f4f1e8"))
	var park := Vector3(-207.5,0,91.5)
	_box_batch(Color("74b062"),[[park+Vector3(0,0.035,0),Vector3(33,0.06,27)]])
	_box_batch(Color("e3cfa3"),[[park+Vector3(0,0.07,0),Vector3(31,0.04,3)],[park+Vector3(0,0.072,0),Vector3(3,0.04,25)]])
	_model_batch("res://models/fountain.glb",[[park,0.0,0.6]])
	_collider(self,park+Vector3(0,0.5,0),Vector3(8.4,1.0,8.4))
	var trees := []
	var rng := RandomNumberGenerator.new()
	rng.seed = 1900
	for p in [Vector3(-218,0,84),Vector3(-198,0,84),Vector3(-219,0,99),Vector3(-196,0,100),Vector3(-212,0,103),Vector3(-201,0,95)]:
		trees.append([p,rng.randf()*TAU,rng.randf_range(0.8,1.1)])
	for x in range(-238,-60,12):
		trees.append([Vector3(float(x),0,21.0),rng.randf()*TAU,0.7])
	for z in range(22,150,10):
		if absf(float(z)-112.0) > 7.0 and absf(float(z)-72.0) > 7.0:
			trees.append([Vector3(-240.5,0,float(z)),rng.randf()*TAU,0.7])
	_model_batch("res://models/tree_round.glb",trees)
	# Playground: slide and swings (visual).
	_box(self,Vector3(-216,1.0,96),Vector3(0.8,2.0,0.8),Color("e8685a"))
	var slide := _box(self,Vector3(-216,0.9,98.2),Vector3(0.8,0.1,3.4),Color("f2c94c"))
	slide.rotation_degrees.x = 30.0
	for sx in [-200.0,-196.0]:
		_box(self,Vector3(sx,1.3,100),Vector3(0.12,2.6,0.12),Color("3b444c"))
	_box(self,Vector3(-198,2.6,100),Vector3(4.2,0.12,0.12),Color("3b444c"))
	_model_batch("res://models/bench.glb",[[park+Vector3(-8,0,-1.7),0.0],[park+Vector3(8,0,-1.7),0.0],[park+Vector3(-1.7,0,8),PI/2.0]])
	# Lamps along the streets.
	var lamps := []
	for z in CIV_STREETS:
		for x in range(-236,(-118 if z > 100.0 else -60),18):
			if not _civ_near_cross(false,float(x),8.0):
				lamps.append([Vector3(float(x),0,z+5.6),PI/2.0])
				lamps.append([Vector3(float(x)+9.0,0,z-5.6),-PI/2.0])
	_model_batch("res://models/lamp.glb",lamps)
	_sign("CIVIC CENTER",Vector3(-58,7.5,32),Color("ffe9b8"),58)
	_box_batch(Color("b9b4a8"),[[Vector3(-162.5,0.03,135),Vector3(33,0.06,34)],[Vector3(-207.5,0.03,135),Vector3(33,0.06,34)],[Vector3(-123.5,0.03,135),Vector3(23,0.06,34)]])
	_sign("POLICE",Vector3(-74,10.5,44),Color("cfe2ff"),56)
	_sign("HARBOR HOSPITAL",Vector3(-117.5,16,44),Color("ffd0d0"),56)
	_sign("GRAND HOTEL",Vector3(-162.5,62,52),Color("ffe2a8"),72)
	_sign("HARBOR HIGH SCHOOL",Vector3(-207.5,13,42),Color("ffe9b8"),52)
	_sign("SEASIDE HOTEL",Vector3(-74,17.6,94.6),Color("e8f7ff"),60)
	_sign("CIVIC MALL",Vector3(-140,15,80),Color("ffd6e0"),60)
	_sign("CIVIC PARK",Vector3(-207.5,6,79),Color("d8f5c8"),48)
	_sign("HARBOR BANK",Vector3(-162.5,15.5,121),Color("ffe9b8"),58)
	_sign("FIRE STATION",Vector3(-207.5,11,124),Color("ffd0c8"),56)
	_sign("CITY LIBRARY",Vector3(-123.5,11,126),Color("c8f0ef"),52)
	for site in CIVIC:
		civic_nodes.append(_civic_token(site["pos"],site["name"]))

func _civic_token(pos: Vector3, label: String) -> Node3D:
	var token := Node3D.new()
	token.position = pos+Vector3(0,1.7,0)
	add_child(token)
	var gem := MeshInstance3D.new()
	var crystal := PrismMesh.new()
	crystal.size = Vector3(0.9,1.3,0.9)
	gem.mesh = crystal
	var mat := _material(Color("8fe36b"))
	mat.emission_enabled = true
	mat.emission = Color("3f8a2a")
	gem.material_override = mat
	token.add_child(gem)
	_sign(label.to_upper(),pos+Vector3(0,4.4,0),Color("d9ffc8"),36)
	_box(self,pos+Vector3(0,0.1,0),Vector3(2.4,0.18,2.4),Color("2f5a26"))
	return token

func _civic_shots() -> void:
	# Developer-only: the Civic Center. Never saves.
	driving = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	car.position = Vector3(-100,0.8,34.5)
	car.rotation = Vector3(0,PI/2.0,0)
	for i in 150:
		await get_tree().physics_frame
	await _skyline_shot("civic-aerial",Vector3(-150,0,62),Vector3(-40,95,-15))
	await _skyline_shot("civic-street",Vector3(-150,6,52),Vector3(-88,8,28))
	await _skyline_shot("civic-school-park",Vector3(-207,2,72),Vector3(-170,24,40))
	await _skyline_shot("civic-south-row",Vector3(-165,4,132),Vector3(-150,22,98))
	_follow_camera(1.0)
	await _save_shot("civic-game")
	_open_map()
	await _save_shot("civic-map")
	get_tree().quit()

var hub_zoom := 0.0
var hub_spot := Vector3.ZERO

func _hub_focus() -> Vector3:
	# The nearest thing worth zooming in on inside the dome, or INF.
	if driving or player.position.distance_to(HUB_C) > HUB_R:
		return Vector3.INF
	if seat_id >= 0:
		var seat: Dictionary = hub_seats[seat_id]
		var k := String(seat["kind"])
		if k == "ttt":
			return TTT_TABLES[int(seat["table"])]
		if k == "rps":
			return RPS_TABLES[int(seat["table"])]
		if k == "show":
			return HUB_STAGE
		return seat["pos"]
	var best := Vector3.INF
	var best_d := 7.0
	var spots: Array = TTT_TABLES+RPS_TABLES+[Vector3(180,0,10),HUB_STAGE+Vector3(-7.5,0,0),Vector3(180,0,54)]
	for p in spots:
		var d := Vector2(player.position.x-(p as Vector3).x,player.position.z-(p as Vector3).z).length()
		if d < best_d:
			best_d = d
			best = p
	return best

# ---------- v0.21.0: Harbor Raceway (real circuit, pit lane, inside parking, boosters, spikes) ----------
const RW_X0 := 205.0
const RW_X1 := 620.0
const RW_Z0 := -440.0
const RW_Z1 := -40.0
# Visitor parking inside the gate (cars only; race cars come from the pit lane).
const RW_LOT_X1 := 257.5
const RW_LOT_Z0 := -250.5
const RACE_PARK := Vector3(248.25,0.8,-141.5)
const RW_DESK := Vector3(262,0,-138)
const RW_PIT := Vector3(295.5,0.8,-205)
const RACE_MAX := 30.0
const RACE_ACCEL := 16.0
const RACE_TURN := 4.6
const RACE_COLOR := Color("ff7a1a")
# Circuit control points in race order (smoothed with a centripetal Catmull-Rom spline).
const RW_TRACK := [Vector2(312,-150),Vector2(312,-210),Vector2(312,-270),Vector2(312,-325),Vector2(318,-365),Vector2(338,-395),Vector2(370,-409),Vector2(415,-411),Vector2(470,-411),Vector2(520,-409),Vector2(556,-398),Vector2(576,-372),Vector2(580,-342),Vector2(568,-322),Vector2(567,-303),Vector2(582,-284),Vector2(588,-250),Vector2(589,-205),Vector2(586,-165),Vector2(572,-132),Vector2(545,-118),Vector2(505,-118),Vector2(474,-126),Vector2(458,-150),Vector2(455,-185),Vector2(455,-230),Vector2(452,-262),Vector2(438,-288),Vector2(414,-292),Vector2(401,-272),Vector2(399,-240),Vector2(399,-195),Vector2(398,-150),Vector2(390,-110),Vector2(370,-80),Vector2(340,-66),Vector2(320,-78),Vector2(313,-105),Vector2(312,-128)]
const RW_TRACK_W := 14.0
const RW_STEP := 2.5
const RW_WALL := 16.0
const RW_GRID := [Vector2(-3,6),Vector2(3,10),Vector2(-3,14),Vector2(3,18)]
const BOOST_PRICE := 50
const SPIKE_PRICE := 40
const GP_PRICE := 50
const TA_PRICE := 20
const GP_PRIZES := [300,150,75,0]
const AI_NAMES := ["Blaze","Nova","Turbo Tom"]
const AI_COLORS := [Color("2f5fd0"),Color("7ac74f"),Color("e8559a")]
# AI drivers use the exact same race car (top speed, acceleration, boosters, spikes) as players.
# They only differ in how much they lift for corners.
const AI_CORNER := [0.26,0.31,0.36]
var race_car := false
var race_parked_pos := Vector3.ZERO
var race_parked_rot := 0.0
var race_ghost: Node3D
var rw_path := {}
var rw_corner: Array = []
var rw_gate_idx: Array = []
var rec_act := 0
var rec_count := 0.0
var rec_t := 0.0
var rec_lap := 0
var rec_gate := 0
var rec_started := false
var rec_laps := 2
var rec_lap_t0 := 0.0
var rec_ai: Array = []
var rec_online := false
var rec_race_id := ""
var rec_results: Array = []
var rec_last_count := -1
var boost_t := 0.0
var slow_t := 0.0
var offtrack := false
var boosts := 0
var spikes := 0
var rw_best_lap := 0.0
var rw_best_gp := 0.0
# Kept only so older saves load and save unchanged (the jump and drag events were removed in 0.21).
var rw_best_jump := 0.0
var rw_best_drag := 0.0
var spike_strips: Array = []
var rw_panel: PanelContainer
var rw_info: Label
var rw_buttons := {}
var rw_board: Label3D
var rec_big: Label
var boost_button: Button
var spike_button: Button
var online_bests := {}

func _in_raceway(p: Vector3) -> bool:
	return p.x > RW_X0 and p.x < RW_X1 and p.z > RW_Z0 and p.z < RW_Z1

func _in_rw_lot(p: Vector3) -> bool:
	return p.x > RW_X0 and p.x < RW_LOT_X1 and p.z > RW_LOT_Z0 and p.z < RW_Z1

func _box_batch_rot(color: Color, items: Array) -> MultiMeshInstance3D:
	# items: [position, size, yaw]
	if items.is_empty():
		return null
	var multi := MultiMesh.new()
	multi.transform_format = MultiMesh.TRANSFORM_3D
	multi.mesh = BoxMesh.new()
	multi.instance_count = items.size()
	for i in items.size():
		var it: Array = items[i]
		multi.set_instance_transform(i,Transform3D(Basis(Vector3.UP,float(it[2]))*Basis.from_scale(it[1]),it[0]))
		_note_road(it[0],it[1],float(it[2]),color)
	var inst := MultiMeshInstance3D.new()
	inst.multimesh = multi
	inst.material_override = _material(color)
	add_child(inst)
	return inst

func _multi_collider(items: Array, layer := 1) -> StaticBody3D:
	# One static body holding many boxes. items: [position, size, yaw]
	var body := StaticBody3D.new()
	body.collision_layer = layer
	body.collision_mask = 0
	add_child(body)
	for it in items:
		var shape := CollisionShape3D.new()
		var box := BoxShape3D.new()
		box.size = it[1]
		shape.shape = box
		shape.transform = Transform3D(Basis(Vector3.UP,float(it[2])),it[0])
		body.add_child(shape)
	return body

# ---------- circuit geometry ----------
func _cr_point(p0: Vector2, p1: Vector2, p2: Vector2, p3: Vector2, u: float) -> Vector2:
	# Centripetal Catmull-Rom between p1 and p2 (u in 0..1): no loops or overshoot on uneven spacing.
	var t0 := 0.0
	var t1 := t0+sqrt(maxf(p0.distance_to(p1),0.01))
	var t2 := t1+sqrt(maxf(p1.distance_to(p2),0.01))
	var t3 := t2+sqrt(maxf(p2.distance_to(p3),0.01))
	var t := lerpf(t1,t2,u)
	var a1 := p0*((t1-t)/(t1-t0))+p1*((t-t0)/(t1-t0))
	var a2 := p1*((t2-t)/(t2-t1))+p2*((t-t1)/(t2-t1))
	var a3 := p2*((t3-t)/(t3-t2))+p3*((t-t2)/(t3-t2))
	var b1 := a1*((t2-t)/(t2-t0))+a2*((t-t0)/(t2-t0))
	var b2 := a2*((t3-t)/(t3-t1))+a3*((t-t1)/(t3-t1))
	return b1*((t2-t)/(t2-t1))+b2*((t-t1)/(t2-t1))

func _rw_build_path() -> void:
	var g := RW_TRACK.size()
	var way: Array = []
	rw_gate_idx.clear()
	for i in g:
		var p0: Vector2 = RW_TRACK[(i-1+g) % g]
		var p1: Vector2 = RW_TRACK[i]
		var p2: Vector2 = RW_TRACK[(i+1) % g]
		var p3: Vector2 = RW_TRACK[(i+2) % g]
		rw_gate_idx.append(way.size())
		var parts := maxi(1,int(ceil(p1.distance_to(p2)/RW_STEP)))
		for k in parts:
			way.append(_cr_point(p0,p1,p2,p3,float(k)/float(parts)))
	var n := way.size()
	var cum: Array = [0.0]
	for i in n:
		cum.append(float(cum[i])+(way[(i+1) % n] as Vector2).distance_to(way[i]))
	rw_path = {"way":way,"cum":cum,"total":cum[n]}
	# How sharply the track turns over the next ~35 m (used by the AI to lift for corners).
	var ahead := int(35.0/RW_STEP)
	rw_corner.clear()
	for i in n:
		var d0 := _rw_dir(i)
		var turn := 0.0
		for k in range(1,ahead+1):
			turn = maxf(turn,absf(d0.angle_to(_rw_dir(i+k))))
		rw_corner.append(turn)

func _rw_dir(i: int) -> Vector2:
	var way: Array = rw_path["way"]
	var n := way.size()
	return ((way[(i+1) % n] as Vector2)-(way[(i-1+n) % n] as Vector2)).normalized()

func _rw_bend(i: int) -> float:
	# Signed heading change around node i (positive = turning towards the +perp side).
	var a := _rw_dir(i-3)
	var b := _rw_dir(i+3)
	return a.x*b.y-a.y*b.x

func _ribbon(color: Color, quads: Array, y: float) -> void:
	# quads: [[a0,b0,b1,a1], ...] Vector2 corners on the ground, drawn flat at height y.
	if quads.is_empty():
		return
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	st.set_normal(Vector3.UP)
	for q in quads:
		var v: Array = []
		for c in q:
			v.append(Vector3((c as Vector2).x,y,(c as Vector2).y))
		for idx in [0,1,2,0,2,3]:
			st.add_vertex(v[idx])
	var mi := MeshInstance3D.new()
	mi.mesh = st.commit()
	var m := _material(color)
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	mi.material_override = m
	add_child(mi)

func _rw_band(a: float, b: float, keep: Callable) -> Array:
	# Quads between lateral offsets a..b for every path segment where keep(i) is true.
	var way: Array = rw_path["way"]
	var n := way.size()
	var out: Array = []
	for i in n:
		if not keep.call(i):
			continue
		var j := (i+1) % n
		var ni := _rw_dir(i)
		var nj := _rw_dir(j)
		var qa := Vector2(-ni.y,ni.x)
		var qb := Vector2(-nj.y,nj.x)
		var ci: Vector2 = way[i]
		var cj: Vector2 = way[j]
		out.append([ci+qa*a,ci+qa*b,cj+qb*b,cj+qb*a])
	return out

func _rw_keepout(p: Vector2) -> bool:
	# Places where trackside walls must not go: pit lane and paddock, grandstands, bridge towers.
	if p.x < 306.0 and p.y > -362.0:
		return true
	for r in [Rect2(340,-272,20,104),Rect2(550,-267,20,104),Rect2(424,-443,12,12),Rect2(424,-391,12,12)]:
		if (r as Rect2).has_point(p):
			return true
	return p.x < RW_X0+3.0 or p.x > RW_X1-3.0 or p.y < RW_Z0+3.0 or p.y > RW_Z1-3.0

func _build_raceway() -> void:
	var rock := Color("7d776c")
	var grass := Color("6aa35a")
	var paved := Color("a9a69e")
	_rw_build_path()
	# Approach road east from the North Highway's Industrial Quarter cross street (z = -150).
	_slab(Vector3((110.5+RW_X0)/2.0,-0.35,-150),Vector3(RW_X0-110.5,0.6,14),0,paved)
	_box(self,Vector3((110.5+RW_X0)/2.0,0.012,-150),Vector3(RW_X0-110.5,0.08,10),Color("394552"))
	var road_dash := []
	for x in range(116,200,8):
		road_dash.append([Vector3(float(x),0.06,-150),Vector3(3,0.02,0.18)])
	_box_batch(Color("e7d9a4"),road_dash)
	_sign("HARBOR RACEWAY  →\nparking inside",Vector3(118,6.5,-150),Color("ffd8a8"),56)
	# Venue ground and walls (entrance gap on the west wall at z -157..-143).
	var cx := (RW_X0+RW_X1)/2.0
	var cz := (RW_Z0+RW_Z1)/2.0
	_slab(Vector3(cx,-0.35,cz),Vector3(RW_X1-RW_X0,0.6,RW_Z1-RW_Z0),0,grass)
	var stripes := []
	var sz2 := RW_Z0
	while sz2 < RW_Z1:
		stripes.append([Vector3((291.0+RW_X1)/2.0,0.0,sz2+3.0),Vector3(RW_X1-291.0,0.04,6.0)])
		sz2 += 12.0
	_box_batch(Color("5f984f"),stripes)
	var arch := _sign("HARBOR RACEWAY",Vector3(RW_X0+1,9,-150),Color("ffd8a8"),80)
	arch.outline_size = 14
	for z in [-157.5,-142.5]:
		_box(self,Vector3(RW_X0+1,4,z),Vector3(1.2,8,1.2),Color("ff7a1a"),true)
	_box(self,Vector3(RW_X0+1,8.2,-150),Vector3(1.4,1.0,16),Color("23262b"))
	_build_rw_parking()
	_build_rw_pits()
	_build_rw_track()
	_build_rw_trackside()
	_rw_refresh_board()

func _build_rw_parking() -> void:
	var paved := Color("a9a69e")
	# Big visitor lot just inside the gate (about 240 bays). Cars stop at the bollards; people walk on.
	var lot_w := RW_LOT_X1-RW_X0
	var lot_d := RW_Z1-RW_LOT_Z0
	_box_batch(Color("3d434a"),[[Vector3((RW_X0+RW_LOT_X1)/2.0,0.04,(RW_Z1+RW_LOT_Z0)/2.0),Vector3(lot_w,0.1,lot_d)]])
	var lines := []
	for row in [[213.0,218.5],[225.5,231.0],[233.0,238.5],[245.5,251.0]]:
		var z := -56.0
		while z > -246.0:
			if z <= -143.0 or z >= -157.0:
				lines.append([Vector3((float(row[0])+float(row[1]))/2.0,0.1,z),Vector3(float(row[1])-float(row[0]),0.02,0.14)])
			z -= 3.0
		for edge in row:
			lines.append([Vector3(float(edge),0.1,-150.0),Vector3(0.12,0.02,0.1)])
	_box_batch(Color("f4f1e8"),lines)
	# Planted median and footpaths.
	_box_batch(Color("5f984f"),[[Vector3(232,0.08,-100),Vector3(1.8,0.1,84)],[Vector3(232,0.08,-201),Vector3(1.8,0.1,86)]])
	_box_batch(paved,[[Vector3(209.25,0.08,-145),Vector3(7.5,0.1,210)],[Vector3(254.25,0.08,-145),Vector3(6.5,0.1,210)]])
	var trees := []
	for z in range(-64,-244,-12):
		if absf(float(z)+150.0) > 10.0:
			trees.append([Vector3(232,0,float(z)),0.0,0.7])
	_model_batch("res://models/tree_round.glb",trees)
	var lamps := []
	for z in range(-60,-250,-20):
		lamps.append([Vector3(208,0,float(z)),PI/2.0,1.0])
		lamps.append([Vector3(255,0,float(z)),-PI/2.0,1.0])
	_model_batch("res://models/lamp.glb",lamps)
	# Car-only bollard line on the east and north edges of the lot.
	var posts := []
	var z2 := RW_Z1-1.0
	while z2 > RW_LOT_Z0:
		posts.append([Vector3(RW_LOT_X1,0.45,z2),Vector3(0.28,0.9,0.28)])
		z2 -= 1.6
	var x2 := RW_X0+1.0
	while x2 < RW_LOT_X1:
		posts.append([Vector3(x2,0.45,RW_LOT_Z0),Vector3(0.28,0.9,0.28)])
		x2 += 1.6
	_box_batch(Color("f2c94c"),posts)
	_multi_collider([[Vector3(RW_LOT_X1,1.0,(RW_Z1+RW_LOT_Z0)/2.0),Vector3(0.6,2.0,lot_d),0.0],[Vector3((RW_X0+RW_LOT_X1)/2.0,1.0,RW_LOT_Z0),Vector3(lot_w,2.0,0.6),0.0]],HUB_CAR_LAYER)
	_sign("PARKING\npark here · walk to the Pit Desk",Vector3(214,5.5,-150),Color("bff4f0"),44)
	var p_sign := _sign("P",Vector3(230,9,-150),Color("6fb6ff"),120)
	p_sign.outline_size = 16

func _build_rw_pits() -> void:
	var paved := Color("8f8c85")
	# Paddock between the parking lot and the pit building.
	_box_batch(paved,[[Vector3((RW_LOT_X1+291.0)/2.0,0.04,-200),Vector3(291.0-RW_LOT_X1,0.1,320)]])
	_prop("res://models/hub_counter.glb",RW_DESK+Vector3(3,0,0),Vector3(6.2,1.2,1.4),-90.0,Color("22b5c9"))
	_sign("PIT DESK\nrace car · boosters · spikes",RW_DESK+Vector3(3,4.4,0),Color("bff4f0"),40)
	_model_batch("res://models/billboard.glb",[[Vector3(266,0,-168),-PI/2.0,1.3]])
	rw_board = Label3D.new()
	rw_board.font_size = 48
	rw_board.pixel_size = 0.016
	rw_board.modulate = Color("23262b")
	rw_board.outline_size = 0
	rw_board.position = Vector3(265.55,9.5,-168)
	rw_board.rotation.y = -PI/2.0
	add_child(rw_board)
	# Pit building: 15 garages facing the pit lane, race control tower at the north end.
	_prop("res://models/pit_building.glb",Vector3(283,0,-225),Vector3(150,10,14),90.0,Color("eef0f1"),false)
	_collider(self,Vector3(283,5,-225),Vector3(14,10,150))
	_collider(self,Vector3(283,13,-294),Vector3(10,26,10))
	_sign("PIT GARAGES",Vector3(283,14,-160),Color("ffd8a8"),48)
	# Pit lane with entry and exit, pit wall, and painted pit boxes.
	var asphalt := Color("33383e")
	_box_batch(asphalt,[[Vector3(295.5,0.07,-220),Vector3(9.0,0.1,220)]])
	_box_batch_rot(asphalt,[[Vector3(303.25,0.068,-99),Vector3(9.0,0.1,26),atan2(-(311.0-295.5),-(-88.0+110.0))],[Vector3(303.25,0.068,-341),Vector3(9.0,0.1,26),atan2(-(311.0-295.5),-(-352.0+330.0))]])
	var marks := []
	for i in 15:
		marks.append([Vector3(294.5,0.13,-155.0-float(i)*10.0),Vector3(4.0,0.02,6.0)])
	_box_batch(Color("c96a2a"),marks)
	_box_batch(Color("f4f1e8"),[[Vector3(291.2,0.13,-220),Vector3(0.25,0.02,220)],[Vector3(299.8,0.13,-220),Vector3(0.25,0.02,220)]])
	_box(self,Vector3(303,0.55,-220),Vector3(0.8,1.1,216),Color("e2e4e6"),true)
	var wall_stripes := []
	for z in range(-114,-328,-6):
		wall_stripes.append([Vector3(303,0.56,float(z)),Vector3(0.84,1.12,3.0)])
	_box_batch(Color("d33a3a"),wall_stripes)
	_sign("PIT LANE",Vector3(299,4,-104),Color("fff5dc"),40)
	_sign("PIT EXIT",Vector3(299,4,-334),Color("fff5dc"),40)

func _build_rw_track() -> void:
	var way: Array = rw_path["way"]
	var n := way.size()
	var bends: Array = []
	for i in n:
		bends.append(_rw_bend(i))
	var corner := func(i: int) -> bool: return absf(float(bends[i])) > 0.035
	var hw := RW_TRACK_W/2.0
	# Asphalt, white edge lines, kerbs on corners (both sides), gravel traps on the outside of corners.
	_ribbon(Color("2f3338"),_rw_band(-hw,hw,func(_i): return true),0.12)
	_ribbon(Color("f4f1e8"),_rw_band(-hw+0.25,-hw+0.55,func(_i): return true),0.15)
	_ribbon(Color("f4f1e8"),_rw_band(hw-0.55,hw-0.25,func(_i): return true),0.15)
	for side: float in [-1.0,1.0]:
		var a: float = hw*side
		var b: float = (hw+1.5)*side
		_ribbon(Color("d33a3a"),_rw_band(minf(a,b),maxf(a,b),func(i): return corner.call(i) and i % 2 == 0),0.17)
		_ribbon(Color("f4f1e8"),_rw_band(minf(a,b),maxf(a,b),func(i): return corner.call(i) and i % 2 == 1),0.17)
		var outer := func(i: int) -> bool: return absf(float(bends[i])) > 0.05 and signf(float(bends[i])) == -side
		var g0: float = (hw+1.5)*side
		var g1: float = (RW_WALL-1.0)*side
		_ribbon(Color("d8c39a"),_rw_band(minf(g0,g1),maxf(g0,g1),outer),0.09)
	# Start / finish: chequered line, grid boxes, light gantry.
	var checks := []
	var checks_w := []
	for i in 10:
		for j in 2:
			((checks if (i+j) % 2 == 0 else checks_w) as Array).append([Vector3(305.7+float(i)*1.4,0.15,-150.7+float(j)*1.4),Vector3(1.4,0.02,1.4)])
	_box_batch(Color("1b1b1b"),checks)
	_box_batch(Color("f4f1e8"),checks_w)
	var grid := []
	for slot in RW_GRID:
		var s: Vector2 = slot
		grid.append([Vector3(312.0+s.x,0.15,-150.0+s.y-2.6),Vector3(3.0,0.02,0.25)])
		grid.append([Vector3(312.0+s.x-1.4,0.15,-150.0+s.y-1.6),Vector3(0.25,0.02,2.0)])
		grid.append([Vector3(312.0+s.x+1.4,0.15,-150.0+s.y-1.6),Vector3(0.25,0.02,2.0)])
	_box_batch(Color("f4f1e8"),grid)
	_prop("res://models/start_gantry.glb",Vector3(314,0,-151.5),Vector3(25,9,1.2),0.0,Color("3a4048"),false)
	_collider(self,Vector3(302,4.2,-151.5),Vector3(0.8,8.5,0.8))
	_collider(self,Vector3(326,4.2,-151.5),Vector3(0.8,8.5,0.8))
	_sign("START / FINISH",Vector3(314,10.6,-151.5),Color("fff5dc"),48)

func _build_rw_trackside() -> void:
	var way: Array = rw_path["way"]
	var n := way.size()
	# Trackside walls: armco on straights, red/white tyre walls on corners, with colliders.
	var armco := []
	var tyre_r := []
	var tyre_w := []
	var shapes := []
	var i := 0
	while i < n:
		var j := (i+2) % n
		for side in [-1.0,1.0]:
			var di := _rw_dir(i)
			var dj := _rw_dir(j)
			var a: Vector2 = (way[i] as Vector2)+Vector2(-di.y,di.x)*RW_WALL*side
			var b: Vector2 = (way[j] as Vector2)+Vector2(-dj.y,dj.x)*RW_WALL*side
			var mid := (a+b)/2.0
			if _rw_keepout(mid) or _rw_keepout(a) or _rw_keepout(b) or _rw_point_dist(mid) < RW_WALL-1.5:
				continue
			var d := b-a
			var yaw := atan2(-d.x,-d.y)
			var length := d.length()+0.4
			if absf(_rw_bend(i)) > 0.05:
				((tyre_r if (i/2) % 2 == 0 else tyre_w) as Array).append([Vector3(mid.x,0.55,mid.y),Vector3(1.2,1.1,length),yaw])
				shapes.append([Vector3(mid.x,0.55,mid.y),Vector3(1.2,1.1,length),yaw])
			else:
				armco.append([Vector3(mid.x,0.5,mid.y),Vector3(0.35,1.0,length),yaw])
				shapes.append([Vector3(mid.x,0.5,mid.y),Vector3(0.35,1.0,length),yaw])
		i += 2
	_box_batch_rot(Color("b9c2c8"),armco)
	_box_batch_rot(Color("d33a3a"),tyre_r)
	_box_batch_rot(Color("eef1f2"),tyre_w)
	_multi_collider(shapes)
	# Grandstands: main stand facing the start/finish straight, second stand on the east straight.
	_prop("res://models/grandstand.glb",Vector3(350,0,-220),Vector3(100,18,14),-90.0,Color("a3a6a3"),false)
	_collider(self,Vector3(350,9,-220),Vector3(14,18,100))
	_prop("res://models/grandstand.glb",Vector3(560,0,-215),Vector3(100,18,14),90.0,Color("a3a6a3"),false)
	_collider(self,Vector3(560,9,-215),Vector3(14,18,100))
	# Footbridge over the back straight.
	_prop("res://models/footbridge.glb",Vector3(430,0,-411),Vector3(54,9,4),90.0,Color("eef0f1"),false)
	_collider(self,Vector3(430,3.5,-437),Vector3(6,7,5))
	_collider(self,Vector3(430,3.5,-385),Vector3(6,7,5))
	# Billboards, marshal posts and trees well clear of the track.
	_model_batch("res://models/billboard.glb",[[Vector3(475,0,-432),0.0,1.2],[Vector3(540,0,-432),0.0,1.2],[Vector3(612,0,-200),-PI/2.0,1.2],[Vector3(380,0,-45),PI,1.2]])
	var marshal := []
	var mk := 0
	while mk < n:
		var di := _rw_dir(mk)
		var p: Vector2 = (way[mk] as Vector2)+Vector2(-di.y,di.x)*(RW_WALL+2.5)
		if not _rw_keepout(p) and _rw_point_dist(p) > RW_WALL+1.0:
			marshal.append([Vector3(p.x,1.0,p.y),Vector3(1.6,2.0,1.6)])
		mk += 48
	_box_batch(Color("ff9a3a"),marshal)
	var rng := RandomNumberGenerator.new()
	rng.seed = 2021
	var round_t := []
	var pine_t := []
	var tries := 0
	while round_t.size()+pine_t.size() < 90 and tries < 2000:
		tries += 1
		var p := Vector2(rng.randf_range(296.0,RW_X1-6.0),rng.randf_range(RW_Z0+6.0,RW_Z1-6.0))
		if _rw_keepout(p) or _rw_point_dist(p) < RW_WALL+6.0:
			continue
		((round_t if rng.randf() < 0.6 else pine_t) as Array).append([Vector3(p.x,0,p.y),rng.randf()*TAU,rng.randf_range(0.8,1.3)])
	for k in 16:
		var p2 := Vector2(rng.randf_range(212.0,250.0),rng.randf_range(-430.0,-262.0)) if k % 2 == 0 else Vector2(rng.randf_range(255.0,288.0),rng.randf_range(-430.0,-368.0))
		pine_t.append([Vector3(p2.x,0,p2.y),rng.randf()*TAU,rng.randf_range(0.9,1.3)])
	_model_batch("res://models/tree_round.glb",round_t)
	_model_batch("res://models/tree_pine.glb",pine_t)

# ---------- race car rental ----------
func _model_key() -> int:
	return 100 if race_car else car_id

func _race_car_start() -> void:
	if race_car:
		return
	if paused:
		_toggle_menu()
	if driving:
		driving = false
	# Your own car waits in the parking lot (shown as a parked copy).
	if not _in_rw_lot(car.position):
		car.position = RACE_PARK
		car.rotation = Vector3(0,PI/2.0,0)
	race_parked_pos = car.position
	race_parked_rot = car.rotation.y
	if race_ghost != null:
		race_ghost.queue_free()
	race_ghost = _try_model("res://models/car_%d.glb" % int(CARS[car_id].get("model",car_id)))
	if race_ghost != null:
		race_ghost.position = race_parked_pos
		race_ghost.rotation.y = race_parked_rot
		add_child(race_ghost)
		var body_m := StandardMaterial3D.new()
		body_m.albedo_color = car_body_mat.albedo_color
		var roof_m := StandardMaterial3D.new()
		roof_m.albedo_color = car_roof_mat.albedo_color
		_tint_ghost(race_ghost,body_m,roof_m)
	race_car = true
	_apply_car()
	car.position = RW_PIT
	car.rotation = Vector3(0,0,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	driving = true
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	_apply_view()
	_follow_camera(1.0)
	_show_toast("Your race car is ready in the pit lane! Everyone drives the same car. Tap RACEWAY MENU to race.")

func _tint_ghost(node: Node, body_m: Material, roof_m: Material) -> void:
	if node is MeshInstance3D and (node as MeshInstance3D).mesh != null:
		var mi := node as MeshInstance3D
		for s in mi.mesh.get_surface_count():
			var m := mi.mesh.surface_get_material(s)
			var key := m.resource_name if m != null else ""
			if key.begins_with("Body"):
				mi.set_surface_override_material(s,body_m)
			elif key.begins_with("Cabin"):
				mi.set_surface_override_material(s,roof_m)
	for child in node.get_children():
		_tint_ghost(child,body_m,roof_m)

func _race_car_end(silent := false) -> void:
	if not race_car:
		return
	if paused:
		_toggle_menu()
	_rec_stop()
	race_car = false
	boost_t = 0.0
	slow_t = 0.0
	if race_ghost != null:
		race_ghost.queue_free()
		race_ghost = null
	car.position = race_parked_pos
	car.rotation = Vector3(0,race_parked_rot,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	driving = false
	player.position = RW_DESK+Vector3(-3.0,0.75,0)
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	_apply_car()
	_apply_view()
	if not silent:
		_show_toast("Race car returned. Your own car is in the parking lot.")

func _race_keep_cars_out() -> void:
	if race_car:
		if not _in_raceway(car.position):
			_race_car_end(true)
		return
	if _in_raceway(car.position) and not _in_rw_lot(car.position):
		if driving:
			driving = false
			player.position = RW_DESK+Vector3(-3.0,0.75,0)
			player.show()
			player.get_child(0).set_deferred("disabled",false)
			_apply_view()
		car.position = RACE_PARK
		car.rotation = Vector3(0,PI/2.0,0)
		car.velocity = Vector3.ZERO
		car_speed = 0.0
		_show_toast("Harbor Raceway: park in the lot and take a race car at the Pit Desk.")

# ---------- speed effects ----------
func _eff_max() -> float:
	var m := car_max
	if race_car:
		if boost_t > 0.0:
			m *= 1.45
		if slow_t > 0.0:
			m *= 0.4
		elif offtrack:
			m *= 0.55
	return m

func _eff_accel() -> float:
	return car_accel*(2.0 if race_car and boost_t > 0.0 else 1.0)

# ---------- track helpers ----------
func _rw_seg_progress(pos: Vector2) -> float:
	# Progress along the lap between the last gate and the next one.
	var way: Array = rw_path["way"]
	var cum: Array = rw_path["cum"]
	var n := way.size()
	var g := RW_TRACK.size()
	var i0: int = rw_gate_idx[(rec_gate-1+g) % g]
	var i1: int = rw_gate_idx[rec_gate] if rec_gate != 0 else n
	var best := INF
	var best_s := float(cum[i0])
	for i in range(i0,i1):
		var a: Vector2 = way[i]
		var b: Vector2 = way[(i+1) % n]
		var t := clampf((pos-a).dot(b-a)/maxf((b-a).length_squared(),0.01),0.0,1.0)
		var d := pos.distance_to(a.lerp(b,t))
		if d < best:
			best = d
			best_s = float(cum[i])+t*a.distance_to(b)
	return best_s

func _rw_track_dist(pos: Vector2) -> float:
	var way: Array = rw_path["way"]
	var n := way.size()
	var best := INF
	for i in n:
		var a: Vector2 = way[i]
		var b: Vector2 = way[(i+1) % n]
		var t := clampf((pos-a).dot(b-a)/maxf((b-a).length_squared(),0.01),0.0,1.0)
		best = minf(best,pos.distance_to(a.lerp(b,t)))
	return best

func _rw_point_dist(pos: Vector2) -> float:
	# Cheap distance to the nearest centreline sample (within RW_STEP/2 of the true distance).
	var best := INF
	for w in rw_path["way"]:
		best = minf(best,pos.distance_squared_to(w))
	return sqrt(best)

func _rw_player_progress() -> float:
	var pos := Vector2(car.position.x,car.position.z)
	if not rec_started:
		return -pos.distance_to(RW_TRACK[0])
	return float(rec_lap)*float(rw_path["total"])+_rw_seg_progress(pos)

func _rw_target() -> Vector3:
	if rec_act == 1 or rec_act == 2:
		var g: Vector2 = RW_TRACK[rec_gate]
		return Vector3(g.x,0,g.y)
	return car.position

# ---------- events ----------
func _rec_stop() -> void:
	rec_act = 0
	rec_count = 0.0
	rec_started = false
	rec_online = false
	offtrack = false
	for a in rec_ai:
		(a["node"] as Node3D).queue_free()
	rec_ai.clear()
	for s in spike_strips:
		if is_instance_valid(s["node"]):
			(s["node"] as Node3D).queue_free()
	spike_strips.clear()
	if rec_big != null:
		rec_big.hide()

func _rw_place(pos: Vector3, yaw: float) -> void:
	car.position = pos
	car.rotation = Vector3(0,yaw,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	_follow_camera(1.0)

func _rw_grid_pos(slot_i: int) -> Vector3:
	var slot: Vector2 = RW_GRID[slot_i]
	var start: Vector2 = RW_TRACK[0]
	return Vector3(start.x+slot.x,0.8,start.y+slot.y)

func _rw_start(kind: int, online := false) -> void:
	if not race_car or kind < 1 or kind > 2:
		return
	var price: int = [0,GP_PRICE,TA_PRICE][kind]
	if online and (not online_on or online_state != 3):
		_show_toast("Turn Online on first (top right) to invite racers.")
		return
	if not _pay(price):
		return
	_rec_stop()
	rec_act = kind
	rec_t = 0.0
	rec_lap = 0
	rec_gate = 0
	rec_results.clear()
	rec_count = 3.0
	rec_last_count = -1
	if paused:
		_toggle_menu()
	rec_laps = 2 if kind == 1 else 3
	_rw_place(_rw_grid_pos(2),0.0)
	if kind == 1 and not online:
		for k in 3:
			_rw_spawn_ai(k,[0,1,3][k])
	if online:
		rec_online = true
		rec_race_id = "%s%d" % [online_id,randi() % 100000]
		rec_count = 10.0
		_online_event_send("rcs",{"rid":rec_race_id,"left":10.0})
		_feed_add("You started an online Grand Prix. Racers can join for 10 s…","")
	_show_toast(["","Grand Prix: 2 laps. Use boosters and spikes!","Time attack: 3 laps, beat your best lap."][kind])

func _rw_spawn_ai(k: int, slot_i: int) -> void:
	var node := Node3D.new()
	add_child(node)
	var model := _try_model("res://models/car_4.glb")
	if model != null:
		model.position.y = 0.8
		node.add_child(model)
		_online_tint(model,AI_COLORS[k])
	else:
		_box(node,Vector3(0,0.8,0),Vector3(1.8,0.9,3.6),AI_COLORS[k])
	var tag := Label3D.new()
	tag.text = AI_NAMES[k]
	tag.font_size = 32
	tag.pixel_size = 0.012
	tag.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	tag.outline_size = 8
	tag.position = Vector3(0,2.6,0)
	node.add_child(tag)
	var slot: Vector2 = RW_GRID[slot_i]
	# Same race car as the player: same top speed, acceleration, booster and spike rules.
	rec_ai.append({"node":node,"s":-slot.y,"lat":slot.x,"v":0.0,"vmax":RACE_MAX,"accel":RACE_ACCEL,"corner":AI_CORNER[k],"boost":0.0,"slow":0.0,"boosts":1,"spikes":1,"done":0.0,"name":AI_NAMES[k]})
	_rw_ai_place(rec_ai[rec_ai.size()-1])

func _rw_ai_place(a: Dictionary) -> void:
	var total := float(rw_path["total"])
	var smp := _path_sample(rw_path,fposmod(float(a["s"]),total))
	var p: Vector2 = smp[0]
	var dir: Vector2 = smp[1]
	var perp := Vector2(-dir.y,dir.x)
	var q := p+perp*float(a["lat"])
	var node: Node3D = a["node"]
	node.position = Vector3(q.x,0,q.y)
	node.rotation.y = atan2(-dir.x,-dir.y)

func _rw_tick(delta: float) -> void:
	if boost_t > 0.0:
		boost_t -= delta
	if slow_t > 0.0:
		slow_t -= delta
		car_speed = minf(car_speed,_eff_max())
	for i in range(spike_strips.size()-1,-1,-1):
		if clock > float(spike_strips[i]["until"]):
			if is_instance_valid(spike_strips[i]["node"]):
				(spike_strips[i]["node"] as Node3D).queue_free()
			spike_strips.remove_at(i)
	if rec_act == 0:
		return
	if rec_count > 0.0:
		rec_count -= delta
		car_speed = 0.0
		var c := int(ceil(rec_count))
		if c != rec_last_count:
			rec_last_count = c
			rec_big.text = str(c) if c > 0 else "GO!"
			rec_big.show()
		if rec_count <= 0.0:
			rec_big.text = "GO!"
			rec_t = 0.0
			rec_lap_t0 = 0.0
		return
	rec_t += delta
	if rec_t > 1.0 and rec_big.visible:
		rec_big.hide()
	var pos := Vector2(car.position.x,car.position.z)
	# Spike hits on us.
	for s in spike_strips:
		if String(s["owner"]) != "me" and not bool(s["hit_me"]) and pos.distance_to(s["pos"]) < 2.8:
			s["hit_me"] = true
			slow_t = 2.0
			car_speed = minf(car_speed,_eff_max())
			_show_toast("SPIKES! Slowed down for 2 s.")
	offtrack = rec_started and _rw_track_dist(pos) > RW_TRACK_W/2.0+2.0
	var g: Vector2 = RW_TRACK[rec_gate]
	if pos.distance_to(g) < 15.0:
		if rec_gate == 0:
			if rec_started:
				rec_lap += 1
				var lap_t := rec_t-rec_lap_t0
				rec_lap_t0 = rec_t
				_rw_lap_done(lap_t)
				if rec_lap >= rec_laps:
					_rw_finish()
					return
			rec_started = true
		rec_gate = (rec_gate+1) % RW_TRACK.size()
	_rw_ai_tick(delta)

func _rw_ai_tick(delta: float) -> void:
	var total := float(rw_path["total"])
	var cum: Array = rw_path["cum"]
	var n := (rw_path["way"] as Array).size()
	var me := _rw_player_progress()
	for a in rec_ai:
		if float(a["done"]) > 0.0:
			_rw_ai_place(a)
			continue
		var s := float(a["s"])
		var sm := fposmod(s,total)
		var j := clampi(cum.bsearch(sm,false)-1,0,n-1)
		var vmax := float(a["vmax"])
		# Lift for the sharpest bend coming up; no catch-up help either way.
		var target := vmax*(1.0-float(a["corner"])*clampf(float(rw_corner[j])/1.3,0.0,1.0))
		if float(a["boost"]) > 0.0:
			a["boost"] = float(a["boost"])-delta
			target = vmax*1.45
		elif int(a["boosts"]) > 0 and float(rw_corner[j]) < 0.1 and randf() < 0.004:
			a["boosts"] = int(a["boosts"])-1
			a["boost"] = 3.0
		if float(a["slow"]) > 0.0:
			a["slow"] = float(a["slow"])-delta
			target = minf(target,vmax*0.4)
			a["v"] = minf(float(a["v"]),target)
		var acc := float(a["accel"])*(2.0 if float(a["boost"]) > 0.0 else 1.0)
		var v := move_toward(float(a["v"]),target,delta*(acc if target > float(a["v"]) else 20.0))
		a["v"] = v
		a["s"] = s+v*delta
		_rw_ai_place(a)
		var apos := Vector2((a["node"] as Node3D).position.x,(a["node"] as Node3D).position.z)
		for sp in spike_strips:
			if String(sp["owner"]) != String(a["name"]) and not (sp["hit"] as Dictionary).has(a["name"]) and apos.distance_to(sp["pos"]) < 2.8:
				(sp["hit"] as Dictionary)[a["name"]] = true
				a["slow"] = 2.0
		var rel := float(a["s"])-me
		if int(a["spikes"]) > 0 and rel > 8.0 and rel < 30.0 and randf() < 0.01:
			a["spikes"] = int(a["spikes"])-1
			_rw_drop_spike_at(apos,String(a["name"]))
		if float(a["s"]) >= float(rec_laps)*total:
			a["done"] = rec_t

func _rw_lap_done(lap_t: float) -> void:
	if rw_best_lap <= 0.0 or lap_t < rw_best_lap:
		var first := rw_best_lap <= 0.0
		rw_best_lap = lap_t
		if rec_act == 2:
			cash += 100
			_show_toast("NEW BEST LAP %.2f s!  +$100" % lap_t if not first else "Best lap set: %.2f s  +$100" % lap_t)
		_save_progress()
		_rw_refresh_board()
	else:
		_show_toast("Lap %d: %.2f s  (best %.2f s)" % [rec_lap,lap_t,rw_best_lap])

func _rw_finish() -> void:
	var t := rec_t
	if rec_act == 1:
		var pos := 1
		if rec_online:
			for r in rec_results:
				if float(r[1]) < t:
					pos += 1
			rec_results.append(["You",t])
			_online_event_send("rcf",{"rid":rec_race_id,"t":t})
		else:
			for a in rec_ai:
				if float(a["done"]) > 0.0 and float(a["done"]) < t:
					pos += 1
		var prize: int = GP_PRIZES[mini(pos-1,GP_PRIZES.size()-1)]
		cash += prize
		if rw_best_gp <= 0.0 or t < rw_best_gp:
			rw_best_gp = t
		_feed_add("Grand Prix finished: P%d  ·  %s%s" % [pos,_rw_fmt(t),"  ·  +$%d" % prize if prize > 0 else ""],"")
		_show_toast("FINISH! You placed %s.  %s%s" % [["1st","2nd","3rd","4th"][mini(pos-1,3)],_rw_fmt(t),"  +$%d" % prize if prize > 0 else ""])
		if pos == 1:
			_emote(player_person,3)
	else:
		_show_toast("Time attack done: %s total. Best lap %.2f s." % [_rw_fmt(t),rw_best_lap])
	_save_progress()
	_rw_refresh_board()
	_rec_stop()

func _rw_fmt(t: float) -> String:
	return "%d:%05.2f" % [int(t)/60,fmod(t,60.0)]

# ---------- boosters and spikes ----------
func _rw_buy(kind: int) -> void:
	if kind == 0:
		if boosts >= 5:
			_show_toast("You can carry 5 boosters.")
			return
		if not _pay(BOOST_PRICE):
			return
		boosts += 1
	else:
		if spikes >= 5:
			_show_toast("You can carry 5 spike strips.")
			return
		if not _pay(SPIKE_PRICE):
			return
		spikes += 1
	_save_progress()
	_rw_refresh_panel()

func _rw_use_boost() -> void:
	if not race_car or rec_act == 0 or rec_count > 0.0 or boosts <= 0 or boost_t > 0.0:
		return
	boosts -= 1
	boost_t = 3.0
	_save_progress()
	_show_toast("BOOST!")

func _rw_use_spike() -> void:
	if not race_car or rec_act != 1 or rec_count > 0.0 or spikes <= 0:
		return
	spikes -= 1
	var back := car.position+car.global_basis.z*4.0
	_rw_drop_spike_at(Vector2(back.x,back.z),"me")
	if rec_online:
		_online_event_send("spk",{"rid":rec_race_id,"x":snappedf(back.x,0.1),"z":snappedf(back.z,0.1)})
	_save_progress()
	_show_toast("Spikes dropped behind you!")

func _rw_drop_spike_at(p: Vector2, owner: String) -> void:
	var node := Node3D.new()
	node.position = Vector3(p.x,0,p.y)
	add_child(node)
	_box(node,Vector3(0,0.06,0),Vector3(5,0.12,1.2),Color("23262b"))
	for k in 7:
		var spk := MeshInstance3D.new()
		var pm := PrismMesh.new()
		pm.size = Vector3(0.35,0.4,0.35)
		spk.mesh = pm
		spk.position = Vector3(-2.1+float(k)*0.7,0.32,0)
		spk.material_override = _material(Color("c9d1d8"))
		node.add_child(spk)
	spike_strips.append({"node":node,"pos":p,"owner":owner,"until":clock+25.0,"hit":{},"hit_me":owner == "me"})

# ---------- online races ----------
func _race_msg(event: String, p: Dictionary) -> void:
	var from := String(p.get("i",""))
	if from == "" or from == online_id or from.length() > 24:
		return
	var nm := _online_clean_name(String(p.get("n","Racer")))
	var rid := String(p.get("rid","")).substr(0,40)
	if event == "rcs":
		var left := clampf(float(p.get("left",10.0)),0.0,10.0)
		for item in feed:
			if item["from"] == from:
				feed.erase(item)
				break
		_feed_add("%s started a Grand Prix at Harbor Raceway!" % nm,from,{"race":rid,"t0":clock,"left":left})
	elif event == "rcf" and rid == rec_race_id and rec_race_id != "":
		var t := clampf(float(p.get("t",0.0)),1.0,3600.0)
		rec_results.append([nm,t])
		online_bests[nm] = minf(float(online_bests.get(nm,t)),t)
		_feed_add("%s finished the Grand Prix: %s" % [nm,_rw_fmt(t)],"")
		_rw_refresh_board()
	elif event == "spk" and rid == rec_race_id and rec_act == 1:
		_rw_drop_spike_at(Vector2(clampf(float(p.get("x",0.0)),RW_X0,RW_X1),clampf(float(p.get("z",0.0)),RW_Z0,RW_Z1)),from)

func _join_race(from: String, invite: Dictionary) -> void:
	var left := float(invite["left"])-(clock-float(invite["t0"]))
	if left < 1.5:
		_show_toast("That race has already started. Catch the next one!")
		return
	if trial_active >= 0 or chase_mode != 0 or online_role != 0 or bus_riding or sky_riding or sky_wait >= 0:
		_show_toast("Finish your trial, chase or bus ride first, then join.")
		return
	if cash < GP_PRICE:
		_show_toast("You need $%d to join a Grand Prix." % GP_PRICE)
		return
	if seat_id >= 0:
		_stand_up()
	if not race_car:
		if driving:
			driving = false
		car.position = RACE_PARK
		car.rotation = Vector3(0,PI/2.0,0)
		player.position = RW_DESK+Vector3(-3.0,0.75,0)
		_race_car_start()
	cash -= GP_PRICE
	_rec_stop()
	rec_act = 1
	rec_laps = 2
	rec_lap = 0
	rec_gate = 0
	rec_results.clear()
	rec_online = true
	rec_race_id = String(invite["race"])
	rec_count = left
	rec_last_count = -1
	_rw_place(_rw_grid_pos(1+absi(online_id.hash()) % 3),0.0)
	_save_progress()
	_show_toast("You joined the Grand Prix! Get ready…")

# ---------- raceway panel, HUD, board ----------
func _build_raceway_ui(root: Control) -> void:
	rw_panel = PanelContainer.new()
	root.add_child(rw_panel)
	rw_panel.custom_minimum_size = Vector2(720,0)
	rw_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var col := VBoxContainer.new()
	col.add_theme_constant_override("separation",10)
	rw_panel.add_child(col)
	col.add_child(_label("HARBOR RACEWAY",26,Color("ffb35c")))
	rw_info = _label("",17,Color("cbd8de"))
	rw_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	rw_info.custom_minimum_size.x = 670
	col.add_child(rw_info)
	var grid := GridContainer.new()
	grid.columns = 2
	grid.add_theme_constant_override("h_separation",10)
	grid.add_theme_constant_override("v_separation",8)
	col.add_child(grid)
	var defs := [
		["car","GET RACE CAR",_race_car_start],
		["ret","RETURN RACE CAR",_race_car_end],
		["gp","GRAND PRIX vs robots  $%d" % GP_PRICE,_rw_start.bind(1,false)],
		["gpo","ONLINE GRAND PRIX  $%d" % GP_PRICE,_rw_start.bind(1,true)],
		["ta","TIME ATTACK  $%d" % TA_PRICE,_rw_start.bind(2,false)],
		["boost","BUY BOOSTER  $%d" % BOOST_PRICE,_rw_buy.bind(0)],
		["spike","BUY SPIKES  $%d" % SPIKE_PRICE,_rw_buy.bind(1)],
		["back","BACK",_rw_close],
	]
	for d in defs:
		var b := _button(d[1],d[2])
		b.custom_minimum_size = Vector2(330,52)
		b.add_theme_font_size_override("font_size",18)
		grid.add_child(b)
		rw_buttons[d[0]] = b
	rw_panel.hide()
	rec_big = _label("",110,Color("ffd86a"))
	rec_big.add_theme_constant_override("outline_size",18)
	rec_big.add_theme_color_override("font_outline_color",Color("5a3410"))
	rec_big.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	rec_big.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(rec_big)
	rec_big.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	rec_big.size = Vector2(400,160)
	rec_big.position = Vector2(root.size.x/2.0-200.0,root.size.y*0.25)
	rec_big.hide()
	boost_button = _button("BOOST",_rw_use_boost)
	boost_button.custom_minimum_size = Vector2(104,64)
	boost_button.add_theme_font_size_override("font_size",17)
	boost_button.add_theme_stylebox_override("normal",_panel(Color("1f7f9a"),18))
	root.add_child(boost_button)
	spike_button = _button("SPIKES",_rw_use_spike)
	spike_button.custom_minimum_size = Vector2(104,64)
	spike_button.add_theme_font_size_override("font_size",17)
	spike_button.add_theme_stylebox_override("normal",_panel(Color("8a3a2a"),18))
	root.add_child(spike_button)
	for b in [boost_button,spike_button]:
		b.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
		b.hide()
	_rw_layout(root.size)

func _rw_layout(view: Vector2) -> void:
	if boost_button == null:
		return
	boost_button.position = Vector2(view.x-248,view.y-200)
	spike_button.position = Vector2(view.x-132,view.y-200)
	rec_big.position = Vector2(view.x/2.0-200.0,view.y*0.25)

func _rw_open() -> void:
	if not paused:
		_toggle_menu()
	_rw_refresh_panel()
	_open_panel(rw_panel)

func _rw_close() -> void:
	if paused:
		_toggle_menu()

func _rw_refresh_panel() -> void:
	if rw_panel == null:
		return
	rw_info.text = "Everyone drives the same race car, robots too, so it is fair. Boosters: %d  ·  Spikes: %d  ·  Cash: $%d\nBest lap %s  ·  Grand Prix %s  ·  Lap length %.2f km\nGrand Prix prizes: 1st $300, 2nd $150, 3rd $75. Leave the track and you slow down." % [boosts,spikes,cash,("%.2f s" % rw_best_lap) if rw_best_lap > 0.0 else "--",_rw_fmt(rw_best_gp) if rw_best_gp > 0.0 else "--",float(rw_path.get("total",0.0))/1000.0]
	rw_buttons["car"].visible = not race_car
	rw_buttons["ret"].visible = race_car
	for k in ["gp","gpo","ta"]:
		rw_buttons[k].disabled = not race_car
	rw_buttons["boost"].disabled = boosts >= 5
	rw_buttons["spike"].disabled = spikes >= 5
	rw_panel.reset_size()
	_layout_panels()

func _rw_refresh_board() -> void:
	if rw_board == null:
		return
	var lines := ["RACEWAY RECORDS","Best lap  %s" % (("%.2f s" % rw_best_lap) if rw_best_lap > 0.0 else "--"),"Grand Prix  %s" % (_rw_fmt(rw_best_gp) if rw_best_gp > 0.0 else "--")]
	if not online_bests.is_empty():
		lines.append("ONLINE GRAND PRIX")
		var names: Array = online_bests.keys()
		names.sort_custom(func(a, b): return float(online_bests[a]) < float(online_bests[b]))
		for k in mini(3,names.size()):
			lines.append("%s  %s" % [names[k],_rw_fmt(float(online_bests[names[k]]))])
	rw_board.text = "\n".join(lines)

func _rw_hud() -> void:
	if boost_button == null:
		return
	var racing := race_car and rec_act > 0 and rec_count <= 0.0
	boost_button.visible = racing and not paused
	spike_button.visible = racing and rec_act == 1 and not paused
	boost_button.text = "BOOST\nx%d" % boosts
	boost_button.disabled = boosts <= 0 or boost_t > 0.0
	spike_button.text = "SPIKES\nx%d" % spikes
	spike_button.disabled = spikes <= 0
	if not race_car or rec_act == 0:
		return
	mission_label.text = "HARBOR RACEWAY"
	var pos_txt := ""
	if rec_act == 1 and not rec_online:
		var me := _rw_player_progress()
		var p := 1
		for a in rec_ai:
			if float(a["s"]) > me:
				p += 1
		pos_txt = "POS %d/4  ·  " % p
	objective.text = "%s%sLAP %d/%d  ·  %s%s" % ["GRAND PRIX  ·  " if rec_act == 1 else "TIME ATTACK  ·  ",pos_txt,mini(rec_lap+1,rec_laps),rec_laps,_rw_fmt(rec_t),"  ·  OFF TRACK!" if offtrack else ""]
	speed_label.text = "%d km/h%s%s" % [int(absf(car_speed)*3.6),"  ·  BOOST!" if boost_t > 0.0 else "","  ·  SPIKED!" if slow_t > 0.0 else ""]

func _peer_car_model(peer: Dictionary, idx: int, race: bool) -> void:
	var car_node: Node3D = peer["car"]
	for child in car_node.get_children():
		if child != peer["red"] and child != peer["blue"]:
			child.queue_free()
	var model := _try_model("res://models/car_%d.glb" % int(CARS[idx].get("model",idx)) if not race else "res://models/car_4.glb")
	if model != null:
		car_node.add_child(model)
		_online_tint(model,RACE_COLOR if race else Color.from_hsv(float(String(peer["name"]).hash() % 360)/360.0,0.65,0.9))

func _smoke_raceway() -> void:
	blocked_skip_traffic = true
	var space := get_world_3d().direct_space_state
	var q := PhysicsShapeQueryParameters3D.new()
	var sph := SphereShape3D.new()
	sph.radius = 0.5
	q.shape = sph
	q.exclude = [player.get_rid(),car.get_rid()]
	# People walk from the road through the lot to the Pit Desk.
	q.collision_mask = player.collision_mask
	for x in range(100,int(RW_DESK.x)-1,4):
		q.transform = Transform3D(Basis.IDENTITY,Vector3(float(x),1.0,-150 if x < 230 else -138))
		assert(space.intersect_shape(q,1).is_empty(),"Walk to the Pit Desk blocked at x=%d" % x)
	# Cars drive in up to the lot; the bollards keep own cars out of the pits and track.
	q.collision_mask = car.collision_mask
	for x in range(100,250,5):
		q.transform = Transform3D(Basis.IDENTITY,Vector3(float(x),1.0,-150))
		assert(space.intersect_shape(q,1).is_empty(),"Road into the parking lot blocked at x=%d" % x)
	for z in range(-60,-240,-30):
		q.transform = Transform3D(Basis.IDENTITY,Vector3(222,1.0,float(z)))
		assert(space.intersect_shape(q,1).is_empty(),"Parking aisle blocked at z=%d" % z)
	q.transform = Transform3D(Basis.IDENTITY,Vector3(RW_LOT_X1,1.0,-148))
	assert(not space.intersect_shape(q,1).is_empty(),"Bollards stop cars at the lot edge")
	q.transform = Transform3D(Basis.IDENTITY,Vector3(230,1.0,RW_LOT_Z0))
	assert(not space.intersect_shape(q,1).is_empty(),"Bollards stop cars at the north edge of the lot")
	assert(_in_rw_lot(RACE_PARK) and not _in_rw_lot(RW_PIT) and _in_raceway(RW_PIT),"Parking is in the lot, race cars start in the pit lane")
	# The whole circuit is clear, smooth, and the pit lane leads onto it.
	var total := float(rw_path["total"])
	assert(total > 1300.0,"Circuit is over 1.3 km (%.0f m)" % total)
	var d := 0.0
	while d < total:
		var smp := _path_sample(rw_path,d)
		var p2: Vector2 = smp[0]
		assert(not _blocked_at(Vector3(p2.x,1.0,p2.y),0.8),"Track blocked at %s by %s" % [str(p2),_blocker(Vector3(p2.x,1.0,p2.y),0.8)])
		for side in [-1.0,1.0]:
			var e: Vector2 = p2+Vector2(-(smp[1] as Vector2).y,(smp[1] as Vector2).x)*side*(RW_TRACK_W/2.0-0.5)
			assert(not _blocked_at(Vector3(e.x,1.0,e.y),0.4),"Track edge blocked at %s" % str(e))
		d += 5.0
	var way: Array = rw_path["way"]
	for i in way.size():
		var turn := absf(_rw_dir(i).angle_to(_rw_dir(i+1)))
		assert(turn < 0.2,"Track has no sharp kinks (%.2f rad at %s)" % [turn,str(way[i])])
	for z in range(-110,-330,-10):
		assert(not _blocked_at(Vector3(RW_PIT.x,1.0,float(z)),0.8),"Pit lane blocked at z=%d" % z)
	assert(not _blocked_at(Vector3(306,1.0,-345),0.8) and not _blocked_at(Vector3(306,1.0,-96),0.8),"Pit exit and entry are open")
	blocked_skip_traffic = false
	var was := [cash,boosts,spikes,rw_best_lap,rw_best_gp,car_id,car.position,driving,player.position,view_mode]
	view_mode = 0
	_apply_view()
	# Get a race car at the pit desk: same stats for everyone, own car stays in the lot.
	cash = 1000
	car_id = 4
	_apply_car()
	var own_max := car_max
	driving = false
	player.position = RW_DESK+Vector3(-2.0,0.75,0)
	car.position = Vector3(222,0.8,-90)
	_interact()
	assert(paused and rw_panel.visible and rw_buttons["car"].visible,"Pit desk opens the Raceway menu")
	assert(not rw_buttons.has("jump") and not rw_buttons.has("drag"),"Only track events are offered")
	_race_car_start()
	assert(race_car and driving and not paused and car_max == RACE_MAX and car_accel == RACE_ACCEL,"Race car has the same stats for everyone")
	assert(own_max != RACE_MAX and race_ghost != null and race_parked_pos.distance_to(Vector3(222,0.8,-90)) < 0.1,"Own car stays where it was parked in the lot")
	assert(car.position.distance_to(RW_PIT) < 0.1,"Race car starts in the pit lane")
	_race_car_end(true)
	car.position = Vector3(150,0.8,-150)
	_race_car_start()
	assert(race_parked_pos.distance_to(RACE_PARK) < 0.1,"A car left outside is parked in the lot")
	# Shop.
	boosts = 0
	spikes = 0
	_rw_buy(0)
	_rw_buy(1)
	_rw_buy(1)
	assert(boosts == 1 and spikes == 2 and cash == 1000-BOOST_PRICE-2*SPIKE_PRICE,"Pit shop sells boosters and spikes")
	boosts = 0
	_save_progress()
	boosts = 3
	_load_progress()
	assert(boosts == 0 and spikes == 2,"Inventory is saved")
	boosts = 2
	# Grand Prix against three AI racers in identical cars.
	cash = 1000
	_rw_start(1)
	assert(rec_act == 1 and rec_ai.size() == 3 and cash == 1000-GP_PRICE and rec_count > 0.0,"Grand Prix starts with AI and a countdown")
	assert(rec_ai.all(func(a): return float(a["vmax"]) == RACE_MAX and float(a["accel"]) == RACE_ACCEL),"AI racers drive the same race car as players")
	_rw_start(3)
	assert(rec_act == 1,"Removed events cannot be started")
	_rw_tick(1.0)
	assert(car_speed == 0.0,"Cars wait for the countdown")
	rec_count = 0.0
	_rw_tick(0.016)
	var s0 := float(rec_ai[0]["s"])
	var top := 0.0
	for i in 120:
		_rw_ai_tick(0.1)
		top = maxf(top,float(rec_ai[0]["v"]))
	assert(float(rec_ai[0]["s"]) > s0+200.0,"AI racers drive the track")
	assert(top <= RACE_MAX*1.45+0.01,"AI never goes faster than a boosted player car (%.1f)" % top)
	_rw_use_boost()
	assert(boost_t > 0.0 and boosts == 1 and _eff_max() > car_max*1.4,"Booster gives a speed boost")
	boost_t = 0.0
	# Our spikes slow an AI racer down.
	_rw_use_spike()
	assert(spikes == 1 and spike_strips.size() >= 1,"Spikes are dropped behind the car")
	var on_line: Vector2 = _path_sample(rw_path,200.0)[0]
	_rw_drop_spike_at(on_line,"me")
	rec_ai[1]["s"] = 200.0
	rec_ai[1]["lat"] = 0.0
	rec_ai[1]["v"] = 20.0
	rec_ai[1]["slow"] = 0.0
	_rw_ai_tick(0.016)
	assert(float(rec_ai[1]["slow"]) > 0.0,"AI hit by spikes slows down")
	# AI spikes slow us down.
	_rw_drop_spike_at(Vector2(car.position.x,car.position.z),"Blaze")
	car_speed = 25.0
	_rw_tick(0.016)
	assert(slow_t > 0.0 and car_speed <= car_max*0.41,"Spikes slow the player down")
	slow_t = 0.0
	# Leaving the track slows you.
	car.position = Vector3(520,0.8,-240)
	_rw_tick(0.016)
	assert(offtrack and _eff_max() < car_max*0.6,"Off track is slower")
	# Drive through every gate for two laps, ahead of the AI, and win.
	for a in rec_ai:
		a["s"] = -200.0
		a["vmax"] = 0.0
		a["v"] = 0.0
	var before := cash
	var guard := 0
	while rec_act == 1 and guard < 200:
		var g: Vector2 = RW_TRACK[rec_gate]
		car.position = Vector3(g.x,0.8,g.y)
		rec_t += 2.0
		_rw_tick(0.016)
		guard += 1
	assert(rec_act == 0 and cash == before+GP_PRIZES[0] and rw_best_gp > 0.0 and rw_best_lap > 0.0,"Winning the Grand Prix pays $%d and saves times" % GP_PRIZES[0])
	assert(rec_ai.is_empty() and spike_strips.is_empty(),"Race cleans up")
	# Progress follows the track between gates.
	_rw_start(2)
	rec_count = 0.0
	rec_started = true
	rec_gate = 3
	var mid: Vector2 = _path_sample(rw_path,(float(rw_path["cum"][rw_gate_idx[2]])+float(rw_path["cum"][rw_gate_idx[3]]))/2.0)[0]
	car.position = Vector3(mid.x,0.8,mid.y)
	var pr := _rw_player_progress()
	assert(pr > float(rw_path["cum"][rw_gate_idx[2]]) and pr < float(rw_path["cum"][rw_gate_idx[3]]),"Race position follows the track")
	_rec_stop()
	# Online Grand Prix: another player starts a race, we JOIN, results are shared.
	_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"rcs","payload":{"i":"p7","n":"Mia","rid":"race42","left":8.0}}}))
	assert(feed.any(func(f): return f["from"] == "p7" and (f["invite"] as Dictionary).has("race")),"Race invite shows with JOIN")
	cash = 1000
	_accept_invite("p7")
	assert(race_car and rec_act == 1 and rec_online and rec_race_id == "race42" and rec_count > 5.0 and rec_ai.is_empty(),"JOIN puts us on the grid of the online race")
	_online_handle(JSON.stringify({"topic":ONLINE_TOPIC,"event":"broadcast","payload":{"type":"broadcast","event":"rcf","payload":{"i":"p7","n":"Mia","rid":"race42","t":84.5}}}))
	assert(rec_results.size() == 1 and online_bests.has("Mia"),"Online finish times are shared")
	_rec_stop()
	# Return the race car: own car and stats come back.
	_race_car_end()
	assert(not race_car and not driving and car.position.distance_to(RACE_PARK) < 0.5 and car_max == _car_stats(car_id).x and car_max != RACE_MAX and race_ghost == null,"Returning the race car restores your own car")
	# A normal car that gets onto the track is moved to the lot; one in the lot stays.
	car.position = Vector3(400,0.8,-200)
	_race_keep_cars_out()
	assert(car.position.distance_to(RACE_PARK) < 0.1,"Own cars cannot enter the track")
	car.position = Vector3(222,0.8,-200)
	_race_keep_cars_out()
	assert(car.position.distance_to(Vector3(222,0.8,-200)) < 0.1,"Own cars can park anywhere in the lot")
	cash = was[0]
	boosts = was[1]
	spikes = was[2]
	rw_best_lap = was[3]
	rw_best_gp = was[4]
	car_id = was[5]
	_apply_car()
	car.position = was[6]
	driving = was[7]
	player.position = was[8]
	view_mode = was[9]
	_apply_view()
	_save_progress()

func _race_shots() -> void:
	# Developer-only: Harbor Raceway. Never saves.
	player.position = RW_DESK+Vector3(-2.0,0.75,0)
	car.position = Vector3(222,0.8,-120)
	car.rotation.y = PI/2.0
	_race_car_start()
	for i in 20:
		await get_tree().physics_frame
	await _skyline_shot("race-aerial",Vector3(430,0,-240),Vector3(250,230,10))
	await _skyline_shot("race-pits",Vector3(270,0,-190),Vector3(215,45,-95))
	await _skyline_shot("race-corner",Vector3(345,0,-395),Vector3(300,25,-345))
	await _skyline_shot("race-hairpin",Vector3(428,0,-275),Vector3(440,32,-205))
	paused = false
	_rw_start(1)
	rec_count = 0.0
	_rw_tick(0.016)
	for i in 12:
		_rw_ai_tick(0.1)
	car.position = Vector3(312,0.8,-175)
	car.rotation.y = 0.0
	_rw_drop_spike_at(Vector2(312,-165),"me")
	view_mode = 1
	_apply_view()
	for i in 30:
		await get_tree().physics_frame
	await _save_shot("race-gp")
	view_mode = 2
	_apply_view()
	for i in 10:
		await get_tree().physics_frame
	await _save_shot("race-incar")
	_rec_stop()
	view_mode = 0
	_apply_view()
	_rw_open()
	await _save_shot("race-menu")
	get_tree().quit()

# ---------- v0.22.0: Call Car ----------
const CALL_COOL := 8.0
const CALL_COOL_CHASE := 45.0
var call_ready_at := -100.0
var horn_snd: AudioStreamWAV

func _call_block_reason() -> String:
	if race_car or bus_riding or sky_riding or seat_id >= 0:
		return "You can't call your car right now."
	if Vector2(player.position.x-HUB_C.x,player.position.z-HUB_C.z).length() < HUB_R+2.0:
		return "Cars can't come into Harbor Dome. Walk outside first."
	if _in_raceway(player.position) and not _in_rw_lot(player.position):
		return "Walk to the raceway car park to call your car."
	if clock < call_ready_at:
		return "Your car is on its way. Try again in %d s." % ceili(call_ready_at-clock)
	return ""

func _call_spot() -> Vector3:
	# An open space next to or just behind the player, on solid ground, where the whole car fits.
	var right := player.global_basis.x
	right.y = 0
	right = right.normalized()
	var back := player.global_basis.z
	back.y = 0
	back = back.normalized()
	var space := get_world_3d().direct_space_state
	var shape := BoxShape3D.new()
	shape.size = Vector3(2.0,1.2,3.7)
	for off: Vector3 in [right*3.2,-right*3.2,back*4.5,right*3.2+back*3.0,-right*3.2+back*3.0,right*5.5,-right*5.5,back*7.5]:
		var at := player.position+off
		var down := PhysicsRayQueryParameters3D.create(Vector3(at.x,player.position.y+4.0,at.z),Vector3(at.x,player.position.y-6.0,at.z),1)
		down.exclude = [player.get_rid(),car.get_rid()]
		var ground := space.intersect_ray(down)
		if ground.is_empty() or absf(float(ground["position"].y)-(player.position.y-0.75)) > 1.5:
			continue
		var spot := Vector3(at.x,float(ground["position"].y)+0.8,at.z)
		if _in_raceway(spot) and not _in_rw_lot(spot):
			continue
		var query := PhysicsShapeQueryParameters3D.new()
		query.shape = shape
		query.collision_mask = 1 | HUB_CAR_LAYER
		query.transform = Transform3D(Basis.from_euler(Vector3(0,player.rotation.y,0)),spot+Vector3(0,0.15,0))
		var skip: Array[RID] = [player.get_rid(),car.get_rid()]
		query.exclude = skip
		if space.intersect_shape(query,1).is_empty():
			return spot
	return Vector3.INF

func _call_car() -> bool:
	var reason := _call_block_reason()
	if reason != "":
		_show_toast(reason)
		return false
	var spot := _call_spot()
	if spot == Vector3.INF:
		_show_toast("No space for your car here. Step out into the open street.")
		return false
	car.position = spot
	car.rotation = Vector3(0,player.rotation.y,0)
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	call_ready_at = clock+(CALL_COOL_CHASE if chase_mode == 1 or online_role == 1 else CALL_COOL)
	if car_model != null:
		car_model.scale = Vector3.ONE*0.6
		create_tween().tween_property(car_model,"scale",Vector3.ONE,0.35).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	_play_horn()
	_show_toast("Your car pulled up. Tap ENTER CAR.")
	_refresh_hud()
	return true

func _play_horn() -> void:
	if fx_player == null or "--smoke-test" in OS.get_cmdline_user_args():
		return
	if horn_snd == null:
		var sr := 22050
		var total := int(sr*0.55)
		var bytes := PackedByteArray()
		bytes.resize(total*2)
		for i in total:
			var t := float(i)/sr
			var v := 0.0
			for beep in [[0.0,0.16],[0.24,0.3]]:
				var u: float = t-float(beep[0])
				if u >= 0.0 and u < float(beep[1]):
					var env := minf(u/0.01,1.0)*minf((float(beep[1])-u)/0.02,1.0)
					v += (signf(sin(TAU*415.0*u))*0.5+signf(sin(TAU*523.0*u))*0.5)*0.32*env
			bytes.encode_s16(i*2,int(clampf(v,-1.0,1.0)*22000.0))
		horn_snd = AudioStreamWAV.new()
		horn_snd.format = AudioStreamWAV.FORMAT_16_BITS
		horn_snd.mix_rate = sr
		horn_snd.data = bytes
	fx_player.stream = horn_snd
	fx_player.play()

func _smoke_follow_call() -> void:
	var was := [driving,player.position,player.rotation,walk_view,view_mode,car.position,car.rotation,call_ready_at]
	driving = false
	player.show()
	player.get_child(0).disabled = false
	# Walking has its own views; Follow comes after Eye and is the default.
	walk_view = 3
	_cycle_view()
	assert(follow_view and walk_view == 0 and view_button.text == "View: Follow","Follow view on foot")
	player.position = Vector3(4.6,0.9,5.2)
	player.rotation = Vector3.ZERO
	cam_yaw = 0.0
	cam_pitch = 0.3
	cam_hold = 0.0
	for i in 5:
		await get_tree().physics_frame
	_follow_camera(1.0)
	var d := camera.global_position.distance_to(player.position+Vector3(0,0.75,0))
	assert(d > 1.0 and d < FOLLOW_DIST+0.1,"Follow camera is just behind the player (%.2f m)" % d)
	assert(camera.global_position.y < player.position.y+3.0,"Follow camera is at street level")
	var start := player.position
	stick = Vector2(0,-1)
	for i in 30:
		await get_tree().physics_frame
	stick = Vector2.ZERO
	assert(player.position.z < start.z-2.0,"Stick up walks away from the camera (moved %s)" % str(player.position-start))
	var yaw := cam_yaw
	_look(Vector2(120,0))
	assert(cam_yaw < yaw and cam_hold > 0.0,"Dragging turns the follow camera")
	# Driving keeps its own view.
	view_mode = 0
	driving = true
	_apply_view()
	assert(not follow_view and view_button.text == "View: Far","Driving keeps the far view")
	driving = false
	_apply_view()
	assert(follow_view and view_button.text == "View: Follow","Walking goes back to Follow")
	# Call Car: the car pulls up next to you, then you can get in.
	call_ready_at = -100.0
	var away := Vector3(20,0.8,2.3)
	car.position = away
	car.rotation = Vector3.ZERO
	_refresh_hud()
	assert(action_button.text == "CALL CAR" and not action_button.disabled,"CALL CAR shows when the car is far")
	_interact()
	assert(not driving and player.position.distance_to(car.position) < 5.0,"Called car is right next to the player (%.1f m)" % player.position.distance_to(car.position))
	assert(not _blocked_at(car.position+Vector3(0,0.3,0),0.6),"Called car is in open space")
	_refresh_hud()
	assert(action_button.text == "ENTER CAR","ENTER CAR after calling")
	_interact()
	assert(driving,"Can get into the called car")
	_interact()
	assert(not driving,"Can get out again")
	car.position = away
	assert(not _call_car() and car.position.distance_to(away) < 0.1,"Cooldown blocks an instant second call")
	call_ready_at = -100.0
	player.position = HUB_C+Vector3(0,0.75,0)
	assert(not _call_car() and car.position.distance_to(away) < 0.1,"No calling a car into Harbor Dome")
	player.position = Vector3(430,0.75,-300)
	assert(not _call_car() and car.position.distance_to(away) < 0.1,"No calling a car onto the race track")
	driving = was[0]
	player.position = was[1]
	player.rotation = was[2]
	walk_view = was[3]
	view_mode = was[4]
	car.position = was[5]
	car.rotation = was[6]
	call_ready_at = was[7]
	if driving:
		player.hide()
		player.get_child(0).disabled = true
	_apply_view()

func _follow_shots() -> void:
	# Developer-only: the street-level follow camera and Call Car. Never saves.
	driving = false
	player.show()
	player.get_child(0).disabled = false
	walk_view = 0
	_apply_view()
	var spots := [["follow-waterfront",Vector3(4.6,0.75,5.2),PI],["follow-city",Vector3(4,0.75,-12),0.0],["follow-north",Vector3(12,0.75,-72),0.0],["follow-marina",Vector3(0,0.75,160),PI],["follow-skyline",Vector3(-300,0.75,-250),PI/2.0]]
	for it: Array in spots:
		player.position = it[1]
		player.rotation.y = float(it[2])
		cam_yaw = float(it[2])
		cam_pitch = 0.3
		for i in 20:
			await get_tree().physics_frame
		_follow_camera(1.0)
		await _save_shot(String(it[0]))
		_shot_stats(String(it[0]))
	player.position = Vector3(4.6,0.75,5.2)
	player.rotation.y = PI
	cam_yaw = PI
	car.position = Vector3(40,0.8,2.3)
	for i in 10:
		await get_tree().physics_frame
	_refresh_hud()
	await _save_shot("follow-call-before")
	_call_car()
	for i in 25:
		await get_tree().physics_frame
	await _save_shot("follow-call-after")
	get_tree().quit()


# ---------- v0.23: RUN toggle and fast travel between districts ----------
const RUN_SPEED := 9.0
const WALK_SPEED := 5.0
# Which area must be open before you can travel to each checkpoint (see _area_open):
# 0 city, 1 ridge (east), 2 bay (west), 3 north, 4 marina, 5 skyline downtown.
const TRAVEL_AREA := [0,1,2,3,3,3,5,5,4,1,2,1,0,0,0]
const TRAVEL_COOL := 20.0
var run_on := true
var run_button: Button
var travel_button: Button
var travel_panel: PanelContainer
var travel_info: Label
var travel_buttons: Array = []
var travel_ready_at := 0.0

func _walk_speed() -> float:
	return RUN_SPEED if run_on else WALK_SPEED

func _build_travel(root: Control) -> void:
	run_button = _button("RUN: OFF",_toggle_run)
	run_button.custom_minimum_size = Vector2(150,52)
	run_button.add_theme_font_size_override("font_size",20)
	root.add_child(run_button)
	run_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	run_button.position = Vector2(46,root.size.y-280)
	travel_button = _button("Travel",_open_travel)
	travel_button.custom_minimum_size = Vector2(170,48)
	travel_button.add_theme_font_size_override("font_size",20)
	root.add_child(travel_button)
	travel_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	travel_button.position = Vector2(root.size.x-194,480)
	travel_panel = PanelContainer.new()
	root.add_child(travel_panel)
	travel_panel.custom_minimum_size = Vector2(760,0)
	travel_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var r := VBoxContainer.new()
	r.add_theme_constant_override("separation",10)
	travel_panel.add_child(r)
	r.add_child(_label("FAST TRAVEL",26,Color("f0bd62")))
	travel_info = _label("",17,Color("cbd8de"))
	travel_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	travel_info.custom_minimum_size.x = 700
	r.add_child(travel_info)
	var grid := GridContainer.new()
	grid.columns = 2
	grid.add_theme_constant_override("h_separation",10)
	grid.add_theme_constant_override("v_separation",8)
	r.add_child(grid)
	for i in CHECKPOINTS.size():
		var b := _button("",_travel_to.bind(i))
		b.custom_minimum_size = Vector2(345,46)
		b.add_theme_font_size_override("font_size",18)
		travel_buttons.append(b)
		grid.add_child(b)
	var back := _button("Close",_close_travel)
	r.add_child(back)
	travel_panel.hide()

func _toggle_run() -> void:
	run_on = not run_on
	_refresh_run()

func _refresh_run() -> void:
	if run_button == null:
		return
	run_button.text = "RUN: ON" if run_on else "RUN: OFF"
	var sb := run_button.get_theme_stylebox("normal").duplicate() as StyleBoxFlat
	sb.bg_color = Color("c9612f") if run_on else Color("213d4f")
	run_button.add_theme_stylebox_override("normal",sb)

func _hud_v23_tick() -> void:
	if run_button == null:
		return
	_web_fps_tick()
	if quick_day != _quick_today():
		_quick_daily_check()
	var on_foot := not driving and not race_car and seat_id < 0 and not bus_riding and not sky_riding and not paused
	run_button.visible = on_foot
	travel_button.visible = not paused and not race_car
	if feed_box != null:
		feed_box.visible = not paused
	if quests_button != null:
		quests_button.visible = not paused and not race_car
	var below := hud_info.position.y+hud_info.size.y+10.0
	# v0.24.1: RUN sits up top, right beside the QR code (or under the job panel when the QR is
	# hidden), well away from the stick so a thumb on the stick can't switch it off by accident.
	# Quests sits right under the job panel too (top of the column beside the QR), RUN below it.
	var col_x := 24.0
	if qr_small != null:
		qr_small.position = Vector2(24,below)
		qr_small.visible = not paused and qr_show and not qr_big.visible
		if qr_small.visible:
			col_x = qr_small.position.x+qr_small.size.x+12.0
	if quests_button != null:
		quests_button.position = Vector2(col_x,below)
		run_button.position = Vector2(col_x,below+quests_button.size.y+10.0)
	else:
		run_button.position = Vector2(col_x,below)

func _travel_block_reason() -> String:
	if race_car:
		return "Finish or quit the race first."
	if chase_mode != 0 or online_role != 0:
		return "No fast travel during a chase."
	if trial_active >= 0:
		return "Cancel the time trial first."
	if bus_riding:
		return "Get off the bus first."
	if sky_riding or sky_wait >= 0:
		return "Get off the sky train first."
	if seat_id >= 0:
		return "Stand up first."
	if fm_hosting:
		return "You're hiding for FIND ME!"
	var now := Time.get_ticks_msec()/1000.0
	if now < travel_ready_at:
		return "Fast travel is ready again in %ds." % int(ceil(travel_ready_at-now))
	return ""

func _travel_open(i: int) -> bool:
	return _area_open(int(TRAVEL_AREA[i])) or i == checkpoint_id

func _open_travel() -> void:
	if not paused:
		_toggle_menu()
	_refresh_travel()
	_open_panel(travel_panel)

func _close_travel() -> void:
	if paused:
		_toggle_menu()

func _refresh_travel() -> void:
	var why := _travel_block_reason()
	travel_info.text = why if why != "" else "Jump to any district you have opened. Your car comes with you. Locked districts open as you play."
	for i in CHECKPOINTS.size():
		var open := _travel_open(i)
		travel_buttons[i].text = String(CHECKPOINTS[i]["name"]) if open else "%s · LOCKED" % CHECKPOINTS[i]["name"]
		travel_buttons[i].disabled = not open or why != ""

func _travel_to(i: int) -> void:
	var why := _travel_block_reason()
	if why != "" or not _travel_open(i):
		_show_toast(why if why != "" else "That district is still locked.")
		return
	var pos: Vector3 = CHECKPOINTS[i]["pos"]
	car.position = pos+Vector3(4.5,0.8,0)
	car.rotation = Vector3.ZERO
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	player.position = pos+Vector3(0,0.75,0)
	player.velocity = Vector3.ZERO
	if not driving:
		player.show()
		player.get_child(0).set_deferred("disabled",false)
	travel_ready_at = Time.get_ticks_msec()/1000.0+TRAVEL_COOL
	if paused:
		_toggle_menu()
	_follow_camera(1.0)
	_show_toast("Welcome to %s!" % CHECKPOINTS[i]["name"])
	_refresh_hud()

func _smoke_travel() -> void:
	# RUN makes you faster on foot; fast travel moves you and your car, respects locks and the wait.
	assert(run_on and _walk_speed() == RUN_SPEED,"v0.29: running by default")
	_toggle_run()
	assert(not run_on and _walk_speed() == WALK_SPEED and run_button.text == "RUN: OFF","RUN toggles off")
	_toggle_run()
	assert(run_on and run_button.text == "RUN: ON","RUN toggles back on")
	var was_driving := driving
	var was_p := player.position
	var was_c := car.position
	driving = false
	travel_ready_at = 0.0
	_travel_to(0)
	var cp: Vector3 = CHECKPOINTS[0]["pos"]
	assert(Vector2(player.position.x-cp.x,player.position.z-cp.z).length() < 0.5 and car.position.distance_to(player.position) < 6.0,"Fast travel moves you and your car")
	var at := player.position
	_travel_to(9 if not _travel_open(1) else 0)
	assert(player.position == at,"Fast travel waits, and locked districts stay locked")
	for i in CHECKPOINTS.size():
		assert(i == checkpoint_id or _travel_open(i) == _area_open(int(TRAVEL_AREA[i])),"Travel follows district locks")
	assert(STOP_CLOCK.x > 4.5 and absf(STOP_WEST.x+32.0) > 4.5,"Job stops are beside the road, not on it")
	travel_ready_at = 0.0
	driving = was_driving
	player.position = was_p
	car.position = was_c

func _v23_shots() -> void:
	# Developer-only: roadside job stops, taller trees, hats, RUN and Travel. Never saves.
	driving = false
	player.show()
	player.get_child(0).disabled = false
	walk_view = 0
	_apply_view()
	exploring = false
	next_job_pending = false
	carrying = false
	var stops := [["v23-stop-clock",1,Vector3(0,0.75,-12),PI],["v23-stop-west",5,Vector3(-26,0.75,-6),0.0],["v23-stop-port",0,Vector3(-20,0.75,12),PI*0.75]]
	for it: Array in stops:
		route_index = int(it[1])
		player.position = it[2]
		var d: Vector3 = _destination()-player.position
		player.rotation.y = atan2(-d.x,-d.z)
		cam_yaw = player.rotation.y
		cam_pitch = 0.3
		for i in 20:
			await get_tree().physics_frame
		_follow_camera(1.0)
		_refresh_hud()
		await _save_shot(String(it[0]))
	# Run on, trees.
	run_on = true
	_refresh_run()
	route_index = 0
	player.position = Vector3(-6,0.75,30)
	player.rotation.y = -PI/2.0
	cam_yaw = player.rotation.y
	for i in 20:
		await get_tree().physics_frame
	_follow_camera(1.0)
	await _save_shot("v23-trees-run")
	# Hats on the player, close up from the front.
	for h in [1,2,3,4]:
		av_hat = h
		_apply_avatar()
		paused = true
		player.position = Vector3(4.6,0.75,5.2)
		player.rotation.y = 0.0
		for i in 3:
			await get_tree().process_frame
		camera.position = player.position+Vector3(0.45,0.95,-1.05)
		camera.look_at(player.position+Vector3(0,0.82,0))
		await _save_shot("v23-hat-%d" % h)
		paused = false
	av_hat = 1
	_apply_avatar()
	camera.position = player.position+Vector3(0.7,1.1,1.0)
	camera.look_at(player.position+Vector3(0,0.82,0))
	paused = true
	await _save_shot("v23-hat-back")
	paused = false
	# v0.24: the North Highway edge where pines used to stand on the cross street.
	for spot: Array in [["v24-pines-110",Vector3(-88,0.8,-110)],["v24-pines-150",Vector3(-88,0.8,-150)]]:
		driving = true
		player.hide()
		car.position = spot[1]
		car.rotation.y = PI/2.0
		view_mode = 0
		_apply_view()
		for i in 20:
			await get_tree().physics_frame
		_follow_camera(1.0)
		await _save_shot(String(spot[0]))
	driving = false
	player.show()
	_apply_view()
	# v0.24 QR code, small and enlarged.
	route_index = 0
	player.position = Vector3(4.6,0.75,5.2)
	player.rotation.y = PI
	cam_yaw = PI
	for i in 15:
		await get_tree().physics_frame
	_follow_camera(1.0)
	await _save_shot("v24-qr-small")
	qr_big.show()
	await _save_shot("v24-qr-big")
	qr_big.hide()
	# Travel panel.
	_open_travel()
	for i in 3:
		await get_tree().process_frame
	await _save_shot("v23-travel")
	get_tree().quit()

# ---------- v0.24: "Scan to play" QR code (opens the browser version and turns Online on) ----------
const JOIN_URL := "https://kokolo2020.github.io/GTA2027/play/?join=1"
var hud_info: Control
var qr_small: Button
var qr_big: Button
var qr_show := true

func _build_qr(root: Control) -> void:
	if not ResourceLoader.exists("res://map/join_qr.png"):
		return
	var tex: Texture2D = load("res://map/join_qr.png")
	qr_small = _qr_button(tex,108,"SCAN TO PLAY")
	root.add_child(qr_small)
	qr_small.pressed.connect(func(): qr_big.show())
	qr_big = _qr_button(tex,420,"Scan with your phone camera to play Harbor City in the browser and join online.\nTap to close.")
	root.add_child(qr_big)
	qr_big.pressed.connect(func(): qr_big.hide())
	qr_big.hide()
	get_viewport().size_changed.connect(_qr_layout)
	_qr_layout()
	if OS.has_feature("web"):
		get_tree().create_timer(2.0).timeout.connect(_qr_join_check)

func _qr_button(tex: Texture2D, side: int, caption: String) -> Button:
	var b := Button.new()
	b.flat = true
	b.focus_mode = Control.FOCUS_NONE
	b.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	var card := PanelContainer.new()
	card.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb := _panel(Color("fbfbf7"),14 if side < 200 else 24)
	var pad := 6 if side < 200 else 14
	sb.content_margin_left = pad
	sb.content_margin_right = pad
	sb.content_margin_top = pad
	sb.content_margin_bottom = 4
	card.add_theme_stylebox_override("panel",sb)
	b.add_child(card)
	var col := VBoxContainer.new()
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_theme_constant_override("separation",4)
	card.add_child(col)
	var img := TextureRect.new()
	img.texture = tex
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	img.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	img.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	img.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	img.custom_minimum_size = Vector2(side,side)
	col.add_child(img)
	var l := _label(caption,13 if side < 200 else 19,Color("132b3a"))
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size.x = side
	col.add_child(l)
	card.reset_size()
	b.custom_minimum_size = card.get_combined_minimum_size()
	b.size = b.custom_minimum_size
	touch_buttons.append(b)
	return b

func _qr_layout() -> void:
	if qr_big == null:
		return
	var view := get_viewport().get_visible_rect().size
	qr_big.position = (view-qr_big.size)/2.0

func _qr_join_check() -> void:
	# Opened from the QR code (…/play/?join=1): switch Online on straight away.
	var search = JavaScriptBridge.eval("window.location.search",true)
	if typeof(search) == TYPE_STRING and String(search).contains("join=1") and not online_on:
		_online_toggle()

func _smoke_qr() -> void:
	assert(qr_small != null and qr_big != null and not qr_big.visible,"QR code built, big view closed")
	qr_small.pressed.emit()
	assert(qr_big.visible,"Tapping the QR code enlarges it")
	qr_big.pressed.emit()
	assert(not qr_big.visible,"Tapping the big QR code closes it")

# ---------- v0.24: starter crate (new players) / welcome-back crate (one time for existing saves) ----------
# Free, earned in game, never bought. Rarity picks the car; the paint is random; cash comes on top.
const CRATE_RARITY := [
	{"name":"COMMON","chance":0.6,"car":1,"bonus":[100,250],"color":Color("9fb7c4")},
	{"name":"RARE","chance":0.3,"car":3,"bonus":[250,400],"color":Color("4fa3ff")},
	{"name":"EPIC","chance":0.1,"car":4,"bonus":[400,500],"color":Color("c27cff")},
]
const CRATE_START_CASH := 1000
var crate_done := false
var crate_open := false
var crate_root: Control
var crate_buttons: Array = []
var crate_card: PanelContainer
var crate_title: Label
var crate_reward := {}
var crate_new_player := false
var crate_cash_label: Label
var crate_car_draw: Control
var crate_drive: Button

func _crate_roll(rng: RandomNumberGenerator, new_player: bool) -> Dictionary:
	var roll := rng.randf()
	var tier := 0
	var acc := 0.0
	for i in CRATE_RARITY.size():
		acc += float(CRATE_RARITY[i]["chance"])
		if roll < acc:
			tier = i
			break
	var r: Dictionary = CRATE_RARITY[tier]
	var bonus := rng.randi_range(int(r["bonus"][0]),int(r["bonus"][1]))
	var car := int(r["car"])
	var already := (owned_mask & (1 << car)) != 0
	return {"tier":tier,"car":car,"paint":rng.randi_range(1,PAINTS.size()-1),"bonus":bonus,
		"cash":(CRATE_START_CASH if new_player else 0)+bonus+(500 if already else 0),"already":already}

func _open_crate() -> void:
	crate_new_player = deliveries == 0 and owned_mask == 1 and found_mask == 0
	crate_open = true
	paused = true
	stick = Vector2.ZERO
	if crate_root == null:
		_build_crate_ui()
	crate_card.hide()
	for b: Button in crate_buttons:
		b.show()
		b.modulate = Color.WHITE
		b.scale = Vector2.ONE
		b.rotation = 0.0
		b.disabled = false
	crate_title.text = "PICK YOUR STARTER CRATE" if crate_new_player else "WELCOME BACK! PICK A FREE CRATE"
	crate_root.show()

func _build_crate_ui() -> void:
	crate_root = Control.new()
	crate_root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	crate_root.mouse_filter = Control.MOUSE_FILTER_STOP
	hud.add_child(crate_root)
	var dim := ColorRect.new()
	dim.color = Color(0.03,0.07,0.1,0.86)
	dim.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	dim.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crate_root.add_child(dim)
	var center := CenterContainer.new()
	center.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	center.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crate_root.add_child(center)
	var col := VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation",22)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	center.add_child(col)
	crate_title = _label("",38,Color("f0bd62"))
	crate_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(crate_title)
	var sub := _label("Each crate holds a car, a paint job and cash. Tap one!",20,Color("cbd8de"))
	sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(sub)
	var row := HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation",34)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(row)
	var tints := [Color("b07a3e"),Color("a0643a"),Color("b8873e")]
	for i in 3:
		var b := Button.new()
		b.text = "?"
		b.focus_mode = Control.FOCUS_NONE
		b.custom_minimum_size = Vector2(190,190)
		b.add_theme_font_size_override("font_size",84)
		b.add_theme_color_override("font_color",Color("fff3d0"))
		for state in ["normal","hover","pressed","disabled"]:
			var sb := StyleBoxFlat.new()
			sb.bg_color = (tints[i] as Color).lightened(0.12 if state == "hover" else 0.0)
			sb.set_corner_radius_all(16)
			sb.set_border_width_all(10)
			sb.border_color = Color("5c3a1c")
			sb.shadow_color = Color(0,0,0,0.45)
			sb.shadow_size = 10
			b.add_theme_stylebox_override(state,sb)
		b.pressed.connect(_crate_pick.bind(i))
		touch_buttons.append(b)
		crate_buttons.append(b)
		row.add_child(b)
	# Reveal card (hidden until a crate opens).
	crate_card = PanelContainer.new()
	crate_card.add_theme_stylebox_override("panel",_panel(Color("132b3a"),26))
	col.add_child(crate_card)
	var cc := VBoxContainer.new()
	cc.add_theme_constant_override("separation",8)
	crate_card.add_child(cc)
	var badge := _label("",26,Color.WHITE)
	badge.name = "Badge"
	badge.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cc.add_child(badge)
	crate_car_draw = Control.new()
	crate_car_draw.custom_minimum_size = Vector2(520,170)
	crate_car_draw.draw.connect(_crate_draw_car)
	cc.add_child(crate_car_draw)
	var name_l := _label("",34,Color("fff5dc"))
	name_l.name = "CarName"
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cc.add_child(name_l)
	var paint_l := _label("",20,Color("cbd8de"))
	paint_l.name = "Paint"
	paint_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cc.add_child(paint_l)
	crate_cash_label = _label("",36,Color("7ee08a"))
	crate_cash_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cc.add_child(crate_cash_label)
	crate_drive = _button("DRIVE IT!",_crate_drive)
	crate_drive.add_theme_font_size_override("font_size",28)
	for state in ["normal","hover","pressed"]:
		var sb := _panel(Color("f0bd62") if state != "pressed" else Color("d9a24a"),18)
		crate_drive.add_theme_stylebox_override(state,sb)
	crate_drive.add_theme_color_override("font_color",Color("132b3a"))
	crate_drive.add_theme_color_override("font_hover_color",Color("132b3a"))
	cc.add_child(crate_drive)
	crate_card.hide()

func _crate_pick(i: int) -> void:
	if crate_reward.has("picked") or not crate_open:
		return
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	crate_reward = _crate_roll(rng,crate_new_player)
	crate_reward["picked"] = i
	for k in crate_buttons.size():
		var b: Button = crate_buttons[k]
		b.disabled = true
		if k != i:
			create_tween().tween_property(b,"modulate:a",0.0,0.25)
	var chosen: Button = crate_buttons[i]
	chosen.pivot_offset = chosen.size/2.0
	var tw := create_tween()
	for n in 6:
		tw.tween_property(chosen,"rotation",0.14 if n % 2 == 0 else -0.14,0.07)
	tw.tween_property(chosen,"rotation",0.0,0.05)
	tw.tween_property(chosen,"scale",Vector2(1.25,1.25),0.18)
	tw.parallel().tween_property(chosen,"modulate",Color(3,3,3,1),0.18)
	tw.tween_callback(_crate_reveal)
	_crate_sound(false)

func _crate_reveal() -> void:
	if not crate_reward.has("tier"):
		return
	for b: Button in crate_buttons:
		b.hide()
	var tier: Dictionary = CRATE_RARITY[int(crate_reward["tier"])]
	var spec: Dictionary = CARS[int(crate_reward["car"])]
	var paint: Dictionary = PAINTS[int(crate_reward["paint"])]
	var badge := crate_card.find_child("Badge",true,false) as Label
	badge.text = "★ %s ★" % tier["name"]
	badge.add_theme_color_override("font_color",tier["color"])
	(crate_card.find_child("CarName",true,false) as Label).text = String(spec["name"]).to_upper()
	(crate_card.find_child("Paint",true,false) as Label).text = "%s paint  •  %s%s" % [paint["name"],spec["note"],"\nAlready in your garage: +$500 extra" if crate_reward["already"] else ""]
	crate_card.show()
	crate_card.modulate.a = 0.0
	crate_card.pivot_offset = crate_card.size/2.0
	crate_card.scale = Vector2(0.6,0.6)
	var tw := create_tween()
	tw.tween_property(crate_card,"modulate:a",1.0,0.2)
	tw.parallel().tween_property(crate_card,"scale",Vector2.ONE,0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	var total := int(crate_reward["cash"])
	var count := func(v: float): crate_cash_label.text = "+$%d" % int(v)
	tw.tween_method(count,0.0,float(total),1.1)
	crate_car_draw.queue_redraw()
	_crate_confetti(tier["color"])
	_crate_sound(true)

func _crate_draw_car() -> void:
	if crate_reward.is_empty():
		return
	var c: Color = PAINTS[int(crate_reward["paint"])]["color"]
	var w := crate_car_draw.size.x
	var o := Vector2(w/2.0-190,20)
	var body := PackedVector2Array([o+Vector2(0,100),o+Vector2(8,62),o+Vector2(70,52),o+Vector2(120,10),o+Vector2(255,10),o+Vector2(310,52),o+Vector2(372,62),o+Vector2(380,100)])
	crate_car_draw.draw_colored_polygon(body,c)
	crate_car_draw.draw_polyline(body+PackedVector2Array([body[0]]),c.darkened(0.45),4.0,true)
	var glass := PackedVector2Array([o+Vector2(132,20),o+Vector2(185,20),o+Vector2(185,52),o+Vector2(92,52)])
	crate_car_draw.draw_colored_polygon(glass,Color("2a3d4f"))
	var glass2 := PackedVector2Array([o+Vector2(197,20),o+Vector2(248,20),o+Vector2(290,52),o+Vector2(197,52)])
	crate_car_draw.draw_colored_polygon(glass2,Color("2a3d4f"))
	for wx in [85.0,295.0]:
		crate_car_draw.draw_circle(o+Vector2(wx,102),30,Color("1c2228"))
		crate_car_draw.draw_circle(o+Vector2(wx,102),14,Color("b9c2c9"))
	crate_car_draw.draw_rect(Rect2(o+Vector2(358,70),Vector2(16,10)),Color("fff0b8"))
	crate_car_draw.draw_rect(Rect2(o+Vector2(6,70),Vector2(14,10)),Color("e96963"))

func _crate_confetti(tint: Color) -> void:
	var p := CPUParticles2D.new()
	crate_root.add_child(p)
	p.position = crate_root.size/2.0
	p.amount = 140
	p.one_shot = true
	p.explosiveness = 0.95
	p.lifetime = 2.2
	p.direction = Vector2(0,-1)
	p.spread = 180.0
	p.initial_velocity_min = 260.0
	p.initial_velocity_max = 620.0
	p.gravity = Vector2(0,700)
	p.scale_amount_min = 5.0
	p.scale_amount_max = 10.0
	p.angular_velocity_min = -400.0
	p.angular_velocity_max = 400.0
	var g := Gradient.new()
	g.set_color(0,tint)
	g.set_color(1,Color("f0bd62"))
	g.add_point(0.5,Color("7ee08a"))
	p.color_initial_ramp = g
	p.emitting = true
	get_tree().create_timer(2.6).timeout.connect(p.queue_free)

func _crate_sound(burst: bool) -> void:
	if "--smoke-test" in OS.get_cmdline_user_args():
		return
	var gen := AudioStreamGenerator.new()
	gen.mix_rate = 22050.0
	var sp := AudioStreamPlayer.new()
	sp.stream = gen
	sp.volume_db = -8.0
	add_child(sp)
	sp.play()
	var pb := sp.get_stream_playback() as AudioStreamGeneratorPlayback
	var n := int(gen.mix_rate*(0.7 if burst else 0.45))
	for i in n:
		var t := float(i)/gen.mix_rate
		var v := 0.0
		if burst:
			# Rising "ta-da" arpeggio.
			var notes := [523.25,659.25,783.99,1046.5]
			var k := mini(int(t/0.12),3)
			v = sin(TAU*float(notes[k])*t)*0.32*exp(-(t-float(k)*0.12)*4.0)
		else:
			# Wooden rattle.
			v = (randf()*2.0-1.0)*0.35*(0.5+0.5*sin(TAU*18.0*t))*exp(-t*3.0)
		pb.push_frame(Vector2(v,v))
	get_tree().create_timer(1.2).timeout.connect(sp.queue_free)

func _crate_drive() -> void:
	if crate_reward.is_empty() or not crate_reward.has("picked"):
		return
	var car_i := int(crate_reward["car"])
	cash += int(crate_reward["cash"])
	owned_mask |= 1 << car_i
	while car_paint.size() < CARS.size():
		car_paint.append(0)
	car_paint[car_i] = int(crate_reward["paint"])
	car_id = car_i
	crate_done = true
	crate_open = false
	crate_root.hide()
	paused = false
	_apply_car()
	# Start in the car.
	if not driving and not race_car and seat_id < 0:
		car.position = player.position+Vector3(2.4,0.1,0)
		car.rotation.y = player.rotation.y
		driving = true
		player.hide()
		player.get_child(0).set_deferred("disabled",true)
	_save_progress()
	_follow_camera(1.0)
	_show_toast("Your %s is ready! +$%d. Follow the golden ring." % [CARS[car_i]["name"],int(crate_reward["cash"])])
	if online_on:
		_feed_add_system("%s unboxed a %s %s!" % [online_name,String(CRATE_RARITY[int(crate_reward["tier"])]["name"]).capitalize(),CARS[car_i]["name"]])
	crate_reward = {}
	_refresh_hud()

func _feed_add_system(text: String) -> void:
	_feed_add(text,"")

func _smoke_crate() -> void:
	var was := [cash,owned_mask,car_id,car_paint.duplicate(),crate_done,driving,player.position,car.position,deliveries,found_mask]
	# A brand-new player.
	cash = 0
	owned_mask = 1
	car_id = 0
	deliveries = 0
	found_mask = 0
	crate_done = false
	driving = false
	player.show()
	_open_crate()
	assert(crate_open and paused and crate_new_player and crate_root.visible,"Starter crate shows for a new player")
	_toggle_menu()
	assert(paused and crate_open,"Menu cannot close the crate")
	_crate_pick(1)
	assert(crate_reward.has("picked"),"Picking a crate rolls a reward")
	var r := crate_reward.duplicate()
	assert(int(r["cash"]) >= CRATE_START_CASH+100 and int(r["cash"]) <= CRATE_START_CASH+500,"Starter cash plus bonus")
	_crate_drive()
	assert(not crate_open and not paused and crate_done and driving,"DRIVE IT closes the crate and puts you in the car")
	assert(car_id == int(r["car"]) and (owned_mask & (1 << car_id)) != 0 and int(car_paint[car_id]) == int(r["paint"]),"Crate car is yours, with its paint")
	assert(cash == int(r["cash"]),"Crate cash added once")
	# Rolls: rarity odds and owned-car bonus.
	var rng := RandomNumberGenerator.new()
	rng.seed = 5
	var tiers := [0,0,0]
	for i in 2000:
		tiers[int(_crate_roll(rng,false)["tier"])] += 1
	assert(tiers[0] > tiers[1] and tiers[1] > tiers[2] and tiers[2] > 100,"Common > Rare > Epic")
	owned_mask = (1 << CARS.size())-1
	assert(bool(_crate_roll(rng,false)["already"]) and int(_crate_roll(rng,false)["cash"]) >= 600,"Owned car pays +$500 instead")
	cash = was[0]
	owned_mask = was[1]
	car_id = was[2]
	car_paint = was[3]
	crate_done = was[4]
	driving = was[5]
	player.position = was[6]
	car.position = was[7]
	deliveries = was[8]
	found_mask = was[9]
	if not driving:
		player.show()
		player.get_child(0).set_deferred("disabled",false)
	_apply_car()
	_save_progress()

func _crate_shots() -> void:
	# Developer-only: the starter crate. Never saves.
	cash = 0
	owned_mask = 1
	deliveries = 0
	found_mask = 0
	_open_crate()
	for i in 5:
		await get_tree().process_frame
	await _save_shot("crate-pick")
	_crate_pick(0)
	await get_tree().create_timer(0.75).timeout
	await _save_shot("crate-open")
	await get_tree().create_timer(1.6).timeout
	await _save_shot("crate-reveal")
	# v0.25 quick quest right after the crate: walking towards the first stop, then at it.
	crate_open = false
	crate_root.hide()
	paused = false
	quick_on = true
	quick_idx = 0
	quick_done = 0
	driving = false
	player.show()
	walk_view = 0
	_apply_view()
	player.position = Vector3(4.6,0.75,5.2)
	var d: Vector3 = QUICK[0]["pos"]-player.position
	player.rotation.y = atan2(-d.x,-d.z)
	cam_yaw = player.rotation.y
	for i in 20:
		await get_tree().physics_frame
	_follow_camera(1.0)
	_refresh_hud()
	await _save_shot("quick-1")
	player.position = QUICK[0]["pos"]+Vector3(0,0.75,3.0)
	for i in 10:
		await get_tree().physics_frame
	_refresh_hud()
	await _save_shot("quick-at")
	# v0.24.1: the Quests list.
	player.position = Vector3(26.5,0.75,-6)
	player.rotation.y = 0.0
	cam_yaw = 0.0
	for i in 10:
		await get_tree().physics_frame
	_follow_camera(1.0)
	_refresh_hud()
	await _save_shot("quests-hud")
	# v0.24.1 treasure hunt, placed just ahead for the picture.
	treasure_time_override = 1000.0*TREASURE_CYCLE+48.0
	treasure_got = -1
	_treasure_tick(0.0)
	treasure_node.position = Vector3(25.0,0,-17)
	treasure_time_override = 1000.0*TREASURE_CYCLE+120.0
	for i in 6:
		await get_tree().physics_frame
	await _save_shot("treasure")
	paused = true
	for k in treasure_props.size():
		treasure_node.visible = true
		for j in treasure_props.size():
			(treasure_props[j] as Node3D).visible = j == k
		(treasure_node.get_node("Chest") as Node3D).visible = true
		treasure_beam.visible = false
		camera.position = treasure_node.position+Vector3(9.0,3.2,7.0)
		camera.look_at(treasure_node.position+Vector3(1.4,2.0,0))
		await _save_shot("prop-%d" % k)
	paused = false
	player.position = Vector3(25.0,0.75,-10)
	camera.position = player.position+Vector3(2.2,1.4,3.0)
	camera.look_at(player.position+Vector3(0,-0.2,0))
	paused = true
	await _save_shot("player-ring")
	paused = false
	treasure_node.position = Vector3(500,0,500)
	# v0.24.1 Find Me as the hider.
	fm_test = true
	cash = 1000
	player.position = Vector3(32.0,0.75,-6)
	player.rotation.y = 0.0
	cam_yaw = 0.0
	_fm_start()
	_fm_msg("fmf",{"i":"h1","n":"Mia","f":fm_id})
	for i in 10:
		await get_tree().physics_frame
	_follow_camera(1.0)
	await _save_shot("findme-host")
	_fm_finish("test")
	fm_test = false
	_open_quests()
	for i in 3:
		await get_tree().process_frame
	await _save_shot("quests-list")
	get_tree().quit()

# ---------- v0.25: quick quests (short pick-ups, paid on the spot, next one starts at once) ----------
# The first nine stay in the old city a short walk apart; then the chain tours every town.
const QUICK := [
	{"task":"Grab a coffee at Harbor Café","pos":Vector3(6.5,0,16),"item":"coffee"},
	{"task":"Pick up a watch at the Clocktower","pos":Vector3(6.5,0,-22),"item":"watch"},
	{"task":"Fetch flowers at West Arcade","pos":Vector3(-25.5,0,8),"item":"flowers"},
	{"task":"Collect a parcel at the North Gate post office","pos":Vector3(-25.5,0,-22),"item":"parcel"},
	{"task":"Pick up a pizza at Sunset Market","pos":Vector3(25.5,0,-22),"item":"pizza"},
	{"task":"Collect seed packets at East Gardens","pos":Vector3(25.5,0,23),"item":"seeds"},
	{"task":"Grab a ferry ticket at Ferry Steps","pos":Vector3(6.5,0,44),"item":"ferry ticket"},
	{"task":"Pick up a toolbox at Port Dispatch","pos":Vector3(-25.5,0,26),"item":"toolbox"},
	{"task":"Find a lost cat by the Harbor Waterfront","pos":Vector3(14.5,0,27),"item":"cat"},
	{"task":"Pick up sunglasses in Marina Heights","pos":Vector3(-5.5,0,116),"item":"sunglasses"},
	{"task":"Collect a trail map at Ridge Trailhead","pos":Vector3(78.5,0,4),"item":"trail map"},
	{"task":"Grab game tokens at Harbor Dome","pos":Vector3(155.0,0,40.5),"item":"tokens"},
	{"task":"Pick up a trophy at Harbor Raceway","pos":Vector3(214,0,-168),"item":"trophy"},
	{"task":"Fetch spare parts from the Industrial Quarter","pos":Vector3(16.5,0,-72),"item":"spare parts"},
	{"task":"Collect a birthday cake in Maple Suburbs","pos":Vector3(13,0,-205),"item":"cake"},
	{"task":"Grab a postcard at Harbor Airfield","pos":Vector3(12.5,0,-345),"item":"postcard"},
	{"task":"Pick up a train ticket at Union Station","pos":Vector3(-240,0,-316),"item":"train ticket"},
	{"task":"Rescue a kite in Central Park","pos":Vector3(-436,0,-250),"item":"kite"},
	{"task":"Return library books at Civic Center","pos":Vector3(-145.5,0,23),"item":"books"},
	{"task":"Collect seashells at Bay Promenade","pos":Vector3(-95.5,0,9),"item":"seashells"},
	{"task":"Grab an ice cream at Sunset Pier","pos":Vector3(441,0,336),"item":"ice cream"},
	{"task":"Rent a surfboard at Sunset Beach","pos":Vector3(362,0,342),"item":"surfboard"},
	{"task":"Grab a postcard at the Sunset Lighthouse","pos":Vector3(578,0,372),"item":"postcard"},
	{"task":"Collect fresh bread at Westside Market","pos":Vector3(-320,0,86),"item":"bread"},
	{"task":"Pick up sunflowers at Westside Windmill","pos":Vector3(-430,0,218),"item":"flowers"},
	{"task":"Find a lost cat on Westside Hill","pos":Vector3(-368,0,192),"item":"cat"},
]
const QUICK_XP := 50
const QUICK_ALL_BONUS := 500
var quick_on := true
var quick_idx := 0
var quick_done := 0
# v0.25: daily quests. Each stop can be done once per day (your phone's date); all 20 come back at midnight.
var quick_day := ""
var quick_got := 0
var quick_test_day := ""
var quick_props: Array = []

func _quick_pay(i: int) -> int:
	# A fixed reward per stop: the further out of the old city, the more it pays.
	var here: Vector3 = QUICK[i]["pos"]
	return 60+int(clampf(Vector2(here.x-4.6,here.z-5.2).length()*0.4,0.0,240.0))

func _quick_today() -> String:
	return quick_test_day if quick_test_day != "" else Time.get_date_string_from_system()

func _quick_is_done(i: int) -> bool:
	return (quick_got & (1 << i)) != 0

func _quick_left() -> int:
	var n := 0
	for i in QUICK.size():
		if not _quick_is_done(i):
			n += 1
	return n

func _quick_next(from: Vector3) -> int:
	# Nearest stop not done today, or -1 when all are done.
	var best := -1
	var bd := INF
	for i in QUICK.size():
		if _quick_is_done(i):
			continue
		var d := Vector2(QUICK[i]["pos"].x-from.x,QUICK[i]["pos"].z-from.z).length()
		if d < bd:
			bd = d
			best = i
	return best

func _quick_fix_target() -> void:
	# Keeps quick_idx on a stop that is still open today; with none left, switch to exploring.
	if legacy_rules:
		return
	if quick_on and (quick_idx < 0 or quick_idx >= QUICK.size() or _quick_is_done(quick_idx)):
		var body: Node3D = car if driving else player
		var nxt := _quick_next(body.position if body != null else Vector3(4.6,0,5.2))
		if nxt >= 0:
			quick_idx = nxt
		else:
			quick_idx = 0
			quick_on = false
			exploring = true

func _quick_daily_check() -> void:
	if quick_props.is_empty():
		_build_quick_props()
	var today := _quick_today()
	if today != quick_day:
		var had_day := quick_day != ""
		quick_day = today
		quick_got = 0
		_quick_props_refresh()
		if had_day and not legacy_rules:
			_show_toast("New day: all %d daily quests are back!" % QUICK.size())
		_save_progress()
	_quick_fix_target()

func _quick_complete() -> void:
	if quick_idx < 0 or _quick_is_done(quick_idx):
		return
	var pay := _quick_pay(quick_idx)
	var at: Vector3 = QUICK[quick_idx]["pos"]
	cash += pay
	bonus_xp += QUICK_XP
	quick_done += 1
	quick_got |= 1 << quick_idx
	_quick_props_refresh()
	var nxt := _quick_next(at)
	quick_from = Vector3(1e9,0,0)
	if nxt >= 0:
		quick_idx = nxt
		_show_toast("DONE!  +$%d  +%d XP   (%d/%d today)  Next: %s" % [pay,QUICK_XP,QUICK.size()-_quick_left(),QUICK.size(),QUICK[quick_idx]["task"]])
	else:
		cash += QUICK_ALL_BONUS
		quick_on = false
		exploring = true
		_show_toast("ALL %d DAILY QUESTS DONE!  +$%d  +$%d bonus. New ones tomorrow!" % [QUICK.size(),pay,QUICK_ALL_BONUS])
	_save_progress()
	_quick_fx(at)
	if not ("--smoke-test" in OS.get_cmdline_user_args()):
		_play_coin()

func _quick_side(p: Vector3) -> Vector3:
	# Direction pointing away from the nearest road, so the object sits on the pavement by the building.
	var best := Vector3.ZERO
	var score := -1
	for k in 8:
		var a := TAU*float(k)/8.0
		var dir := Vector3(cos(a),0,sin(a))
		var s := 0
		for r in [1.5,3.0,4.5]:
			if not _on_road(p+dir*r):
				s += 1
		if _on_road(p-dir*3.0):
			s += 1
		if s > score:
			score = s
			best = dir
	return best

func _build_quick_props() -> void:
	quick_props.clear()
	var wood := Color("8a5a2b")
	var white := Color("f4f1e8")
	for i in QUICK.size():
		var n := Node3D.new()
		n.name = "QuickItem%d" % i
		add_child(n)
		var p: Vector3 = QUICK[i]["pos"]
		var side := _quick_side(p)
		n.position = Vector3(p.x,0,p.z)+side*1.6
		n.rotation.y = atan2(side.x,side.z)
		n.scale = Vector3.ONE*1.3
		var item := String(QUICK[i]["item"])
		var table := item in ["coffee","watch","pizza","sunglasses","tokens","cake","books","seeds","ice cream","bread"]
		if table:
			# Small round street-stall table with a striped awning.
			_tp_part(n,_tp_cyl(0.65,0.65,0.07),Vector3(0,0.82,0),Color("e9e2d0"))
			_tp_part(n,_tp_cyl(0.06,0.06,0.8),Vector3(0,0.41,0),Color("3a3f45"))
			_tp_part(n,_tp_cyl(0.3,0.3,0.04),Vector3(0,0.02,0),Color("3a3f45"))
			_tp_part(n,_tp_cyl(0.04,0.04,2.3),Vector3(0,1.15,0),Color("dddddd"))
			_tp_part(n,_tp_cyl(0.05,1.25,0.45),Vector3(0,2.35,0),Color("e0433a") if i % 2 == 0 else Color("2f7fd0"))
		var top := 0.86 if table else 0.0
		match item:
			"coffee":
				_tp_part(n,_tp_cyl(0.13,0.1,0.28),Vector3(0,top+0.14,0),white)
				_tp_part(n,_tp_cyl(0.12,0.12,0.02),Vector3(0,top+0.285,0),Color("5a3218"))
				_tp_part(n,TorusMesh.new(),Vector3(0.15,top+0.15,0),white,Vector3(PI/2,0,0),Vector3(0.09,0.09,0.09))
				_tp_part(n,_tp_cyl(0.2,0.2,0.02),Vector3(0,top+0.01,0),white)
			"watch":
				_tp_part(n,BoxMesh.new(),Vector3(0,top+0.08,0),Color("3a2a4a"),Vector3.ZERO,Vector3(0.5,0.16,0.4))
				_tp_part(n,TorusMesh.new(),Vector3(0,top+0.26,0),Color("f2c94c"),Vector3(PI/2,0,0),Vector3(0.18,0.18,0.18))
				_tp_part(n,_tp_cyl(0.14,0.14,0.04),Vector3(0,top+0.36,0.0),Color("f2c94c"),Vector3(PI/2,0,0))
				_tp_part(n,_tp_cyl(0.11,0.11,0.045),Vector3(0,top+0.36,-0.005),white,Vector3(PI/2,0,0))
			"flowers":
				_tp_part(n,_tp_cyl(0.32,0.24,0.55),Vector3(0,0.28,0),Color("b85d34"))
				var cols := [Color("ff5a7a"),Color("ffd23f"),Color("ffffff"),Color("c45adf"),Color("ff8a3a")]
				for f in 9:
					var a := TAU*float(f)/9.0
					var off := Vector3(cos(a),0,sin(a))*(0.15 if f % 2 == 0 else 0.08)
					_tp_part(n,_tp_cyl(0.015,0.015,0.6),Vector3(0,0.8,0)+off,Color("3e9e4a"))
					_tp_part(n,_tp_sphere(0.1),Vector3(0,1.12+0.06*float(f % 3),0)+off*1.4,cols[f % cols.size()])
			"parcel", "seeds":
				var c := Color("b98a52") if item == "parcel" else Color("6aa84f")
				if item == "parcel":
					_tp_part(n,BoxMesh.new(),Vector3(0,0.3,0),c,Vector3.ZERO,Vector3(0.7,0.6,0.55))
					_tp_part(n,BoxMesh.new(),Vector3(0.05,0.8,0),c,Vector3(0,0.3,0),Vector3(0.5,0.4,0.4))
					_tp_part(n,BoxMesh.new(),Vector3(0,0.605,0),Color("d9c08a"),Vector3.ZERO,Vector3(0.12,0.02,0.56))
				else:
					_tp_part(n,BoxMesh.new(),Vector3(0,top+0.1,0),wood,Vector3.ZERO,Vector3(0.7,0.2,0.45))
					var pc := [Color("ff5a7a"),Color("ffd23f"),Color("6ad0ff"),Color("8fdc5a")]
					for s in 4:
						_tp_part(n,BoxMesh.new(),Vector3(-0.24+0.16*float(s),top+0.28,0),pc[s],Vector3(-0.3,0,0),Vector3(0.13,0.2,0.02))
			"pizza":
				for s in 3:
					_tp_part(n,BoxMesh.new(),Vector3(0,top+0.04+0.08*float(s),0),Color("e8d6b0"),Vector3(0,0.15*float(s),0),Vector3(0.6,0.07,0.6))
				_tp_part(n,_tp_cyl(0.12,0.12,0.005),Vector3(0,top+0.24,0),Color("d0342c"))
			"ferry ticket", "train ticket":
				# Ticket machine with a ticket sticking out.
				var body_c := Color("2f6fd0") if item == "ferry ticket" else Color("2e8a57")
				_tp_part(n,BoxMesh.new(),Vector3(0,0.75,0),body_c,Vector3.ZERO,Vector3(0.6,1.5,0.45))
				_tp_part(n,BoxMesh.new(),Vector3(0,1.15,0.23),Color("1c2a35"),Vector3.ZERO,Vector3(0.4,0.3,0.02))
				_tp_part(n,BoxMesh.new(),Vector3(0,0.85,0.3),Color("fff3c4"),Vector3(0.3,0,0),Vector3(0.22,0.02,0.18))
				_tp_part(n,BoxMesh.new(),Vector3(0,1.62,0),Color("ffd23f"),Vector3.ZERO,Vector3(0.62,0.16,0.47))
			"toolbox":
				_tp_part(n,BoxMesh.new(),Vector3(0,0.2,0),Color("d0342c"),Vector3.ZERO,Vector3(0.7,0.4,0.35))
				_tp_part(n,BoxMesh.new(),Vector3(0,0.48,0),Color("3a3f45"),Vector3.ZERO,Vector3(0.4,0.05,0.06))
				for x in [-0.2,0.2]:
					_tp_part(n,BoxMesh.new(),Vector3(x,0.44,0),Color("3a3f45"),Vector3.ZERO,Vector3(0.04,0.1,0.06))
			"cat":
				var fur := Color("e8913a")
				_tp_part(n,_tp_sphere(0.26),Vector3(0,0.26,0),fur,Vector3.ZERO,Vector3(1.0,1.0,1.35))
				_tp_part(n,_tp_sphere(0.19),Vector3(0,0.55,0.28),fur)
				for x in [-0.1,0.1]:
					_tp_part(n,PrismMesh.new(),Vector3(x,0.74,0.28),fur,Vector3.ZERO,Vector3(0.1,0.12,0.05))
					_tp_part(n,_tp_sphere(0.03),Vector3(x*0.7,0.58,0.45),Color("1c1c22"))
				_tp_part(n,_tp_cyl(0.04,0.04,0.5),Vector3(0.15,0.2,-0.38),fur,Vector3(1.1,0,0.4))
			"sunglasses":
				for x in [-0.12,0.12]:
					_tp_part(n,_tp_cyl(0.1,0.1,0.02),Vector3(x,top+0.12,0),Color("1c1c22"),Vector3(PI/2,0,0))
				_tp_part(n,BoxMesh.new(),Vector3(0,top+0.15,0),Color("1c1c22"),Vector3.ZERO,Vector3(0.08,0.02,0.02))
				_tp_part(n,BoxMesh.new(),Vector3(0,top+0.03,-0.1),Color("7a5ad0"),Vector3.ZERO,Vector3(0.35,0.06,0.2))
			"trail map":
				_tp_part(n,_tp_cyl(0.06,0.06,1.6),Vector3(-0.45,0.8,0),wood)
				_tp_part(n,_tp_cyl(0.06,0.06,1.6),Vector3(0.45,0.8,0),wood)
				_tp_part(n,BoxMesh.new(),Vector3(0,1.25,0),Color("f0e2b8"),Vector3.ZERO,Vector3(1.0,0.7,0.05))
				_tp_part(n,BoxMesh.new(),Vector3(-0.1,1.3,0.03),Color("3e9e4a"),Vector3(0,0,0.4),Vector3(0.5,0.08,0.01))
				_tp_part(n,BoxMesh.new(),Vector3(0.15,1.15,0.03),Color("2f6fd0"),Vector3(0,0,-0.3),Vector3(0.4,0.06,0.01))
				_tp_part(n,BoxMesh.new(),Vector3(0,1.62,0),wood,Vector3.ZERO,Vector3(1.1,0.06,0.15))
			"tokens":
				for s in 7:
					var a := float(s)*1.7
					_tp_part(n,_tp_cyl(0.09,0.09,0.03),Vector3(cos(a)*0.15*float(s % 3),top+0.02+0.03*float(s/3),sin(a)*0.15*float(s % 3)),Color("f2c94c"))
				_tp_part(n,BoxMesh.new(),Vector3(0,top+0.05,-0.25),Color("c45adf"),Vector3.ZERO,Vector3(0.35,0.1,0.15))
			"trophy":
				_tp_part(n,BoxMesh.new(),Vector3(0,0.45,0),Color("3a3f45"),Vector3.ZERO,Vector3(0.6,0.9,0.6))
				_tp_part(n,BoxMesh.new(),Vector3(0,0.95,0),Color("2a2a30"),Vector3.ZERO,Vector3(0.3,0.1,0.3))
				_tp_part(n,_tp_cyl(0.04,0.06,0.2),Vector3(0,1.1,0),Color("f2c94c"))
				_tp_part(n,_tp_cyl(0.22,0.1,0.32),Vector3(0,1.36,0),Color("f2c94c"))
				for x in [-0.25,0.25]:
					_tp_part(n,TorusMesh.new(),Vector3(x,1.38,0),Color("f2c94c"),Vector3(PI/2,0,0),Vector3(0.1,0.1,0.1))
			"spare parts":
				for s in 3:
					_tp_part(n,_tp_cyl(0.38,0.38,0.24),Vector3(0,0.12+0.25*float(s),0),Color("1c1c22"))
					_tp_part(n,_tp_cyl(0.18,0.18,0.25),Vector3(0,0.12+0.25*float(s),0),Color("9aa3ab"))
				_tp_part(n,BoxMesh.new(),Vector3(0.6,0.15,0),Color("d0342c"),Vector3(0,0.4,0),Vector3(0.35,0.3,0.25))
			"cake":
				_tp_part(n,_tp_cyl(0.26,0.26,0.18),Vector3(0,top+0.09,0),Color("ff9ec0"))
				_tp_part(n,_tp_cyl(0.18,0.18,0.14),Vector3(0,top+0.25,0),Color("fff3e8"))
				for c2 in 3:
					var a := TAU*float(c2)/3.0
					_tp_part(n,_tp_cyl(0.015,0.015,0.12),Vector3(cos(a)*0.09,top+0.38,sin(a)*0.09),Color("6ad0ff"))
					_tp_part(n,_tp_sphere(0.025),Vector3(cos(a)*0.09,top+0.46,sin(a)*0.09),Color("ffb020"))
			"postcard":
				_tp_part(n,_tp_cyl(0.04,0.04,1.5),Vector3(0,0.75,0),Color("9aa3ab"))
				var pc2 := [Color("6ad0ff"),Color("ffd23f"),Color("ff5a7a"),Color("8fdc5a"),Color("c45adf"),Color("ff8a3a")]
				for s in 6:
					var a := float(s % 3)*TAU/3.0
					_tp_part(n,BoxMesh.new(),Vector3(cos(a)*0.12,0.9+0.35*float(s/3),sin(a)*0.12),pc2[s],Vector3(0,-a+PI/2,0),Vector3(0.22,0.15,0.01))
			"kite":
				_tp_part(n,_tp_cyl(0.03,0.03,1.4),Vector3(0,0.7,0),wood,Vector3(0,0,0.2))
				_tp_part(n,BoxMesh.new(),Vector3(0.15,1.35,0),Color("ff5a3a"),Vector3(0,0,PI/4),Vector3(0.5,0.5,0.02))
				_tp_part(n,BoxMesh.new(),Vector3(0.15,1.35,0.012),Color("ffd23f"),Vector3(0,0,PI/4),Vector3(0.25,0.25,0.02))
				for s in 4:
					_tp_part(n,BoxMesh.new(),Vector3(0.15+0.05*float(s % 2),0.95-0.15*float(s),0),Color("2f6fd0") if s % 2 == 0 else Color("ff5a7a"),Vector3(0,0,0.5),Vector3(0.1,0.04,0.01))
			"books":
				var bc := [Color("2f6fd0"),Color("d0342c"),Color("3e9e4a"),Color("e8a628")]
				for s in 4:
					_tp_part(n,BoxMesh.new(),Vector3(0,top+0.04+0.075*float(s),0),bc[s],Vector3(0,0.2*float(s),0),Vector3(0.36,0.07,0.26))
			"ice cream":
				for s in 3:
					_tp_part(n,_tp_cyl(0.07,0.015,0.24),Vector3(-0.2+0.2*float(s),top+0.12,0),Color("d9a066"))
					_tp_part(n,_tp_sphere(0.085),Vector3(-0.2+0.2*float(s),top+0.27,0),[Color("ffb3c8"),Color("fff3c4"),Color("8a5a3a")][s])
			"bread":
				_tp_part(n,BoxMesh.new(),Vector3(0,top+0.08,0),Color("b98a52"),Vector3.ZERO,Vector3(0.6,0.16,0.4))
				for s in 3:
					_tp_part(n,_tp_sphere(0.12),Vector3(-0.17+0.17*float(s),top+0.2,0),Color("d9a35a"),Vector3(0,0.4,0),Vector3(1.8,0.8,0.9))
			"surfboard":
				for s in 2:
					_tp_part(n,_tp_sphere(0.5),Vector3(-0.35+0.7*float(s),0.95,0),[Color("2fb0d0"),Color("ff8a3a")][s],Vector3(0,0,0.12),Vector3(0.45,1.9,0.08))
					_tp_part(n,BoxMesh.new(),Vector3(-0.35+0.7*float(s),0.95,0.045),Color("ffffff"),Vector3(0,0,0.12),Vector3(0.05,1.6,0.01))
			"seashells":
				_tp_part(n,_tp_cyl(0.22,0.17,0.32),Vector3(0,0.16,0),Color("2fb0d0"))
				_tp_part(n,TorusMesh.new(),Vector3(0,0.36,0),Color("dddddd"),Vector3(0,0,0.3),Vector3(0.28,0.28,0.28))
				for s in 5:
					var a := float(s)*1.3
					_tp_part(n,_tp_sphere(0.07),Vector3(0.4+cos(a)*0.15,0.04,sin(a)*0.15),[Color("ffd9c4"),Color("f4f1e8"),Color("ffb3a0")][s % 3],Vector3.ZERO,Vector3(1.0,0.5,1.3))
		for c in n.get_children():
			(c as GeometryInstance3D).cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
		quick_props.append(n)
	_quick_props_refresh()

func _daily_shots() -> void:
	await get_tree().process_frame
	crate_open = false
	if crate_root != null:
		crate_root.hide()
	paused = false
	driving = false
	player.show()
	walk_view = 0
	_apply_view()
	quick_got = 0
	quick_on = true
	_quick_props_refresh()
	for i in [0,1,2,3,4,7,8,14,17,18]:
		quick_idx = i
		var it := (quick_props[i] as Node3D).position
		var side := _quick_side(QUICK[i]["pos"])
		var perp := Vector3(-side.z,0,side.x)
		player.position = it-side*3.6+perp*1.7+Vector3(0,0.75,0)
		var d: Vector3 = it-player.position
		player.rotation.y = atan2(-d.x,-d.z)
		cam_yaw = player.rotation.y
		for f in 12:
			await get_tree().physics_frame
		_follow_camera(1.0)
		_refresh_hud()
		player.hide()
		await _save_shot("item-%02d" % i)
		player.show()
	# Do two, then open the list: they are gone from it and the next one is picked.
	quick_idx = 0
	player.position = QUICK[0]["pos"]+Vector3(0,0.75,0)
	_quick_complete()
	quick_idx = 2
	_quick_complete()
	player.position = QUICK[2]["pos"]+Vector3(0,0.75,2.5)
	for f in 6:
		await get_tree().physics_frame
	_open_quests()
	await _save_shot("list")
	get_tree().quit()

func _quick_props_refresh() -> void:
	for i in quick_props.size():
		(quick_props[i] as Node3D).visible = not legacy_rules and not _quick_is_done(i)

func _quick_fx(at: Vector3) -> void:
	var fx := Node3D.new()
	add_child(fx)
	fx.global_position = at+Vector3(0,0.4,0)
	var ring := MeshInstance3D.new()
	var torus := TorusMesh.new()
	torus.inner_radius = 1.7
	torus.outer_radius = 2.1
	ring.mesh = torus
	ring.material_override = _fx_material(Color("ffd86a"),0.9)
	fx.add_child(ring)
	var tw := create_tween()
	tw.tween_property(fx,"scale",Vector3(2.4,2.4,2.4),0.6)
	tw.parallel().tween_property(fx,"position:y",fx.position.y+1.5,0.6)
	tw.tween_callback(fx.queue_free)

func _play_coin() -> void:
	var gen := AudioStreamGenerator.new()
	gen.mix_rate = 22050.0
	var sp := AudioStreamPlayer.new()
	sp.stream = gen
	sp.volume_db = -8.0
	add_child(sp)
	sp.play()
	var pb := sp.get_stream_playback() as AudioStreamGeneratorPlayback
	var n := int(gen.mix_rate*0.35)
	for i in n:
		var t := float(i)/gen.mix_rate
		var f := 988.0 if t < 0.08 else 1319.0
		var v := sin(TAU*f*t)*0.3*exp(-maxf(t-(0.0 if t < 0.08 else 0.08),0.0)*9.0)
		pb.push_frame(Vector2(v,v))
	get_tree().create_timer(0.8).timeout.connect(sp.queue_free)

func _smoke_quick() -> void:
	var was := [cash,bonus_xp,quick_on,quick_idx,quick_done,exploring,driving,player.position,car.position,quick_day,quick_got]
	quick_got = 0
	quick_day = _quick_today()
	_quick_props_refresh()
	# All towns are open from the start.
	for a in 6:
		assert(_area_open(a),"Every town is open")
	_update_gate()
	assert(not north_gate_body.visible and not marina_gate_body.visible and not bay_gate_body.visible,"No gates block the roads")
	# 20 levels, early ones quick.
	assert(LEVEL_XP.size() == 20 and _level_for(0) == 1 and _level_for(100) == 2 and _level_for(10450) == 20 and _level_for(99999) == 20,"Levels 1-20")
	# Quick quest chain: first stop is a short walk, pay and XP on the spot, then the next one.
	quick_on = true
	quick_idx = 0
	quick_done = 0
	driving = false
	player.show()
	assert(_destination().is_equal_approx(QUICK[0]["pos"]),"Quick quest leads the guidance")
	assert(Vector2(QUICK[0]["pos"].x-4.6,QUICK[0]["pos"].z-5.2).length() < 15.0,"First quick quest is right by the start")
	player.position = QUICK[0]["pos"]+Vector3(1,0.75,0)
	_refresh_hud()
	assert(action_button.text.begins_with("PICK UP"),"PICK UP shows at the stop")
	var c0 := cash
	var x0 := _xp()
	var pay := _quick_pay(0)
	_interact()
	assert(cash == c0+pay and _xp() == x0+QUICK_XP and quick_done == 1 and _quick_is_done(0),"Quick quest pays and moves on")
	assert(quick_idx == 8,"Next is the nearest open one (Harbor Waterfront)")
	assert(not (quick_props[0] as Node3D).visible and (quick_props[8] as Node3D).visible,"Picked-up item disappears, others stay")
	var c1 := cash
	_interact()
	assert(quick_idx == 8 and cash == c1,"Can't collect the next one from far away")
	# The money glitch: going back to a finished stop pays nothing, and it can't be picked from the list.
	quick_idx = 0
	_quick_complete()
	assert(cash == c1,"A finished quest never pays twice")
	quick_idx = 8
	_open_quests()
	assert(not quest_order.has(0),"Finished quest is gone from the list")
	_close_quests()
	# Pay is fixed per stop, wherever you start from.
	quick_from = Vector3(500,0,500)
	assert(_quick_pay(3) == _quick_pay(3) and _quick_pay(0) < _quick_pay(16),"Fixed pay, more for far stops")
	quick_from = Vector3(1e9,0,0)
	# Every item sits off the road, near its ring.
	var bad := []
	for i in QUICK.size():
		var ip := (quick_props[i] as Node3D).position
		if _on_road(ip) or _on_road(QUICK[i]["pos"]) or _blocked_at(ip+Vector3(0,1.0,0),0.4) or _blocked_at(QUICK[i]["pos"]+Vector3(0,1.0,0),0.4):
			bad.append([i,QUICK[i]["pos"],ip,_curb_spot(QUICK[i]["pos"])])
	if not bad.is_empty():
		print("QUICK_ON_ROAD ",bad)
	assert(bad.is_empty(),"Quest rings and items are off the road")
	for i in QUICK.size():
		var ip := (quick_props[i] as Node3D).position
		assert(Vector2(ip.x-QUICK[i]["pos"].x,ip.z-QUICK[i]["pos"].z).length() < 2.0,"Quest item %d is by its ring" % i)
	# Finish them all: bonus, then quick quests are closed for the day.
	quick_got = ((1 << QUICK.size())-1) & ~(1 << 5)
	quick_idx = 5
	var c2 := cash
	_quick_complete()
	assert(cash == c2+_quick_pay(5)+QUICK_ALL_BONUS and not quick_on and exploring,"All daily quests done gives the bonus")
	_toggle_activity()
	assert(not quick_on and not exploring,"No quick quests left today, so delivery jobs")
	_toggle_activity()
	assert(exploring,"Then exploring")
	# Midnight: everything comes back.
	quick_test_day = "2099-01-01"
	_quick_daily_check()
	assert(quick_got == 0 and _quick_left() == QUICK.size() and (quick_props[0] as Node3D).visible,"New day brings all quests back")
	quick_test_day = ""
	quick_got = 0
	quick_day = _quick_today()
	quick_on = true
	exploring = false
	for i in QUICK.size():
		var p: Vector3 = QUICK[i]["pos"]
		if i < 9:
			assert(Vector2(p.x,p.z).length() < 56.0,"Early quick quests are in the old city")
	# Mode cycle: quick -> jobs -> explore -> quick.
	_toggle_activity()
	assert(not quick_on and not exploring,"Then delivery jobs")
	_toggle_activity()
	assert(exploring,"Then exploring")
	_toggle_activity()
	assert(quick_on and not exploring,"Back to quick quests")
	quick_day = was[9]
	quick_got = was[10]
	_quick_props_refresh()
	cash = was[0]
	bonus_xp = was[1]
	quick_on = was[2]
	quick_idx = was[3]
	quick_done = was[4]
	exploring = was[5]
	driving = was[6]
	player.position = was[7]
	car.position = was[8]
	_save_progress()

# ---------- v0.24.1: Quests list (nearby quick quests, pick any one) ----------
const QUEST_LIST_SIZE := 8
var quests_button: Button
var quest_panel: PanelContainer
var quest_info: Label
var quest_buttons: Array = []
var quest_order: Array = []
var quick_from := Vector3(1e9,0,0)

func _build_quest_list(root: Control) -> void:
	quests_button = _button("Quests",_open_quests)
	quests_button.custom_minimum_size = Vector2(150,52)
	quests_button.add_theme_font_size_override("font_size",20)
	for state in ["normal","hover"]:
		var sb := quests_button.get_theme_stylebox(state).duplicate() as StyleBoxFlat
		sb.bg_color = Color("8a5a12") if state == "normal" else Color("a36c18")
		quests_button.add_theme_stylebox_override(state,sb)
	root.add_child(quests_button)
	quests_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	quests_button.position = Vector2(24,240)
	quest_panel = PanelContainer.new()
	root.add_child(quest_panel)
	quest_panel.custom_minimum_size = Vector2(820,0)
	quest_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var r := VBoxContainer.new()
	r.add_theme_constant_override("separation",10)
	quest_panel.add_child(r)
	r.add_child(_label("QUESTS NEAR YOU",26,Color("f0bd62")))
	quest_info = _label("",17,Color("cbd8de"))
	quest_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	quest_info.custom_minimum_size.x = 760
	r.add_child(quest_info)
	var grid := GridContainer.new()
	grid.columns = 2
	grid.add_theme_constant_override("h_separation",10)
	grid.add_theme_constant_override("v_separation",8)
	r.add_child(grid)
	for i in QUEST_LIST_SIZE:
		var b := _button("",_quest_pick.bind(i))
		b.custom_minimum_size = Vector2(375,62)
		b.add_theme_font_size_override("font_size",16)
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		quest_buttons.append(b)
		grid.add_child(b)
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation",10)
	r.add_child(row)
	var fm := _button("FIND ME!  ($%d prizes)" % (FM_PRIZES[0]+FM_PRIZES[1]+FM_PRIZES[2]),_fm_start)
	fm.name = "FindMe"
	fm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	for state in ["normal","hover"]:
		var fsb := _panel(Color("1f8a8a") if state == "normal" else Color("27a3a3"),18)
		fm.add_theme_stylebox_override(state,fsb)
	row.add_child(fm)
	var mode := _button("",_quest_mode)
	mode.name = "Mode"
	mode.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(mode)
	var close := _button("Close",_close_quests)
	close.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(close)
	quest_panel.hide()

func _quest_nearby() -> Array:
	# Quick quests still open today, sorted by distance from you, nearest first.
	var body: Node3D = car if driving else player
	var idx: Array = range(QUICK.size()).filter(func(i): return not _quick_is_done(i))
	idx.sort_custom(func(a,b): return (QUICK[a]["pos"] as Vector3).distance_to(body.position) < (QUICK[b]["pos"] as Vector3).distance_to(body.position))
	return idx

func _open_quests() -> void:
	_quick_daily_check()
	if not paused:
		_toggle_menu()
	_refresh_quests()
	_open_panel(quest_panel)

func _close_quests() -> void:
	if paused:
		_toggle_menu()

func _refresh_quests() -> void:
	var body: Node3D = car if driving else player
	quest_order = _quest_nearby().slice(0,QUEST_LIST_SIZE)
	var left := _quick_left()
	if left == 0:
		quest_info.text = "All %d daily quests are done today. New ones tomorrow! Try the treasure hunt or FIND ME meanwhile." % QUICK.size()
	elif not quick_on:
		quest_info.text = "Daily quests: %d of %d left today. Tap one to go there (you are on %s now)." % [left,QUICK.size(),"exploring" if exploring else "delivery jobs"]
	else:
		quest_info.text = "Daily quests: %d of %d left today. Each pays once, plus %d XP. Do all %d for a $%d bonus. Orange dots on the minimap are quests." % [left,QUICK.size(),QUICK_XP,QUICK.size(),QUICK_ALL_BONUS]
	for k in QUEST_LIST_SIZE:
		var b: Button = quest_buttons[k]
		b.visible = k < quest_order.size()
		if not b.visible:
			continue
		var i := int(quest_order[k])
		var d := int(Vector2(QUICK[i]["pos"].x-body.position.x,QUICK[i]["pos"].z-body.position.z).length())
		var pay := _quick_pay(i)
		var tracking := quick_on and i == quick_idx
		b.text = "%s%s\n%dm  ·  +$%d" % ["▶ " if tracking else "",QUICK[i]["task"],d,pay]
		var sb := _panel(Color("2f6b3a") if tracking else Color("213d4f"),14)
		sb.content_margin_top = 6
		sb.content_margin_bottom = 6
		b.add_theme_stylebox_override("normal",sb)
	(quest_panel.find_child("Mode",true,false) as Button).text = "Switch activity (now: %s)" % ("quick quests" if quick_on else ("exploring" if exploring else "delivery jobs"))

func _quest_pick(k: int) -> void:
	if k >= quest_order.size() or _quick_is_done(int(quest_order[k])):
		return
	var body: Node3D = car if driving else player
	quick_on = true
	quick_idx = int(quest_order[k])
	quick_from = body.position
	_save_progress()
	if paused:
		_toggle_menu()
	_refresh_hud()
	_show_toast("Quest: %s. Follow the golden ring!" % QUICK[quick_idx]["task"])

func _quest_mode() -> void:
	_toggle_activity()

func _smoke_quests() -> void:
	var was := [quick_on,quick_idx,quick_done,player.position,driving,exploring,quick_got]
	quick_got = 0
	driving = false
	player.position = Vector3(25,0.75,-20)
	_open_quests()
	assert(paused and quest_panel.visible,"Quests list opens")
	assert(int(quest_order[0]) == 4,"Nearest quest is listed first (Sunset Market)")
	var listed := 0
	for b: Button in quest_buttons:
		if b.text.contains("m  ·  +$"):
			listed += 1
	assert(listed == QUEST_LIST_SIZE,"Quests list shows distance and pay")
	_quest_pick(2)
	assert(not paused and quick_on and quick_idx == int(quest_order[2]),"Picking a quest tracks it")
	assert(_destination().is_equal_approx(QUICK[quick_idx]["pos"]),"Guidance goes to the picked quest")
	quick_on = was[0]
	quick_idx = was[1]
	quick_done = was[2]
	player.position = was[3]
	driving = was[4]
	exploring = was[5]
	quick_got = was[6]
	quick_from = Vector3(1e9,0,0)
	_save_progress()

# ---------- v0.24.1: your own name tag above your head (or above your car) ----------
var my_tag: Label3D
var my_ring: MeshInstance3D

func _my_name() -> String:
	return online_name if online_name != "" else "You"

func _my_tag_tick() -> void:
	if player == null or "--bake-map" in OS.get_cmdline_user_args():
		return
	if my_tag == null:
		my_tag = Label3D.new()
		my_tag.font_size = 44
		my_tag.outline_size = 12
		my_tag.outline_modulate = Color("132b3a")
		my_tag.modulate = Color("ffd86a")
		my_tag.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		my_tag.no_depth_test = true
		my_tag.fixed_size = true
		my_tag.pixel_size = 0.0011
		my_tag.render_priority = 10
		add_child(my_tag)
	var body: Node3D = car if driving else player
	my_tag.visible = booted and not eye_view and not in_car_view and not crate_open and not (bus_riding and not driving) and not sky_riding
	if not my_tag.visible:
		return
	var lift := 1.7 if driving else (1.18 if seat_id < 0 else 0.9)
	my_tag.position = body.position+Vector3(0,lift,0)
	var t := "%s  ·  Lv %d" % [_my_name(),_level()]
	if my_tag.text != t:
		my_tag.text = t

# ---------- v0.24.1: treasure hunt (a new chest every 5 minutes, same for everyone online) ----------
# The 5-minute window comes from the clock, so every player sees the same chest at the same place.
# Reach it before the timer runs out; if nobody gets there in time it vanishes and a new one appears.
const TREASURE_CYCLE := 300
const TREASURE_CASH := 300
const TREASURE_XP := 100
const TREASURE_BEAM_AT := 90.0
const TREASURE_SEE := 35.0
var treasure_node: Node3D
var treasure_beam: MeshInstance3D
var treasure_props: Array = []
var treasure_label: Label
var treasure_cycle := -1
var treasure_got := -1
var treasure_count := 0
var treasure_spots: Array = []
var treasure_time_override := -1.0

func _treasure_now() -> float:
	return treasure_time_override if treasure_time_override >= 0.0 else Time.get_unix_time_from_system()

func _treasure_pick(cycle: int) -> int:
	if treasure_spots.is_empty():
		for arr in [FINDS,CIVIC,RIDGE,BAY,NORTH,DOWNTOWN,MARINA]:
			for it in arr:
				treasure_spots.append([it["pos"],String(it["name"])])
	var rng := RandomNumberGenerator.new()
	rng.seed = hash(cycle*7919+13)
	return rng.randi_range(0,treasure_spots.size()-1)

func _treasure_spot(cycle: int) -> Vector3:
	var i := _treasure_pick(cycle)
	return treasure_spots[i][0]

func _treasure_district(pos: Vector3) -> String:
	var best := ""
	var bd := INF
	for c in CHECKPOINTS:
		var d := (c["pos"] as Vector3).distance_to(pos)
		if d < bd:
			bd = d
			best = c["name"]
	return best

# v0.24.2: no arrow, distance or map dot. Clues get better as time runs out:
# first the district, then the landmark it's hidden at, and in the last 90 seconds the light beam.
func _treasure_clue(left: float) -> String:
	var spot: Array = treasure_spots[_treasure_pick(treasure_cycle)]
	var obj := String(TREASURE_PROPS[_treasure_prop(treasure_cycle)])
	if left > 180.0:
		return "Look for a %s somewhere around %s" % [obj,_treasure_district(spot[0])]
	if left > TREASURE_BEAM_AT:
		return "The %s is at %s (%s)" % [obj,spot[1],_treasure_district(spot[0])]
	return "Golden beam at %s, by the %s!" % [spot[1],obj]

# v0.24.2: every round hides the chest next to a big, odd object you can spot from a distance.
const TREASURE_PROPS := ["GIANT RUBBER DUCK","RED BEACH UMBRELLA","PURPLE HOT-AIR BALLOON","PIRATE FLAG","STACK OF BLUE BARRELS","GIANT PINEAPPLE"]
const TREASURE_PROP_SEE := 110.0

func _treasure_prop(cycle: int) -> int:
	return posmod(cycle*5+3,TREASURE_PROPS.size())

func _tp_part(parent: Node3D, mesh: Mesh, pos: Vector3, color: Color, rot := Vector3.ZERO, sc := Vector3.ONE) -> MeshInstance3D:
	var m := MeshInstance3D.new()
	m.mesh = mesh
	m.position = pos
	m.rotation = rot
	m.scale = sc
	m.material_override = _material(color)
	parent.add_child(m)
	return m

func _tp_sphere(r: float) -> SphereMesh:
	var sm := SphereMesh.new()
	sm.radius = r
	sm.height = r*2.0
	sm.radial_segments = 16
	sm.rings = 8
	return sm

func _tp_cyl(top: float, bottom: float, h: float) -> CylinderMesh:
	var c := CylinderMesh.new()
	c.top_radius = top
	c.bottom_radius = bottom
	c.height = h
	c.radial_segments = 14
	c.rings = 1
	return c

func _build_treasure_props() -> void:
	treasure_props.clear()
	for k in TREASURE_PROPS.size():
		var n := Node3D.new()
		treasure_node.add_child(n)
		n.position = Vector3(2.2,0,0.6)
		match k:
			0: # giant rubber duck
				_tp_part(n,_tp_sphere(1.1),Vector3(0,1.1,0),Color("ffd23f"),Vector3.ZERO,Vector3(1.25,0.85,1.0))
				_tp_part(n,_tp_sphere(0.7),Vector3(0.75,2.2,0),Color("ffd23f"))
				_tp_part(n,_tp_sphere(0.32),Vector3(1.4,2.1,0),Color("ff8a1f"),Vector3.ZERO,Vector3(1.4,0.5,1.0))
				for z in [-0.3,0.3]:
					_tp_part(n,_tp_sphere(0.09),Vector3(1.2,2.42,z),Color("1c1c22"))
			1: # red beach umbrella
				_tp_part(n,_tp_cyl(0.06,0.06,3.4),Vector3(0,1.7,0),Color("eeeeee"))
				_tp_part(n,_tp_cyl(0.05,2.0,0.9),Vector3(0,3.5,0),Color("e0433a"))
				_tp_part(n,_tp_cyl(0.05,1.0,0.5),Vector3(0,3.75,0),Color("fff3e8"))
			2: # purple hot-air balloon, floating
				_tp_part(n,_tp_sphere(1.8),Vector3(0,7.0,0),Color("8e4fd6"),Vector3.ZERO,Vector3(1.0,1.2,1.0))
				_tp_part(n,_tp_cyl(0.7,0.35,1.0),Vector3(0,5.0,0),Color("8e4fd6"))
				_tp_part(n,BoxMesh.new(),Vector3(0,3.6,0),Color("8a5a2b"),Vector3.ZERO,Vector3(0.9,0.6,0.9))
				for x in [-0.4,0.4]:
					_tp_part(n,_tp_cyl(0.02,0.02,1.2),Vector3(x,4.4,0),Color("3b2a1a"))
				_tp_part(n,_tp_cyl(0.03,0.03,3.3),Vector3(0,1.7,0),Color("c8b89a"))
			3: # pirate flag
				_tp_part(n,_tp_cyl(0.08,0.1,5.0),Vector3(0,2.5,0),Color("5c3a1c"))
				_tp_part(n,BoxMesh.new(),Vector3(0.95,4.3,0),Color("1c1c22"),Vector3.ZERO,Vector3(1.8,1.2,0.05))
				_tp_part(n,_tp_sphere(0.28),Vector3(0.95,4.4,0.04),Color("f4f1e8"))
				_tp_part(n,BoxMesh.new(),Vector3(0.95,4.05,0.04),Color("f4f1e8"),Vector3(0,0,0.6),Vector3(0.9,0.1,0.02))
				_tp_part(n,BoxMesh.new(),Vector3(0.95,4.05,0.04),Color("f4f1e8"),Vector3(0,0,-0.6),Vector3(0.9,0.1,0.02))
			4: # stack of blue barrels
				for b: Vector3 in [Vector3(-0.55,0.55,0),Vector3(0.55,0.55,0),Vector3(0,0.55,0.9),Vector3(-0.1,1.65,0.35),Vector3(0.35,1.65,-0.2),Vector3(0.1,2.75,0.1)]:
					_tp_part(n,_tp_cyl(0.48,0.48,1.1),b,Color("2f6fd0"))
					_tp_part(n,_tp_cyl(0.5,0.5,0.08),b+Vector3(0,0.3,0),Color("c9d4dd"))
			5: # giant pineapple
				_tp_part(n,_tp_sphere(1.0),Vector3(0,1.3,0),Color("e8a628"),Vector3.ZERO,Vector3(1.0,1.35,1.0))
				for a in 6:
					var leaf := _tp_part(n,PrismMesh.new(),Vector3(0,2.9,0),Color("3e9e4a"),Vector3(0,float(a)*PI/3.0,0.35),Vector3(0.35,1.4,0.1))
					leaf.position += Vector3(cos(float(a)*PI/3.0),0,-sin(float(a)*PI/3.0))*0.25
		for c in n.get_children():
			(c as GeometryInstance3D).cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
		n.hide()
		treasure_props.append(n)

func _build_treasure(root: Control) -> void:
	treasure_node = Node3D.new()
	add_child(treasure_node)
	var gold := _material(Color("f2c94c"))
	gold.emission_enabled = true
	gold.emission = Color("a8781a")
	gold.metallic = 0.6
	gold.roughness = 0.35
	var wood := _material(Color("8a5a2b"))
	var chest := Node3D.new()
	chest.name = "Chest"
	treasure_node.add_child(chest)
	for part: Array in [[Vector3(0,0.35,0),Vector3(1.1,0.6,0.75),wood],[Vector3(0,0.75,0),Vector3(1.14,0.24,0.79),gold],[Vector3(0,0.35,-0.39),Vector3(0.22,0.3,0.04),gold]]:
		var m := MeshInstance3D.new()
		var b := BoxMesh.new()
		b.size = part[1]
		m.mesh = b
		m.position = part[0]
		m.material_override = part[2]
		chest.add_child(m)
	for x in [-0.5,0.5]:
		var band := MeshInstance3D.new()
		var bb := BoxMesh.new()
		bb.size = Vector3(0.08,0.64,0.78)
		band.mesh = bb
		band.position = Vector3(x,0.37,0)
		band.material_override = gold
		chest.add_child(band)
	# A tall golden light beam you can see from across town.
	var beam := MeshInstance3D.new()
	treasure_beam = beam
	var cyl := CylinderMesh.new()
	cyl.top_radius = 0.35
	cyl.bottom_radius = 0.9
	cyl.height = 70.0
	cyl.radial_segments = 12
	cyl.rings = 1
	beam.mesh = cyl
	beam.position = Vector3(0,35.0,0)
	var bm := StandardMaterial3D.new()
	bm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	bm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	bm.albedo_color = Color(1.0,0.72,0.12,0.5)
	bm.cull_mode = BaseMaterial3D.CULL_DISABLED
	beam.material_override = bm
	beam.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	treasure_node.add_child(beam)
	var tag := Label3D.new()
	tag.text = "TREASURE"
	tag.font_size = 48
	tag.outline_size = 12
	tag.modulate = Color("ffd86a")
	tag.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	tag.pixel_size = 0.012
	tag.position = Vector3(0,2.4,0)
	treasure_node.add_child(tag)
	_build_treasure_props()
	treasure_node.hide()
	treasure_label = _label("",21,Color("ffe29a"))
	var sb := _panel(Color(0.32,0.2,0.02,0.9),16)
	sb.content_margin_top = 8
	sb.content_margin_bottom = 8
	treasure_label.add_theme_stylebox_override("normal",sb)
	treasure_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	root.add_child(treasure_label)
	treasure_label.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	treasure_label.custom_minimum_size = Vector2(330,0)
	treasure_label.hide()

func _treasure_dir_char(to: Vector3) -> String:
	var body: Node3D = car if driving else player
	var d := Vector2(to.x-body.position.x,to.z-body.position.z)
	var f := Vector2(-camera.global_basis.z.x,-camera.global_basis.z.z).normalized()
	var r := Vector2(camera.global_basis.x.x,camera.global_basis.x.z).normalized()
	var a := atan2(d.dot(r),d.dot(f))
	var arrows := ["↑","↗","→","↘","↓","↙","←","↖"]
	return arrows[posmod(int(round(a/(PI/4.0))),8)]

func _treasure_tick(_delta: float) -> void:
	if treasure_node == null:
		return
	var now := _treasure_now()
	var cycle := int(floor(now/float(TREASURE_CYCLE)))
	var left := float(TREASURE_CYCLE)-fmod(now,float(TREASURE_CYCLE))
	if cycle != treasure_cycle:
		var first := treasure_cycle < 0
		treasure_cycle = cycle
		treasure_node.position = _treasure_spot(cycle)
		if not first and treasure_got != cycle and not race_car:
			_show_toast("NEW TREASURE HUNT! Read the clue at the top. You have 5 minutes!")
	var active := treasure_got != cycle and not race_car
	var body: Node3D = car if driving else player
	var far := Vector2(body.position.x-treasure_node.position.x,body.position.z-treasure_node.position.z).length()
	var near := far < TREASURE_SEE
	# The object shows from further away than the chest; the beam only in the last 90 seconds.
	treasure_node.visible = active and (far < TREASURE_PROP_SEE or left <= TREASURE_BEAM_AT)
	treasure_beam.visible = left <= TREASURE_BEAM_AT
	(treasure_node.get_node("Chest") as Node3D).visible = near or left <= TREASURE_BEAM_AT
	var pk := _treasure_prop(cycle)
	for k in treasure_props.size():
		(treasure_props[k] as Node3D).visible = k == pk
	if active:
		(treasure_node.get_node("Chest") as Node3D).rotation.y += _delta*1.2
		var dist := Vector2(body.position.x-treasure_node.position.x,body.position.z-treasure_node.position.z).length()
		if dist < (5.0 if driving else 3.2) and absf(body.position.y-treasure_node.position.y) < 4.0:
			_treasure_claim()
			active = false
	var view := get_viewport().get_visible_rect().size
	var vis := not paused and not race_car and chase_mode == 0 and online_role == 0 and not crate_open
	treasure_label.visible = vis
	if not vis:
		if hud_arrow != null:
			hud_arrow.position.y = 96.0
		return
	var mm := int(left)/60
	var ss := int(left)%60
	var extra := ("\n"+fm_banner) if fm_banner != "" else ""
	if active:
		treasure_label.text = "TREASURE HUNT  %d:%02d\n%s" % [mm,ss,_treasure_clue(left)]+extra
		treasure_label.add_theme_color_override("font_color",Color("ff7a5a") if left < 60.0 else Color("ffe29a"))
	else:
		treasure_label.text = "Treasure found!  Next hunt in %d:%02d" % [mm,ss]+extra
		treasure_label.add_theme_color_override("font_color",Color("9fe0a8"))
	# Sits between the job panel and the Online/Radio buttons; long clues wrap onto more lines.
	var left_x := hud_info.position.x+hud_info.size.x+16.0
	var w := clampf(view.x-390.0-left_x,240.0,520.0)
	treasure_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	treasure_label.custom_minimum_size = Vector2(w,0)
	treasure_label.size = Vector2(w,0)
	treasure_label.reset_size()
	treasure_label.position = Vector2(maxf(left_x,minf(view.x/2.0-w/2.0,view.x-390.0-w)),24)
	if hud_arrow != null:
		# Keep the quest arrow just below the banner instead of under it.
		var ax := view.x/2.0-70.0
		var overlaps := ax+140.0 > treasure_label.position.x and ax < treasure_label.position.x+treasure_label.size.x
		hud_arrow.position.y = maxf(96.0,treasure_label.position.y+treasure_label.size.y+4.0) if overlaps else 96.0

func _treasure_claim() -> void:
	treasure_got = treasure_cycle
	treasure_node.visible = false
	treasure_count += 1
	cash += TREASURE_CASH
	bonus_xp += TREASURE_XP
	_save_progress()
	_quick_fx(treasure_node.position)
	if not ("--smoke-test" in OS.get_cmdline_user_args()):
		_play_coin()
	_show_toast("TREASURE!  +$%d  +%d XP   A new hunt starts in %d:%02d" % [TREASURE_CASH,TREASURE_XP,int(float(TREASURE_CYCLE)-fmod(_treasure_now(),float(TREASURE_CYCLE)))/60,int(float(TREASURE_CYCLE)-fmod(_treasure_now(),float(TREASURE_CYCLE)))%60])
	if online_on:
		_feed_add_system("%s found the treasure!" % _my_name())
	_refresh_hud()

# ---------- v0.24.1: glowing ring under real players (NPC walkers have none) ----------
func _player_ring(parent: Node3D, color: Color) -> MeshInstance3D:
	var ring := MeshInstance3D.new()
	var torus := TorusMesh.new()
	torus.inner_radius = 0.42
	torus.outer_radius = 0.56
	torus.rings = 24
	torus.ring_segments = 6
	ring.mesh = torus
	ring.scale = Vector3(1,0.18,1)
	ring.position = Vector3(0,0.04,0)
	var m := StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.albedo_color = color
	ring.material_override = m
	ring.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	parent.add_child(ring)
	return ring

func _smoke_treasure() -> void:
	var was := [cash,bonus_xp,treasure_got,treasure_count,player.position,driving,treasure_time_override]
	driving = false
	treasure_time_override = 1000.0*TREASURE_CYCLE+10.0
	treasure_got = -1
	_treasure_tick(0.0)
	assert(treasure_got != 1000 and treasure_cycle == 1000,"A treasure is out")
	var spot := treasure_node.position
	assert(spot.is_equal_approx(_treasure_spot(1000)),"Everyone gets the same spot for the same 5 minutes")
	treasure_time_override = 1001.0*TREASURE_CYCLE+10.0
	_treasure_tick(0.0)
	assert(treasure_got != 1001 and treasure_cycle == 1001 and not treasure_node.position.is_equal_approx(Vector3(-99999,0,0)),"When the timer runs out a new treasure appears")
	var c0 := cash
	var x0 := _xp()
	player.position = treasure_node.position+Vector3(1.0,0.75,0)
	_treasure_tick(0.0)
	assert(cash == c0+TREASURE_CASH and _xp() == x0+TREASURE_XP and treasure_got == 1001 and not treasure_node.visible,"Reaching the treasure pays once")
	_treasure_tick(0.0)
	assert(cash == c0+TREASURE_CASH,"No double reward")
	assert(treasure_label.text.begins_with("Treasure found"),"Banner shows the wait for the next hunt")
	# Clues only: no distance or arrow; district first, landmark next, beam in the last 90 s.
	treasure_got = -1
	treasure_time_override = 1002.0*TREASURE_CYCLE+10.0
	player.position = Vector3(500,0.75,500)
	_treasure_tick(0.0)
	assert(treasure_label.text.contains("Look for a ") and treasure_label.text.contains(String(TREASURE_PROPS[_treasure_prop(1002)])),"The clue names the object to look for")
	assert(treasure_label.text.contains("somewhere around") and not treasure_label.text.contains("m\n") and not treasure_label.text.contains(" m") and not treasure_beam.visible and not treasure_node.visible,"Early: district clue only, chest and beam hidden far away")
	treasure_time_override = 1002.0*TREASURE_CYCLE+200.0
	_treasure_tick(0.0)
	assert(treasure_label.text.contains(" is at "),"Later: the landmark clue")
	treasure_time_override = 1002.0*TREASURE_CYCLE+250.0
	_treasure_tick(0.0)
	assert(treasure_beam.visible and treasure_node.visible,"Last 90 seconds: the beam shows")
	cash = was[0]
	bonus_xp = was[1]
	treasure_got = was[2]
	treasure_count = was[3]
	player.position = was[4]
	driving = was[5]
	treasure_time_override = was[6]
	treasure_cycle = -1
	_save_progress()

# ---------- v0.24.1: FIND ME! (online hide-and-seek with prize money) ----------
# A player pays the prize pool up front, then is frozen for 2 minutes on a glowing floor.
# Everyone online gets a hint of the area. The first three to reach them win the prizes.
# The hider's game decides the places and announces them; unclaimed prize money is refunded.
const FM_PRIZES := [200,100,50]
const FM_TIME := 120.0
# Anywhere on the glowing floor (radius 2.6, pulsing) counts, plus room for network lag.
const FM_REACH := 4.5
var fm_hosting := false
var fm_id := ""
var fm_end := 0.0
var fm_places: Array = []
var fm_refund := 0
var fm_send_t := 0.0
var fm_banner := ""
var fm_glow: MeshInstance3D
var fm_hunts := {}
var fm_paid := {}
var fm_test := false
var fm_sent: Array = []

func _fm_now() -> float:
	return Time.get_unix_time_from_system()

func _fm_send(event: String, payload: Dictionary) -> void:
	if fm_test:
		fm_sent.append([event,payload.duplicate(true)])
		return
	_online_event_send(event,payload)

func _fm_area(pos: Vector3) -> String:
	var best := ""
	var bd := INF
	for c in CHECKPOINTS:
		var d := (c["pos"] as Vector3).distance_to(pos)
		if d < bd:
			bd = d
			best = c["name"]
	for q in QUICK:
		var d := (q["pos"] as Vector3).distance_to(pos)
		var t := String(q["task"])
		if d < bd and t.contains(" at "):
			bd = d
			best = t.substr(t.rfind(" at ")+4)
	return best

func _fm_glow_mesh() -> MeshInstance3D:
	var g := MeshInstance3D.new()
	var c := CylinderMesh.new()
	c.top_radius = 2.6
	c.bottom_radius = 2.6
	c.height = 0.04
	c.radial_segments = 32
	c.rings = 1
	g.mesh = c
	var m := StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_color = Color(0.45,1.0,0.95,0.55)
	g.material_override = m
	g.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(g)
	return g

func _fm_block_reason() -> String:
	if not (fm_test or (online_on and online_state == 3)):
		return "Turn Online on first (top right). Find Me is for playing with others."
	if fm_hosting:
		return "Your Find Me is already running."
	if driving or race_car or seat_id >= 0 or bus_riding or sky_riding or chase_mode != 0 or online_role != 0:
		return "Get out on foot first."
	var pool := int(FM_PRIZES[0]+FM_PRIZES[1]+FM_PRIZES[2])
	if cash < pool:
		return "You need $%d for the prizes." % pool
	return ""

func _fm_start() -> void:
	var why := _fm_block_reason()
	if why != "":
		_show_toast(why)
		return
	# Hide on the pavement, not in the middle of the road.
	var spot := _curb_spot(player.position)
	if not spot.is_equal_approx(player.position):
		player.position = spot
		player.velocity = Vector3.ZERO
	var pool := int(FM_PRIZES[0]+FM_PRIZES[1]+FM_PRIZES[2])
	cash -= pool
	fm_refund = pool
	fm_hosting = true
	fm_places = []
	fm_end = _fm_now()+FM_TIME
	fm_id = "%s-%d" % [online_id if online_id != "" else "me",int(_fm_now())]
	fm_send_t = 0.0
	if fm_glow == null:
		fm_glow = _fm_glow_mesh()
	_save_progress()
	if paused:
		_toggle_menu()
	_fm_announce()
	_show_toast("FIND ME! You're frozen for 2 minutes. First three to find you win $%d / $%d / $%d." % [FM_PRIZES[0],FM_PRIZES[1],FM_PRIZES[2]])
	_feed_add_system("You started FIND ME near %s!" % _fm_area(player.position))
	_refresh_hud()

func _fm_announce() -> void:
	_fm_send("fms",{"f":fm_id,"x":snappedf(player.position.x,0.1),"z":snappedf(player.position.z,0.1),"a":_fm_area(player.position),"e":fm_end,"won":fm_places.size(),"pl":fm_places})

func _fm_finish(reason: String) -> void:
	var paid := 0
	for pl in fm_places:
		paid += int(pl[2])
	var pool := int(FM_PRIZES[0]+FM_PRIZES[1]+FM_PRIZES[2])
	cash += pool-paid
	fm_refund = 0
	fm_hosting = false
	_fm_send("fmr",{"f":fm_id,"pl":fm_places,"done":1})
	_save_progress()
	if fm_glow != null:
		fm_glow.hide()
	var names: Array = []
	for pl in fm_places:
		names.append("%s $%d" % [pl[1],int(pl[2])])
	_show_toast("FIND ME over (%s). %s%s" % [reason,("Winners: "+", ".join(names)) if not names.is_empty() else "Nobody found you!",(" Refund +$%d." % (pool-paid)) if pool-paid > 0 else ""])
	_refresh_hud()

func _fm_msg(ev: String, p: Dictionary) -> void:
	var from := String(p.get("i",""))
	var f := String(p.get("f",""))
	if from == "" or f == "" or f.length() > 48:
		return
	if ev == "fms":
		if from == online_id:
			return
		var known := fm_hunts.has(f)
		var h: Dictionary = fm_hunts[f] if known else {"sent":false}
		h["host"] = from
		h["name"] = _online_clean_name(String(p.get("n","Player")))
		h["pos"] = Vector3(float(p.get("x",0.0)),0,float(p.get("z",0.0)))
		h["area"] = String(p.get("a","")).substr(0,32)
		h["end"] = minf(float(p.get("e",0.0)),_fm_now()+FM_TIME+5.0)
		h["won"] = int(p.get("won",0))
		fm_hunts[f] = h
		_fm_check_paid(f,p.get("pl",[]))
		if not known:
			_feed_add_system("%s started FIND ME near %s! Prizes $%d / $%d / $%d. Look for the glowing floor!" % [h["name"],h["area"],FM_PRIZES[0],FM_PRIZES[1],FM_PRIZES[2]])
	elif ev == "fmf":
		# Someone says they found me: check they really are close, then give out the next place.
		if not fm_hosting or f != fm_id or fm_places.size() >= 3:
			return
		for pl in fm_places:
			if String(pl[0]) == from:
				return
		if online_peers.has(from):
			var pp: Vector3 = online_peers[from]["target"]
			if Vector2(pp.x-player.position.x,pp.z-player.position.z).length() > FM_REACH+6.0:
				return
		elif not fm_test:
			return
		var place := fm_places.size()
		fm_places.append([from,_online_clean_name(String(p.get("n","Player"))),int(FM_PRIZES[place])])
		_feed_add_system("%s found you! %s place +$%d" % [fm_places[place][1],["1st","2nd","3rd"][place],int(FM_PRIZES[place])])
		_fm_send("fmr",{"f":fm_id,"pl":fm_places,"done":0})
		if fm_places.size() >= 3:
			_fm_finish("all three prizes won")
	elif ev == "fmr":
		var pl = p.get("pl",[])
		if not pl is Array:
			return
		_fm_check_paid(f,pl)
		if fm_hunts.has(f):
			fm_hunts[f]["won"] = (pl as Array).size()
			if int(p.get("done",0)) == 1:
				if fm_hunts[f].has("glow"):
					(fm_hunts[f]["glow"] as Node3D).queue_free()
				fm_hunts.erase(f)

func _fm_check_paid(f: String, pl) -> void:
	# Pays you once if the hider's winners list has your id in it.
	if not pl is Array or fm_paid.has(f):
		return
	for k in mini((pl as Array).size(),3):
		var row = pl[k]
		if row is Array and row.size() >= 3 and String(row[0]) == online_id:
			var amount := clampi(int(row[2]),0,int(FM_PRIZES[k]))
			fm_paid[f] = [k,amount]
			cash += amount
			bonus_xp += 60
			_save_progress()
			_show_toast("YOU FOUND THEM! %s place  +$%d  +60 XP" % [["1st","2nd","3rd"][k],amount])
			if not ("--smoke-test" in OS.get_cmdline_user_args()):
				_play_coin()
			return

func _fm_tick(delta: float) -> void:
	var now := _fm_now()
	fm_banner = ""
	if fm_hosting:
		var left := fm_end-now
		if fm_glow != null:
			fm_glow.show()
			fm_glow.position = Vector3(player.position.x,player.position.y-0.6,player.position.z)
			var pulse := 1.0+sin(clock*4.0)*0.08
			fm_glow.scale = Vector3(pulse,1,pulse)
		fm_banner = "FIND ME (hiding)  %d:%02d   found %d/3" % [int(maxf(left,0.0))/60,int(maxf(left,0.0))%60,fm_places.size()]
		fm_send_t -= delta
		if fm_send_t <= 0.0:
			fm_send_t = 3.0
			_fm_announce()
		if left <= 0.0:
			_fm_finish("time's up")
	# Hunting: glowing floors under hiders, a hint banner, and "found" when you reach them.
	var body: Node3D = car if driving else player
	var lines: Array = []
	for f in fm_hunts.keys():
		var h: Dictionary = fm_hunts[f]
		if now > float(h["end"])+5.0:
			if h.has("glow"):
				(h["glow"] as Node3D).queue_free()
			fm_hunts.erase(f)
			continue
		var pos: Vector3 = h["pos"]
		if online_peers.has(h["host"]):
			var t: Vector3 = online_peers[h["host"]]["target"]
			pos = Vector3(t.x,t.y-0.62,t.z)
		if not h.has("glow"):
			h["glow"] = _fm_glow_mesh()
		var g: MeshInstance3D = h["glow"]
		g.position = pos+Vector3(0,0.02,0)
		var pulse := 1.0+sin(clock*4.0)*0.08
		g.scale = Vector3(pulse,1,pulse)
		var left := maxf(float(h["end"])-now,0.0)
		var near := not driving and Vector2(body.position.x-pos.x,body.position.z-pos.z).length() < FM_REACH
		# Ask (again every 3 s while you stand there) until the hider confirms your place.
		if near and not fm_paid.has(f) and int(h["won"]) < 3 and now >= float(h.get("sent_t",0.0)):
			h["sent_t"] = now+3.0
			_fm_send("fmf",{"f":f})
			if not bool(h["sent"]):
				_show_toast("You found %s! Checking your place..." % h["name"])
			h["sent"] = true
		if fm_paid.has(f):
			var won: Array = fm_paid[f] if fm_paid[f] is Array else [0,0]
			lines.append("You found %s!  %s place  +$%d" % [h["name"],["1st","2nd","3rd"][int(won[0])],int(won[1])])
		elif bool(h["sent"]):
			lines.append("Found %s! Waiting for your place..." % h["name"] if int(h["won"]) < 3 else "%s: all 3 prizes are taken" % h["name"])
		elif int(h["won"]) < 3:
			lines.append("FIND %s near %s  %d:%02d" % [h["name"],h["area"],int(left)/60,int(left)%60])
	if not lines.is_empty():
		fm_banner = (fm_banner+"\n" if fm_banner != "" else "")+"\n".join(lines)

func _smoke_findme() -> void:
	var was := [cash,bonus_xp,online_id,online_name,player.position,driving]
	fm_test = true
	fm_sent = []
	driving = false
	online_id = "me1"
	online_name = "Koko"
	player.position = Vector3(1.0,0.75,-12)
	cash = 1000
	assert(_on_road(player.position),"Middle of the avenue counts as road")
	_fm_start()
	assert(fm_hosting and cash == 650 and fm_refund == 350,"Find Me takes the prize pool")
	assert(not _on_road(player.position) and absf(player.position.x) < 12.0,"The hider moves from the road to the pavement nearby")
	assert(not fm_sent.is_empty() and fm_sent[0][0] == "fms","Find Me is announced")
	var at := player.position
	stick = Vector2(0,-1)
	for i in 3:
		_physics_process(0.1)
	stick = Vector2.ZERO
	assert(Vector2(player.position.x-at.x,player.position.z-at.z).length() < 0.05,"The hider is frozen")
	# Three hunters find them; a fourth is too late; a repeat doesn't count twice.
	for h in ["h1","h2","h1","h3","h4"]:
		_fm_msg("fmf",{"i":h,"n":h.to_upper(),"f":fm_id})
	assert(not fm_hosting and cash == 650 and fm_refund == 0,"All prizes won: nothing refunded, Find Me ends")
	var last = fm_sent[fm_sent.size()-1]
	assert(last[0] == "fmr" and (last[1]["pl"] as Array).size() == 3 and last[1]["pl"][0][0] == "h1" and last[1]["pl"][1][0] == "h2" and last[1]["pl"][2][0] == "h3","Places in order, no repeats")
	# Time runs out with one winner: the rest is refunded.
	cash = 1000
	_fm_start()
	_fm_msg("fmf",{"i":"h9","n":"Nine","f":fm_id})
	fm_end = _fm_now()-1.0
	_fm_tick(0.1)
	assert(not fm_hosting and cash == 650+150,"Unclaimed prizes come back")
	# As a hunter: someone else hides, we find them and get paid once.
	fm_sent = []
	var c0 := cash
	_fm_msg("fms",{"i":"p5","n":"Mia","f":"p5-1","x":20.0,"z":-6.0,"a":"Sunset Market","e":_fm_now()+60.0,"won":0})
	_fm_tick(0.1)
	assert(fm_banner.contains("FIND Mia near Sunset Market"),"Hunters get the hint")
	player.position = Vector3(21,0.75,-6)
	_fm_tick(0.1)
	assert(not fm_sent.is_empty() and fm_sent[0][0] == "fmf","Reaching the glowing floor reports a find")
	assert(fm_banner.contains("Found Mia! Waiting") and not fm_banner.contains("FIND Mia"),"Hunter's banner stops saying FIND once you reach them")
	_fm_tick(0.1)
	assert(fm_sent.size() == 1,"No spam: one report per 3 seconds")
	fm_hunts["p5-1"]["sent_t"] = 0.0
	_fm_tick(0.1)
	assert(fm_sent.size() == 2,"Report is sent again if the hider hasn't answered")
	# The hider's regular announce carries the winners, so a lost result message still pays.
	_fm_msg("fms",{"i":"p5","n":"Mia","f":"p5-1","x":20.0,"z":-6.0,"a":"Sunset Market","e":_fm_now()+60.0,"won":2,"pl":[["zz","Zed",200],["me1","Koko",100]]})
	assert(cash == c0+100,"Paid from the announce")
	_fm_tick(0.1)
	assert(fm_banner.contains("You found Mia!") and fm_banner.contains("2nd place") and fm_banner.contains("+$100"),"Banner shows your place")
	var n_sent := fm_sent.size()
	fm_hunts["p5-1"]["sent_t"] = 0.0
	_fm_tick(0.1)
	assert(fm_sent.size() == n_sent,"No more reports once paid")
	_fm_msg("fmr",{"i":"p5","f":"p5-1","pl":[["zz","Zed",200],["me1","Koko",100]],"done":0})
	_fm_msg("fmr",{"i":"p5","f":"p5-1","pl":[["zz","Zed",200],["me1","Koko",100]],"done":1})
	assert(cash == c0+100,"2nd place paid once")
	fm_test = false
	cash = was[0]
	bonus_xp = was[1]
	online_id = was[2]
	online_name = was[3]
	player.position = was[4]
	driving = was[5]
	for f in fm_hunts:
		if fm_hunts[f].has("glow"):
			(fm_hunts[f]["glow"] as Node3D).queue_free()
	fm_hunts.clear()
	fm_paid.clear()
	_save_progress()

# ---------- v0.24.2: road map (for moving people off the road) ----------
var road_rects: Array = []

func _note_road(pos: Vector3, size: Vector3, yaw: float, color: Color) -> void:
	if size.y > 0.15 or size.x < 3.0 or size.z < 3.0:
		return
	if not (color.to_html(false) in SURF_ASPHALT):
		return
	road_rects.append([Vector2(pos.x,pos.z),Vector2(size.x/2.0,size.z/2.0),yaw])

func _on_road(p: Vector3) -> bool:
	for r in road_rects:
		var d := Vector2(p.x,p.z)-(r[0] as Vector2)
		if float(r[2]) != 0.0:
			d = d.rotated(float(r[2]))
		var h: Vector2 = r[1]
		if absf(d.x) <= h.x+0.3 and absf(d.y) <= h.y+0.3:
			return true
	return false

func _ped_curb(from: Vector3) -> Vector3:
	# Nearest pavement spot (off every road, nothing solid there) for someone standing around.
	for r in range(1,25):
		for k in 24:
			var a := TAU*float(k)/24.0
			var c := from+Vector3(cos(a),0,sin(a))*(float(r)*0.75)
			if not _on_road(c) and not _blocked_at(c+Vector3(0,1.0,0),0.35):
				return c
	return from

func _curb_spot(from: Vector3) -> Vector3:
	# Nearest open spot that isn't on a road, searching outwards in rings.
	if not _on_road(from):
		return from
	var space := get_world_3d().direct_space_state
	for r in range(2,16):
		for k in 24:
			var a := TAU*float(k)/24.0
			var c := from+Vector3(cos(a),0,sin(a))*(float(r)+0.6)
			if _on_road(c):
				continue
			var q := PhysicsShapeQueryParameters3D.new()
			q.shape = player.get_child(0).shape
			q.transform = Transform3D(Basis.IDENTITY,c+Vector3(0,0.2,0))
			q.exclude = [player.get_rid(),car.get_rid()]
			if space.intersect_shape(q,1).is_empty():
				return c
	return from

# ---------- v0.26: Sunset Beach (east island) and Westside (west of the Civic Center) ----------
const SB_X0 := 270.0
const SB_X1 := 610.0
const SB_Z0 := 40.0
const SB_Z1 := 400.0
const SB_AVES := [330.0,430.0,530.0]
const SB_STREETS := [90.0,150.0,250.0]
const SB_BEACH_ROAD := 318.0
const SB_PIER_X := 450.0
const WS_X0 := -462.0
const WS_X1 := -246.0
const WS_Z0 := -50.0
const WS_Z1 := 340.0
const WS_AVES := [-300.0,-360.0,-420.0]
const WS_STREETS := [0.0,72.0,150.0,230.0,300.0]
const WS_MARKET := Vector3(-330,0,111)
# Same houses and size as Maple Suburbs (the model is right at 1x once its own transform is kept).
const HOUSE_SCALE := 1.0
const HOUSE_STEP := 16.0
const HOUSE_ROW := 14.0
const HOUSE_EDGE := 14.4

func _ex_house(items: Dictionary, pos: Vector3, yaw: float, rng: RandomNumberGenerator) -> void:
	var key := "house_0" if rng.randf() < 0.5 else "house_1"
	_place(items,key,pos,yaw,HOUSE_SCALE,false)
	var size := Vector3(8.8,5.6,7.8)*HOUSE_SCALE
	if absf(sin(yaw)) > 0.7:
		size = Vector3(size.z,size.y,size.x)
	_collider(self,pos+Vector3(0,size.y/2.0,0),size)

func _ex_grid(x0: float, x1: float, z0: float, z1: float, aves: Array, streets: Array, z_end := {}) -> Array:
	# Roads (10 m wide) with centre dashes. z_end can shorten an avenue: {x: [z_from, z_to]}.
	var roads := []
	var dashes := []
	for x in aves:
		var za: float = z0
		var zb: float = z1
		if z_end.has(x):
			za = float(z_end[x][0])
			zb = float(z_end[x][1])
		roads.append([Vector3(x,0.01,(za+zb)/2.0),Vector3(10,0.08,zb-za)])
		var z := za+4.0
		while z < zb-2.0:
			var cross := false
			for s in streets:
				if absf(z-float(s)) < 7.0:
					cross = true
			if not cross:
				dashes.append([Vector3(x,0.06,z),Vector3(0.18,0.02,3)])
			z += 8.0
	for z in streets:
		roads.append([Vector3((x0+x1)/2.0,0.012,z),Vector3(x1-x0,0.08,10)])
		var x := x0+4.0
		while x < x1-2.0:
			var cross := false
			for a in aves:
				if absf(x-float(a)) < 7.0:
					cross = true
			if not cross:
				dashes.append([Vector3(x,0.062,z),Vector3(3,0.02,0.18)])
			x += 8.0
	_box_batch(Color("394552"),roads)
	_box_batch(Color("e7d9a4"),dashes)
	return roads

func _ex_lamps(lamps: Array, x0: float, x1: float, z0: float, z1: float, aves: Array, streets: Array) -> void:
	for z in streets:
		var x := x0+10.0
		while x < x1-6.0:
			var near := false
			for a in aves:
				if absf(x-float(a)) < 9.0:
					near = true
			if not near:
				lamps.append([Vector3(x,0,float(z)+6.4),PI/2.0])
				lamps.append([Vector3(x+12.0,0,float(z)-6.4),-PI/2.0])
			x += 24.0
	for a in aves:
		var z := z0+10.0
		while z < z1-6.0:
			var near := false
			for s in streets:
				if absf(z-float(s)) < 9.0:
					near = true
			if not near:
				lamps.append([Vector3(float(a)+6.4,0,z),0.0])
			z += 24.0

func _ex_umbrella(pos: Vector3, color: Color) -> void:
	var n := Node3D.new()
	add_child(n)
	n.position = pos
	_tp_part(n,_tp_cyl(0.05,0.05,2.4),Vector3(0,1.2,0),Color("eeeeee"))
	_tp_part(n,_tp_cyl(0.05,1.5,0.6),Vector3(0,2.45,0),color)

func _ex_yards(xl: Array, zl: Array, edge_x: Array, edge_z: Array, skip: Array) -> void:
	# Grass yards inside each block, leaving the road and a 4 m sidewalk (9 m from a road centre).
	var yards := []
	for i in xl.size()-1:
		for j in zl.size()-1:
			if [i,j] in skip:
				continue
			var x0: float = float(xl[i])+(1.0 if i == 0 and edge_x[0] else 9.0)
			var x1: float = float(xl[i+1])-(1.0 if i == xl.size()-2 and edge_x[1] else 9.0)
			var z0: float = float(zl[j])+(1.0 if j == 0 and edge_z[0] else 9.0)
			var z1: float = float(zl[j+1])-(1.0 if j == zl.size()-2 and edge_z[1] else 9.0)
			if x1-x0 > 2.0 and z1-z0 > 2.0:
				yards.append([Vector3((x0+x1)/2.0,0.02,(z0+z1)/2.0),Vector3(x1-x0,0.04,z1-z0)])
	_box_batch(Color("78a06b"),yards)

func _build_expansion() -> void:
	var water := Color("248caa")
	var walk := Color("8f8d86")
	var rock := Color("8a8377")
	var sand := Color("cdb88a")
	var wood := Color("7a5f45")
	var rng := RandomNumberGenerator.new()
	rng.seed = 2626
	var lamps := []
	var trees := []
	var palms := []
	var benches := []
	var items := {}
	# ===== Sunset Beach =====
	_box(self,Vector3(454,-0.66,245),Vector3(392,0.3,470),water)
	_slab(Vector3((SB_X0+SB_X1)/2.0,-0.35,(SB_Z0+SB_Z1)/2.0),Vector3(SB_X1-SB_X0,0.6,SB_Z1-SB_Z0),0,walk)
	# Bridge: from the Harbor Dome causeway (before the dome's car barrier) south, then east to the island.
	_slab(Vector3(130,-0.35,91.0),Vector3(14,0.6,118),0,walk)
	_slab(Vector3(200,-0.35,150),Vector3(154,0.6,14),0,walk)
	_box_batch(Color("394552"),[[Vector3(130,0.012,93.5),Vector3(10,0.08,113)],[Vector3(202.5,0.014,150),Vector3(145,0.08,10)]])
	var bdash := []
	for z in range(42,140,8):
		bdash.append([Vector3(130,0.06,float(z)),Vector3(0.18,0.02,3)])
	for x in range(142,268,8):
		bdash.append([Vector3(float(x),0.064,150),Vector3(3,0.02,0.18)])
	_box_batch(Color("e7d9a4"),bdash)
	var rail := Color("dfe3e6")
	_box(self,Vector3(122.8,0.55,98.1),Vector3(0.4,1.1,117.8),rail,true)
	_box(self,Vector3(137.2,0.55,91.0),Vector3(0.4,1.1,103.6),rail,true)
	_box(self,Vector3(203.6,0.55,142.8),Vector3(132.8,1.1,0.4),rail,true)
	_box(self,Vector3(196.4,0.55,157.2),Vector3(147.2,1.1,0.4),rail,true)
	for z in range(50,140,16):
		lamps.append([Vector3(136.4,0,float(z)),0.0])
	for x in range(150,268,16):
		lamps.append([Vector3(float(x),0,156.4),PI/2.0])
	_sign("SUNSET BEACH  ↓",Vector3(130,6.5,46),Color("ffd8a8"),56)
	_sign("SUNSET BEACH",Vector3(SB_X0+8.0,9,150),Color("ffd8a8"),80)
	# v0.27: no edge walls; the north side joins the new coast road land, the rest is open seafront.
	_ex_grid(SB_X0,SB_X1,SB_Z0+5.0,SB_BEACH_ROAD,SB_AVES,SB_STREETS)
	_box_batch(Color("394552"),[[Vector3((SB_X0+10.0+SB_X1-10.0)/2.0,0.016,SB_BEACH_ROAD),Vector3(SB_X1-SB_X0-20.0,0.08,10)]])
	_ex_lamps(lamps,SB_X0,SB_X1,SB_Z0,SB_BEACH_ROAD,SB_AVES,SB_STREETS)
	# Beach, boardwalk and pier.
	_box_batch(sand,[[Vector3((SB_X0+SB_X1)/2.0,0.03,(SB_BEACH_ROAD+9.0+SB_Z1)/2.0),Vector3(SB_X1-SB_X0,0.06,SB_Z1-SB_BEACH_ROAD-9.0)]])
	_box_batch(wood,[[Vector3((SB_X0+SB_X1)/2.0,0.05,SB_BEACH_ROAD+11.0),Vector3(SB_X1-SB_X0-4.0,0.06,4.0)]])
	_slab(Vector3(SB_PIER_X,-0.35,SB_Z1+22.0),Vector3(8,0.6,44),0,wood)
	_box(self,Vector3(SB_PIER_X-4.2,0.55,SB_Z1+22.0),Vector3(0.3,1.1,44),wood,true)
	_box(self,Vector3(SB_PIER_X+4.2,0.55,SB_Z1+22.0),Vector3(0.3,1.1,44),wood,true)
	_box(self,Vector3(SB_PIER_X,0.55,SB_Z1+44.0),Vector3(8.6,1.1,0.3),wood,true)
	for z in range(int(SB_Z1)+6,int(SB_Z1)+44,8):
		for sx in [-3.6,3.6]:
			_box(self,Vector3(SB_PIER_X+sx,-0.5,float(z)),Vector3(0.4,1.4,0.4),Color("6b5038"))
	items["kiosk"] = [[Vector3(SB_PIER_X,0,SB_Z1+38.0),PI,1.0]]
	_collider(self,Vector3(SB_PIER_X,1.7,SB_Z1+38.0),Vector3(3,3.4,3.2))
	_prop("res://models/lighthouse.glb",Vector3(SB_X1-14.0,0,SB_Z1-12.0),Vector3(5,20,5),0.0,Color("f2f0e8"))
	var ucols := [Color("e0433a"),Color("2f7fd0"),Color("ffd23f"),Color("3e9e4a"),Color("ff8a3a")]
	for k in 16:
		var ux := SB_X0+20.0+float(k)*20.0+rng.randf_range(-4.0,4.0)
		if absf(ux-SB_PIER_X) < 8.0:
			continue
		var uz := rng.randf_range(SB_BEACH_ROAD+22.0,SB_Z1-12.0)
		_ex_umbrella(Vector3(ux,0,uz),ucols[k % ucols.size()])
		_box_batch(ucols[(k+2) % ucols.size()],[[Vector3(ux+1.2,0.07,uz+0.6),Vector3(1.0,0.03,2.0)]])
	for x in range(int(SB_X0)+14,int(SB_X1)-10,22):
		if absf(float(x)-SB_PIER_X) > 10.0:
			palms.append([Vector3(float(x),0,SB_BEACH_ROAD+17.0),rng.randf()*TAU,rng.randf_range(0.85,1.15)])
	for x in range(int(SB_X0)+22,int(SB_X1)-10,30):
		benches.append([Vector3(float(x),0,SB_BEACH_ROAD+13.6),PI])
	_ex_yards([SB_X0,330.0,430.0,530.0,SB_X1],[SB_Z0,90.0,150.0,250.0,SB_BEACH_ROAD],[true,true],[true,false],[[1,1],[2,1],[3,1]])
	# Sunset Boulevard (z = 150) shops, the Sunset Hotel facing the beach, and beach houses.
	for x in [352.0,404.0,456.0,504.0,556.0]:
		_place(items,"shops_0" if int(x) % 2 == 0 else "shops_1",Vector3(x,0,134),0.0)
		_place(items,"shops_1" if int(x) % 2 == 0 else "shops_0",Vector3(x,0,166),PI)
	_place(items,"hotel",Vector3(480,0,290),0.0,0.9)
	_sign("SUNSET HOTEL",Vector3(480,19,290),Color("ffe9b8"),56)
	# Houses: rows facing each street inside every block (setback keeps sidewalks clear).
	var xs := [SB_X0,330.0,430.0,530.0,SB_X1]
	for bi in 4:
		var bx0: float = xs[bi]
		var bx1: float = xs[bi+1]
		var x := bx0+(7.0 if bi == 0 else HOUSE_EDGE)
		while x <= bx1-(7.0 if bi == 3 else HOUSE_EDGE):
			_ex_house(items,Vector3(x,0,90.0-HOUSE_ROW),0.0,rng)
			_ex_house(items,Vector3(x,0,90.0+HOUSE_ROW),PI,rng)
			_ex_house(items,Vector3(x,0,250.0-HOUSE_ROW),0.0,rng)
			if bi == 0:
				_ex_house(items,Vector3(x,0,150.0+HOUSE_ROW),PI,rng)
			if not (bi == 2):
				_ex_house(items,Vector3(x,0,250.0+HOUSE_ROW),PI,rng)
				_ex_house(items,Vector3(x,0,SB_BEACH_ROAD-HOUSE_ROW),0.0,rng)
			x += HOUSE_STEP
		trees.append([Vector3((bx0+bx1)/2.0,0,200),rng.randf()*TAU,1.0])
		trees.append([Vector3((bx0+bx1)/2.0-12.0,0,206),rng.randf()*TAU,0.9])
		trees.append([Vector3((bx0+bx1)/2.0+12.0,0,194),rng.randf()*TAU,0.9])
	# ===== Westside =====
	_box(self,Vector3((WS_X0+WS_X1)/2.0-10.0,-0.66,(WS_Z0+WS_Z1)/2.0),Vector3(WS_X1-WS_X0+40.0,0.3,WS_Z1-WS_Z0+40.0),water)
	_slab(Vector3((WS_X0+WS_X1)/2.0,-0.35,(WS_Z0+WS_Z1)/2.0),Vector3(WS_X1-WS_X0,0.6,WS_Z1-WS_Z0),0,walk)
	# v0.27: no edge walls (land to the north and east, open seafront west and south).
	_ex_grid(WS_X0+6.0,WS_X1,WS_Z0+5.0,WS_Z1-5.0,WS_AVES,WS_STREETS)
	_ex_lamps(lamps,WS_X0,WS_X1,WS_Z0,WS_Z1,WS_AVES,WS_STREETS)
	_sign("WESTSIDE",Vector3(WS_X1-6.0,8,72),Color("cfe8ff"),72)
	_sign("WESTSIDE  ←",Vector3(-232,6.5,64),Color("cfe8ff"),48)
	_ex_yards([WS_X0,-420.0,-360.0,-300.0,WS_X1],[WS_Z0,0.0,72.0,150.0,230.0,300.0,WS_Z1],[true,true],[true,true],[[2,2],[0,4],[0,5]])
	# Market square with stalls and a fountain.
	var m := WS_MARKET
	_box_batch(Color("a9a69e"),[[m+Vector3(0,0.035,0),Vector3(44,0.06,58)]])
	items["fountain"] = [[m,0.0,0.6]]
	_collider(self,m+Vector3(0,0.5,0),Vector3(8.4,1.0,8.4))
	var stall_cols := [Color("e0433a"),Color("2f7fd0"),Color("3e9e4a"),Color("ffb020"),Color("c45adf"),Color("ff8a3a")]
	for k in 6:
		var sp := m+Vector3(-15.0+float(k % 3)*15.0,0,-17.0 if k < 3 else 17.0)
		_box(self,sp+Vector3(0,0.45,0),Vector3(3.6,0.9,1.6),Color("8a5a2b"),true)
		_box(self,sp+Vector3(0,2.5,0),Vector3(4.2,0.12,2.6),stall_cols[k])
		for cx in [-1.7,1.7]:
			_box(self,sp+Vector3(cx,1.25,-1.1),Vector3(0.1,2.5,0.1),Color("dddddd"))
		_box_batch(stall_cols[(k+3) % 6],[[sp+Vector3(0,0.98,0),Vector3(3.2,0.12,1.2)]])
	for b in [[m+Vector3(-9,0,0),PI/2.0],[m+Vector3(9,0,0),-PI/2.0],[m+Vector3(0,0,-9),0.0],[m+Vector3(0,0,9),PI]]:
		benches.append(b)
	_sign("WESTSIDE MARKET",m+Vector3(0,7,0),Color("ffe9b8"),56)
	# Windmill park on the north-west corner, a water tower, and houses everywhere else.
	var park := Vector3(-441,0,265)
	_box_batch(Color("74b062"),[[park+Vector3(0,0.035,0),Vector3(30,0.06,60)]])
	_landmark("res://models/windmill.glb",park+Vector3(0,0,-8),[])
	_collider(self,park+Vector3(0,3.4,-8),Vector3(3.8,6.9,3.1))
	for p in [park+Vector3(-9,0,10),park+Vector3(8,0,14),park+Vector3(-6,0,-22),park+Vector3(9,0,-20)]:
		trees.append([p,rng.randf()*TAU,1.0])
	var wt := Vector3(-390,0,265)
	for lx in [-2.2,2.2]:
		for lz in [-2.2,2.2]:
			_box(self,wt+Vector3(lx,4.5,lz),Vector3(0.4,9,0.4),Color("6b6f75"),true)
	_tp_part(self,_tp_cyl(3.6,3.6,4.5),wt+Vector3(0,11.2,0),Color("dfe3e6"))
	_tp_part(self,_tp_cyl(0.3,3.8,1.2),wt+Vector3(0,14.0,0),Color("b0463c"))
	_sign("WESTSIDE",wt+Vector3(0,11.2,3.7),Color("1c2a35"),40).billboard = BaseMaterial3D.BILLBOARD_DISABLED
	var wxs := [WS_X0+6.0,-420.0,-360.0,-300.0,WS_X1]
	var wzs := [WS_Z0+5.0,0.0,72.0,150.0,230.0,300.0,WS_Z1-5.0]
	for bi in 4:
		for bj in 6:
			var bx0: float = wxs[bi]
			var bx1: float = wxs[bi+1]
			var bz0: float = wzs[bj]
			var bz1: float = wzs[bj+1]
			if bi == 2 and bj == 2:
				continue # market
			if bi == 0 and (bj == 4 or bj == 5):
				continue # windmill park
			if bi == 1 and bj == 4:
				continue # water tower
			var x := bx0+(0.0 if bi == 0 else HOUSE_EDGE)
			while x <= bx1-(7.0 if bi == 3 else HOUSE_EDGE):
				if bz1-bz0 > 40.0:
					_ex_house(items,Vector3(x,0,bz0+(11.0 if bj == 0 else HOUSE_ROW)),PI,rng)
					_ex_house(items,Vector3(x,0,bz1-HOUSE_ROW),0.0,rng)
				elif bj > 0 and bz1-bz0 > 30.0:
					_ex_house(items,Vector3(x,0,bz0+HOUSE_ROW),PI,rng)
				x += HOUSE_STEP
			if bz1-bz0 > 60.0:
				trees.append([Vector3((bx0+bx1)/2.0,0,(bz0+bz1)/2.0),rng.randf()*TAU,1.0])
	for key in items:
		_model_batch("res://models/%s.glb" % key,items[key],{},String(key).begins_with("house_"))
	_model_batch("res://models/lamp.glb",lamps)
	_model_batch("res://models/tree_round.glb",trees)
	_model_batch("res://models/palm.glb",palms)
	_model_batch("res://models/bench.glb",benches)

func _expand_shots() -> void:
	await get_tree().process_frame
	crate_open = false
	if crate_root != null:
		crate_root.hide()
	paused = false
	driving = false
	player.show()
	walk_view = 0
	_apply_view()
	# [name, stand here, look towards]
	for s in [["bridge",Vector3(130,0,60),Vector3(130,0,150)],["sb-blvd",Vector3(342,0,157),Vector3(450,0,150)],["sb-beach",Vector3(380,0,330),Vector3(450,0,380)],["sb-pier",Vector3(430,0,350),Vector3(SB_PIER_X,0,SB_Z1+40.0)],["sb-hotel",Vector3(470,0,326),Vector3(480,0,290)],["ws-gate",Vector3(-230,0,76),Vector3(-300,0,72)],["ws-market",Vector3(-345,0,80),Vector3(-330,0,111)],["ws-street",Vector3(-300,0,160),Vector3(-300,0,240)],["ws-windmill",Vector3(-420,0,240),Vector3(-441,0,258)],["ws-houses",Vector3(-318,0,157),Vector3(-336,0,172)],["sb-houses",Vector3(372,0,243),Vector3(357,0,228)]]:
		player.position = (s[1] as Vector3)+Vector3(0,0.75,0)
		var d: Vector3 = (s[2] as Vector3)-(s[1] as Vector3)
		player.rotation.y = atan2(-d.x,-d.z)
		cam_yaw = player.rotation.y
		for f in 30:
			await get_tree().physics_frame
		_follow_camera(1.0)
		_refresh_hud()
		await _save_shot(String(s[0]))
	get_tree().quit()

# ===================== v0.27: one connected city, Harbor Loop sky train, day and night =====================

# Open land that fills the gaps between districts: [x0, x1, z0, z1]. Drawn a little lower than the
# district ground so the two never fight, but solid at the same height so cars roll straight across.
const LAND_FILLS := [
	[-480.0,650.0,-470.0,-40.0],
	[-480.0,56.0,-40.0,17.0],
	[56.0,110.0,-40.0,-6.0],
	[110.0,186.0,-40.0,-12.0],
	[56.0,110.0,6.0,25.0],
	[186.0,650.0,-40.0,-14.0],
	[262.0,650.0,-14.0,40.0],
	[-480.0,650.0,-790.0,-470.0],
	[-700.0,-480.0,-790.0,-40.0],
]
# New roads joining the districts: [from, to, width].
const LINK_ROADS := [
	[Vector2(197,-453),Vector2(197,-23),10.0],
	[Vector2(-660,-458),Vector2(460,-458),10.0],
	[Vector2(192,-28),Vector2(535,-28),10.0],
	[Vector2(330,-23),Vector2(330,46),10.0],
	[Vector2(430,-23),Vector2(430,46),10.0],
	[Vector2(530,-23),Vector2(530,46),10.0],
	[Vector2(108,-220),Vector2(192,-220),10.0],
	[Vector2(108,-300),Vector2(192,-300),10.0],
	[Vector2(-660,-56),Vector2(-150,-56),20.0],
	[Vector2(-300,-51.5),Vector2(-300,-44),10.0],
	[Vector2(-360,-51.5),Vector2(-360,-44),10.0],
	[Vector2(-420,-51.5),Vector2(-420,-44),10.0],
	[Vector2(-247,0),Vector2(-175,0),8.0],
	[Vector2(-140,-4),Vector2(-140,18),10.0],
	[Vector2(-185,-4),Vector2(-185,18),10.0],
	[Vector2(-230,-4),Vector2(-230,18),10.0],
]
const SEA_FLOOR_Y := -2.2

var safe_hist: Array = []
var safe_t := 0.0
var sea_t := 0.0
var lamp_spots: Array = []

func _build_connect() -> void:
	var grass := _material(Color("78a06b"))
	for f in LAND_FILLS:
		var x0: float = f[0]
		var x1: float = f[1]
		var z0: float = f[2]
		var z1: float = f[3]
		var mesh := MeshInstance3D.new()
		var bm := BoxMesh.new()
		bm.size = Vector3(x1-x0,0.6,z1-z0)
		mesh.mesh = bm
		mesh.material_override = grass
		mesh.position = Vector3((x0+x1)/2.0,-0.38,(z0+z1)/2.0)
		add_child(mesh)
		_collider(self,Vector3((x0+x1)/2.0,-0.35,(z0+z1)/2.0),Vector3(x1-x0,0.6,z1-z0))
	# The sea all around, with a shallow floor so a car that drives in can be towed back out.
	_box(self,Vector3(85,-0.75,-30),Vector3(3200,0.3,3200),Color("248caa"))
	var floor_body := StaticBody3D.new()
	var floor_shape := CollisionShape3D.new()
	var fb := BoxShape3D.new()
	fb.size = Vector3(3200,0.6,3200)
	floor_shape.shape = fb
	floor_body.position = Vector3(85,SEA_FLOOR_Y-0.3,-30)
	floor_body.add_child(floor_shape)
	add_child(floor_body)
	# Roads: asphalt first (so crossings are known), then lane dashes and lamps away from crossings.
	var asphalt := []
	for r in LINK_ROADS:
		var a: Vector2 = r[0]
		var b: Vector2 = r[1]
		var w: float = r[2]
		var mid := (a+b)/2.0
		var along_x := absf(b.x-a.x) > absf(b.y-a.y)
		var size := Vector3(absf(b.x-a.x),0.08,w) if along_x else Vector3(w,0.08,absf(b.y-a.y))
		asphalt.append([Vector3(mid.x,0.013,mid.y),size])
	_box_batch(Color("394552"),asphalt)
	var dashes := []
	var lamps := []
	var trees := []
	for r in LINK_ROADS:
		var a: Vector2 = r[0]
		var b: Vector2 = r[1]
		var w: float = r[2]
		var len := a.distance_to(b)
		if len < 20.0:
			continue
		var dir := (b-a)/len
		var n := Vector2(-dir.y,dir.x)
		var t := 4.0
		while t < len-2.0:
			var p := a+dir*t
			if not _v27_near_cross(p,n,w):
				dashes.append([Vector3(p.x,0.066,p.y),Vector3(0.18,0.02,3) if absf(dir.y) > 0.5 else Vector3(3,0.02,0.18)])
			t += 8.0
		t = 10.0
		var side := 1.0
		while t < len-6.0:
			var p := a+dir*t
			var q := p+n*side*(w/2.0+1.6)
			if not _v27_near_cross(p,n,w) and not _on_road(Vector3(q.x,0,q.y)):
				# Lamp arms point at the road.
				var yaw := atan2(-n.y*side,n.x*side)+PI
				lamps.append([Vector3(q.x,0,q.y),yaw])
			side = -side
			t += 26.0
		t = 18.0
		while t < len-10.0:
			var p := a+dir*t
			for s in [-1.0,1.0]:
				var q: Vector2 = p+n*s*(w/2.0+9.0)
				var q3 := Vector3(q.x,0,q.y)
				if not _on_road(q3) and not _v27_in_district(q3):
					trees.append([q3,float(int(t*7.0) % 628)/100.0,0.9+float(int(t) % 5)*0.06])
			t += 31.0
	_box_batch(Color("e7d9a4"),dashes)
	_model_batch("res://models/lamp.glb",lamps)
	# A few trees on the new open land.
	var rng := RandomNumberGenerator.new()
	rng.seed = 2727
	for k in 70:
		var q := Vector3(rng.randf_range(116,186),0,rng.randf_range(-430,-60))
		if not _on_road(q) and not _v27_near_any_road(q,8.0) and q.distance_to(Vector3(176,0,-270)) > 22.0:
			trees.append([q,rng.randf()*TAU,rng.randf_range(0.8,1.2)])
	for k in 30:
		var q := Vector3(rng.randf_range(210,640),0,rng.randf_range(-12,36))
		if not _on_road(q) and not _v27_near_any_road(q,8.0) and not _v27_in_district(q):
			trees.append([q,rng.randf()*TAU,rng.randf_range(0.8,1.2)])
	_model_batch("res://models/tree_round.glb",trees)
	_sign("COAST ROAD",Vector3(214,6.0,-28),Color("ffe0b8"),48)
	_sign("RACEWAY ROAD  ↑",Vector3(197,6.0,-40),Color("ffd8a8"),44)
	_sign("WESTSIDE BOULEVARD",Vector3(-290,6.0,-56),Color("cfe8ff"),48)

func _v27_near_cross(p: Vector2, n: Vector2, w: float) -> bool:
	for s in [-1.0,1.0]:
		var q: Vector2 = p+n*s*(w/2.0+3.0)
		if _on_road(Vector3(q.x,0,q.y)):
			return true
	return false

func _v27_near_any_road(q: Vector3, d: float) -> bool:
	for o in [Vector3(d,0,0),Vector3(-d,0,0),Vector3(0,0,d),Vector3(0,0,-d)]:
		if _on_road(q+o):
			return true
	return false

func _v27_in_district(q: Vector3) -> bool:
	# Inside one of the built-up districts (where the land fill is hidden under district ground).
	if q.z < -462.0:
		return true
	if q.x > RW_X0-2.0 and q.x < RW_X1+2.0 and q.z > RW_Z0-2.0 and q.z < RW_Z1+2.0:
		return true
	if q.x > SB_X0-2.0 and q.x < SB_X1+2.0 and q.z > SB_Z0-2.0 and q.z < SB_Z1+2.0:
		return true
	if q.x > -112.0 and q.x < 112.0 and q.z > -455.0 and q.z < -54.0:
		return true
	if q.x > DT_WEST-2.0 and q.x < DT_EAST+2.0 and q.z > DT_SOUTH-2.0 and q.z < DT_NORTH+2.0:
		return true
	return false

func _sea_tick(delta: float) -> void:
	if sky_riding or seat_id >= 0 or not booted:
		return
	var body: CharacterBody3D = car if driving else player
	safe_t += delta
	if body.position.y > -0.3 and body.is_on_floor() and safe_t > 0.4:
		safe_t = 0.0
		safe_hist.append([body.position,body.rotation.y])
		if safe_hist.size() > 8:
			safe_hist.pop_front()
	if body.position.y < -0.6:
		sea_t += delta
		if driving:
			car_speed = move_toward(car_speed,0.0,delta*30.0)
		if sea_t > 1.0:
			_sea_tow()
	else:
		sea_t = 0.0

func _sea_tow() -> void:
	sea_t = 0.0
	if safe_hist.is_empty():
		_rescue()
		return
	var h: Array = safe_hist[0]
	var body: CharacterBody3D = car if driving else player
	body.position = (h[0] as Vector3)+Vector3(0,0.4,0)
	body.rotation = Vector3(0,float(h[1]),0)
	body.velocity = Vector3.ZERO
	if driving:
		car_speed = 0.0
		player.position = car.position
	safe_hist = [h]
	_show_toast("Splash! Your car went into the sea. It's been towed back to the road." if driving else "Splash! You swam back to the shore.")

# ---------- Harbor Loop sky train ----------
const SKY_Y := 15.0
const SKY_SPEED := 20.0
const SKY_ACCEL := 1.5
const SKY_DWELL := 14.0
const SKY_CARS := 3
const SKY_CAR_LEN := 13.0
const SKY_GAP := 0.7
const SKY_TRAINS := 2
const SKY_CORNERS := [Vector2(-95,32),Vector2(130,32),Vector2(130,150),Vector2(530,150),Vector2(530,-28),Vector2(197,-28),Vector2(197,-300),Vector2(-300,-300),Vector2(-300,72),Vector2(-95,72)]
const SKY_STATIONS := [
	{"name":"Harbor Waterfront","at":Vector2(22,32)},
	{"name":"Sunset Beach","at":Vector2(380,150)},
	{"name":"Harbor Raceway","at":Vector2(197,-178)},
	{"name":"Union Station","at":Vector2(-205,-300)},
	{"name":"Westside Market","at":Vector2(-300,46)},
]
const TOUR_BONUS := 750
const TOUR_XP := 150

var sky_pts: PackedVector3Array = PackedVector3Array()
var sky_s: PackedFloat32Array = PackedFloat32Array()
var sky_len := 0.0
var sky_st_s: Array = []
var sky_st_info: Array = []   # per station: {"pos","side","entrance","platform"}
var sky_trip: Array = []
var sky_period := 0.0
var sky_trains: Array = []    # per train: Array of car Node3D
var sky_labels: Array = []
var sky_window_mat: StandardMaterial3D
var sky_light_mat: StandardMaterial3D
var sky_riding := false
var sky_train := 0
var sky_wait := -1
var sky_getoff := -1
var sky_last_at := -1
var sky_was_dwell := false
var sky_time_override := -1.0
var sky_pillars: Array = []
var tour_day := ""
var tour_got := 0
var tour_test_day := ""

func _sky_build_path() -> void:
	var pts: Array = []
	var n := SKY_CORNERS.size()
	var tin: Array = []
	var tout: Array = []
	for i in n:
		var c: Vector2 = SKY_CORNERS[i]
		var prev: Vector2 = SKY_CORNERS[(i+n-1) % n]
		var nxt: Vector2 = SKY_CORNERS[(i+1) % n]
		var r := minf(22.0,minf(c.distance_to(prev),c.distance_to(nxt))*0.45)
		tin.append(c+(prev-c).normalized()*r)
		tout.append(c+(nxt-c).normalized()*r)
	for i in n:
		var c: Vector2 = SKY_CORNERS[i]
		var a: Vector2 = tin[i]
		var b: Vector2 = tout[i]
		for k in 12:
			var t := float(k)/12.0
			var p := a.lerp(c,t).lerp(c.lerp(b,t),t)
			pts.append(p)
		var nb: Vector2 = tin[(i+1) % n]
		var seg := b.distance_to(nb)
		var steps := maxi(1,int(seg/4.0))
		for k in steps:
			pts.append(b.lerp(nb,float(k)/float(steps)))
	sky_pts = PackedVector3Array()
	sky_s = PackedFloat32Array()
	var total := 0.0
	for i in pts.size():
		var p: Vector2 = pts[i]
		if i > 0:
			total += p.distance_to(pts[i-1])
		sky_pts.append(Vector3(p.x,SKY_Y,p.y))
		sky_s.append(total)
	var first: Vector2 = pts[0]
	var last: Vector2 = pts[pts.size()-1]
	total += first.distance_to(last)
	sky_pts.append(Vector3(first.x,SKY_Y,first.y))
	sky_s.append(total)
	sky_len = total

func _sky_pos(s: float) -> Vector3:
	s = fposmod(s,sky_len)
	var lo := 0
	var hi := sky_s.size()-1
	while hi-lo > 1:
		var mid := (lo+hi)/2
		if sky_s[mid] <= s:
			lo = mid
		else:
			hi = mid
	var span := sky_s[hi]-sky_s[lo]
	var t := 0.0 if span <= 0.0 else (s-sky_s[lo])/span
	return sky_pts[lo].lerp(sky_pts[hi],t)

func _sky_dir(s: float) -> Vector3:
	var d := _sky_pos(s+2.0)-_sky_pos(s-2.0)
	d.y = 0
	return d.normalized() if d.length() > 0.001 else Vector3(0,0,-1)

func _sky_project(at: Vector2) -> float:
	var best := INF
	var best_s := 0.0
	for i in sky_pts.size():
		var d := Vector2(sky_pts[i].x,sky_pts[i].z).distance_to(at)
		if d < best:
			best = d
			best_s = sky_s[i]
	# Refine on the neighbouring metre.
	var s0 := best_s
	for k in range(-40,41):
		var s := s0+float(k)*0.1
		var p := _sky_pos(s)
		var d := Vector2(p.x,p.z).distance_to(at)
		if d < best:
			best = d
			best_s = s
	return fposmod(best_s,sky_len)

func _sky_trip_time(d: float) -> float:
	var ramp := SKY_SPEED*SKY_SPEED/SKY_ACCEL
	if d >= ramp:
		return d/SKY_SPEED+SKY_SPEED/SKY_ACCEL
	return 2.0*sqrt(d/SKY_ACCEL)

func _sky_trip_dist(d: float, t: float) -> float:
	var total := _sky_trip_time(d)
	var ta := minf(SKY_SPEED/SKY_ACCEL,total/2.0)
	var vmax := SKY_ACCEL*ta
	if t <= ta:
		return 0.5*SKY_ACCEL*t*t
	if t >= total-ta:
		var rem := total-t
		return d-0.5*SKY_ACCEL*rem*rem
	return 0.5*SKY_ACCEL*ta*ta+vmax*(t-ta)

func _sky_now() -> float:
	return sky_time_override if sky_time_override >= 0.0 else Time.get_unix_time_from_system()

func _sky_state(train: int) -> Dictionary:
	# Where a train is right now. Same clock for every player, so all phones see the same trains.
	var tau := fposmod(_sky_now()+float(train)*sky_period/float(SKY_TRAINS),sky_period)
	var n := sky_st_s.size()
	for i in n:
		var d: float = float(sky_trip[i][0])
		var tt: float = float(sky_trip[i][1])
		if tau < SKY_DWELL:
			return {"s":float(sky_st_s[i]),"dwell":true,"at":i,"next":(i+1) % n,"wait":SKY_DWELL-tau}
		tau -= SKY_DWELL
		if tau < tt:
			return {"s":fposmod(float(sky_st_s[i])+_sky_trip_dist(d,tau),sky_len),"dwell":false,"at":-1,"next":(i+1) % n,"wait":tt-tau}
		tau -= tt
	return {"s":float(sky_st_s[0]),"dwell":true,"at":0,"next":1 % n,"wait":0.0}

func _sky_time_at_station(train: int, station: int, into_dwell := 2.0) -> float:
	# A clock value when this train has just stopped at this station (for tests and screenshots).
	var t := into_dwell
	for i in station:
		t += SKY_DWELL+float(sky_trip[i][1])
	return t-float(train)*sky_period/float(SKY_TRAINS)+sky_period*10.0

func _sky_next_arrival(station: int) -> float:
	# Seconds until any train next stops at this station (0 if one is there now).
	var best := INF
	for k in SKY_TRAINS:
		var tau := fposmod(_sky_now()+float(k)*sky_period/float(SKY_TRAINS),sky_period)
		var start := 0.0
		for i in station:
			start += SKY_DWELL+float(sky_trip[i][1])
		if tau >= start and tau < start+SKY_DWELL:
			return 0.0
		best = minf(best,fposmod(start-tau,sky_period))
	return best

func _build_skytrain() -> void:
	_sky_build_path()
	sky_st_s.clear()
	for st in SKY_STATIONS:
		sky_st_s.append(_sky_project(st["at"]))
	sky_trip.clear()
	sky_period = 0.0
	for i in sky_st_s.size():
		var d := fposmod(float(sky_st_s[(i+1) % sky_st_s.size()])-float(sky_st_s[i]),sky_len)
		var tt := _sky_trip_time(d)
		sky_trip.append([d,tt])
		sky_period += SKY_DWELL+tt
	# Guideway: a concrete beam with two rails and low side walls.
	var beam := []
	var rails := []
	var walls := []
	for i in sky_pts.size()-1:
		var a := sky_pts[i]
		var b := sky_pts[i+1]
		var d := b-a
		var l := d.length()
		if l < 0.01:
			continue
		var yaw := atan2(d.x,d.z)
		var mid := (a+b)/2.0
		var right := Vector3(d.z,0,-d.x)/l
		beam.append([mid+Vector3(0,-0.55,0),Vector3(3.4,1.1,l+0.08),yaw])
		for s in [-0.75,0.75]:
			rails.append([mid+right*s+Vector3(0,0.1,0),Vector3(0.2,0.2,l+0.05),yaw])
		for s in [-1.6,1.6]:
			walls.append([mid+right*s+Vector3(0,0.25,0),Vector3(0.2,0.5,l+0.05),yaw])
	_box_batch_rot(Color("cfd2cc"),beam)
	_box_batch_rot(Color("5d666c"),rails)
	_box_batch_rot(Color("e9ece6"),walls)
	sky_window_mat = StandardMaterial3D.new()
	sky_window_mat.albedo_color = Color("1d2e3a")
	sky_window_mat.roughness = 0.2
	sky_window_mat.emission_enabled = true
	sky_window_mat.emission = Color("ffe7b8")
	sky_window_mat.emission_energy_multiplier = 0.0
	sky_light_mat = StandardMaterial3D.new()
	sky_light_mat.albedo_color = Color("fff6d8")
	sky_light_mat.emission_enabled = true
	sky_light_mat.emission = Color("fff2c8")
	sky_light_mat.emission_energy_multiplier = 0.6
	# Stations first (they decide which side the platform is on), then pillars that avoid crossings.
	sky_st_info.clear()
	for i in SKY_STATIONS.size():
		sky_st_info.append(_sky_build_station(i))
	var pil := []
	var caps := []
	var last := -100.0
	var s := 0.0
	while s < sky_len:
		var p := _sky_pos(s)
		var g := Vector3(p.x,0,p.z)
		var dir := _sky_dir(s)
		var nrm := Vector3(-dir.z,0,dir.x)
		# Only on straight stretches (in the road median); on the curved corners a pillar would land in a lane.
		var ok := s-last >= 30.0 and maxf(absf(dir.x),absf(dir.z)) > 0.9995 and maxf(absf(_sky_dir(s-6.0).x),absf(_sky_dir(s-6.0).z)) > 0.9995 and maxf(absf(_sky_dir(s+6.0).x),absf(_sky_dir(s+6.0).z)) > 0.9995
		if ok:
			for k in [-1.0,1.0]:
				# v0.29: 12.5 m out, so pillars also stand in the median of the 20 m (4-lane) roads.
				if _on_road(g+nrm*k*12.5) or _on_road(g+dir*k*9.0) != _on_road(g):
					ok = false
			if ok and _blocked_at(g+Vector3(0,1.2,0),1.0):
				ok = false
		if ok:
			last = s
			var yaw := atan2(dir.x,dir.z)
			pil.append([g+Vector3(0,(SKY_Y-1.1-2.0)/2.0,0),Vector3(1.3,SKY_Y-1.1+2.0,1.3),yaw])
			caps.append([g+Vector3(0,SKY_Y-1.4,0),Vector3(3.0,0.6,1.6),yaw])
			_collider(self,g+Vector3(0,2.5,0),Vector3(1.3,5.0,1.3))
			sky_pillars.append(g)
		s += 2.0
	_box_batch_rot(Color("bfc2bc"),pil)
	_box_batch_rot(Color("b3b6b0"),caps)
	# Trains.
	sky_trains.clear()
	sky_labels.clear()
	for k in SKY_TRAINS:
		var cars: Array = []
		for j in SKY_CARS:
			cars.append(_sky_make_car(j == 0,j == SKY_CARS-1))
		sky_trains.append(cars)
		var lab := Label3D.new()
		lab.font_size = 44
		lab.modulate = Color("bff3ff")
		lab.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		lab.outline_size = 8
		lab.pixel_size = 0.016
		lab.text = "HARBOR LOOP"
		lab.position = Vector3(0,4.6,0)
		(cars[0] as Node3D).add_child(lab)
		sky_labels.append(lab)
	_sky_place_trains()

func _sky_make_car(lead: bool, tail: bool) -> Node3D:
	var car_node := Node3D.new()
	add_child(car_node)
	var half := SKY_CAR_LEN/2.0
	_box(car_node,Vector3(0,1.75,0),Vector3(2.9,2.7,SKY_CAR_LEN),Color("f3f5f2"))
	_box(car_node,Vector3(0,0.75,0),Vector3(2.94,0.36,SKY_CAR_LEN-0.2),Color("17a2b8"))
	var win := _box(car_node,Vector3(0,2.15,0),Vector3(2.96,0.95,SKY_CAR_LEN-1.6),Color("1d2e3a"))
	win.material_override = sky_window_mat
	_box(car_node,Vector3(0,3.2,0),Vector3(2.5,0.25,SKY_CAR_LEN-0.6),Color("d9dde0"))
	for z in [-half+2.4,half-2.4]:
		_box(car_node,Vector3(0,0.28,z),Vector3(2.2,0.5,2.4),Color("2a3036"))
	for s in [-1.0,1.0]:
		var door := _box(car_node,Vector3(s*1.49,1.55,0),Vector3(0.04,2.1,1.5),Color("2f3c46"))
		door.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	if lead:
		_box(car_node,Vector3(0,1.55,-half-0.55),Vector3(2.7,2.2,1.1),Color("f3f5f2"))
		var ws := _box(car_node,Vector3(0,2.2,-half-1.12),Vector3(2.3,0.9,0.06),Color("1d2e3a"))
		ws.material_override = sky_window_mat
		_box(car_node,Vector3(0,0.75,-half-0.55),Vector3(2.74,0.36,1.12),Color("17a2b8"))
		for s in [-0.8,0.8]:
			var hl := _box(car_node,Vector3(s,1.15,-half-1.12),Vector3(0.45,0.22,0.06),Color("fff6d8"))
			hl.material_override = sky_light_mat
	if tail:
		for s in [-0.8,0.8]:
			_box(car_node,Vector3(s,1.15,half+0.04),Vector3(0.45,0.22,0.06),Color("e0303a"))
	return car_node

func _sky_place_trains() -> void:
	for k in sky_trains.size():
		var st := _sky_state(k)
		var cars: Array = sky_trains[k]
		var span := SKY_CAR_LEN+SKY_GAP
		var front := float(st["s"])+span*float(SKY_CARS)/2.0
		for j in cars.size():
			var c := front-span*(float(j)+0.5)
			var pf := _sky_pos(c+SKY_CAR_LEN*0.38)
			var pb := _sky_pos(c-SKY_CAR_LEN*0.38)
			var fwd := pf-pb
			fwd.y = 0
			if fwd.length() < 0.001:
				continue
			var node: Node3D = cars[j]
			node.global_transform = Transform3D(Basis.looking_at(fwd.normalized(),Vector3.UP),(pf+pb)/2.0+Vector3(0,0.2,0))
		var lab: Label3D = sky_labels[k]
		lab.text = "HARBOR LOOP\nAt %s" % SKY_STATIONS[int(st["at"])]["name"] if bool(st["dwell"]) else "HARBOR LOOP\nNext: %s" % SKY_STATIONS[int(st["next"])]["name"]

func _sky_build_station(i: int) -> Dictionary:
	var s: float = sky_st_s[i]
	var p := _sky_pos(s)
	var dir := _sky_dir(s)
	var nrm := Vector3(-dir.z,0,dir.x)
	var g := Vector3(p.x,0,p.z)
	var side := 1.0
	var ent := Vector3.INF
	for sd in [1.0,-1.0]:
		for e in [9.5,8.0,11.0,12.5]:
			var q: Vector3 = g+nrm*sd*e
			if not _on_road(q) and not _on_road(q+dir*3.6) and not _blocked_at(q+Vector3(0,1.0,0),1.0):
				side = sd
				ent = q
				break
		if ent != Vector3.INF:
			break
	if ent == Vector3.INF:
		ent = g+nrm*9.5
	var off := g.distance_to(ent)
	var lift := ent+dir*3.6
	var along_x := absf(dir.x) > absf(dir.z)
	var plat := g+nrm*side*3.75
	var plat_size := Vector3(44,0.5,4.0) if along_x else Vector3(4.0,0.5,44)
	_slab(plat+Vector3(0,SKY_Y+0.0,0),plat_size,0,Color("d8d4c8"))
	var edge := g+nrm*side*1.9
	_box(self,edge+Vector3(0,SKY_Y+0.26,0),Vector3(44,0.03,0.3) if along_x else Vector3(0.3,0.03,44),Color("f2c230"))
	# Roof over the platform and the track, on posts at the back edge.
	var roof_c := g+nrm*side*2.6
	_box(self,roof_c+Vector3(0,SKY_Y+4.9,0),Vector3(46,0.3,6.6) if along_x else Vector3(6.6,0.3,46),Color("2f6f8f"))
	var strip := _box(self,roof_c+Vector3(0,SKY_Y+4.72,0),Vector3(42,0.08,0.5) if along_x else Vector3(0.5,0.08,42),Color("fff6d8"))
	strip.material_override = sky_light_mat if sky_light_mat != null else strip.material_override
	for k in range(-2,3):
		var post := g+nrm*side*5.6+dir*float(k)*10.5
		_box(self,post+Vector3(0,SKY_Y+2.6,0),Vector3(0.3,4.6,0.3),Color("5d666c"))
	# Glass lift tower from the street up to the platform, and a walkway across.
	_box(self,lift+Vector3(0,(SKY_Y+3.2)/2.0,0),Vector3(3.0,SKY_Y+3.2,3.0),Color("8fc8dc"))
	for cx in [-1.0,1.0]:
		for cz in [-1.0,1.0]:
			_box(self,lift+Vector3(cx*1.5,(SKY_Y+3.4)/2.0,cz*1.5),Vector3(0.25,SKY_Y+3.4,0.25),Color("2f6f8f"))
	var walk_c := g+dir*3.6+nrm*side*(5.75+off)/2.0
	var walk_len := maxf(off-5.75,0.5)
	_box(self,walk_c+Vector3(0,SKY_Y-0.05,0),Vector3(2.4,0.4,walk_len) if along_x else Vector3(walk_len,0.4,2.4),Color("d8d4c8"))
	_sign("HARBOR LOOP\n%s" % SKY_STATIONS[i]["name"],plat+Vector3(0,SKY_Y+6.6,0),Color("bff3ff"),46)
	_sign("SKY TRAIN ↑",lift+Vector3(0,4.2,0)-nrm*side*1.8,Color("bff3ff"),40)
	var ring := MeshInstance3D.new()
	var torus := TorusMesh.new()
	torus.inner_radius = 2.0
	torus.outer_radius = 2.4
	ring.mesh = torus
	var rmat := StandardMaterial3D.new()
	rmat.albedo_color = Color("5fe0ff")
	rmat.emission_enabled = true
	rmat.emission = Color("2fb8e0")
	rmat.emission_energy_multiplier = 0.8
	ring.material_override = rmat
	ring.position = ent+Vector3(0,0.12,0)
	add_child(ring)
	return {"pos":g,"side":side,"entrance":ring.position*Vector3(1,0,1),"platform":plat+Vector3(0,SKY_Y+0.3,0),"dir":dir}

func _sky_near() -> int:
	if driving or sky_riding or sky_wait >= 0 or race_car or seat_id >= 0 or bus_riding:
		return -1
	for i in sky_st_info.size():
		var e: Vector3 = sky_st_info[i]["entrance"]
		if Vector2(player.position.x-e.x,player.position.z-e.z).length() < 3.2 and absf(player.position.y-e.y) < 3.0:
			return i
	return -1

func _sky_fmt(sec: float) -> String:
	var t := int(ceil(sec))
	return "%d:%02d" % [t/60,t % 60]

func _sky_enter(i: int) -> void:
	if chase_mode != 0 or online_role != 0:
		_show_toast("No sky train rides during a chase.")
		return
	if fm_hosting:
		_show_toast("You're hiding for FIND ME! Stay put until it ends.")
		return
	sky_wait = i
	var plat: Vector3 = sky_st_info[i]["platform"]
	player.position = plat+Vector3(0,0.6,0)
	player.velocity = Vector3.ZERO
	var dir: Vector3 = sky_st_info[i]["dir"]
	player.rotation.y = atan2(-dir.x,-dir.z)
	cam_yaw = player.rotation.y+PI
	var wait := _sky_next_arrival(i)
	_show_toast("Up on the platform at %s. %s  Ride to all 5 stations today for a $%d City Tour bonus." % [SKY_STATIONS[i]["name"],"A train is here, hop on!" if wait <= 0.0 else "Next train in %s." % _sky_fmt(wait),TOUR_BONUS])
	_follow_camera(1.0)

func _sky_leave_platform() -> void:
	if sky_wait < 0:
		return
	var e: Vector3 = sky_st_info[sky_wait]["entrance"]
	sky_wait = -1
	player.position = e+Vector3(0,0.9,0)
	player.velocity = Vector3.ZERO
	_show_toast("Back down on the street.")
	_follow_camera(1.0)

func _sky_board(k: int, at: int) -> void:
	sky_wait = -1
	sky_riding = true
	sky_train = k
	sky_last_at = at
	sky_was_dwell = true
	sky_getoff = -1
	player.hide()
	player.get_child(0).set_deferred("disabled",true)
	_tour_stamp(at)
	_show_toast("All aboard the Harbor Loop! Next stop: %s. Tap GET OFF NEXT to hop off at the next station." % SKY_STATIONS[(at+1) % SKY_STATIONS.size()]["name"])

func _sky_alight(i: int) -> void:
	sky_riding = false
	sky_getoff = -1
	var e: Vector3 = sky_st_info[i]["entrance"]
	var nrm := Vector3(-(sky_st_info[i]["dir"] as Vector3).z,0,(sky_st_info[i]["dir"] as Vector3).x)*float(sky_st_info[i]["side"])
	player.position = e+nrm*1.2+Vector3(0,0.9,0)
	player.velocity = Vector3.ZERO
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	safe_hist.clear()
	_show_toast("Welcome to %s!" % SKY_STATIONS[i]["name"])
	_follow_camera(1.0)

func _sky_action() -> void:
	if sky_wait >= 0:
		_sky_leave_platform()
		return
	if not sky_riding:
		return
	var st := _sky_state(sky_train)
	if bool(st["dwell"]):
		_sky_alight(int(st["at"]))
		return
	if sky_getoff >= 0:
		sky_getoff = -1
		_show_toast("OK, staying on the train.")
	else:
		sky_getoff = int(st["next"])
		_show_toast("Getting off at %s." % SKY_STATIONS[sky_getoff]["name"])

func _sky_tick(_delta: float) -> void:
	if sky_trains.is_empty():
		return
	_sky_place_trains()
	if sky_wait >= 0:
		var plat: Vector3 = sky_st_info[sky_wait]["platform"]
		if Vector2(player.position.x-plat.x,player.position.z-plat.z).length() > 26.0 or player.position.y < SKY_Y-3.0:
			sky_wait = -1
			_show_toast("You left the platform.")
			return
		for k in SKY_TRAINS:
			var st := _sky_state(k)
			if bool(st["dwell"]) and int(st["at"]) == sky_wait and float(st["wait"]) > 1.0:
				_sky_board(k,sky_wait)
				break
		return
	if not sky_riding:
		return
	var st := _sky_state(sky_train)
	var cars: Array = sky_trains[sky_train]
	var mid: Node3D = cars[SKY_CARS/2]
	player.position = mid.global_position+Vector3(0,1.2,0)
	player.velocity = Vector3.ZERO
	var dwell := bool(st["dwell"])
	if dwell and int(st["at"]) != sky_last_at:
		sky_last_at = int(st["at"])
		var name := String(SKY_STATIONS[sky_last_at]["name"])
		if sky_getoff == sky_last_at:
			_tour_stamp(sky_last_at)
			_sky_alight(sky_last_at)
			return
		var stamped := _tour_stamp(sky_last_at)
		if not stamped:
			_show_toast("%s  ·  tap GET OFF to hop off" % name)
	elif not dwell and sky_was_dwell:
		_show_toast("Next stop: %s" % SKY_STATIONS[int(st["next"])]["name"])
	sky_was_dwell = dwell

func _sky_camera(weight: float) -> void:
	var cars: Array = sky_trains[sky_train]
	var mid: Node3D = cars[SKY_CARS/2]
	var tr := mid.global_transform
	var fwd := -tr.basis.z
	if walk_view == 3:
		# Window seat: inside the lead car, looking ahead down the line.
		var lead: Node3D = cars[0]
		camera.global_transform = Transform3D(Basis.looking_at(fwd+Vector3(0,-0.08,0),Vector3.UP),lead.global_transform*Vector3(0.6,2.3,-5.5))
		return
	var want := tr*Vector3(7.5,7.0,26.0)
	camera.position = camera.position.lerp(want,minf(weight*0.6,1.0)) if weight < 1.0 else want
	var look := mid.global_position+fwd*14.0+Vector3(0,1.5,0)
	if camera.position.distance_to(look) > 0.05:
		camera.look_at(look)

func _tour_today() -> String:
	return tour_test_day if tour_test_day != "" else Time.get_date_string_from_system()

func _tour_stamp(i: int) -> bool:
	if tour_day != _tour_today():
		tour_day = _tour_today()
		tour_got = 0
	if tour_got & (1 << i):
		return false
	tour_got |= 1 << i
	var got := 0
	for k in SKY_STATIONS.size():
		if tour_got & (1 << k):
			got += 1
	if got >= SKY_STATIONS.size():
		cash += TOUR_BONUS
		bonus_xp += TOUR_XP
		_show_toast("CITY TOUR COMPLETE!  +$%d  +%d XP. A new tour starts tomorrow." % [TOUR_BONUS,TOUR_XP])
		if not ("--smoke-test" in OS.get_cmdline_user_args()):
			_play_coin()
	else:
		_show_toast("City Tour stamp: %s  (%d/%d today)" % [SKY_STATIONS[i]["name"],got,SKY_STATIONS.size()])
	_save_progress()
	return true

func _sky_hud() -> bool:
	# Returns true when the sky train owns the action button this frame.
	if sky_riding:
		var st := _sky_state(sky_train)
		var nxt := int(st["at"]) if bool(st["dwell"]) else int(st["next"])
		objective.text = "Harbor Loop  ·  %s: %s  (%s)" % ["at" if bool(st["dwell"]) else "next",SKY_STATIONS[nxt]["name"],_sky_fmt(float(st["wait"]))]
		speed_label.text = "On the sky train  •  View: Eye for the window seat"
		if bool(st["dwell"]):
			action_button.text = "GET OFF"
		else:
			action_button.text = "GETTING OFF…" if sky_getoff >= 0 else "GET OFF NEXT"
		return true
	if sky_wait >= 0:
		var w := _sky_next_arrival(sky_wait)
		objective.text = "Harbor Loop  ·  %s  ·  next train %s" % [SKY_STATIONS[sky_wait]["name"],"now" if w <= 0.0 else "in "+_sky_fmt(w)]
		action_button.text = "LEAVE PLATFORM"
		return true
	if _sky_near() >= 0 and _nearest_shop() < 0:
		action_button.text = "SKY TRAIN"
		return true
	return false

# ---------- Day and night ----------
const DAY_CYCLE := 1440.0
const DAY_MODES := ["Live day & night","Always day","Always sunset","Always night"]
# hour, sky top, horizon, ground, ambient, ambient energy, light colour, light energy, haze, stars, street lights
const DAY_KEYS := [
	[0.0,"060b1d","1b2645","0c1220","56679a",0.5,"a9bcff",0.24,"141c33",1.0,1.0],
	[4.9,"060b1d","1b2645","0c1220","56679a",0.5,"a9bcff",0.24,"141c33",1.0,1.0],
	[5.7,"1d2c5a","e08b6a","2a2a3a","8a7f9a",0.48,"ffb07a",0.3,"9c7f86",0.3,1.0],
	[6.6,"3b6db8","f5c39a","5d7f7a","c0c8d8",0.52,"ffd2a0",0.8,"d9c7b5",0.0,0.3],
	[8.0,"3d7cc9","c6e1ea","6d8f86","c9dcef",0.55,"fff1d6",1.05,"c6e1ea",0.0,0.0],
	[16.8,"3d7cc9","c6e1ea","6d8f86","c9dcef",0.55,"fff1d6",1.05,"c6e1ea",0.0,0.0],
	[18.0,"3a62a8","f2b27a","6d7f80","d8c0b0",0.52,"ffb066",0.85,"e8b590",0.0,0.25],
	[18.8,"283c78","ff8a55","3a3a48","a88a98",0.48,"ff7a40",0.45,"c88070",0.15,0.9],
	[19.6,"141d42","6a4a78","1a1d2c","6a6a9a",0.48,"9fb0ff",0.22,"3a3558",0.6,1.0],
	[21.0,"060b1d","1b2645","0c1220","56679a",0.5,"a9bcff",0.24,"141c33",1.0,1.0],
	[24.0,"060b1d","1b2645","0c1220","56679a",0.5,"a9bcff",0.24,"141c33",1.0,1.0],
]
const SUNRISE_H := 5.8
const SUNSET_H := 18.9
const SKY_SHADER := """
shader_type sky;
uniform vec3 top_col : source_color = vec3(0.24, 0.49, 0.79);
uniform vec3 hor_col : source_color = vec3(0.78, 0.88, 0.92);
uniform vec3 gnd_col : source_color = vec3(0.43, 0.56, 0.53);
uniform vec3 sun_dir = vec3(0.0, 1.0, 0.0);
uniform vec3 sun_col : source_color = vec3(1.0, 0.95, 0.84);
uniform float sun_vis = 1.0;
uniform vec3 moon_dir = vec3(0.0, 1.0, 0.0);
uniform float moon_vis = 0.0;
uniform float stars = 0.0;
uniform float glow = 0.0;

float hash(vec3 p) {
	p = fract(p * 0.3183099 + 0.1);
	p *= 17.0;
	return fract(p.x * p.y * p.z * (p.x + p.y + p.z));
}

void sky() {
	vec3 d = EYEDIR;
	float y = d.y;
	vec3 c;
	if (y >= 0.0) {
		c = mix(hor_col, top_col, pow(y, 0.55));
	} else {
		c = mix(hor_col, gnd_col, clamp(-y * 6.0, 0.0, 1.0));
	}
	vec3 sd3 = normalize(sun_dir);
	float sd = max(dot(d, sd3), 0.0);
	c += sun_col * glow * pow(sd, 5.0) * (1.0 - clamp(abs(y) * 2.2, 0.0, 1.0)) * 0.7;
	c += sun_col * sun_vis * (pow(sd, 1400.0) * 5.0 + pow(sd, 70.0) * 0.22);
	float md = max(dot(d, normalize(moon_dir)), 0.0);
	c += vec3(0.86, 0.9, 1.0) * moon_vis * (smoothstep(0.99935, 0.9996, md) * 1.1 + pow(md, 90.0) * 0.1);
	if (stars > 0.001 && y > 0.0) {
		vec3 cell = floor(d * 260.0);
		float h = hash(cell);
		float s = step(0.9966, h) * smoothstep(0.02, 0.3, y);
		c += vec3(s * stars * (0.55 + 0.45 * hash(cell + 7.0)));
	}
	COLOR = c;
}
"""

var day_mode := 0
var day_hour_override := -1.0
var night_amt := 0.0
var haze_now := HAZE
var sky_shader_mat: ShaderMaterial
var night_windows: Array = []
var night_lobby: Array = []
var night_lamps: Array = []
var night_heads: Array = []
var night_tails: Array = []
var lamp_pool_mm: MultiMeshInstance3D
var lamp_pool_mat: StandardMaterial3D
var head_spot: SpotLight3D
var clock_label: Label
var time_button: Button
var day_tick_t := 0.0
var day_last_hour := -100.0

func _game_hour() -> float:
	if day_hour_override >= 0.0:
		return day_hour_override
	match day_mode:
		1:
			return 13.0
		2:
			return 18.55
		3:
			return 22.5
	return fposmod(Time.get_unix_time_from_system()/DAY_CYCLE*24.0+9.0,24.0)

func _day_key(h: float) -> Array:
	for i in DAY_KEYS.size()-1:
		var a: Array = DAY_KEYS[i]
		var b: Array = DAY_KEYS[i+1]
		if h >= float(a[0]) and h <= float(b[0]):
			var t := 0.0 if float(b[0]) <= float(a[0]) else (h-float(a[0]))/(float(b[0])-float(a[0]))
			var out := [h]
			for k in range(1,a.size()):
				if a[k] is String:
					out.append(Color(String(a[k])).lerp(Color(String(b[k])),t))
				else:
					out.append(lerpf(float(a[k]),float(b[k]),t))
			return out
	return _day_key(0.0)

func _night_setup() -> void:
	# Sky shader with sun, moon and stars (replaces the fixed daytime sky).
	if world_env_res != null and world_env_res.sky != null:
		var sh := Shader.new()
		sh.code = SKY_SHADER
		sky_shader_mat = ShaderMaterial.new()
		sky_shader_mat.shader = sh
		world_env_res.sky.sky_material = sky_shader_mat
	# Find the lamp heads, windows and car lights in the city's models, and let them glow at night.
	var seen := {}
	var stack: Array[Node] = [self]
	while stack.size() > 0:
		var n: Node = stack.pop_back()
		stack.append_array(n.get_children())
		if n is MeshInstance3D and (n as MeshInstance3D).mesh != null:
			_night_scan_mesh((n as MeshInstance3D).mesh,seen)
		elif n is MultiMeshInstance3D and (n as MultiMeshInstance3D).multimesh != null and (n as MultiMeshInstance3D).multimesh.mesh != null:
			_night_scan_mesh((n as MultiMeshInstance3D).multimesh.mesh,seen)
	for i in 5:
		var m := _try_model("res://models/car_%d.glb" % i)
		if m != null:
			var st2: Array[Node] = [m]
			while st2.size() > 0:
				var n2: Node = st2.pop_back()
				st2.append_array(n2.get_children())
				if n2 is MeshInstance3D and (n2 as MeshInstance3D).mesh != null:
					_night_scan_mesh((n2 as MeshInstance3D).mesh,seen)
			m.free()
	# Warm pools of light on the ground under every street lamp.
	var tex := GradientTexture2D.new()
	var grad := Gradient.new()
	grad.set_color(0,Color(1,1,1,1))
	grad.set_color(1,Color(1,1,1,0))
	grad.add_point(0.45,Color(1,1,1,0.45))
	tex.gradient = grad
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5,0.5)
	tex.fill_to = Vector2(1.0,0.5)
	tex.width = 128
	tex.height = 128
	lamp_pool_mat = StandardMaterial3D.new()
	lamp_pool_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	lamp_pool_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	lamp_pool_mat.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	lamp_pool_mat.albedo_texture = tex
	lamp_pool_mat.albedo_color = Color(1.0,0.78,0.45,0.0)
	lamp_pool_mat.disable_receive_shadows = true
	if not lamp_spots.is_empty():
		var mm := MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		var pm := PlaneMesh.new()
		pm.size = Vector2(14,14)
		mm.mesh = pm
		mm.instance_count = lamp_spots.size()
		for i in lamp_spots.size():
			var sp: Array = lamp_spots[i]
			var off := Basis(Vector3.UP,float(sp[1]))*Vector3(LAMP_ARM-0.2,0,0)
			mm.set_instance_transform(i,Transform3D(Basis.IDENTITY,(sp[0] as Vector3)*Vector3(1,0,1)+off+Vector3(0,0.13,0)))
		lamp_pool_mm = MultiMeshInstance3D.new()
		lamp_pool_mm.multimesh = mm
		lamp_pool_mm.material_override = lamp_pool_mat
		lamp_pool_mm.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		lamp_pool_mm.visible = false
		add_child(lamp_pool_mm)
	# Headlights on your own car.
	head_spot = SpotLight3D.new()
	head_spot.light_color = Color("fff1d0")
	head_spot.spot_range = 34.0
	head_spot.spot_angle = 32.0
	head_spot.spot_attenuation = 0.8
	head_spot.light_energy = 0.0
	head_spot.shadow_enabled = false
	head_spot.position = Vector3(0,0.8,-1.9)
	head_spot.rotation_degrees = Vector3(-9,0,0)
	head_spot.visible = false
	car.add_child(head_spot)
	# Clock under the minimap.
	if minimap != null:
		clock_label = Label.new()
		clock_label.add_theme_font_size_override("font_size",18)
		clock_label.add_theme_color_override("font_color",Color("fff3d0"))
		clock_label.add_theme_color_override("font_outline_color",Color(0,0,0,0.85))
		clock_label.add_theme_constant_override("outline_size",6)
		clock_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		clock_label.size = Vector2(150,24)
		clock_label.position = Vector2(-150,MINI_SIZE-30)
		clock_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
		minimap.add_child(clock_label)
	_daynight_apply(true)

func _night_scan_mesh(mesh: Mesh, seen: Dictionary) -> void:
	for s in mesh.get_surface_count():
		var m := mesh.surface_get_material(s)
		if not (m is BaseMaterial3D) or seen.has(m.get_rid()):
			continue
		seen[m.get_rid()] = true
		var base := m.resource_name.get_slice(".",0)
		var bm := m as BaseMaterial3D
		var list: Array = []
		if base.begins_with("WinGlass") or base == "GlassBlue" or base == "GlassTeal" or base == "GlassDark":
			list = night_windows
		elif base == "GlassLobby":
			list = night_lobby
		elif base == "LampGlow":
			list = night_lamps
		elif base == "Light":
			list = night_heads
		elif base == "Tail":
			list = night_tails
		else:
			continue
		bm.emission_enabled = true
		bm.emission_energy_multiplier = 0.0
		list.append(bm)

func _daynight_tick(delta: float) -> void:
	day_tick_t += delta
	if day_tick_t < 0.25:
		return
	day_tick_t = 0.0
	_daynight_apply(false)

func _daynight_apply(force: bool) -> void:
	var h := _game_hour()
	if not force and absf(h-day_last_hour) < 0.004:
		_daynight_lights()
		return
	day_last_hour = h
	var k := _day_key(h)
	var top: Color = k[1]
	var hor: Color = k[2]
	var gnd: Color = k[3]
	var amb: Color = k[4]
	var amb_e: float = k[5]
	var lc: Color = k[6]
	var le: float = k[7]
	var fog: Color = k[8]
	var stars: float = k[9]
	night_amt = k[10]
	# Sun goes east to west between sunrise and sunset; the moon takes over at night.
	var day := h >= SUNRISE_H and h <= SUNSET_H
	var f := clampf((h-SUNRISE_H)/(SUNSET_H-SUNRISE_H),0.0,1.0)
	var el := deg_to_rad(sin(f*PI)*62.0)
	var to_sun := Vector3(cos(f*PI)*cos(el),sin(el),0.35).normalized()
	var mf := fposmod(h-SUNSET_H,24.0)/(24.0-(SUNSET_H-SUNRISE_H))
	var mel := deg_to_rad(18.0+sin(clampf(mf,0.0,1.0)*PI)*44.0)
	var to_moon := Vector3(cos(mf*PI)*cos(mel),sin(mel),-0.45).normalized()
	var edge := minf(absf(h-SUNRISE_H),absf(h-SUNSET_H))
	var fade := clampf(edge/0.35,0.0,1.0)
	var to_light := Vector3(to_sun.x,maxf(to_sun.y,0.1),to_sun.z).normalized() if day else to_moon
	if sun_light != null:
		sun_light.global_transform = Transform3D(Basis.looking_at(-to_light,Vector3.UP),sun_light.global_position)
		sun_light.light_color = lc
		sun_light.light_energy = le*fade
	if world_env_res != null:
		world_env_res.ambient_light_color = amb
		world_env_res.ambient_light_energy = amb_e
		world_env_res.fog_light_color = fog
		world_env_res.background_color = hor
	haze_now = fog
	if sky_shader_mat != null:
		sky_shader_mat.set_shader_parameter("top_col",top)
		sky_shader_mat.set_shader_parameter("hor_col",hor)
		sky_shader_mat.set_shader_parameter("gnd_col",gnd)
		sky_shader_mat.set_shader_parameter("sun_dir",Vector3(cos(f*PI),sin(f*PI)*0.95-0.02,0.35).normalized())
		sky_shader_mat.set_shader_parameter("sun_col",lc)
		sky_shader_mat.set_shader_parameter("sun_vis",1.0 if day else 0.0)
		sky_shader_mat.set_shader_parameter("moon_dir",to_moon)
		sky_shader_mat.set_shader_parameter("moon_vis",clampf(stars*1.4,0.0,1.0))
		sky_shader_mat.set_shader_parameter("stars",stars)
		var tw := clampf(1.0-edge/1.4,0.0,1.0)
		sky_shader_mat.set_shader_parameter("glow",tw)
	for m: BaseMaterial3D in night_windows:
		m.emission = Color("ffd9a0")
		m.emission_energy_multiplier = 0.42*night_amt
	for m: BaseMaterial3D in night_lobby:
		m.emission = Color("ffe2b0")
		m.emission_energy_multiplier = 0.9*night_amt
	for m: BaseMaterial3D in night_lamps:
		m.emission = Color("ffe2a0")
		m.emission_energy_multiplier = 0.3+3.2*night_amt
	for m: BaseMaterial3D in night_heads:
		m.emission = Color("fff4dc")
		m.emission_energy_multiplier = 3.0*night_amt
	for m: BaseMaterial3D in night_tails:
		m.emission = Color("ff2a2a")
		m.emission_energy_multiplier = 2.4*night_amt
	if sky_window_mat != null:
		sky_window_mat.emission_energy_multiplier = 1.4*night_amt
	if sky_light_mat != null:
		sky_light_mat.emission_energy_multiplier = 0.6+2.6*night_amt
	for m: BaseMaterial3D in ap_light_mats:
		m.emission_energy_multiplier = 0.4+3.6*night_amt
	for m: BaseMaterial3D in ap_taxi_mats:
		m.emission_energy_multiplier = 0.3+3.0*night_amt
	if lamp_pool_mm != null:
		lamp_pool_mm.visible = night_amt > 0.02
		lamp_pool_mat.albedo_color = Color(1.0,0.78,0.45,0.6*night_amt)
	if clock_label != null:
		var hh := int(h)
		var mm := int((h-float(hh))*60.0)
		var word := "NIGHT"
		if h >= 5.0 and h < 7.0:
			word = "SUNRISE"
		elif h >= 7.0 and h < 17.5:
			word = "DAY"
		elif h >= 17.5 and h < 19.8:
			word = "SUNSET"
		clock_label.text = "%s  %d:%02d" % [word,hh,mm]
	_daynight_lights()

func _daynight_lights() -> void:
	if head_spot != null:
		head_spot.visible = night_amt > 0.15 and driving
		head_spot.light_energy = 3.0*night_amt

func _cycle_day_mode() -> void:
	day_mode = (day_mode+1) % DAY_MODES.size()
	_refresh_time_button()
	_daynight_apply(true)
	_save_progress()
	_show_toast("Time of day: %s" % DAY_MODES[day_mode])

func _refresh_time_button() -> void:
	if time_button != null:
		time_button.text = "Time: %s" % DAY_MODES[day_mode]

# ---------- v0.27 smoke test and screenshots ----------
func _smoke_v27() -> void:
	var keep_tour := [tour_day,tour_got,day_mode]
	# No more walls between districts; solid ground in the old gaps; the new roads are there.
	for p in [Vector3(-110.5,1.2,-125),Vector3(110.5,1.2,-180),Vector3(204.5,1.2,-100),Vector3(-246.5,1.0,40),Vector3(-300,0.8,-50.5),Vector3(30,1.5,-56.5),Vector3(-126,1.0,15.5),Vector3(400,1.2,-39.5),Vector3(-446.5,1.2,-200),Vector3(-130,1.0,-61.0)]:
		assert(not _blocked_at(p,0.3),"Wall still at %s: %s" % [str(p),_blocker(p,0.3)])
	var space := get_world_3d().direct_space_state
	for p in [Vector3(150,6,-100),Vector3(-200,6,-30),Vector3(400,6,-20),Vector3(300,6,0),Vector3(-300,6,-56),Vector3(160,6,-430),Vector3(90,6,-30)]:
		var q := PhysicsRayQueryParameters3D.create(p,p-Vector3(0,12,0))
		q.exclude = [player.get_rid(),car.get_rid()]
		var hit := space.intersect_ray(q)
		assert(not hit.is_empty() and absf(float((hit["position"] as Vector3).y)+0.05) < 0.06,"No ground at %s" % str(p))
	for p in [Vector3(150,0,-300),Vector3(197,0,-100),Vector3(400,0,-28),Vector3(530,0,0),Vector3(330,0,10),Vector3(-300,0,-56),Vector3(-200,0,0),Vector3(-109.5,0,-300),Vector3(150,0,-220),Vector3(-140,0,8)]:
		assert(_on_road(p),"New road missing at %s" % str(p))
	# Every new road is clear to drive along (no posts, trees or lamps in the way).
	blocked_skip_traffic = true
	for r in LINK_ROADS:
		var a: Vector2 = r[0]
		var b: Vector2 = r[1]
		var l := a.distance_to(b)
		var t := 0.0
		while t <= l:
			var p := a.lerp(b,t/l)
			for off in [-2.5,2.5]:
				var dir := (b-a)/l
				var q: Vector2 = p+Vector2(-dir.y,dir.x)*off
				var pos := Vector3(q.x,1.1,q.y)
				var near_pillar := false
				for pl: Vector3 in sky_pillars:
					if Vector2(pl.x-q.x,pl.z-q.y).length() < 2.0:
						near_pillar = true
				if not near_pillar:
					assert(not _blocked_at(pos,0.8),"Road blocked at %s by %s" % [str(pos),_blocker(pos,0.8)])
			t += 3.0
	blocked_skip_traffic = false
	# Driving into the sea tows you back to the last safe spot.
	stick = Vector2.ZERO
	driving = true
	player.hide()
	car.position = Vector3(0,0.6,47)
	car.rotation = Vector3.ZERO
	car.velocity = Vector3.ZERO
	car_speed = 0.0
	safe_hist.clear()
	for f in 20:
		await get_tree().physics_frame
	assert(not safe_hist.is_empty(),"Safe spots are recorded while driving")
	var safe0: Vector3 = safe_hist[0][0]
	print("SEA_TOW_FROM ",safe0)
	car.position = Vector3(0,0.0,300)
	var went_in := false
	for f in 160:
		await get_tree().physics_frame
		if car.position.y < -0.6:
			went_in = true
		if went_in and car.position.z < 150.0:
			break
	assert(went_in,"Car sank into the sea")
	assert(car.position.y > -0.3 and car.position.distance_to(safe0) < 3.0 and absf(car.position.z-300.0) > 50.0,"Car in the sea is towed back (at %s)" % str(car.position))
	driving = false
	player.show()
	# Sky train: a closed loop with 5 stations, clear of buildings, pillars off the crossings.
	assert(sky_len > 2400.0 and sky_len < 3600.0,"Sky train loop length %d m" % int(sky_len))
	assert(sky_st_s.size() == 5 and sky_period > 150.0,"Sky train timetable")
	assert(sky_pillars.size() > 40,"Sky train pillars: %d" % sky_pillars.size())
	var s := 0.0
	while s < sky_len:
		var p := _sky_pos(s)+Vector3(0,2.0,0)
		assert(not _blocked_at(p,1.4),"Sky train runs into something at %s: %s" % [str(p),_blocker(p,1.4)])
		s += 3.0
	for i in 5:
		var e: Vector3 = sky_st_info[i]["entrance"]
		assert(not _on_road(e) and not _blocked_at(e+Vector3(0,1.0,0),0.6),"Station %d entrance blocked" % i)
		sky_time_override = _sky_time_at_station(0,i)
		var st := _sky_state(0)
		assert(bool(st["dwell"]) and int(st["at"]) == i,"Train 0 stops at station %d" % i)
		var other := _sky_state(1)
		assert(absf(fposmod(float(other["s"])-float(st["s"]),sky_len)-sky_len/2.0) < sky_len*0.3,"Two trains are spread around the loop")
	# Ride: board at Waterfront, get off at the next station, City Tour pays once after all 5.
	cash = 100
	tour_test_day = "2027-02-01"
	tour_day = ""
	tour_got = 0
	sky_time_override = _sky_time_at_station(0,0,-20.0)
	player.position = (sky_st_info[0]["entrance"] as Vector3)+Vector3(0,0.9,0)
	_refresh_hud()
	assert(_sky_near() == 0 and action_button.text == "SKY TRAIN","SKY TRAIN button at the station entrance")
	_interact()
	assert(sky_wait == 0,"Waiting on the platform")
	await get_tree().physics_frame
	assert(not sky_riding,"No boarding before the train arrives")
	sky_time_override = _sky_time_at_station(0,0,2.0)
	await get_tree().physics_frame
	await get_tree().physics_frame
	assert(sky_riding and sky_train == 0 and not player.visible,"Boarded the sky train")
	assert(tour_got == 1,"Boarding stamps the first station")
	sky_time_override += 30.0
	await get_tree().physics_frame
	assert(player.position.y > SKY_Y and player.position.distance_to((sky_trains[0][1] as Node3D).global_position) < 2.0,"You ride inside the train")
	_refresh_hud()
	assert(action_button.text == "GET OFF NEXT","GET OFF NEXT while moving")
	_interact()
	assert(sky_getoff == 1,"Queued to get off at Sunset Beach")
	for i in range(1,5):
		sky_time_override = _sky_time_at_station(0,i,1.0)
		await get_tree().physics_frame
		await get_tree().physics_frame
		if i == 1:
			assert(not sky_riding and player.visible and player.position.distance_to(sky_st_info[1]["entrance"]) < 4.0,"Got off at Sunset Beach")
			# Ride on from here.
			_sky_enter(1)
			sky_time_override = _sky_time_at_station(0,1,3.0)
			await get_tree().physics_frame
			assert(sky_riding,"Boarded again at Sunset Beach")
	assert(tour_got == 31 and cash == 100+TOUR_BONUS,"City Tour bonus paid once (cash %d, got %d)" % [cash,tour_got])
	sky_time_override = _sky_time_at_station(0,0,1.0)
	await get_tree().physics_frame
	await get_tree().physics_frame
	assert(cash == 100+TOUR_BONUS,"City Tour pays only once a day")
	_sky_action()
	assert(not sky_riding,"GET OFF at a station")
	tour_test_day = "2027-02-02"
	assert(_tour_stamp(2) and tour_got == 4,"New tour on a new day")
	tour_test_day = ""
	sky_time_override = -1.0
	# Day and night.
	day_hour_override = 13.0
	_daynight_apply(true)
	assert(night_amt < 0.01 and sun_light.light_energy > 0.9 and not lamp_pool_mm.visible,"Daytime")
	day_hour_override = 22.5
	_daynight_apply(true)
	assert(night_amt > 0.99 and sun_light.light_energy < 0.4 and lamp_pool_mm.visible,"Night")
	assert(not night_lamps.is_empty() and (night_lamps[0] as BaseMaterial3D).emission_energy_multiplier > 2.0,"Street lamps glow at night")
	assert(not night_windows.is_empty() and (night_windows[0] as BaseMaterial3D).emission_energy_multiplier > 0.3,"Windows light up at night")
	assert(sky_window_mat.emission_energy_multiplier > 1.0,"Sky train windows light up")
	day_hour_override = 18.75
	_daynight_apply(true)
	var hor: Color = sky_shader_mat.get_shader_parameter("hor_col")
	assert(hor.r > hor.b+0.2,"Sunset sky is orange")
	assert(clock_label == null or clock_label.text.begins_with("SUNSET"),"Clock shows sunset")
	day_hour_override = 6.2
	_daynight_apply(true)
	assert(clock_label == null or clock_label.text.begins_with("SUNRISE"),"Clock shows sunrise")
	day_hour_override = -1.0
	day_mode = 3
	assert(_game_hour() > 21.0,"Always night mode")
	_smoke_airport()
	# Nobody stands in a road, and a car stuck behind someone in its lane moves on after a few seconds.
	for p in peds:
		if bool(p["idle"]):
			assert(not _on_road(p["a"]),"Person standing in the road at %s" % str(p["a"]))
	var was_on := traffic_on
	traffic_on = true
	var tc: Dictionary = traffic[0]
	var tpos: Vector2 = tc["pos"]
	var tdir: Vector2 = tc["dir"]
	var blocker: Dictionary = peds[0]
	var keep_ped := [blocker["a"],blocker["b"],blocker["idle"],(blocker["node"] as Node3D).position]
	var spot := Vector3(tpos.x+tdir.x*3.6,0,tpos.y+tdir.y*3.6)
	blocker["a"] = spot
	blocker["b"] = spot
	blocker["idle"] = true
	(blocker["node"] as Node3D).position = spot
	tc["v"] = 0.0
	var s0 := float(tc["s"])
	for f in 60:
		_traffic_tick(1.0/60.0)
	assert(absf(float(tc["s"])-s0) < 0.5,"Car waits for a person in its lane")
	var gave_up := false
	for f in 420:
		_traffic_tick(1.0/60.0)
		if float(tc.get("ped_skip",0.0)) > 0.0:
			gave_up = true
	assert(gave_up,"Car doesn't wait forever behind a person standing in the lane")
	blocker["a"] = keep_ped[0]
	blocker["b"] = keep_ped[1]
	blocker["idle"] = keep_ped[2]
	(blocker["node"] as Node3D).position = keep_ped[3]
	traffic_on = was_on
	tour_day = keep_tour[0]
	tour_got = keep_tour[1]
	day_mode = keep_tour[2]
	_daynight_apply(true)

func _city_shots() -> void:
	await get_tree().process_frame
	crate_open = false
	if crate_root != null:
		crate_root.hide()
	paused = false
	driving = false
	player.show()
	walk_view = 1
	_apply_view()
	# [name, hour, train time station or -1, camera position, look at]
	var shots := [
		["loop-waterfront",13.0,0,Vector3(-30,26,70),Vector3(0,14,32)],
		["loop-sunset-beach",18.6,1,Vector3(330,30,200),Vector3(380,15,150)],
		["loop-raceway",9.5,2,Vector3(150,34,-130),Vector3(197,14,-178)],
		["loop-downtown-night",22.5,3,Vector3(-160,40,-250),Vector3(-205,15,-300)],
		["loop-westside-sunrise",6.2,4,Vector3(-300,26,30),Vector3(-330,15,72)],
		["city-night-street",22.0,-1,Vector3(-180,8,-112),Vector3(-260,2,-100)],
		["coast-road",16.0,-1,Vector3(240,22,-60),Vector3(330,0,-10)],
		["boulevard",11.0,-1,Vector3(-250,14,-30),Vector3(-330,2,-60)],
		["dt-street",14.0,-1,Vector3(-152,4,-214),Vector3(-400,10,-222)],
		["dt-avenue",10.0,-1,Vector3(-136,4,-118),Vector3(-140,14,-440)],
		["dt-aerial",12.0,-1,Vector3(-130,190,-10),Vector3(-400,0,-270)],
		["dt-night-avenue",21.5,-1,Vector3(-296,5,-150),Vector3(-300,10,-420)],
		["nm-highway",10.5,-1,Vector3(4,4,-70),Vector3(0,8,-400)],
		["nm-suburbs",16.5,-1,Vector3(-58,5,-150),Vector3(-90,2,-200)],
		["nm-midtown",13.0,-1,Vector3(-60,5,-282),Vector3(-60,20,-420)],
		["nm-airfield",15.5,-1,Vector3(130,24,-300),Vector3(60,0,-395)],
		["nm-aerial",12.0,-1,Vector3(120,95,-110),Vector3(-10,0,-260)],
		["nm-night",21.5,-1,Vector3(-4,5,-128),Vector3(0,8,-420)],
		["airport-terminal",11.0,-1,Vector3(40,30,-420),Vector3(40,4,-500)],
		["airport-apron",15.0,-1,Vector3(-130,26,-600),Vector3(60,2,-548)],
		["airport-runway",17.5,-1,Vector3(-330,20,-700),Vector3(0,2,-640)],
		["airport-night",21.5,-1,Vector3(250,35,-620),Vector3(60,0,-548)],
		["airport-aerial",12.0,-1,Vector3(60,110,-450),Vector3(60,0,-575)],
		["airport-plane",14.0,-1,Vector3(40,9,-520),Vector3(10,3,-550)],
	]
	for sh in shots:
		day_hour_override = float(sh[1])
		_daynight_apply(true)
		if int(sh[2]) >= 0:
			sky_time_override = _sky_time_at_station(0,int(sh[2]),3.0)
		_sky_place_trains()
		player.position = (sh[4] as Vector3)*Vector3(1,0,1)+Vector3(0,0.75,0)
		for f in 8:
			await get_tree().physics_frame
		cam_lock = true
		camera.global_position = sh[3]
		camera.look_at(sh[4])
		await _save_shot(String(sh[0]))
		cam_lock = false
	# v0.29: the clean screen's Menu.
	day_hour_override = 13.0
	_daynight_apply(true)
	player.position = Vector3(0,0.75,-180)
	for f in 8:
		await get_tree().physics_frame
	_toggle_menu()
	for f in 4:
		await get_tree().process_frame
	await _save_shot("menu")
	_toggle_menu()
	# Riding view.
	day_hour_override = 17.6
	_daynight_apply(true)
	sky_time_override = _sky_time_at_station(0,1,-25.0)
	sky_riding = true
	sky_train = 0
	player.hide()
	for f in 10:
		await get_tree().physics_frame
	_sky_place_trains()
	_sky_camera(1.0)
	_refresh_hud()
	await _save_shot("loop-ride")
	get_tree().quit()

# ---------- v0.27: Harbor International Airport (north of the city) ----------
const AP_ROAD_Z := -458.0
const AP_RUNWAY_Z := -660.0
const AP_TAXI_Z := -612.0
const AP_GATES := [-40.0,10.0,60.0,110.0,165.0]
const AP_PLANE_Z := -548.0
const AP_PLANE_SCALE := 3.0
const AP_PLANE_FIX := PI   # the airplane model faces +Z; turn it so its nose points along -Z
# Moving airliner: [seconds, from, to, easing]  (0 linear, 1 slow down, 2 speed up)
const AP_FLIGHT := [
	[28.0,Vector3(-1300,140,-660),Vector3(-262,0,-660),0],
	[26.0,Vector3(-262,0,-660),Vector3(380,0,-660),1],
	[5.0,Vector3(380,0,-660),Vector3(410,0,-640),0],
	[4.0,Vector3(410,0,-640),Vector3(410,0,-612),0],
	[60.0,Vector3(410,0,-612),Vector3(-255,0,-612),0],
	[4.0,Vector3(-255,0,-612),Vector3(-255,0,-638),0],
	[4.0,Vector3(-255,0,-638),Vector3(-270,0,-660),0],
	[10.0,Vector3(-270,0,-660),Vector3(-270,0,-660),0],
	[24.0,Vector3(-270,0,-660),Vector3(150,0,-660),2],
	[22.0,Vector3(150,0,-660),Vector3(1300,180,-660),0],
]
const AP_APRON_LOOP := [Vector2(-100,-516),Vector2(215,-516),Vector2(215,-584),Vector2(-100,-584)]
const AP_HANGAR_LOOP := [Vector2(240,-505),Vector2(440,-505),Vector2(440,-596),Vector2(240,-596)]

var ap_plane: Node3D
var ap_flight_len := 0.0
var ap_vehicles: Array = []   # {"node","loop","off","speed"}
var ap_light_mats: Array = []
var ap_taxi_mats: Array = []

func _build_airport() -> void:
	var pave := Color("b9b6ad")
	var tarmac := Color("33383e")
	var white := Color("eef0ec")
	var yellow := Color("f2c230")
	# Ground: forecourt, car park, apron, taxiway, runway.
	_box_batch(Color("9c9a92"),[[Vector3(40,0.02,-471.5),Vector3(240,0.06,17)],[Vector3(-172.5,0.02,-482),Vector3(155,0.06,36)]])
	_box_batch(Color("8f8c85"),[[Vector3(160,0.025,-548),Vector3(560,0.06,88)]])
	_box_batch(tarmac,[
		[Vector3(80,0.03,AP_TAXI_Z),Vector3(700,0.07,20)],
		[Vector3(80,0.035,AP_RUNWAY_Z),Vector3(740,0.07,45)],
		[Vector3(-60,0.03,-602),Vector3(18,0.07,20)],[Vector3(150,0.03,-602),Vector3(18,0.07,20)],
		[Vector3(-255,0.03,-636),Vector3(20,0.07,30)],[Vector3(80,0.03,-636),Vector3(20,0.07,30)],[Vector3(410,0.03,-636),Vector3(20,0.07,30)],
	])
	var marks := []
	var x := -250.0
	while x < 410.0:
		marks.append([Vector3(x,0.08,AP_RUNWAY_Z),Vector3(12,0.02,0.6)])
		x += 24.0
	for ex in [-283.0,443.0]:
		for k in 8:
			marks.append([Vector3(ex,0.08,AP_RUNWAY_Z-17.5+float(k)*5.0),Vector3(10,0.02,2.2)])
	for s in [-21.0,21.0]:
		marks.append([Vector3(80,0.08,AP_RUNWAY_Z+s),Vector3(736,0.02,0.4)])
	_box_batch(white,marks)
	var ylines := [[Vector3(80,0.075,AP_TAXI_Z),Vector3(696,0.02,0.35)],[Vector3(60,0.075,-516),Vector3(320,0.02,0.3)],[Vector3(60,0.075,-584),Vector3(320,0.02,0.3)]]
	for gx in AP_GATES:
		ylines.append([Vector3(gx,0.075,-560),Vector3(0.35,0.02,48)])
		ylines.append([Vector3(gx,0.075,-530),Vector3(6,0.02,0.35)])
	_box_batch(yellow,ylines)
	# Runway and taxiway edge lights (glow at night).
	var rl_mat := StandardMaterial3D.new()
	rl_mat.albedo_color = Color("fff6d8")
	rl_mat.emission_enabled = true
	rl_mat.emission = Color("fff2c8")
	rl_mat.emission_energy_multiplier = 0.4
	ap_light_mats.append(rl_mat)
	var tl_mat := StandardMaterial3D.new()
	tl_mat.albedo_color = Color("6fa8ff")
	tl_mat.emission_enabled = true
	tl_mat.emission = Color("3f7dff")
	tl_mat.emission_energy_multiplier = 0.3
	ap_taxi_mats.append(tl_mat)
	var rlights := []
	var tlights := []
	x = -280.0
	while x <= 440.0:
		for s in [-23.6,23.6]:
			rlights.append([Vector3(x,0.25,AP_RUNWAY_Z+s),Vector3(0.4,0.4,0.4)])
		x += 30.0
	for k in 10:
		for s in [-6.0,0.0,6.0]:
			rlights.append([Vector3(-300.0-float(k)*14.0,1.2,AP_RUNWAY_Z+s),Vector3(0.5,0.5,0.5)])
	x = -265.0
	while x <= 425.0:
		for s in [-10.6,10.6]:
			tlights.append([Vector3(x,0.2,AP_TAXI_Z+s),Vector3(0.3,0.3,0.3)])
		x += 25.0
	var rli := _box_batch(white,rlights)
	rli.material_override = rl_mat
	var tli := _box_batch(white,tlights)
	tli.material_override = tl_mat
	var poles := []
	for k in 10:
		poles.append([Vector3(-300.0-float(k)*14.0,0.55,AP_RUNWAY_Z),Vector3(0.2,1.1,13)])
	_box_batch(Color("5d666c"),poles)
	# Terminal: long glass front, roof canopy, gates on the airside.
	var glass := StandardMaterial3D.new()
	glass.resource_name = "GlassLobby"
	glass.albedo_color = Color("5f8fa8")
	glass.roughness = 0.15
	glass.metallic = 0.3
	_box(self,Vector3(40,6.5,-494),Vector3(220,13,20),Color("e7e9e4"),true)
	var front := _box(self,Vector3(40,5.2,-483.9),Vector3(214,8.0,0.3),Color("5f8fa8"))
	front.material_override = glass
	var back := _box(self,Vector3(40,5.2,-504.1),Vector3(214,6.0,0.3),Color("5f8fa8"))
	back.material_override = glass
	_box(self,Vector3(40,13.4,-492),Vector3(228,0.8,28),Color("2f6f8f"))
	_box(self,Vector3(40,9.6,-479.5),Vector3(200,0.4,9),Color("f3f5f2"))
	for k in 9:
		_box(self,Vector3(-56.0+float(k)*24.0,4.8,-475.6),Vector3(0.4,9.6,0.4),Color("9aa3aa"))
	var big := _sign("HARBOR INTERNATIONAL AIRPORT",Vector3(40,17.5,-484),Color("fff3c9"),110)
	big.outline_size = 16
	_sign("DEPARTURES  ·  ARRIVALS",Vector3(40,11.2,-475),Color("bff3ff"),56)
	# Jet bridges to the first four gates, and gate signs.
	for i in AP_GATES.size():
		var gx: float = AP_GATES[i]
		if i < 4:
			_box(self,Vector3(gx+4.0,4.6,-515.5),Vector3(3.2,2.8,23),Color("d9dde0"))
			_box(self,Vector3(gx+4.0,4.6,-527.5),Vector3(4.2,3.4,2.0),Color("7d878e"))
			_box(self,Vector3(gx+4.0,1.6,-524.5),Vector3(0.6,3.2,0.6),Color("5d666c"))
		_sign("GATE %d" % (i+1),Vector3(gx,8.2,-506),Color("ffe9a8"),48)
	# Parked airliners at the gates, nose to the terminal.
	for i in AP_GATES.size():
		_ap_plane(Vector3(AP_GATES[i],0,AP_PLANE_Z),PI if i % 2 == 0 else PI,Color("f3f5f2") if i != 2 else Color("e7eef5"),true)
	# Control tower, hangars, cargo, fuel farm.
	var tw := _prop("res://models/tower.glb",Vector3(205,0,-488),Vector3(8.4,26,8.4),0.0,Color("d8dcd8"),false)
	tw.scale = Vector3(1.7,1.7,1.7)
	_collider(self,Vector3(205,22,-488),Vector3(14,44,14))
	_sign("HARBOR TOWER",Vector3(205,48,-488),Color("cfe6ff"),60)
	for hx in [290.0,345.0,400.0]:
		var hg := _prop("res://models/hangar.glb",Vector3(hx,13.5,-545),Vector3(24,18,22),180.0,Color("c9d0d4"),false)
		hg.scale = Vector3(1.5,1.5,1.5)
		_collider(self,Vector3(hx,13.5,-545),Vector3(36,27,33))
	_ap_plane(Vector3(345,0,-575),0.0,Color("f2d046"),false,1.4)
	for r in 4:
		for c in 6:
			var cpos := Vector3(282.0+float(c)*7.0,0,-484.0-float(r)*3.0)
			_prop("res://models/container_%d.glb" % ((r+c) % 3),cpos,Vector3(6,2.6,2.4),0.0,[Color("c4533f"),Color("3f78a8"),Color("3e9e4a"),Color("e3a428")][(r*6+c) % 4])
	for fz in [-525.0,-555.0]:
		var tank := MeshInstance3D.new()
		var cyl := CylinderMesh.new()
		cyl.top_radius = 9.0
		cyl.bottom_radius = 9.0
		cyl.height = 10.0
		tank.mesh = cyl
		tank.material_override = _material(Color("eef0ec"))
		tank.position = Vector3(-190,5,fz)
		add_child(tank)
		_collider(self,Vector3(-190,5,fz),Vector3(12.6,10,12.6))
	_sign("FUEL FARM",Vector3(-190,13,-540),Color("ffe0b8"),44)
	# Car park with rows of parked cars.
	var cars := {}
	var rng := RandomNumberGenerator.new()
	rng.seed = 7272
	for row in [-470.0,-482.0,-494.0]:
		var cx := -242.0
		while cx < -100.0:
			if rng.randf() < 0.78:
				var key := "res://models/car_%d.glb" % (rng.randi() % 5)
				if not cars.has(key):
					cars[key] = []
				(cars[key] as Array).append([Vector3(cx,0.35,row),0.0 if int(row) % 2 == 0 else PI])
			cx += 6.0
	for key in cars:
		_model_batch(key,cars[key],{"Body":TRAFFIC_COLORS[rng.randi() % TRAFFIC_COLORS.size()]})
	var pk := []
	var lx := -245.0
	while lx < -97.0:
		for row in [-470.0,-482.0,-494.0]:
			pk.append([Vector3(lx,0.07,row),Vector3(0.15,0.02,5)])
		lx += 6.0
	_box_batch(white,pk)
	_sign("P  AIRPORT PARKING",Vector3(-172,6,-466),Color("cfe6ff"),48)
	# Floodlights around the apron and car park (they light up at night).
	var lamps := []
	for lxp in [-90.0,-20.0,35.0,85.0,140.0,200.0]:
		lamps.append([Vector3(lxp,0,-509),PI/2.0])
		lamps.append([Vector3(lxp,0,-589),-PI/2.0])
	for lxp in [-230.0,-180.0,-130.0]:
		lamps.append([Vector3(lxp,0,-476),PI/2.0])
		lamps.append([Vector3(lxp,0,-488),-PI/2.0])
	_model_batch("res://models/lamp.glb",lamps)
	# Service vehicles parked by each plane, cones and pushback tugs.
	for i in AP_GATES.size():
		var gx: float = AP_GATES[i]
		_ap_truck(Vector3(gx+12.0,0,-544),PI/2.0,Color("f4f7fa"),Color("e0303a"),"catering")
		_ap_truck(Vector3(gx-11.0,0,-556),0.3,Color("e3a428"),Color("2a3036"),"belt")
		var cones := []
		for c in [Vector3(gx+3.0,0.35,-572),Vector3(gx-3.0,0.35,-572),Vector3(gx+22.0,0.35,-547),Vector3(gx-22.0,0.35,-547)]:
			cones.append([c,Vector3(0.4,0.7,0.4)])
		_box_batch(Color("ff7a1a"),cones)
	# Moving: two baggage trains, a fuel truck and a bus around the apron, a follow-me car by the hangars.
	ap_vehicles.clear()
	ap_vehicles.append({"node":_ap_baggage_train(),"loop":AP_APRON_LOOP,"off":0.0,"speed":6.5})
	ap_vehicles.append({"node":_ap_truck(Vector3.ZERO,0.0,Color("f2f2ee"),Color("e0303a"),"fuel"),"loop":AP_APRON_LOOP,"off":0.27,"speed":6.0})
	ap_vehicles.append({"node":_ap_truck(Vector3.ZERO,0.0,Color("2f7fb8"),Color("f4f7fa"),"bus"),"loop":AP_APRON_LOOP,"off":0.52,"speed":7.0})
	ap_vehicles.append({"node":_ap_baggage_train(),"loop":AP_APRON_LOOP,"off":0.76,"speed":6.5})
	ap_vehicles.append({"node":_ap_truck(Vector3.ZERO,0.0,Color("f2d046"),Color("2a3036"),"car"),"loop":AP_HANGAR_LOOP,"off":0.0,"speed":9.0})
	# The airliner that lands, taxis and takes off again.
	ap_plane = _ap_plane(Vector3(-262,0,AP_RUNWAY_Z),0.0,Color("f3f5f2"),false)
	ap_flight_len = 0.0
	for seg in AP_FLIGHT:
		ap_flight_len += float(seg[0])
	_ap_tick(0.0)

func _ap_plane(pos: Vector3, yaw: float, tint: Color, solid: bool, scale := AP_PLANE_SCALE) -> Node3D:
	var holder := Node3D.new()
	holder.position = pos
	holder.rotation.y = yaw
	add_child(holder)
	var body := Node3D.new()
	body.rotation.y = AP_PLANE_FIX
	body.scale = Vector3(scale,scale,scale)
	holder.add_child(body)
	var model := _try_model("res://models/airplane.glb")
	if model != null:
		body.add_child(model)
	else:
		_box(body,Vector3(0,1.6,0),Vector3(1.8,1.8,13),tint)
		_box(body,Vector3(0,1.4,0),Vector3(14,0.3,2.2),tint)
	if solid:
		# Fuselage only, so you can walk under the wings.
		_collider(holder,Vector3(0,1.5*scale,0),Vector3(1.7*scale,2.6*scale,12.4*scale))
	return holder

func _ap_truck(pos: Vector3, yaw: float, body_col: Color, trim: Color, kind: String) -> Node3D:
	var n := Node3D.new()
	n.position = pos
	n.rotation.y = yaw
	add_child(n)
	match kind:
		"bus":
			_box(n,Vector3(0,1.7,0),Vector3(2.6,2.6,11),body_col)
			_box(n,Vector3(0,2.1,0),Vector3(2.64,1.0,10.2),Color("1d2e3a"))
			_box(n,Vector3(0,0.75,0),Vector3(2.64,0.3,11.04),trim)
		"fuel":
			_box(n,Vector3(0,1.4,-3.2),Vector3(2.4,2.2,2.4),body_col)
			_box(n,Vector3(0,1.9,-4.0),Vector3(2.2,0.8,0.1),Color("1d2e3a"))
			var tank := MeshInstance3D.new()
			var cyl := CylinderMesh.new()
			cyl.top_radius = 1.2
			cyl.bottom_radius = 1.2
			cyl.height = 6.0
			tank.mesh = cyl
			tank.material_override = _material(Color("dfe3e6"))
			tank.rotation.x = PI/2.0
			tank.position = Vector3(0,1.75,1.2)
			n.add_child(tank)
			_box(n,Vector3(0,1.75,1.2),Vector3(2.5,0.3,6.0),trim)
		"catering":
			_box(n,Vector3(0,1.3,-2.6),Vector3(2.3,2.0,1.8),Color("eef0ec"))
			_box(n,Vector3(0,2.6,1.0),Vector3(2.4,2.6,5.0),body_col)
			_box(n,Vector3(0,3.0,1.0),Vector3(2.44,0.4,5.04),trim)
		"belt":
			_box(n,Vector3(0,0.9,-1.5),Vector3(1.9,1.2,2.4),body_col)
			var belt := _box(n,Vector3(0,1.9,1.6),Vector3(1.0,0.25,6.5),Color("2a3036"))
			belt.rotation.x = -0.32
		_:
			_box(n,Vector3(0,0.85,0),Vector3(1.8,0.9,4.0),body_col)
			_box(n,Vector3(0,1.5,0.3),Vector3(1.6,0.6,2.0),Color("1d2e3a"))
			_box(n,Vector3(0,1.9,0.3),Vector3(1.2,0.15,0.4),Color("ff8a1a"))
	for wz in ([-3.6,3.6] if kind == "bus" else [-1.4,1.4]):
		for wx in [-1.1,1.1]:
			_box(n,Vector3(wx,0.4,wz),Vector3(0.4,0.8,0.8),Color("20262b"))
	return n

func _ap_baggage_train() -> Node3D:
	var n := Node3D.new()
	add_child(n)
	_box(n,Vector3(0,0.75,-3.0),Vector3(1.5,0.9,2.2),Color("e3a428"))
	_box(n,Vector3(0,1.4,-2.6),Vector3(1.2,0.4,0.9),Color("1d2e3a"))
	for k in 3:
		var z := float(k)*3.2
		_box(n,Vector3(0,0.55,z),Vector3(1.5,0.2,2.6),Color("5d666c"))
		_box(n,Vector3(0,1.05,z),Vector3(1.4,0.8,2.2),[Color("3f78a8"),Color("c4533f"),Color("3e9e4a")][k])
		for wx in [-0.7,0.7]:
			_box(n,Vector3(wx,0.25,z),Vector3(0.2,0.5,0.5),Color("20262b"))
	return n

func _ap_loop_pos(loop: Array, t: float) -> Array:
	# Position and heading t (0..1) of the way round a closed loop.
	var total := 0.0
	for i in loop.size():
		total += (loop[i] as Vector2).distance_to(loop[(i+1) % loop.size()])
	var d := fposmod(t,1.0)*total
	for i in loop.size():
		var a: Vector2 = loop[i]
		var b: Vector2 = loop[(i+1) % loop.size()]
		var l := a.distance_to(b)
		if d <= l:
			var p := a.lerp(b,d/l)
			return [Vector3(p.x,0,p.y),b-a]
		d -= l
	return [Vector3(loop[0].x,0,loop[0].y),Vector2(1,0)]

func _ap_loop_len(loop: Array) -> float:
	var total := 0.0
	for i in loop.size():
		total += (loop[i] as Vector2).distance_to(loop[(i+1) % loop.size()])
	return total

func _ap_flight_at(t: float) -> Array:
	# Airliner position and travel direction at time t of the flight loop.
	t = fposmod(t,ap_flight_len)
	for i in AP_FLIGHT.size():
		var seg: Array = AP_FLIGHT[i]
		var dur: float = seg[0]
		if t <= dur:
			var u := t/dur
			match int(seg[3]):
				1:
					u = 1.0-(1.0-u)*(1.0-u)
				2:
					u = u*u
			var a: Vector3 = seg[1]
			var b: Vector3 = seg[2]
			var dir := b-a
			var k := i
			while dir.length() < 0.01 and k < AP_FLIGHT.size()-1:
				k += 1
				dir = (AP_FLIGHT[k][2] as Vector3)-(AP_FLIGHT[k][1] as Vector3)
			return [a.lerp(b,u),dir]
		t -= dur
	return [AP_FLIGHT[0][1],Vector3(1,0,0)]

func _ap_tick(_delta: float) -> void:
	if ap_plane == null:
		return
	var now := Time.get_unix_time_from_system() if sky_time_override < 0.0 else sky_time_override
	var f := _ap_flight_at(now)
	var pos: Vector3 = f[0]
	var dir: Vector3 = f[1]
	ap_plane.position = pos
	var flat := Vector3(dir.x,0,dir.z)
	if flat.length() > 0.01:
		var yaw := atan2(-flat.x,-flat.z)
		var pitch := atan2(dir.y,flat.length())*0.8 if pos.y > 0.5 else 0.0
		ap_plane.rotation = Vector3(pitch,yaw,0)
	ap_plane.visible = absf(pos.x-80.0) < 900.0
	for v in ap_vehicles:
		var loop: Array = v["loop"]
		var t := float(v["off"])+now*float(v["speed"])/_ap_loop_len(loop)
		var lp := _ap_loop_pos(loop,t)
		var node: Node3D = v["node"]
		node.position = lp[0]
		var d2: Vector2 = lp[1]
		node.rotation.y = atan2(-d2.x,-d2.y)

func _airport_ped_plan() -> Array:
	# Ground staff in hi-vis around the planes, and travellers in front of the terminal.
	var plan: Array = []
	var hivis := [Color("ff8c1a"),Color("e8e23a")]
	var k := 0
	for z in [-521.0,-590.0]:
		for i in 4:
			plan.append([Vector3(-95,0,z),Vector3(210,0,z),false,hivis[k % 2]])
			k += 1
	for gx in AP_GATES:
		for o in [Vector3(9,0,-536),Vector3(-8,0,-562),Vector3(16,0,-552)]:
			var p: Vector3 = Vector3(float(gx),0,0)+o
			plan.append([p,p,true,hivis[k % 2]])
			k += 1
	for i in 8:
		plan.append([Vector3(-70,0,-478),Vector3(150,0,-478),false])
	for p in [Vector3(30,0,-480),Vector3(33,0,-479),Vector3(-20,0,-478),Vector3(95,0,-479)]:
		plan.append([p,p,true])
	return plan

func _smoke_airport() -> void:
	assert(ap_plane != null and ap_vehicles.size() == 5,"Airport planes and vehicles built")
	for p in [Vector3(-200,0,AP_ROAD_Z),Vector3(300,0,AP_ROAD_Z),Vector3(0,0,-447),Vector3(197,0,-440)]:
		assert(_on_road(p),"Airport road missing at %s" % str(p))
	var space := get_world_3d().direct_space_state
	for p in [Vector3(80,6,AP_RUNWAY_Z),Vector3(0,6,AP_TAXI_Z),Vector3(-300,6,-720),Vector3(400,6,-740)]:
		var q := PhysicsRayQueryParameters3D.create(p,p-Vector3(0,12,0))
		var hit := space.intersect_ray(q)
		assert(not hit.is_empty() and absf(float((hit["position"] as Vector3).y)+0.05) < 0.06,"No airport ground at %s" % str(p))
	# The runway and taxiway are clear for the airliner (nothing solid on them).
	var x := -280.0
	while x <= 440.0:
		for z in [AP_RUNWAY_Z,AP_TAXI_Z]:
			assert(not _blocked_at(Vector3(x,2.0,z),1.5),"Airfield blocked at %s by %s" % [str(Vector3(x,2,z)),_blocker(Vector3(x,2.0,z),1.5)])
		x += 10.0
	# The airliner lands, rolls, taxis and climbs away again.
	var t := 0.0
	var seen_air := false
	var seen_ground := false
	while t < ap_flight_len:
		var f := _ap_flight_at(t)
		var p: Vector3 = f[0]
		if p.y > 50.0:
			seen_air = true
		if p.y < 0.1 and absf(p.z-AP_TAXI_Z) < 1.0:
			seen_ground = true
		t += 2.0
	assert(seen_air and seen_ground,"Airliner flies and taxis")
	# Ground staff are where they should be and aren't standing in anything solid.
	var staff := 0
	for p in peds:
		var a: Vector3 = p["a"]
		if a.z < -505.0 and a.z > -600.0:
			staff += 1
			assert(not _blocked_at(a+Vector3(0,1.0,0),0.3),"Airport staff stuck at %s by %s" % [str(a),_blocker(a+Vector3(0,1.0,0),0.3)])
	assert(staff >= 20,"Airport ground staff: %d" % staff)
	var ci := -1
	for i in CHECKPOINTS.size():
		if String(CHECKPOINTS[i]["name"]) == "Harbor Airport":
			ci = i
	assert(ci >= 0 and TRAVEL_AREA.size() == CHECKPOINTS.size(),"Harbor Airport fast travel")

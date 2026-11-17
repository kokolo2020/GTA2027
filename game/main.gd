extends Node3D
## Harbor City: original single-player driving prototype. No external assets or services.

const PICKUP := Vector3(-32, 0, 26)
const DROPOFF := Vector3(32, 0, -29)
const ROUTES := [
	{"pickup": Vector3(-32,0,26), "dropoff": Vector3(32,0,-29), "from": "Port Dispatch", "to": "Sunset Market", "pay": 150},
	{"pickup": Vector3(0,0,-28), "dropoff": Vector3(-32,0,8), "from": "Clocktower", "to": "West Arcade", "pay": 175},
	{"pickup": Vector3(32,0,23), "dropoff": Vector3(-32,0,-30), "from": "East Gardens", "to": "North Gate", "pay": 225},
	{"pickup": Vector3(-32,0,-30), "dropoff": Vector3(0,0,46), "from": "North Gate", "to": "Ferry Steps", "pay": 200},
	{"pickup": Vector3(32,0,-29), "dropoff": Vector3(32,0,23), "from": "Sunset Market", "to": "East Gardens", "pay": 125},
	{"pickup": Vector3(-32,0,8), "dropoff": Vector3(0,0,-28), "from": "West Arcade", "to": "Clocktower", "pay": 175},
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
	{"name":"Ridge Rover","price":1400,"speed":20.0,"accel":12.0,"turn":3.6,"color":Color("e2893a"),"roof":Color("6a3d1c"),"note":"Trail pass: opens the Ridge Gate"},
	{"name":"Coast Runner","price":2600,"speed":25.0,"accel":13.0,"turn":4.3,"color":Color("e3555a"),"roof":Color("5a1f27"),"note":"Fast and sharp through corners"},
	{"name":"Night Comet","price":4500,"speed":29.0,"accel":15.0,"turn":4.7,"color":Color("7b5bd6"),"roof":Color("2a1f55"),"note":"Top speed, quick grip"},
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
	{"name":"Container Yard","pos":Vector3(-72,0,-125),"pay":400},
	{"name":"Smokestack Works","pos":Vector3(74,0,-98),"pay":400},
	{"name":"Maple Court","pos":Vector3(-62,0,-228),"pay":450},
	{"name":"Skate Plaza","pos":Vector3(58,0,-228),"pay":450},
	{"name":"Hangar 3","pos":Vector3(-26,0,-350),"pay":550},
	{"name":"Control Tower","pos":Vector3(26,0,-340),"pay":550},
	{"name":"Runway End","pos":Vector3(0,0,-426),"pay":700},
	{"name":"Summit Pass Overlook","pos":Vector3(178,5.7,-270),"pay":800},
]
const NORTH_BONUS := 2000
const TRIALS := [
	{"name":"City Sprint","area":0,"start":Vector3(-32,0,32),"cps":[Vector3(32,0,32),Vector3(32,0,-32),Vector3(-32,0,-32),Vector3(-32,0,32)],"par":40.0,"pay":300},
	{"name":"Ridge Sprint","area":1,"start":Vector3(52,0,0),"cps":[Vector3(68,0,0),Vector3(100,0,0),Vector3(118,2.5,0),Vector3(144,5.7,0)],"par":16.0,"pay":500},
	{"name":"Bay Run","area":2,"start":Vector3(-52,0,0),"cps":[Vector3(-70,0,0),Vector3(-100,0,0),Vector3(-140,0,0),Vector3(-172,0,0)],"par":13.0,"pay":800},
	{"name":"Pizza Rush","area":0,"start":Vector3(0,0,32),"cps":[Vector3(0,0,0),Vector3(32,0,0),Vector3(32,0,-32),Vector3(0,0,-32),Vector3(-32,0,-32),Vector3(-32,0,0),Vector3(-32,0,32)],"par":38.0,"pay":400},
	{"name":"Waterfront Dash","area":0,"start":Vector3(-50,0,0),"cps":[Vector3(-20,0,0),Vector3(20,0,0),Vector3(50,0,0)],"par":11.0,"pay":250},
	{"name":"North Highway","area":3,"start":Vector3(0,0,-70),"cps":[Vector3(0,0,-130),Vector3(0,0,-200),Vector3(0,0,-270),Vector3(0,0,-330)],"par":15.0,"pay":700},
	{"name":"Runway Dash","area":3,"start":Vector3(0,0,-305),"cps":[Vector3(0,0,-340),Vector3(0,0,-385),Vector3(0,0,-425)],"par":8.0,"pay":600},
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
var best_times: Array = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
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
	_build_world()
	_build_collectibles()
	_build_player()
	_build_car()
	_build_ridge()
	_build_bay()
	_build_north()
	_build_landscape()
	_build_peds()
	radio_player = AudioStreamPlayer.new()
	radio_player.volume_db = -6.0
	add_child(radio_player)
	_build_hud()
	_load_progress()
	_apply_car()
	_update_gate()
	_refresh_hud()
	_radio_refresh()
	if radio_station > 0 and "--smoke-test" not in OS.get_cmdline_user_args() and "--shots" not in OS.get_cmdline_user_args():
		_radio_set(radio_station)
	_show_toast("Harbor City 0.12: levels! Finish quests to level up. Chase and Online are in the Menu.")
	booted = true
	if "--smoke-test" in OS.get_cmdline_user_args():
		await _smoke_test()
	elif "--shots" in OS.get_cmdline_user_args():
		await _shots()

func _material(color: Color) -> StandardMaterial3D:
	var mat := StandardMaterial3D.new()
	mat.albedo_color = color
	mat.roughness = 0.85
	return mat

func _box(parent: Node3D, pos: Vector3, size: Vector3, color: Color, solid := false) -> MeshInstance3D:
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
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("82bfc8")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color("d4e5f1")
	env.ambient_light_energy = 0.65
	world_env.environment = env
	add_child(world_env)
	var sun := DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-55, -30, 0)
	sun.light_color = Color("fff0cd")
	sun.light_energy = 0.85
	sun.shadow_enabled = true
	add_child(sun)
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
	if trial_active >= 0:
		return TRIALS[trial_active]["cps"][trial_cp]
	if exploring:
		var index := _nearest_find()
		if index >= 0:
			return FINDS[index]["pos"]
		if not _ridge_open():
			return RIDGE_GATE
		var ridge_index := _nearest_ridge()
		if ridge_index >= 0:
			return RIDGE[ridge_index]["pos"]
		var bay_index := _nearest_bay()
		if bay_index >= 0:
			return BAY[bay_index]["pos"]
		var north_index := _nearest_north()
		if north_index >= 0:
			return NORTH[north_index]["pos"]
		return car.position if driving else player.position
	return ROUTES[route_index]["dropoff"] if carrying else ROUTES[route_index]["pickup"]

func _toggle_activity() -> void:
	exploring = not exploring
	_save_progress()
	if paused:
		_toggle_menu()
	_refresh_hud()
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
	return (owned_mask & 4) != 0

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
	var spec: Dictionary = CARS[car_id]
	var stats := _car_stats(car_id)
	car_max = stats.x
	car_accel = stats.y
	car_turn = stats.z
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
	return _ridge_count() == RIDGE.size()

func _area_open(area: int) -> bool:
	return area == 0 or (area == 1 and _ridge_open()) or (area == 2 and _bay_open()) or (area == 3 and _north_open())

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
	for z in [-6.5,6.5]:
		_box(self,Vector3(-66,1.5,z),Vector3(20,3,1),rock,true)
	for z in [-10.75,10.75]:
		_box(self,Vector3(-76.5,1.2,z),Vector3(1,2.4,9.5),rock,true)
	for z in [-15.5,15.5]:
		_box(self,Vector3(-126,1.0,z),Vector3(100,2,1),rock,true)
	_box(self,Vector3(-176.5,1.0,0),Vector3(1,2,31),rock,true)
	bay_gate_body = _slab(BAY_GATE+Vector3(0,2,0),Vector3(1,4,12),0,Color("3d7cc4"))
	_box(bay_gate_body,Vector3(0.52,1.0,0),Vector3(0.1,0.8,11),Color("fff3d0"))
	_box(bay_gate_body,Vector3(0.52,-0.8,0),Vector3(0.1,0.8,11),Color("fff3d0"))
	bay_gate_sign = _sign("",Vector3(-57,5.6,0),Color("a8e2ff"),38)
	_sign("BAY ROAD",Vector3(-66,5.2,-2),Color("f7edd4"),48)
	for x in [-90.0,-108.0,-126.0,-144.0,-160.0]:
		_box(self,Vector3(x,0.02,-12 if int(x) % 4 == 0 else 12),Vector3(12,0.06,5),sand)
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
	return _bay_count() >= 3

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
		var basis := Basis(Vector3.UP,yaw).scaled(Vector3(s,s,s))
		multi.set_instance_transform(i,Transform3D(basis,points[i]))
	var instance := MultiMeshInstance3D.new()
	instance.multimesh = multi
	add_child(instance)
	model.free()
	return true

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

func _build_north() -> void:
	var grass := Color("6f945c")
	var asphalt := Color("354653")
	var rock := Color("7d776c")
	var line := Color("e7d9a4")
	# One big joined ground slab with solid rock borders, so many cars can share it later.
	_slab(Vector3(0,-0.35,-248),Vector3(220,0.6,384),0,grass)
	_box(self,Vector3(-110.5,1.25,-248),Vector3(1,2.5,384),rock,true)
	_box(self,Vector3(110.5,1.25,-358),Vector3(1,2.5,164),rock,true)
	_box(self,Vector3(110.5,1.25,-160),Vector3(1,2.5,208),rock,true)
	_box(self,Vector3(0,1.25,-440.5),Vector3(222,2.5,1),rock,true)
	for sx in [-58.0,58.0]:
		_box(self,Vector3(sx,1.5,-56.5),Vector3(104,3,1),rock,true)
	north_gate_body = _slab(NORTH_GATE+Vector3(0,2,0),Vector3(12,4,1),0,Color("e0902f"))
	_box(north_gate_body,Vector3(0,1.0,0.52),Vector3(11,0.8,0.1),Color("fff3d0"))
	_box(north_gate_body,Vector3(0,-0.8,0.52),Vector3(11,0.8,0.1),Color("fff3d0"))
	north_gate_sign = _sign("",Vector3(0,5.6,-57.5),Color("ffd9a0"),38)
	# Highway spine and cross streets.
	_box(self,Vector3(0,0.005,-120),Vector3(218,0.06,120),Color("565c5f"))
	_box(self,Vector3(0,0.004,-235),Vector3(218,0.05,110),Color("7ea76a"))
	_box(self,Vector3(0,0.005,-366),Vector3(218,0.06,140),Color("5b6166"))
	_box(self,Vector3(0,0.01,-248),Vector3(10,0.08,384),asphalt)
	for z in range(-64,-296,-8):
		_box(self,Vector3(0,0.07,float(z)),Vector3(0.15,0.02,3),line)
	for z in [-110.0,-150.0,-205.0,-250.0,-300.0]:
		_box(self,Vector3(0,0.015,z),Vector3(218,0.08,8),asphalt)
		for x in range(-104,105,8):
			if absi(x) > 6:
				_box(self,Vector3(float(x),0.075,z),Vector3(3,0.02,0.15),line)
	_sign("NORTH HIGHWAY",Vector3(0,7.2,-64),Color("ffe0b8"),52)
	_sign("INDUSTRIAL QUARTER",Vector3(0,6.4,-100),Color("d8dde0"),44)
	_sign("MAPLE SUBURBS",Vector3(0,6.4,-190),Color("e3f5d0"),44)
	_sign("HARBOR AIRFIELD",Vector3(0,6.4,-296),Color("cfe6ff"),44)
	# Industrial Quarter.
	for z in [-88.0,-130.0,-168.0]:
		for x in [-30.0,-55.0,30.0,55.0]:
			_prop("res://models/warehouse.glb",Vector3(x,0,z),Vector3(20,6.4,12),90.0 if x < 0 else -90.0)
	for r in 6:
		for c in 2:
			var cx := -96.0 if c == 0 else -89.0
			var cz := -117.0-float(r)*4.2
			_prop("res://models/container_%d.glb" % ((r+c) % 3),Vector3(cx,0,cz),Vector3(6,2.6,2.4),0.0,Color("c4533f"))
			if (r+c) % 2 == 0:
				_prop("res://models/container_%d.glb" % ((r+c+1) % 3),Vector3(cx,2.6,cz),Vector3(6,2.6,2.4),0.0,Color("3f78a8"))
	_prop("res://models/crane.glb",Vector3(-82,0,-98),Vector3(1,1,1),0.0,Color("e3a428"),false)
	for lx in [-6.0,6.0]:
		for lz in [-2.5,2.5]:
			_collider(self,Vector3(-82+lx,7,-98-lz),Vector3(0.8,14,0.8))
	_box(self,Vector3(88,4,-92),Vector3(16,8,12),Color("c4c0b8"),true)
	_box(self,Vector3(88,8.4,-92),Vector3(16.6,0.8,12.6),Color("8d979e"))
	_box(self,Vector3(97,13,-92),Vector3(3.2,26,3.2),Color("b36a4c"),true)
	for y in [20.0,23.0]:
		_box(self,Vector3(97,y,-92),Vector3(3.5,1.2,3.5),Color("f2e6d2"))
	# Maple Suburbs.
	var xs := [-84.0,-66.0,-48.0,-30.0,30.0,48.0,66.0,84.0]
	var rows := [[-196.0,180.0],[-214.0,0.0],[-241.0,180.0],[-259.0,0.0]]
	var hi := 0
	for row in rows:
		for x in xs:
			_prop("res://models/house_%d.glb" % (hi % 2),Vector3(x,0,row[0]),Vector3(8,5.6,7),row[1],Color("efe2c8"))
			hi += 1
	_box(self,Vector3(58,0.06,-228),Vector3(18,0.1,13),Color("9a9d98"))
	_slab(Vector3(54,0.5,-228),Vector3(5,0.3,5),-12.0,Color("c9a96a"))
	_slab(Vector3(63,0.5,-228),Vector3(5,0.3,5),12.0,Color("c9a96a"))
	_box(self,Vector3(58,0.45,-224.5),Vector3(8,0.9,0.5),Color("6d7a82"),true)
	_box(self,Vector3(-62,0.04,-228),Vector3(14,0.08,12),Color("9cc085"))
	for bx in [-67.0,-57.0]:
		_box(self,Vector3(bx,0.45,-224),Vector3(2.4,0.9,0.7),Color("8a6a43"),true)
	# Harbor Airfield.
	_box(self,Vector3(0,0.02,-366),Vector3(20,0.08,140),Color("2c3640"))
	for z in range(-305,-432,-12):
		_box(self,Vector3(0,0.075,float(z)),Vector3(0.5,0.02,5),Color("f4f1e8"))
	for x in [-9.5,9.5]:
		_box(self,Vector3(x,0.075,-366),Vector3(0.3,0.02,140),Color("f4f1e8"))
	for bx in range(-8,9,4):
		_box(self,Vector3(float(bx),0.075,-431),Vector3(1.4,0.02,6),Color("f4f1e8"))
	_box(self,Vector3(-24,0.012,-350),Vector3(30,0.07,100),Color("434d56"))
	for z in [-320.0,-380.0]:
		_prop("res://models/hangar.glb",Vector3(-50,0,z-4.0),Vector3(24,9,22),90.0,Color("c9d0d4"))
		_prop("res://models/airplane.glb",Vector3(-26,0,z),Vector3(14,4,12),90.0,Color("f0f2f4"))
	_prop("res://models/hangar.glb",Vector3(-50,0,-352),Vector3(24,9,22),90.0,Color("c9d0d4"))
	_prop("res://models/tower.glb",Vector3(40,0,-340),Vector3(8.4,26,8.4),0.0,Color("d8dcd8"))
	_prop("res://models/building_3.glb",Vector3(50,0,-385),Vector3(11,10.6,10),-90.0,Color("b3a2ad"))
	_prop("res://models/building_1.glb",Vector3(50,0,-410),Vector3(11,6.2,10),-90.0,Color("e2c994"))
	# Summit Pass: a branch road from the highway up to a lookout.
	_slab(Vector3(127,-0.35,-270),Vector3(34,0.6,24),0,grass)
	_box(self,Vector3(127,0.01,-270),Vector3(34,0.08,8),asphalt)
	for z in [-282.5,-257.5]:
		_box(self,Vector3(127,1.0,z),Vector3(34,2,1),rock,true)
	_slab(Vector3(151.7,2.51,-270),Vector3(24,0.6,20),14.0,Color("93866f"))
	for z in [-259.8,-280.2]:
		_slab(Vector3(151.5,3.38,z),Vector3(24,1.2,0.5),14.0,rock)
	_slab(Vector3(176.3,5.4,-270),Vector3(26,0.6,20),0,grass)
	for z in [-259.6,-280.4]:
		_box(self,Vector3(176.3,6.7,z),Vector3(26,2,0.8),rock,true)
	_box(self,Vector3(189.8,6.7,-270),Vector3(0.8,2,21),rock,true)
	_sign("SUMMIT PASS",Vector3(112,5.2,-270),Color("ffe0b8"),44)
	# Discovery sites.
	for site in NORTH:
		north_nodes.append(_north_token(site["pos"],site["name"]))
	_build_north_landscape()

func _build_north_landscape() -> void:
	var lamps_left: Array = []
	var lamps_right: Array = []
	for z in range(-72,-296,-24):
		lamps_right.append(Vector3(7.5,0,float(z)))
		lamps_left.append(Vector3(-7.5,0,float(z)-12.0))
	for z in range(-308,-432,-24):
		lamps_right.append(Vector3(12.5,0,float(z)))
		lamps_left.append(Vector3(-12.5,0,float(z)-12.0))
	_scatter("res://models/lamp.glb",lamps_right,1.0,1.0,0.0)
	_scatter("res://models/lamp.glb",lamps_left,1.0,1.0,PI)
	var rng := RandomNumberGenerator.new()
	rng.seed = 77
	var pines: Array = []
	for z in range(-64,-436,-7):
		for side in [-1.0,1.0]:
			if side > 0.0 and z < -255 and z > -285:
				continue
			var edge := 102.0+rng.randf_range(0.0,5.0)
			pines.append(Vector3(side*edge,0,float(z)+rng.randf_range(-2.0,2.0)))
			if rng.randf() < 0.5 and not (z < -90 and z > -150):
				pines.append(Vector3(side*(edge-8.0),0,float(z)+rng.randf_range(-3.0,3.0)))
	_scatter("res://models/tree_pine.glb",pines,0.9,1.4)
	var rounds: Array = []
	for z in [-184.0,-224.0,-232.0,-283.0]:
		for x in range(-100,101,12):
			if absi(x) > 12 and absf(float(x)+62.0) > 9.0 and absf(float(x)-58.0) > 11.0 or (absi(x) > 12 and z == -184.0):
				rounds.append(Vector3(float(x)+rng.randf_range(-2.0,2.0),0,z+rng.randf_range(-1.5,1.5)))
	for p in [Vector3(-70,0,-221),Vector3(-54,0,-222),Vector3(-66,0,-234),Vector3(-56,0,-232)]:
		rounds.append(p)
	_scatter("res://models/tree_round.glb",rounds,0.9,1.3)
	var rocks: Array = []
	for z in range(-80,-430,-31):
		rocks.append(Vector3(-98.0+rng.randf_range(-2.0,2.0),0,float(z)))
		rocks.append(Vector3(98.0+rng.randf_range(-2.0,2.0),0,float(z)-15.0))
	for p in [Vector3(118,0,-262),Vector3(120,0,-278),Vector3(138,0,-264)]:
		rocks.append(p)
	_scatter("res://models/rock.glb",rocks,0.8,1.6)

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
		"r":snappedf(body.rotation.y,0.01),"c":car_id,"d":1 if driving else 0,"t":online_role,"l":_level()}
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
	peer["lvl"] = clampi(int(p.get("l",1)),1,9)
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
	var model := _try_model("res://models/car_%d.glb" % car_index)
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
	_box(foot_node,Vector3(0,0.75,0),Vector3(0.5,1.2,0.35),body_color)
	_box(foot_node,Vector3(0,1.5,0),Vector3(0.4,0.4,0.4),Color("e8c9a0"))
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
	return {"node":node,"car":car_node,"foot":foot_node,"label":label,"name":nm,"target":Vector3.ZERO,"yaw":0.0,"seen":Time.get_ticks_msec()/1000.0,"driving":true,"role":0,"lvl":1,"shown":0,"red":red_light,"blue":blue_light}

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

# ---------- v0.12.0: player level (derived from progress, so old saves convert automatically) ----------
const LEVEL_XP := [0,150,450,900,1500]
var last_level := 0

func _xp() -> int:
	var missions := 0
	for i in MISSIONS.size():
		if claimed_mask & (1 << i):
			missions += 1
	return _find_count()*20+(_ridge_count()+_bay_count()+_north_count())*25+_trial_count()*40+missions*60+mini(deliveries,ROUTES.size())*10

func _level_for(xp: int) -> int:
	var level := 1
	for i in LEVEL_XP.size():
		if xp >= int(LEVEL_XP[i]):
			level = i+1
	return level

func _level() -> int:
	return _level_for(_xp())

func _level_text() -> String:
	var xp := _xp()
	var lv := _level_for(xp)
	if lv >= LEVEL_XP.size():
		return "Level %d (MAX)  ·  %d XP" % [lv,xp]
	var lo := int(LEVEL_XP[lv-1])
	var hi := int(LEVEL_XP[lv])
	return "Level %d  %s  %d/%d XP" % [lv,_bar(float(xp-lo),float(hi-lo)),xp-lo,hi-lo]

func _check_level() -> void:
	var lv := _level()
	if last_level == 0 or lv < last_level:
		last_level = lv
		return
	if lv > last_level:
		last_level = lv
		var extra := " Max level! Showroom, avatars and a new map are coming soon." if lv >= LEVEL_XP.size() else ""
		_show_toast("LEVEL UP! You are now Level %d.%s" % [lv,extra])

# ---------- v0.11.0: online police vs thief ----------
func _orole_ready() -> bool:
	return orole_test or (online_on and online_state == 3)

func _orole_start(role: int) -> void:
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
	if nearest < 5.0:
		chase_bust += delta
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
		chase_label.text = "WANTED  ·  escape in %ds\nNearest cop %dm %s   Busted %s" % [int(ceil(left)),int(nearest),arrow,_bar(chase_bust,2.5)]
	else:
		chase_label.text = "POLICE  ·  thief escapes in %ds\nThief %dm %s   Arrest %s" % [int(ceil(left)),int(nearest),arrow,_bar(chase_bust,2.5)]

func _start_trial(i: int) -> bool:
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
		var label := "%s   par %ds   $%d   best %s" % [trial["name"],int(trial["par"]),int(trial["pay"]),("%.1fs" % best) if best > 0.0 else "--"]
		if not _area_open(int(trial["area"])):
			label = "%s   LOCKED (open its area first)" % trial["name"]
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
	for z in [-6.5,6.5]:
		_box(self,Vector3(66,1.5,z),Vector3(20,3,1),rock,true)
	for z in [-23.5,23.5]:
		_box(self,Vector3(93,1.2,z),Vector3(34,2.4,1),rock,true)
	for z in [-14.5,14.5]:
		_box(self,Vector3(76,1.2,z),Vector3(1,2.4,17),rock,true)
	for z in [-16.5,16.5]:
		_box(self,Vector3(110.5,1.2,z),Vector3(1,2.4,13),rock,true)
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
			return Vector2i(_owned_count(),CARS.size())
		9:
			return Vector2i(_bay_count(),BAY.size())
		10:
			return Vector2i(_trial_count(),TRIALS.size())
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
	lines.append(_level_text()+"   (finds 20 XP, sites 25, trials 40, missions 60, jobs 10)")
	lines.append("")
	lines.append("RIDGE DISCOVERIES  %d/%d%s" % [_ridge_count(),RIDGE.size(),"" if _ridge_open() else "   (gate locked)"])
	var names: PackedStringArray = []
	for i in RIDGE.size():
		if ridge_mask & (1 << i):
			names.append(RIDGE[i]["name"])
	lines.append(", ".join(names) if names.size() > 0 else "None yet. Own a Ridge Rover to open the Ridge Gate.")
	lines.append("BAY DISCOVERIES  %d/%d%s" % [_bay_count(),BAY.size(),"" if _bay_open() else "   (gate locked: find all Ridge sites)"])
	lines.append("NORTH DISCOVERIES  %d/%d%s" % [_north_count(),NORTH.size(),"" if _north_open() else "   (gate locked: find 3 Bay sites)"])
	lines.append("")
	lines.append("MISSIONS")
	for i in MISSIONS.size():
		var progress := _mission_progress(i)
		var done := (claimed_mask & (1 << i)) != 0
		lines.append("%s  %s: %s  (+$%d)" % ["[DONE]" if done else "[%d/%d]" % [progress.x,progress.y],MISSIONS[i]["name"],MISSIONS[i]["desc"],MISSIONS[i]["pay"]])
	journal_label.text = "\n".join(lines)

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
	trial_panel.custom_minimum_size = Vector2(620,0)
	trial_panel.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var r := VBoxContainer.new()
	r.add_theme_constant_override("separation",10)
	trial_panel.add_child(r)
	r.add_child(_label("TIME TRIALS & STREET EVENTS",26,Color("f0bd62")))
	trial_info = _label("",17,Color("cbd8de"))
	trial_info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	trial_info.custom_minimum_size.x = 560
	r.add_child(trial_info)
	for i in TRIALS.size():
		var trial_button := _button("",_start_trial.bind(i))
		trial_button.custom_minimum_size = Vector2(560,40)
		for state in ["normal","hover","pressed"]:
			var sb := trial_button.get_theme_stylebox(state).duplicate() as StyleBoxFlat
			sb.content_margin_top = 4
			sb.content_margin_bottom = 4
			trial_button.add_theme_stylebox_override(state,sb)
		trial_buttons.append(trial_button)
		r.add_child(trial_button)
	trial_cancel = _button("Cancel running trial",_cancel_trial)
	r.add_child(trial_cancel)
	r.add_child(_button("Back",_close_sub))
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
	_box(player, Vector3(0,0,0),Vector3(0.65,0.85,0.4),Color("f2b24a"))
	_box(player, Vector3(0,0.68,0),Vector3(0.46,0.46,0.46),Color("ac7552"))
	_box(player, Vector3(-0.18,-0.58,0),Vector3(0.22,0.55,0.26),Color("263d54"))
	_box(player, Vector3(0.18,-0.58,0),Vector3(0.22,0.55,0.26),Color("263d54"))
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
	if car_model != null and car_model_id == car_id:
		_recolor_car_model(car_model)
		return
	if car_model != null:
		car.remove_child(car_model)
		car_model.free()
		car_model = null
	car_model_id = car_id
	var model := _try_model("res://models/car_%d.glb" % car_id)
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
	items.add_child(mode_button)
	items.add_child(_button("Continue",_toggle_menu))
	items.add_child(_button("Return to the car",_rescue))
	items.add_child(_label("Built with Godot Engine • MIT license\nLicense and attribution: credits.txt in the project",14,Color("8ddacb")))
	_build_panels(root)
	menu.hide()
	get_viewport().size_changed.connect(func():
		var view := get_viewport().get_visible_rect().size
		pause_button.position = Vector2(view.x-194,24)
		radio_button.position = Vector2(view.x-194,92)
		online_button.position = Vector2(view.x-376,92)
		radio_caption.position = Vector2(view.x-394,150)
		chase_label.position = Vector2(view.x/2-260,24)
		joystick.position = Vector2(32,view.y-210)
		action_button.position = Vector2(view.x-248,view.y-124)
		status_label.position = Vector2(view.x/2-340,view.y-48)
		_layout_panels()
	)

func _draw_joystick() -> void:
	joystick.draw_circle(Vector2(90,90),86,Color(0.05,0.12,0.18,0.55))
	joystick.draw_arc(Vector2(90,90),85,0,TAU,64,Color(0.8,0.94,0.95,0.6),2,true)
	joystick.draw_circle(Vector2(90,90)+stick*58,32,Color(0.6,0.87,0.88,0.85))

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_F12:
			_capture_preview()
		elif event.keycode == KEY_ESCAPE:
			_toggle_menu()
		elif event.keycode == KEY_E and not paused:
			_interact()
	if event is InputEventScreenTouch:
		if event.pressed:
			# Godot mouse emulation handles only the first finger; dispatch touch UI explicitly.
			for button: Button in touch_buttons:
				if button.is_visible_in_tree() and not button.disabled and button.get_global_rect().has_point(event.position):
					var in_overlay := menu.is_ancestor_of(button) or garage.is_ancestor_of(button) or journal.is_ancestor_of(button) or tune_panel.is_ancestor_of(button) or trial_panel.is_ancestor_of(button)
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
		elif not event.pressed and event.index == touch_id:
			touch_id = -1
			stick = Vector2.ZERO
	if event is InputEventScreenDrag and event.index == touch_id:
		stick = ((event.position-touch_origin)/65.0).limit_length()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and _stick_zone(event.position) and not paused:
			mouse_stick = true
			touch_origin = event.position
		elif not event.pressed and mouse_stick:
			mouse_stick = false
			stick = Vector2.ZERO
	if event is InputEventMouseMotion and mouse_stick:
		stick = ((event.position-touch_origin)/65.0).limit_length()
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
		_toggle_menu()

func _physics_process(delta: float) -> void:
	if not booted or paused:
		return
	clock += delta
	_update_peds(delta)
	var keyboard := Vector2(
		float(Input.is_physical_key_pressed(KEY_D) or Input.is_physical_key_pressed(KEY_RIGHT))-float(Input.is_physical_key_pressed(KEY_A) or Input.is_physical_key_pressed(KEY_LEFT)),
		float(Input.is_physical_key_pressed(KEY_S) or Input.is_physical_key_pressed(KEY_DOWN))-float(Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP)))
	var control := keyboard.limit_length() if keyboard.length() > 0 else stick
	# Align movement to the camera's horizontal axes.
	var forward := -camera.global_basis.z
	forward.y = 0
	forward = forward.normalized()
	var right := camera.global_basis.x
	right.y = 0
	var direction := (right.normalized()*control.x-forward*control.y).limit_length()
	if driving:
		car_speed = move_toward(car_speed,control.length()*car_max,delta*car_accel)
		if direction.length() > 0.08:
			car.rotation.y = lerp_angle(car.rotation.y,atan2(-direction.x,-direction.z),delta*car_turn)
		var movement := -car.global_basis.z*car_speed
		car.velocity.x = movement.x
		car.velocity.z = movement.z
		player.position = car.position
	else:
		player.velocity.x = direction.x*5.0
		player.velocity.z = direction.z*5.0
		if direction.length() > 0.08:
			player.rotation.y = lerp_angle(player.rotation.y,atan2(-direction.x,-direction.z),delta*10)
		player.velocity.y -= 24*delta
		player.move_and_slide()
		car.velocity.x = move_toward(car.velocity.x,0,delta*20)
		car.velocity.z = move_toward(car.velocity.z,0,delta*20)
	car.velocity.y -= 24*delta
	car.move_and_slide()
	if car.is_on_floor():
		car.velocity.y = 0
	if player.position.y < -5 or car.position.y < -5:
		_rescue()
	if driving:
		best_kmh = maxf(best_kmh,absf(car_speed)*3.6)
	_check_ridge()
	_check_bay()
	_check_north()
	_check_trial()
	_chase_tick(delta)
	_orole_tick(delta)
	_online_tick(delta)
	_check_missions()
	_check_level()
	marker.visible = trial_active >= 0 or (not exploring and not next_job_pending) or (exploring and (_nearest_find() >= 0 or not _ridge_open() or _nearest_ridge() >= 0 or _nearest_bay() >= 0))
	for index in find_nodes.size():
		find_nodes[index].visible = not bool(found_mask & (1 << index))
		find_nodes[index].rotation.y += delta
		find_nodes[index].position.y = 1.7+sin(clock*2+index)*0.25
	marker.position = _destination()+Vector3(0,0.25+sin(clock*2)*0.12,0)
	marker.rotation.y += delta*0.4
	_follow_camera(delta*(5.0+absf(car_speed)*0.15))
	_refresh_hud()
	if toast_time > 0:
		toast_time -= delta
		if toast_time <= 0:
			status_label.text = ""

func _follow_camera(weight: float) -> void:
	var target: Vector3 = car.position if driving else player.position
	camera.position = camera.position.lerp(target+Vector3(11,17,19),minf(weight,1.0))
	camera.look_at(target+Vector3(0,0.5,0))

func _interact() -> void:
	if paused:
		return
	if trial_active >= 0:
		if driving:
			_show_toast("Trial running: drive through the golden rings, or Menu > Trials to cancel.")
			return
		trial_active = -1
		_show_toast("Trial ended.")
	var body: CharacterBody3D = car if driving else player
	if not exploring and next_job_pending:
		next_job_pending = false
		_save_progress()
		_show_toast("Next job: %s → %s  •  $%d" % [ROUTES[route_index]["from"],ROUTES[route_index]["to"],ROUTES[route_index]["pay"]])
		_refresh_hud()
		return
	var destination := _destination()
	var nearby := Vector2(body.position.x-destination.x,body.position.z-destination.z).length() < 4.8
	var find_index := _nearest_find() if exploring else -1
	if exploring and find_index >= 0 and nearby and not driving:
		_collect_find(find_index)
	elif not exploring and nearby:
		var route: Dictionary = ROUTES[route_index]
		if carrying:
			cash += int(route["pay"])
			deliveries += 1
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
		_show_toast("Your car is too far away. Open Menu > Return to the car.")
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
		elif not _ridge_open():
			objective.text = "Ridge Gate  ·  %dm  ·  needs a Ridge Rover" % distance
		elif _nearest_ridge() >= 0:
			objective.text = "Discover " + str(RIDGE[_nearest_ridge()]["name"])+"  ·  "+str(distance)+"m"
		elif _nearest_bay() >= 0:
			objective.text = "Discover " + str(BAY[_nearest_bay()]["name"])+"  ·  "+str(distance)+"m"
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
	mission_label.text += "  ·  LV %d" % _level()
	balance_label.text = "$%d  ·  %d/8 finds  ·  %d/20 sites  ·  %d jobs" % [cash,count,_ridge_count()+_bay_count()+_north_count(),deliveries]
	var offset: Vector3 = destination-body.position
	var screen_right := camera.global_basis.x
	var screen_forward := -camera.global_basis.z
	screen_forward.y = 0
	var compass_angle := atan2(offset.dot(screen_right),offset.dot(screen_forward.normalized()))
	var arrows := ["↑","↗","→","↘","↓","↙","←","↖"]
	var arrow_index := posmod(int(round(compass_angle/(PI/4.0))),8)
	compass.text = "%s  %s" % [arrows[arrow_index],"Destination is here" if distance < 5 else "Follow the golden ring"]
	if exploring and index < 0 and _ridge_open() and _nearest_ridge() < 0 and _nearest_bay() < 0:
		compass.text = "Everything found! Free roam, or pick Jobs in Menu."
	elif exploring and index < 0 and not _ridge_open():
		compass.text = "%s  Buy a Ridge Rover in Menu > Garage" % arrows[arrow_index]
	speed_label.text = "%d km/h  •  Release stick to brake" % int(Vector2(car.velocity.x,car.velocity.z).length()*3.6) if driving else "On foot  •  Tokens: collect  •  Ridge sites: just arrive"
	action_button.disabled = false
	if not exploring and next_job_pending:
		action_button.text = "NEXT JOB"
	elif exploring and index >= 0 and distance < 5 and not driving:
		action_button.text = "COLLECT TOKEN"
	elif not exploring and distance < 5:
		action_button.text = "DELIVER +$%d" % int(ROUTES[route_index]["pay"]) if carrying else "PICK UP PARCEL"
	else:
		action_button.text = "EXIT CAR" if driving else "ENTER CAR"
		action_button.disabled = not driving and player.position.distance_to(car.position) >= 5.0
	mode_button.text = "Switch to delivery jobs" if exploring else "Switch to exploring"
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
	panel.show()
	panel.reset_size()
	_layout_panels()

func _layout_panels() -> void:
	var view := get_viewport().get_visible_rect().size
	for panel: Control in [menu,garage,journal,tune_panel,trial_panel,chase_panel]:
		panel.position = Vector2((view.x-panel.size.x)/2.0,maxf(8.0,(view.y-panel.size.y)/2.0))

func _toggle_menu() -> void:
	paused = not paused
	garage.hide()
	journal.hide()
	tune_panel.hide()
	trial_panel.hide()
	chase_panel.hide()
	if paused:
		_open_panel(menu)
	else:
		menu.hide()
	stick = Vector2.ZERO
	touch_id = -1
	mouse_stick = false
	joystick.queue_redraw()

func _rescue() -> void:
	car.position = Vector3(1.7,0.8,4)
	car.rotation = Vector3.ZERO
	car.velocity = Vector3.ZERO
	car_speed = 0
	player.position = Vector3(4.6,0.9,5.2)
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
	_show_toast("Back at the waterfront. Tap ENTER CAR to drive. Your money is safe.")
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
	file.set_value("progress","chase_wins",chase_wins)
	file.save(SAVE_PATH)

func _load_progress() -> void:
	var file := ConfigFile.new()
	if file.load(SAVE_PATH) == OK:
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
		chase_wins = maxi(0,int(file.get_value("progress","chase_wins",0)))
		var saved_times = file.get_value("progress","best_times",[])
		best_times = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
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
	var lines := [
		[Vector3(6,0,-40),Vector3(6,0,40)],[Vector3(-6,0,-40),Vector3(-6,0,40)],
		[Vector3(26.5,0,-40),Vector3(26.5,0,40)],[Vector3(-26.5,0,-40),Vector3(-26.5,0,40)],
		[Vector3(38.5,0,-40),Vector3(38.5,0,40)],
		[Vector3(-44,0,6),Vector3(44,0,6)],[Vector3(-44,0,-26.5),Vector3(44,0,-26.5)],
		[Vector3(-44,0,-37.5),Vector3(44,0,-37.5)],
	]
	var rng := RandomNumberGenerator.new()
	rng.seed = 5150
	for i in 16:
		var line: Array = lines[i % lines.size()]
		var node := Node3D.new()
		add_child(node)
		_box(node,Vector3(0,1.05,0),Vector3(0.55,0.75,0.32),shirts[rng.randi() % shirts.size()])
		_box(node,Vector3(0,1.62,0),Vector3(0.34,0.34,0.34),skins[rng.randi() % skins.size()])
		var leg_nodes: Array[Node3D] = []
		for side in [-0.14,0.14]:
			var hip := Node3D.new()
			hip.position = Vector3(side,0.68,0)
			node.add_child(hip)
			_box(hip,Vector3(0,-0.34,0),Vector3(0.2,0.68,0.22),legs_col)
			leg_nodes.append(hip)
		peds.append({"node":node,"a":line[0],"b":line[1],"t":rng.randf(),"dir":1.0 if rng.randf() < 0.5 else -1.0,"speed":rng.randf_range(1.1,1.8),"off":Vector3.ZERO,"phase":rng.randf()*TAU,"legs":leg_nodes})
	_update_peds(0.0)

func _update_peds(delta: float) -> void:
	for p in peds:
		var a: Vector3 = p["a"]
		var b: Vector3 = p["b"]
		var seg := b-a
		var seg_len := seg.length()
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
		var heading := seg.normalized()*float(p["dir"])
		node.rotation.y = atan2(heading.x,heading.z)
		p["phase"] = float(p["phase"])+delta*float(p["speed"])*4.5
		var legs: Array = p["legs"]
		legs[0].rotation.x = sin(float(p["phase"]))*0.6
		legs[1].rotation.x = -sin(float(p["phase"]))*0.6

func _smoke_test() -> void:
	# Exercise the actual mission and driving transitions; preserve the player's save.
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
	assert(objective.text.begins_with("Ridge Gate"),"Collection end state failed: "+objective.text)
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
	_smoke_models()
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
	print("HARBOR_SMOKE_OK: two-finger input, driving, chase mode, online roles, player levels, six routes, eight collectibles, no duplicate rewards, save persistence, exit, rescue, legacy save, garage, tuning, ridge gate/ramp/sites, bay road, time trials, street events, missions, radio stations, pedestrians, Blender models")
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
	var saved := [found_mask,ridge_mask,bay_mask,north_mask,trial_done,claimed_mask,deliveries]
	found_mask = 0
	ridge_mask = 0
	bay_mask = 0
	north_mask = 0
	trial_done = 0
	claimed_mask = 0
	deliveries = 0
	assert(_xp() == 0 and _level() == 1,"Fresh player is level 1")
	assert(_level_for(149) == 1 and _level_for(150) == 2 and _level_for(449) == 2 and _level_for(450) == 3 and _level_for(1499) == 4 and _level_for(1500) == 5 and _level_for(99999) == 5,"Level thresholds")
	found_mask = 255
	assert(_xp() == 160 and _level() == 2,"Finds give XP")
	ridge_mask = (1 << RIDGE.size())-1
	bay_mask = (1 << BAY.size())-1
	north_mask = (1 << NORTH.size())-1
	trial_done = (1 << TRIALS.size())-1
	claimed_mask = (1 << MISSIONS.size())-1
	deliveries = 50
	var total := 160+(RIDGE.size()+BAY.size()+NORTH.size())*25+TRIALS.size()*40+MISSIONS.size()*60+ROUTES.size()*10
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

func _blocked_at(pos: Vector3, radius := 0.5) -> bool:
	var query := PhysicsShapeQueryParameters3D.new()
	var sphere := SphereShape3D.new()
	sphere.radius = radius
	query.shape = sphere
	query.transform = Transform3D(Basis.IDENTITY,pos)
	query.exclude = [player.get_rid(),car.get_rid()]
	return not get_world_3d().direct_space_state.intersect_shape(query,1).is_empty()

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
	assert(peds.size() == 16,"Pedestrians missing")
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
	best_times = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
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
	_check_missions()
	var total := 0
	for m in MISSIONS:
		total += int(m["pay"])
	assert(claimed_mask == (1 << MISSIONS.size())-1 and cash == total,"Mission rewards wrong")
	_check_missions()
	assert(cash == total,"Mission paid twice")
	_refresh_journal()
	assert("[DONE]" in journal_label.text,"Journal did not show progress")
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

func _save_shot(name: String) -> void:
	for i in 6:
		await get_tree().process_frame
	await RenderingServer.frame_post_draw
	var folder := OS.get_environment("HC_SHOTS")
	if folder == "":
		folder = ProjectSettings.globalize_path("user://screenshots")
	DirAccess.make_dir_recursive_absolute(folder)
	get_viewport().get_texture().get_image().save_png(folder.path_join(name+".png"))

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
	best_times = [31.4,12.9,0.0,0.0,0.0,0.0,0.0]
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

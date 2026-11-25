extends RefCounted
# v0.60: Chit Chat City world portal. One portal in the Harbor Dome opens a picker with real-city worlds
# (Paris, Tokyo, New York, Bangkok), each built lazily from OpenStreetMap data (c) OpenStreetMap contributors, ODbL.
# Each world is one paris.gd instance driven by a definition below. Talks to main through `g`.
const Paris := preload("res://paris.gd")
const HUB_REL := Vector3(-126,0,-40)      # hub portal on the Ridge lawn, relative to HUB_C
const HUB_COL := Color("8ec5ff")
const AREA := Rect2(-330.0,-330.0,660.0,660.0)

const DEFS := [
	{
		"name":"Paris","title":"PARIS","sub":"Eiffel Tower · Champ de Mars","save":"paris","col":Color("8ec5ff"),
		"C":Vector3(900,0,700),"area":Rect2(-256.0,-354.0,951.0,719.0),"data":"res://map/paris_osm.json",
		"ret":Vector2(95,115),"cafe":Vector2(65,70),"view":Vector2(-68.6,-118.0),
		"landmark":"eiffel","lm_r":0.0,"clear":50.0,"hmax":40.0,"lv":5,"mansard":true,"river":true,"water":true,
		"facades":[Color("dcd2bb"),Color("e3dac6"),Color("d3c6a9"),Color("e8e0cf"),Color("cfc2a4"),Color("d9cbb0")],
		"roof":Color("5d6772"),"ground":Color("b3ad9f"),
		"cafe_name":"CAFÉ DE LA TOUR","cafe_roof":Color("2d4a3c"),"awning":[Color("b5322e"),Color("f1ead9")],
		"order":"ORDER A CAFÉ","order_msg":"Un café au lait, s'il vous plaît! Merci.",
		"hello":"Bonjour! Welcome to Paris.",
		"quests":[
			{"n":"Step through the portal to Paris","pay":300,"xp":30},
			{"n":"Stand under the Eiffel Tower","pay":300,"xp":30},
			{"n":"Order at Café de la Tour","pay":300,"xp":30},
			{"n":"Look at the Seine from the quay","pay":300,"xp":30},
		],
	},
	{
		"name":"Tokyo","title":"TOKYO","sub":"Shibuya Crossing · Hachiko","save":"tokyo","col":Color("ff7ac8"),
		"C":Vector3(3200,0,700),"area":AREA,"data":"res://map/tokyo_osm.json",
		"ret":Vector2(8,44),"cafe":Vector2(33,12),"view":Vector2(-20,18),
		"landmark":"crossing","lm_r":20.0,"clear":30.0,"hmax":60.0,"lv":6,"mansard":false,"river":false,"water":false,
		"statue":Vector2(-20,18),
		"facades":[Color("c9ccd1"),Color("b9bec6"),Color("d6d2c8"),Color("a9b3bf"),Color("cfc8bb"),Color("bfc6cf")],
		"roof":Color("7b828c"),"ground":Color("8d9096"),
		"cafe_name":"SHIBUYA CAFÉ","cafe_roof":Color("3b3f5c"),"awning":[Color("e8456b"),Color("f6efe2")],
		"order":"ORDER MATCHA","order_msg":"Matcha latte, onegaishimasu! Arigato!",
		"hello":"Irasshaimase! Welcome to Tokyo.",
		"quests":[
			{"n":"Step through the portal to Tokyo","pay":300,"xp":30},
			{"n":"Cross Shibuya Crossing","pay":300,"xp":30},
			{"n":"Order matcha at Shibuya Café","pay":300,"xp":30},
			{"n":"Say hello to Hachiko","pay":300,"xp":30},
		],
	},
	{
		"name":"New York","title":"NEW YORK","sub":"Times Square · Broadway","save":"newyork","col":Color("ffd24f"),
		"C":Vector3(5200,0,700),"area":AREA,"data":"res://map/newyork_osm.json",
		"ret":Vector2(27,22),"cafe":Vector2(-22,39),"view":Vector2(19,108),
		"landmark":"times","lm_r":22.0,"clear":28.0,"hmax":80.0,"lv":8,"mansard":false,"river":false,"water":false,
		"facades":[Color("b98b72"),Color("a67862"),Color("c4a58c"),Color("9a8a80"),Color("b0a090"),Color("a8806a")],
		"roof":Color("5a5d63"),"ground":Color("7d7f84"),
		"cafe_name":"BROADWAY DINER","cafe_roof":Color("7a2a2a"),"awning":[Color("2b5fa8"),Color("f4efe4")],
		"order":"ORDER COFFEE","order_msg":"One large coffee, coming right up!",
		"hello":"Welcome to New York!",
		"quests":[
			{"n":"Step through the portal to New York","pay":300,"xp":30},
			{"n":"Stand in Times Square","pay":300,"xp":30},
			{"n":"Order coffee at Broadway Diner","pay":300,"xp":30},
			{"n":"Walk up Broadway to the lookout","pay":300,"xp":30},
		],
	},
	{
		"name":"Bangkok","title":"BANGKOK","sub":"Wat Arun · old town","save":"bangkok","col":Color("ffa05a"),
		"C":Vector3(7200,0,700),"area":AREA,"data":"res://map/bangkok_osm.json",
		"ret":Vector2(42,15),"cafe":Vector2(8,-44),"view":Vector2(110,0),
		"landmark":"prang","lm_r":24.0,"clear":32.0,"hmax":30.0,"lv":3,"mansard":false,"river":false,"water":false,
		"facades":[Color("e0d2b4"),Color("d6c4a0"),Color("e8dcc2"),Color("cdbb97"),Color("dccdae"),Color("d2c3a4")],
		"roof":Color("a4574a"),"ground":Color("a9a08c"),
		"cafe_name":"CAFÉ ARUN","cafe_roof":Color("6b4a2e"),"awning":[Color("2e8f7a"),Color("f3ead6")],
		"order":"ORDER THAI TEA","order_msg":"Cha yen, khrap! Sawasdee!",
		"hello":"Sawasdee! Welcome to Bangkok.",
		"quests":[
			{"n":"Step through the portal to Bangkok","pay":300,"xp":30},
			{"n":"Stand beneath Wat Arun","pay":300,"xp":30},
			{"n":"Order Thai tea at Café Arun","pay":300,"xp":30},
			{"n":"Explore the old town lanes","pay":300,"xp":30},
		],
	},
]

var g
var list: Array = []
var hub_pos: Vector3
var hub_root: Node3D
var dry := false : set = _set_dry
var last_hub := false

func _init(game) -> void:
	g = game
	hub_pos = g.HUB_C+HUB_REL
	for d: Dictionary in DEFS:
		list.append(Paris.new(g,d,hub_pos))

func _set_dry(v: bool) -> void:
	dry = v
	for w in list:
		w.dry = v

func build_hub() -> void:
	hub_root = Node3D.new()
	hub_root.name = "WorldPortal"
	g.add_child(hub_root)
	var p = list[0]
	p.make_portal(hub_root,hub_pos,"WORLD PORTAL","Paris · Tokyo · New York · Bangkok",HUB_COL)
	# a tall light beam so the portal can be seen from across the city
	var bm := StandardMaterial3D.new()
	bm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	bm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	bm.albedo_color = Color(0.56,0.77,1.0,0.28)
	bm.cull_mode = BaseMaterial3D.CULL_DISABLED
	var cm := CylinderMesh.new()
	cm.top_radius = 1.2
	cm.bottom_radius = 2.6
	cm.height = 140.0
	cm.radial_segments = 12
	cm.rings = 1
	var beam := MeshInstance3D.new()
	beam.mesh = cm
	beam.material_override = bm
	beam.position = hub_pos+Vector3(0,70.0,0)
	beam.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	hub_root.add_child(beam)

func current():
	if g.player == null:
		return null
	var pp: Vector3 = g.player.position
	for w in list:
		if w.in_paris(pp):
			return w
	return null

func player_in_world() -> bool:
	return current() != null

func near_hub() -> bool:
	if g.player == null or g.paused:
		return false
	var pp: Vector3 = g.player.position
	return Vector2(pp.x-hub_pos.x,pp.z-hub_pos.z).length() < 6.0

func prompt() -> String:
	for w in list:
		var s: String = w.prompt()
		if s != "":
			return s
	if near_hub():
		return "OPEN WORLD PORTAL"
	return ""

func interact() -> bool:
	for w in list:
		if w.interact():
			return true
	if near_hub():
		if list[0].busy():
			g._show_toast("Get out of your vehicle or seat first.")
		else:
			g._open_worlds()
		return true
	return false

func busy() -> bool:
	for w in list:
		if w.entering:
			return true
	return false

func enter(i: int) -> void:
	if busy() or i < 0 or i >= list.size():
		return
	list[i].enter()

func go_home() -> void:
	var w = current()
	if w != null:
		w.go_home()
	else:
		go_portal()

func go_portal() -> void:
	if g.player == null:
		return
	var dir: Vector3 = (g.HUB_C-hub_pos).normalized()
	list[0].move_player(hub_pos+dir*7.0+Vector3(0,0.9,0))
	g._show_toast("The world portal is right here. Walk up to it and tap OPEN WORLD PORTAL.")
	g._refresh_hud()

func tick(delta: float) -> void:
	for w in list:
		w.tick(delta)
	var nh := near_hub()
	if nh != last_hub:
		last_hub = nh
		g._refresh_hud()

func save_state(file: ConfigFile) -> void:
	for w in list:
		w.save_state(file)

func load_state(file: ConfigFile) -> void:
	for w in list:
		w.load_state(file)

func summary(i: int) -> String:
	var w = list[i]
	w.roll_day()
	return "%d/%d quests today" % [w.done_count(),w.QUESTS.size()]

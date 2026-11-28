extends RefCounted
# v0.60: Chit Chat City world portal. One portal in the Harbor Dome opens a picker with real-city worlds
# (Paris, Tokyo, New York, Bangkok), each built lazily from OpenStreetMap data (c) OpenStreetMap contributors, ODbL.
# Each world is one paris.gd instance driven by a definition below. Talks to main through `g`.
const Paris := preload("res://paris.gd")
const HUB_REL := Vector3(-114,0,-76)      # v0.72: the Portal Terrace on the north edge of the Ridge, relative to HUB_C
const GATE_R := 14.0                      # five walk-through gates stand on an arc this far from the terrace centre
const SKY_COL := Color("c7a8ff")
const HUB_COL := Color("8ec5ff")
const AREA := Rect2(-330.0,-330.0,660.0,660.0)

const DEFS := [
	{
		"name":"Paris","title":"PARIS","sub":"Eiffel Tower · Champ de Mars","save":"paris","col":Color("8ec5ff"),
		"C":Vector3(900,0,700),"area":Rect2(-256.0,-354.0,951.0,719.0),"data":"res://map/paris_osm.json",
		"ret":Vector2(95,115),"cafe":Vector2(65,70),"view":Vector2(-68.6,-118.0),
		"landmark":"eiffel","lm_r":0.0,"clear":50.0,"hmax":40.0,"lv":5,"mansard":true,"river":true,"water":true,
		"facades":[Color("dcd2bb"),Color("e3dac6"),Color("d3c6a9"),Color("e8e0cf"),Color("cfc2a4"),Color("d9cbb0")],
		"roof":Color("5d6772"),"ground":Color("8f8a7d"),
		"cafe_name":"CAFÉ DE LA TOUR","cafe_roof":Color("2d4a3c"),"awning":[Color("b5322e"),Color("f1ead9")],
		"order":"ORDER A CAFÉ","order_msg":"Un café au lait, s'il vous plaît! Merci.",
		"clues":[Vector2(74,42),Vector2(-80,29),Vector2(15,-84)],"code":"431","relic":"Tower Key","riddles":["How many legs does the Iron Lady stand on?","How many levels can visitors climb, from the ground to the top?","You order un café au lait. Un means how many?"],
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
		"roof":Color("7b828c"),"ground":Color("70737a"),
		"cafe_name":"SHIBUYA CAFÉ","cafe_roof":Color("3b3f5c"),"awning":[Color("e8456b"),Color("f6efe2")],
		"order":"ORDER MATCHA","order_msg":"Matcha latte, onegaishimasu! Arigato!",
		"clues":[Vector2(43,74),Vector2(-85,0),Vector2(29,-80)],"code":"493","relic":"Hachiko Bell","riddles":["The scramble crosses the road on this many sides (not counting diagonals).","Hachiko waited for his owner for this many years.","Giant screens glow above the crossing: how many are there?"],
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
		"roof":Color("5a5d63"),"ground":Color("63656a"),
		"cafe_name":"BROADWAY DINER","cafe_roof":Color("7a2a2a"),"awning":[Color("2b5fa8"),Color("f4efe4")],
		"order":"ORDER COFFEE","order_msg":"One large coffee, coming right up!",
		"clues":[Vector2(74,42),Vector2(-80,-29),Vector2(0,-85)],"code":"523","relic":"Broadway Star","riddles":["Count the red steps in Times Square.","Seventh Avenue crosses Broadway: this many streets meet here.","N-Y-C: how many letters?"],
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
		"roof":Color("a4574a"),"ground":Color("867e6d"),
		"cafe_name":"CAFÉ ARUN","cafe_roof":Color("6b4a2e"),"awning":[Color("2e8f7a"),Color("f3ead6")],
		"order":"ORDER THAI TEA","order_msg":"Cha yen, khrap! Sawasdee!",
		"clues":[Vector2(74,42),Vector2(-84,15),Vector2(0,-85)],"code":"541","relic":"Arun Lotus","riddles":["The central prang rises in this many stepped tiers.","Small prangs stand round the big one: how many?","One spire crowns the main prang. One means how many?"],
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
var gates: Array = []        # [Vector3 world pos, world index (list.size() = the sky island)]
var armed := true            # a gate only fires after you have stepped away from all of them
var gate_note := 0.0
var calls := {}              # world index -> [time, caller name, boss awake]
# v0.61: the mystic sky island, unlocked by one relic from each of the four cities
const SKY := Vector3(9600,260,700)
const SKY_NEED := 4
var sky_root: Node3D
var sky_built := false
var shrine_done := false
var shrine_day := ""
var last_sky := ""

func relic_count() -> int:
	var n := 0
	for w in list:
		if w.relic:
			n += 1
	return n

func sky_open() -> bool:
	return relic_count() >= SKY_NEED

func in_sky(p: Vector3) -> bool:
	return absf(p.x-SKY.x) < 70.0 and absf(p.z-SKY.z) < 70.0 and p.y > SKY.y-60.0

func sky_portal_pos() -> Vector3:
	return SKY+Vector3(0,0,24)

func build_sky() -> void:
	if sky_built:
		return
	sky_built = true
	sky_root = Node3D.new()
	sky_root.name = "MysticSky"
	sky_root.position = SKY
	g.add_child(sky_root)
	var grass := Color("6aa35a")
	for yaw: float in [0.0,PI/4.0]:
		g._hm(sky_root,Vector3(0,-1.0,0),Vector3(52,2.0,52),grass if yaw == 0.0 else grass.darkened(0.03),true,yaw)
	g._fc_part(sky_root,g._bcone(26.0,1.5,46.0),Vector3(0,-25.0,0),g._material(Color("6d6a78")))
	g._fc_part(sky_root,g._bcone(18.0,1.0,60.0),Vector3(6,-45.0,3),g._material(Color("57546a")))
	for k in 6:
		var ang := float(k)/6.0*TAU+0.4
		var rp := Vector3(cos(ang)*56.0,12.0+float(k%3)*9.0,sin(ang)*56.0)
		g._hm(sky_root,rp,Vector3(9,2.0,9),Color("9a96b4"),true)
		g._fc_part(sky_root,g._bcone(0.05,1.2,4.0),rp+Vector3(0,3.4,0),g._fc_glow(Color("b48cff")))
	var cols := [list[0].W["col"],list[1].W["col"],list[2].W["col"],list[3].W["col"]]
	g._hm(sky_root,Vector3(0,0.6,0),Vector3(9,1.2,9),Color("cfc9e6"),true)
	for k in 4:
		var ang := float(k)/4.0*TAU+PI/4.0
		var pp := Vector3(cos(ang)*5.5,0,sin(ang)*5.5)
		g._hm(sky_root,pp+Vector3(0,2.5,0),Vector3(1.0,5.0,1.0),Color("e8e3f5"),true)
		g._fc_part(sky_root,g._bsph(0.7),pp+Vector3(0,5.8,0),g._fc_glow(cols[k]))
	g._fc_part(sky_root,g._bsph(1.4),Vector3(0,6.5,0),g._fc_glow(Color("f4ecff")))
	# v0.61.1: a grander shrine: glowing floor rings, tiers, spinning halos, orbiting crystals, a sky beam
	g._fc_part(sky_root,g._bcone(11.0,11.0,0.06),Vector3(0,0.05,0),g._fc_glow(Color("b48cff")))
	g._fc_part(sky_root,g._bcone(8.4,8.4,0.08),Vector3(0,0.08,0),g._material(Color("2c2442")))
	g._fc_part(sky_root,g._bcone(7.2,7.2,0.1),Vector3(0,0.1,0),g._fc_glow(Color("ffd98a")))
	g._fc_part(sky_root,g._bcone(6.4,6.4,0.12),Vector3(0,0.12,0),g._material(Color("2c2442")))
	g._hm(sky_root,Vector3(0,1.5,0),Vector3(6.4,0.5,6.4),Color("e8dcff"))
	for k in 4:
		var ang := float(k)/4.0*TAU
		g._hm(sky_root,Vector3(cos(ang)*5.6,5.4,sin(ang)*5.6),Vector3(0.5,0.5,0.5),Color("ffd98a"))
	var halo_cols := [Color("ffd98a"),Color("b48cff"),Color("8ee0ff")]
	for h in 3:
		var pivot := Node3D.new()
		pivot.position = Vector3(0,6.5,0)
		pivot.rotation = Vector3(float(h)*0.9,0,float(h)*0.6)
		sky_root.add_child(pivot)
		var ring := MeshInstance3D.new()
		ring.mesh = g._fc_torus(3.0+float(h)*1.4,3.2+float(h)*1.4)
		ring.material_override = g._fc_glow(halo_cols[h])
		pivot.add_child(ring)
		var tw: Tween = g.create_tween()
		tw.set_loops()
		tw.tween_property(pivot,"rotation:y",TAU if h%2 == 0 else -TAU,10.0+float(h)*4.0).from(0.0)
	var orbit := Node3D.new()
	orbit.position = Vector3(0,4.5,0)
	sky_root.add_child(orbit)
	for k in 10:
		var ang := float(k)/10.0*TAU
		var cr: MeshInstance3D = g._fc_part(orbit,g._bcone(0.05,0.55,1.6),Vector3(cos(ang)*10.0,sin(ang*3.0)*1.8,sin(ang)*10.0),g._fc_glow(halo_cols[k%3].lightened(0.2)))
		cr.rotation.x = 0.4
	var otw: Tween = g.create_tween()
	otw.set_loops()
	otw.tween_property(orbit,"rotation:y",TAU,18.0).from(0.0)
	var bm := StandardMaterial3D.new()
	bm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	bm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	bm.albedo_color = Color(0.75,0.6,1.0,0.22)
	bm.cull_mode = BaseMaterial3D.CULL_DISABLED
	var cm := CylinderMesh.new()
	cm.top_radius = 1.0
	cm.bottom_radius = 3.0
	cm.height = 220.0
	cm.radial_segments = 14
	cm.rings = 1
	var beam := MeshInstance3D.new()
	beam.mesh = cm
	beam.material_override = bm
	beam.position = Vector3(0,112.0,0)
	beam.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	sky_root.add_child(beam)
	list[0].label(sky_root,"MYSTIC SHRINE",Vector3(0,11.0,0),Color("e9d8ff"),72)
	var ol := OmniLight3D.new()
	ol.light_color = Color("c7a8ff")
	ol.light_energy = 1.6
	ol.omni_range = 40.0
	ol.position = Vector3(0,7,0)
	sky_root.add_child(ol)
	list[0].make_portal(sky_root,Vector3(0,0,24),"BACK TO CHIT CHAT CITY","Portal home",Color("ffcf6b"))
	for sx: float in [-1.0,1.0]:
		g._collider(sky_root,Vector3(sx*28.0,3,0),Vector3(2,8,58))
		g._collider(sky_root,Vector3(0,3,sx*28.0),Vector3(58,8,2))

func enter_sky() -> void:
	if g.player == null or busy():
		return
	if not sky_open():
		g._show_toast("The sky world is locked: %d/%d relics. Solve the case in every city (find 3 clues, then the CASE BOARD)." % [relic_count(),SKY_NEED])
		return
	build_sky()
	list[0].move_player(SKY+Vector3(0,0.9,16))
	g._show_toast("The mystic sky island. Step to the shrine.")
	g._refresh_hud()

func sky_prompt() -> String:
	if g.player == null or g.paused or not sky_built:
		return ""
	var p: Vector3 = g.player.position
	if not in_sky(p):
		return ""
	if Vector2(p.x-sky_portal_pos().x,p.z-sky_portal_pos().z).length() < 4.8:
		return "PORTAL HOME"
	if Vector2(p.x-SKY.x,p.z-SKY.z).length() < 7.5:
		return "ACTIVATE SHRINE" if not shrine_done else "MAKE A WISH"
	return ""

func sky_interact(pr: String) -> void:
	if pr == "PORTAL HOME":
		go_portal()
		g._show_toast("Back in Chit Chat City.")
		return
	var today := Time.get_date_string_from_system()
	if not shrine_done:
		shrine_done = true
		shrine_day = today
		g.cash += 100000
		if not g.legacy_rules:
			g.bonus_xp += 5000
		g._show_toast("THE SHRINE AWAKENS! 4 relics joined. +$100,000  +5000 XP")
		g._feed_add("Mystic Shrine awakened!","")
		g._save_progress()
	elif shrine_day != today:
		shrine_day = today
		g.cash += 5000
		g._show_toast("The shrine grants a wish: +$5,000. Come back tomorrow.")
		g._save_progress()
	else:
		g._show_toast("The shrine glows softly. Come back tomorrow.")

func _init(game) -> void:
	g = game
	hub_pos = g.HUB_C+HUB_REL
	for d: Dictionary in DEFS:
		list.append(Paris.new(g,d,hub_pos))
		list[list.size()-1].cu.idx = list.size()-1

func _set_dry(v: bool) -> void:
	dry = v
	for w in list:
		w.dry = v

func build_hub() -> void:
	hub_root = Node3D.new()
	hub_root.name = "WorldPortal"
	g.add_child(hub_root)
	var p = list[0]
	# v0.72: the Portal Terrace. A stone circle with five gates; walking through one takes you there at once.
	g._fc_part(hub_root,g._bcone(19.0,19.0,0.1),hub_pos+Vector3(0,0.03,0),g._material(Color("2b2f45")))
	g._fc_part(hub_root,g._bcone(17.6,17.6,0.1),hub_pos+Vector3(0,0.05,0),g._material(Color("3a3f58")))
	g._fc_part(hub_root,g._fc_torus(18.4,18.8),hub_pos+Vector3(0,0.12,0),g._fc_glow(HUB_COL))
	g._fc_part(hub_root,g._fc_torus(5.6,5.8),hub_pos+Vector3(0,0.12,0),g._fc_glow(Color("ffd98a")))
	g._hm(hub_root,Vector3(hub_pos.x,0.04,hub_pos.z+25.0),Vector3(5.0,0.08,16.0),Color("3a3f58"))
	g._fc_part(hub_root,g._bcone(1.2,1.6,1.0),hub_pos+Vector3(0,0.5,0),g._material(Color("cfc9e6")))
	g._fc_part(hub_root,g._bsph(0.9),hub_pos+Vector3(0,2.0,0),g._fc_glow(Color("f4ecff")))
	g._collider(hub_root,hub_pos+Vector3(0,1.0,0),Vector3(2.4,2.0,2.4))
	p.label(hub_root,"PORTAL TERRACE",hub_pos+Vector3(0,12.5,0),Color("e9f3ff"),96).visibility_range_end = 400.0
	p.label(hub_root,"Walk through a gate to travel",hub_pos+Vector3(0,4.2,0),Color.WHITE,40)
	var n := list.size()+1
	for k in n:
		var ang := deg_to_rad(200.0+140.0*float(k)/float(n-1))
		var gp := hub_pos+Vector3(cos(ang),0,sin(ang))*GATE_R
		var gate: Node3D
		if k < list.size():
			var d: Dictionary = list[k].W
			gate = p.make_portal(hub_root,gp,String(d["title"]),String(d["sub"]),d["col"])
		else:
			gate = p.make_portal(hub_root,gp,"MYSTIC SKY","4 relics open it",SKY_COL)
		gate.rotation.y = atan2(hub_pos.x-gp.x,hub_pos.z-gp.z)
		gates.append([gp,k])
	# a tall light beam so the terrace can be seen from across the city
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
	if g.player != null and sky_built and in_sky(g.player.position):
		return true
	return current() != null

func near_hub() -> bool:
	# v0.72: no button at the terrace any more; the gates work by walking through them.
	return false

func gate_tick(delta: float) -> void:
	if g.player == null or g.paused or gates.is_empty():
		return
	gate_note = maxf(0.0,gate_note-delta)
	var pp: Vector3 = (g.car if g.driving else g.player).position
	if absf(pp.x-hub_pos.x) > 30.0 or absf(pp.z-hub_pos.z) > 30.0 or pp.y > 4.0:
		armed = true
		return
	var best := 1e9
	var gi := -1
	for gt in gates:
		var d := Vector2(pp.x-(gt[0] as Vector3).x,pp.z-(gt[0] as Vector3).z).length()
		if d < best:
			best = d
			gi = int(gt[1])
	if best > 5.0:
		armed = true
		return
	if not armed or best > 2.3 or busy():
		return
	if list[0].busy():
		if gate_note <= 0.0:
			gate_note = 4.0
			g._show_toast("Get out of your vehicle and walk through the gate.")
		return
	armed = false
	if gi >= list.size():
		enter_sky()
	else:
		enter(gi)

# ---------- v0.72: calls for help and the boss channel ----------
func players_in(i: int) -> int:
	var n := 0
	var now := Time.get_ticks_msec()/1000.0
	var a: Rect2 = list[i].AREA.grow(15.0)
	var c: Vector3 = list[i].C
	for id in g.online_peers:
		var peer: Dictionary = g.online_peers[id]
		var t: Vector3 = peer.get("target",Vector3.ZERO)
		if now-float(peer.get("seen",0.0)) < 8.0 and a.has_point(Vector2(t.x-c.x,t.z-c.z)):
			n += 1
	return n

func net_msg(p: Dictionary) -> void:
	var from := String(p.get("i",""))
	if from == "" or from == String(g.online_id) or from.length() > 24:
		return
	var wi := int(p.get("w",-1))
	if wi < 0 or wi >= list.size():
		return
	var a := String(p.get("a",""))
	var nm: String = g._online_clean_name(String(p.get("n","Player")))
	var w = list[wi]
	var here: bool = g.player != null and w.in_paris(g.player.position)
	if a == "call" or a == "start":
		var boss := a == "start" or int(p.get("b",0)) == 1
		calls[wi] = [Time.get_ticks_msec()/1000.0,nm,boss]
		if here:
			return
		var text := "%s is fighting %s in %s! It needs %d players." % [nm,w.cu.boss_name(),w.W["name"],w.cu.BOSS_NEED] if boss else "%s calls all players to %s: cure the infected together!" % [nm,w.W["name"]]
		for item in g.feed:
			if item["from"] == from:
				item["until"] = float(g.clock)+float(g.INVITE_TIME)
				item["invite"] = {"boss":wi}
				return
		g._feed_add(text,from,{"boss":wi})
		if boss:
			g._show_toast("BOSS FIGHT in %s! Tap JOIN to jump in." % String(w.W["name"]).to_upper())
		return
	if a == "win":
		calls.erase(wi)
		if not here:
			g._feed_add("%s defeated in %s!" % [w.cu.boss_name(),w.W["name"]],"")
	if a == "st" and not here:
		calls[wi] = [Time.get_ticks_msec()/1000.0,nm,true]
	w.cu.net(p)

func join_call(i: int) -> void:
	# JOIN on a call for help: straight into that city, next to the boss lair.
	if i < 0 or i >= list.size() or busy() or g.player == null:
		return
	var w = list[i]
	if w.busy():
		g._show_toast("Get out of your vehicle or seat first, then tap JOIN again.")
		return
	if not w.in_paris(g.player.position):
		var cur = current()
		if cur != null:
			cur.ob.abort("Rescue cancelled.")
		await w.enter()
	w.cu.goto_arena()
	g._show_toast("You joined the fight in %s! Tap FIRE to shoot the cure gun." % w.W["name"])
	g._refresh_hud()

func live_line() -> String:
	# For the Harbor Live news screen and the world picker.
	var now := Time.get_ticks_msec()/1000.0
	for wi in calls:
		if now-float(calls[wi][0]) < 45.0 and bool(calls[wi][2]):
			return "BOSS FIGHT in %s: go to the Portal Terrace!" % String(list[int(wi)].W["name"]).to_upper()
	return ""

func prompt() -> String:
	var sp := sky_prompt()
	if sp != "":
		return sp
	for w in list:
		var s: String = w.prompt()
		if s != "":
			return s
	if near_hub():
		return "OPEN WORLD PORTAL"
	return ""

func interact() -> bool:
	var sp := sky_prompt()
	if sp != "":
		sky_interact(sp)
		return true
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
	if g.player != null and sky_built and in_sky(g.player.position):
		go_portal()
		return
	var w = current()
	if w != null:
		w.go_home()
	else:
		go_portal()

func go_portal() -> void:
	if g.player == null:
		return
	var dir: Vector3 = (g.HUB_C-hub_pos).normalized()
	armed = false
	list[0].move_player(hub_pos+Vector3(0,0.9,7.0))
	g._show_toast("The Portal Terrace. Walk through a gate: Paris, Tokyo, New York, Bangkok or the Mystic Sky.")
	g._refresh_hud()

func tick(delta: float) -> void:
	for w in list:
		w.tick(delta)
	gate_tick(delta)
	if sky_built and g.player != null and absf(g.player.position.x-SKY.x) < 80.0 and absf(g.player.position.z-SKY.z) < 80.0 and g.player.position.y < SKY.y-30.0:
		list[0].move_player(SKY+Vector3(0,0.9,16))
	var spr := sky_prompt()
	if spr != last_sky:
		last_sky = spr
		g._refresh_hud()
	var nh := near_hub()
	if nh != last_hub:
		last_hub = nh
		g._refresh_hud()

var seal_bonus := false

func sealed_count() -> int:
	var n := 0
	for x in list:
		if x.ob.sealed:
			n += 1
	return n

func check_seal_bonus() -> void:
	if seal_bonus or sealed_count() < list.size():
		return
	seal_bonus = true
	g.cash += 50000
	if not g.legacy_rules:
		g.bonus_xp += 2500
	g._show_toast("ALL 4 OUTBREAKS SEALED! Bonus +$50,000 and 2,500 XP.")
	g._feed_add("All four cities sealed. Chit Chat City is safe!","")
	g._save_progress()

func save_state(file: ConfigFile) -> void:
	for w in list:
		w.save_state(file)
	file.set_value("sky","shrine",shrine_done)
	file.set_value("sky","day",shrine_day)
	file.set_value("sky","seal_bonus",seal_bonus)

func load_state(file: ConfigFile) -> void:
	for w in list:
		w.load_state(file)
	shrine_done = bool(file.get_value("sky","shrine",false))
	shrine_day = String(file.get_value("sky","day",""))
	seal_bonus = bool(file.get_value("sky","seal_bonus",false))

func summary(i: int) -> String:
	var w = list[i]
	w.roll_day()
	var extra := ""
	var np := players_in(i)
	if np > 0:
		extra += " · %d player%s here" % [np,"" if np == 1 else "s"]
	if calls.has(i) and Time.get_ticks_msec()/1000.0-float(calls[i][0]) < 45.0 and bool(calls[i][2]):
		extra += " · BOSS FIGHT NOW"
	elif w.cu.boss_won:
		extra += " · boss ✓"
	return "%d/%d quests · %s" % [w.done_count(),w.QUESTS.size(),"relic ✓" if w.relic else "clues %d/3" % w.clue_count()]+(" · sealed ✓" if w.ob.sealed else "")+extra

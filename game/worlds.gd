extends RefCounted
# v0.60: Bonkers City world portal. One portal in the Harbor Dome opens a picker with real-city worlds
# (Paris, Tokyo, New York, Bangkok), each built lazily from OpenStreetMap data (c) OpenStreetMap contributors, ODbL.
# Each world is one paris.gd instance driven by a definition below. Talks to main through `g`.
const Paris := preload("res://paris.gd")
const HUB_REL := Vector3(-67.7,5.7,-62)   # v0.72.1: the Portal Summit, a rock mesa joined to the Summit Lookout (relative to HUB_C)
const GATE_R := 12.6
const MESA_R := 18.5                      # radius of the rock mesa the gates stand on                      # five walk-through gates stand on an arc this far from the terrace centre
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
# v0.75: roles. Chosen at the three role stones on the Portal Summit; the role changes your special attack and health.
const ROLES := [
	{"n":"MAGE","sub":"Damage  ·  CURE BLAST: a huge hit on the boss","col":Color("7fe8ff"),"at":Vector3(0,0,-6.0),"btn":"BLAST"},
	{"n":"TANK","sub":"Guardian  ·  double health  ·  SHIELD SLAM","col":Color("ffb03a"),"at":Vector3(-9.0,0,5.0),"btn":"SHIELD"},
	{"n":"HEALER","sub":"Medic  ·  HEAL WAVE heals you and your team","col":Color("8dffb0"),"at":Vector3(9.0,0,5.0),"btn":"HEAL"},
]
var role := 0
# v0.75.1: the call to action. While a boss fight is on anywhere, every player who is not in that city gets a big
# banner with a JOIN button. It is driven by the fight's heartbeat (sent every 2 s), not by one single message.
const BANNER_FRESH := 9.0
var banner_layer: CanvasLayer
var banner_box: PanelContainer
var banner_text: Label
var banner_join: Button
var banner_close: Button
var banner_wi := -1
var banner_hide := {}        # world index -> time until which the player dismissed the banner
var banner_seen := {}        # world index -> time the banner last appeared (for the sound)
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
	list[0].make_portal(sky_root,Vector3(0,0,24),"BACK TO BONKERS CITY","Portal home",Color("ffcf6b"))
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
		g._show_toast("Back in Bonkers City.")
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
	# v0.72.1: the Portal Summit. A rock mesa beside the Summit Lookout (same height, joined by a rock bridge),
	# with five gates in a ring of standing stones, crystals, floating rocks and rune circles.
	var rock := StandardMaterial3D.new()
	rock.albedo_color = Color(0.56,0.52,0.47)
	g._real_setup(rock,"concrete",Color(0.66,0.61,0.55),0.1)
	rock.roughness = 0.95
	var rock_d := StandardMaterial3D.new()
	rock_d.albedo_color = Color(0.4,0.37,0.36)
	g._real_setup(rock_d,"concrete",Color(0.46,0.43,0.42),0.14)
	rock_d.roughness = 0.95
	var moss := StandardMaterial3D.new()
	moss.albedo_color = Color(0.36,0.48,0.3)
	moss.roughness = 1.0
	var boulder := SphereMesh.new()
	boulder.radius = 1.0
	boulder.height = 2.0
	boulder.radial_segments = 7
	boulder.rings = 4
	var top := hub_pos.y
	var base := Vector3(hub_pos.x,0,hub_pos.z)
	var rng := RandomNumberGenerator.new()
	rng.seed = 7210
	# The mesa: solid from the ground to the top, sixteen-sided, and a rock bridge to the lookout.
	var mesa_m := CylinderMesh.new()
	mesa_m.top_radius = MESA_R
	mesa_m.bottom_radius = MESA_R+1.6
	mesa_m.height = top
	mesa_m.radial_segments = 18
	mesa_m.rings = 1
	var mesa: MeshInstance3D = g._fc_part(hub_root,mesa_m,base+Vector3(0,top*0.5,0),rock)
	var mesa_body := StaticBody3D.new()
	var mesa_cs := CollisionShape3D.new()
	var mesa_sh := CylinderShape3D.new()
	mesa_sh.radius = MESA_R
	mesa_sh.height = top
	mesa_cs.shape = mesa_sh
	mesa_body.add_child(mesa_cs)
	mesa.add_child(mesa_body)
	var bridge: MeshInstance3D = g._hm(hub_root,Vector3(hub_pos.x,top*0.5,-11.6),Vector3(9.0,top,3.2),Color.WHITE,true)
	bridge.material_override = rock
	g._fc_part(hub_root,g._bcone(MESA_R-0.9,MESA_R-0.9,0.08),hub_pos+Vector3(0,0.02,0),rock_d)
	# Boulders heaped round the foot and along the rim, so it reads as a crag, not a box.
	for k in 46:
		var a := float(k)*TAU/46.0+rng.randf_range(-0.05,0.05)
		var rr := rng.randf_range(MESA_R+0.6,MESA_R+4.0)
		var sc := Vector3(rng.randf_range(2.2,4.6),rng.randf_range(1.6,4.2),rng.randf_range(2.2,4.6))
		var bp := base+Vector3(cos(a)*rr,rng.randf_range(0.3,top*0.75),sin(a)*rr)
		if bp.z > -13.0 and absf(bp.x-hub_pos.x) < 16.0:
			bp.y = minf(bp.y,1.2)
			if bp.z > -10.0:
				continue
		var b: MeshInstance3D = g._fc_part(hub_root,boulder,bp,rock if k % 3 != 0 else rock_d,sc)
		b.rotation = Vector3(rng.randf()*TAU,rng.randf()*TAU,rng.randf()*TAU)
	for k in 26:
		var a2 := float(k)*TAU/26.0+0.12
		if sin(a2) > 0.55 and absf(cos(a2)) < 0.5:
			continue
		var bp2 := hub_pos+Vector3(cos(a2)*(MESA_R-0.4),0.2,sin(a2)*(MESA_R-0.4))
		var s2 := rng.randf_range(0.8,1.7)
		var b2: MeshInstance3D = g._fc_part(hub_root,boulder,bp2,rock_d if k % 2 == 0 else rock,Vector3(s2*1.3,s2,s2*1.2))
		b2.rotation.y = rng.randf()*TAU
		if k % 3 == 0:
			g._fc_part(hub_root,boulder,bp2+Vector3(0,s2*0.75,0),moss,Vector3(s2*0.9,0.25,s2*0.8))
	# Crystal clusters on the rim.
	var crys := [Color("b48cff"),Color("7fe8ff"),Color("ff9ae0")]
	for k in 9:
		var a3 := deg_to_rad(165.0+210.0*float(k)/8.0)+0.19
		var cp := hub_pos+Vector3(cos(a3)*(MESA_R-1.6),0,sin(a3)*(MESA_R-1.6))
		for m in 3:
			var h := rng.randf_range(1.4,3.4)
			var c: MeshInstance3D = g._fc_part(hub_root,g._bcone(0.02,0.32,h),cp+Vector3(rng.randf_range(-0.6,0.6),h*0.45,rng.randf_range(-0.6,0.6)),g._fc_glow(crys[(k+m) % 3]))
			c.rotation = Vector3(rng.randf_range(-0.35,0.35),0,rng.randf_range(-0.35,0.35))
	# Rune circles on the floor: two rings turning against each other.
	g._fc_part(hub_root,g._fc_torus(MESA_R-2.2,MESA_R-2.0),hub_pos+Vector3(0,0.1,0),g._fc_glow(HUB_COL))
	for r in 2:
		var ring := Node3D.new()
		ring.position = hub_pos+Vector3(0,0.1,0)
		hub_root.add_child(ring)
		var rad := 5.6+3.6*float(r)
		g._fc_part(ring,g._fc_torus(rad,rad+0.14),Vector3.ZERO,g._fc_glow(Color("ffd98a") if r == 0 else SKY_COL))
		for m in 12:
			var a4 := float(m)*TAU/12.0
			var mark: MeshInstance3D = g._fc_part(ring,g._bbox(),Vector3(cos(a4)*(rad+0.6),0,sin(a4)*(rad+0.6)),g._fc_glow(Color("fff1c0") if r == 0 else Color("d9c2ff")),Vector3(0.9,0.04,0.16))
			mark.rotation.y = -a4+(0.6 if m % 2 == 0 else -0.6)
		var rtw: Tween = g.create_tween()
		rtw.set_loops()
		rtw.tween_property(ring,"rotation:y",TAU if r == 0 else -TAU,40.0+20.0*float(r)).from(0.0)
	# Rocks floating round the summit, each with a shard of crystal.
	var orbit := Node3D.new()
	orbit.position = hub_pos+Vector3(0,9.0,0)
	hub_root.add_child(orbit)
	for k in 8:
		var a5 := float(k)*TAU/8.0
		var fp := Vector3(cos(a5)*(MESA_R+4.0),sin(a5*2.0)*2.5,sin(a5)*(MESA_R+4.0))
		var fs := rng.randf_range(1.0,2.0)
		var fr: MeshInstance3D = g._fc_part(orbit,boulder,fp,rock_d,Vector3(fs*1.3,fs*0.8,fs))
		fr.rotation.y = a5
		g._fc_part(orbit,g._bcone(0.02,0.22,1.3),fp+Vector3(0,fs*0.8+0.5,0),g._fc_glow(crys[k % 3]))
	var otw: Tween = g.create_tween()
	otw.set_loops()
	otw.tween_property(orbit,"rotation:y",TAU,90.0).from(0.0)
	# Motes of light drifting up.
	var motes := CPUParticles3D.new()
	motes.position = hub_pos+Vector3(0,0.3,0)
	motes.amount = 26
	motes.lifetime = 6.0
	motes.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX
	motes.emission_box_extents = Vector3(14,0.2,14)
	motes.direction = Vector3(0,1,0)
	motes.spread = 12.0
	motes.gravity = Vector3.ZERO
	motes.initial_velocity_min = 0.6
	motes.initial_velocity_max = 1.4
	var mm := SphereMesh.new()
	mm.radius = 0.07
	mm.height = 0.14
	mm.radial_segments = 4
	mm.rings = 2
	mm.material = g._fc_glow(Color("e6d4ff"))
	motes.mesh = mm
	motes.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	motes.visibility_range_end = 120.0
	hub_root.add_child(motes)
	var glow := OmniLight3D.new()
	glow.light_color = SKY_COL
	glow.light_energy = 1.3
	glow.omni_range = 24.0
	glow.shadow_enabled = false
	glow.position = hub_pos+Vector3(0,4.0,0)
	hub_root.add_child(glow)
	# The altar in the middle.
	var altar: MeshInstance3D = g._fc_part(hub_root,boulder,hub_pos+Vector3(0,0.5,0),rock_d,Vector3(1.8,1.0,1.8))
	altar.rotation.y = 0.6
	g._fc_part(hub_root,g._bsph(0.9),hub_pos+Vector3(0,2.3,0),g._fc_glow(Color("f4ecff")))
	g._fc_part(hub_root,g._fc_torus(1.3,1.42),hub_pos+Vector3(0,2.3,0),g._fc_glow(SKY_COL)).rotation.x = 0.5
	g._collider(hub_root,hub_pos+Vector3(0,1.0,0),Vector3(2.4,2.0,2.4))
	p.label(hub_root,"PORTAL SUMMIT",hub_pos+Vector3(0,13.5,0),Color("e9f3ff"),96).visibility_range_end = 400.0
	p.label(hub_root,"Walk through a gate to travel",hub_pos+Vector3(0,4.6,0),Color.WHITE,40)
	# v0.75: three role stones. Stand at one and tap to become that role.
	for ri in ROLES.size():
		var rd: Dictionary = ROLES[ri]
		var rp: Vector3 = hub_pos+(rd["at"] as Vector3)
		var rs: MeshInstance3D = g._fc_part(hub_root,boulder,rp+Vector3(0,0.55,0),rock_d,Vector3(1.3,0.8,1.3))
		rs.rotation.y = float(ri)*1.3
		var rc: MeshInstance3D = g._fc_part(hub_root,g._bcone(0.02,0.42,1.7),rp+Vector3(0,2.0,0),g._fc_glow(rd["col"]))
		rc.rotation.z = 0.12
		g._fc_part(hub_root,g._fc_torus(1.7,1.85),rp+Vector3(0,0.1,0),g._fc_glow(rd["col"]))
		p.label(hub_root,String(rd["n"]),rp+Vector3(0,3.9,0),(rd["col"] as Color).lightened(0.3),56)
		p.label(hub_root,String(rd["sub"]),rp+Vector3(0,3.2,0),Color.WHITE,26)
	var n := list.size()+1
	for k in n:
		var ang := deg_to_rad(190.0+160.0*float(k)/float(n-1))
		var gp := hub_pos+Vector3(cos(ang),0,sin(ang))*GATE_R
		var gate: Node3D
		if k < list.size():
			var d: Dictionary = list[k].W
			gate = p.make_portal(hub_root,gp,String(d["title"]),String(d["sub"]),d["col"])
		else:
			gate = p.make_portal(hub_root,gp,"MYSTIC SKY","4 relics open it",SKY_COL)
		gate.rotation.y = atan2(hub_pos.x-gp.x,hub_pos.z-gp.z)
		gates.append([gp,k])
		# A standing stone between every two gates (and one at each end), with a glowing rune.
		var gc: Color = list[k].W["col"] if k < list.size() else SKY_COL
		for e in (2 if k == n-1 else 1):
			var sa := ang+deg_to_rad(-20.0 if e == 0 else 20.0)
			var sh := rng.randf_range(5.4,7.0)
			var out := Vector3(cos(sa),0,sin(sa))
			var sp := hub_pos+out*(GATE_R+1.2)
			var stone: MeshInstance3D = g._hm(hub_root,sp+Vector3(0,sh*0.5-0.2,0),Vector3(1.5,sh,1.1),Color.WHITE,false,-sa+PI*0.5+rng.randf_range(-0.2,0.2))
			stone.material_override = rock_d
			stone.rotation.z = rng.randf_range(-0.09,0.09)
			var cap: MeshInstance3D = g._fc_part(hub_root,boulder,sp+Vector3(0,sh-0.1,0),rock,Vector3(1.05,0.5,0.9))
			cap.rotation.y = rng.randf()*TAU
			var rune: MeshInstance3D = g._fc_part(hub_root,g._fc_torus(0.22,0.3),sp+Vector3(0,sh*0.62,0)-out*0.62,g._fc_glow(gc))
			rune.rotation = Vector3(PI*0.5,-sa+PI*0.5,0)
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

func role_near() -> int:
	# Which role stone you are standing at (-1 = none).
	if g.player == null or g.paused or absf(g.player.position.y-hub_pos.y) > 3.0:
		return -1
	var pp: Vector3 = g.player.position
	for ri in ROLES.size():
		var rp: Vector3 = hub_pos+(ROLES[ri]["at"] as Vector3)
		if Vector2(pp.x-rp.x,pp.z-rp.z).length() < 3.2:
			return ri
	return -1

func role_prompt() -> String:
	var ri := role_near()
	if ri < 0:
		return ""
	return "YOU ARE THE %s" % ROLES[ri]["n"] if ri == role else "BECOME THE %s" % ROLES[ri]["n"]

func set_role(ri: int) -> void:
	role = clampi(ri,0,ROLES.size()-1)
	for w in list:
		w.cu.hp = minf(w.cu.hp,w.cu.mhp())
	if not dry:
		g._show_toast("You are the %s now. %s." % [ROLES[role]["n"],ROLES[role]["sub"]])
		g._play_coin()
		g._save_progress()
	g._refresh_hud()

func near_hub() -> bool:
	# v0.72: no button at the terrace any more; the gates work by walking through them.
	return false

func gate_tick(delta: float) -> void:
	if g.player == null or g.paused or gates.is_empty():
		return
	gate_note = maxf(0.0,gate_note-delta)
	var pp: Vector3 = (g.car if g.driving else g.player).position
	if absf(pp.x-hub_pos.x) > 30.0 or absf(pp.z-hub_pos.z) > 30.0 or absf(pp.y-hub_pos.y) > 4.0:
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
			# already in that city: the boss wakes for you at once
			if a == "start":
				w.cu.net(p)
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

func banner_build() -> void:
	banner_layer = CanvasLayer.new()
	banner_layer.layer = 70
	g.add_child(banner_layer)
	banner_box = PanelContainer.new()
	banner_box.add_theme_stylebox_override("panel",g._panel(Color(0.55,0.08,0.06,0.94),18))
	banner_layer.add_child(banner_box)
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation",14)
	banner_box.add_child(row)
	banner_text = g._label("",21,Color("fff1d0"))
	banner_text.custom_minimum_size = Vector2(470,0)
	banner_text.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	row.add_child(banner_text)
	banner_join = g._button("JOIN",func(): banner_go())
	banner_join.custom_minimum_size = Vector2(150,64)
	banner_join.add_theme_font_size_override("font_size",28)
	banner_join.add_theme_stylebox_override("normal",g._panel(Color("f0bd62"),14))
	banner_join.add_theme_stylebox_override("hover",g._panel(Color("ffd27a"),14))
	banner_join.add_theme_color_override("font_color",Color("3a1208"))
	row.add_child(banner_join)
	banner_close = g._button("X",func(): banner_dismiss())
	banner_close.custom_minimum_size = Vector2(52,64)
	banner_close.add_theme_font_size_override("font_size",22)
	row.add_child(banner_close)

func banner_go() -> void:
	if banner_wi >= 0:
		join_call(banner_wi)

func banner_dismiss() -> void:
	if banner_wi >= 0:
		banner_hide[banner_wi] = Time.get_ticks_msec()/1000.0+90.0

func banner_world() -> int:
	# The city with a boss fight going on right now that you are not in (-1 = none).
	var now := Time.get_ticks_msec()/1000.0
	for wi in calls:
		var c: Array = calls[wi]
		if not bool(c[2]) or now-float(c[0]) > BANNER_FRESH or now < float(banner_hide.get(wi,0.0)):
			continue
		if g.player != null and list[int(wi)].in_paris(g.player.position):
			continue
		return int(wi)
	return -1

func banner_tick() -> void:
	var wi := banner_world()
	var cur = current()
	var show: bool = wi >= 0 and not g.paused and not busy() and not (g.explore != null and bool(g.explore.on)) and not (cur != null and bool(cur.cu.b_on))
	if not show:
		if banner_layer != null and banner_layer.visible:
			banner_layer.visible = false
		return
	if banner_layer == null:
		banner_build()
	banner_layer.visible = true
	banner_wi = wi
	var w = list[wi]
	var np := players_in(wi)
	banner_text.text = "JOIN THE FIGHT NOW!\n%s vs %s in %s  ·  %d of %d players" % [String(calls[wi][1]),w.cu.boss_name(),String(w.W["name"]).to_upper(),np,w.cu.BOSS_NEED]
	var vs: Vector2 = g.get_viewport().get_visible_rect().size
	banner_box.reset_size()
	banner_box.position = Vector2(vs.x*0.5-banner_box.size.x*0.5,132.0)
	var pulse := 0.5+0.5*sin(Time.get_ticks_msec()/1000.0*6.0)
	banner_join.modulate = Color(1,1,1).lerp(Color(1.0,0.85,0.6),pulse)
	var now := Time.get_ticks_msec()/1000.0
	if now-float(banner_seen.get(wi,-999.0)) > 30.0 and not dry:
		g._play_coin()
		g._show_toast("JOIN THE FIGHT NOW! Boss fight in %s: tap JOIN at the top of the screen." % String(w.W["name"]).to_upper())
	banner_seen[wi] = now

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

func cast_pose(person: Dictionary, delta: float) -> void:
	var w = current()
	if w != null:
		w.cu.cast_pose(person,delta)

func live_line() -> String:
	# For the Harbor Live news screen and the world picker.
	var now := Time.get_ticks_msec()/1000.0
	for wi in calls:
		if now-float(calls[wi][0]) < 45.0 and bool(calls[wi][2]):
			return "JOIN THE FIGHT NOW: boss in %s. Go to the Portal Summit!" % String(list[int(wi)].W["name"]).to_upper()
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
	return role_prompt()

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
	if role_near() >= 0:
		set_role(role_near())
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
	g._show_toast("The Portal Summit. Walk through a gate: Paris, Tokyo, New York, Bangkok or the Mystic Sky.")
	g._refresh_hud()

func tick(delta: float) -> void:
	for w in list:
		w.tick(delta)
	gate_tick(delta)
	banner_tick()
	if sky_built and g.player != null and absf(g.player.position.x-SKY.x) < 80.0 and absf(g.player.position.z-SKY.z) < 80.0 and g.player.position.y < SKY.y-30.0:
		list[0].move_player(SKY+Vector3(0,0.9,16))
	var spr := sky_prompt()
	if spr != last_sky:
		last_sky = spr
		g._refresh_hud()
	var nh := role_near() >= 0
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
	g._feed_add("All four cities sealed. Bonkers City is safe!","")
	g._save_progress()

func save_state(file: ConfigFile) -> void:
	for w in list:
		w.save_state(file)
	file.set_value("sky","shrine",shrine_done)
	file.set_value("sky","day",shrine_day)
	file.set_value("sky","seal_bonus",seal_bonus)
	file.set_value("sky","role",role)
	if g.ultimate != null:
		g.ultimate.save_state(file)

func load_state(file: ConfigFile) -> void:
	for w in list:
		w.load_state(file)
	shrine_done = bool(file.get_value("sky","shrine",false))
	shrine_day = String(file.get_value("sky","day",""))
	seal_bonus = bool(file.get_value("sky","seal_bonus",false))
	role = clampi(int(file.get_value("sky","role",0)),0,ROLES.size()-1)
	if g.ultimate != null:
		g.ultimate.load_state(file)

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

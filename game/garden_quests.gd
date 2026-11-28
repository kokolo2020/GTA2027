extends RefCounted
# v0.72: Fruit Garden quests. 16 harvest quests in a chain (one per fruit, then Fruit Salad, Speed Harvest and the
# Golden Fruit hunt), a fruit collection, and one daily harvest after the chain is finished. Glowing fruit stand in
# the orchards of garden.gd; walk (or drive) through them to pick. Talks to main through `g`.

const BLOCKS := {
	"mango":[-102.0,-77.0,110.0,176.0],"coconut":[-102.0,-77.0,176.0,242.0],"orange":[-77.0,-52.0,110.0,176.0],
	"banana":[-77.0,-52.0,176.0,242.0],"strawberry":[-52.0,-17.0,110.0,170.0],"lemon":[-52.0,-17.0,170.0,206.0],
	"peach":[-52.0,-17.0,206.0,242.0],"apple":[17.0,53.0,110.0,170.0],"pineapple":[17.0,53.0,170.0,242.0],
	"dragon":[53.0,77.0,110.0,176.0],"papaya":[53.0,77.0,176.0,242.0],"grapes":[77.0,102.0,110.0,176.0],
	"watermelon":[77.0,102.0,176.0,242.0],
}
const COLS := {
	"mango":Color("f2a33a"),"coconut":Color("b98a55"),"orange":Color("f08a1e"),"banana":Color("f2d433"),
	"strawberry":Color("e6283a"),"lemon":Color("f4e040"),"peach":Color("f6a07a"),"apple":Color("e0352c"),
	"pineapple":Color("e8b83a"),"dragon":Color("e0307a"),"papaya":Color("f0922a"),"grapes":Color("8a4ac2"),
	"watermelon":Color("4fb85a"),"gold":Color("ffd84a"),
}
const NAMES := {
	"mango":"mangoes","coconut":"coconuts","orange":"oranges","banana":"bananas","strawberry":"strawberries",
	"lemon":"lemons","peach":"peaches","apple":"apples","pineapple":"pineapples","dragon":"dragon fruit",
	"papaya":"papayas","grapes":"bunches of grapes","watermelon":"watermelons","gold":"golden fruit",
}
const QUESTS := [
	{"k":"pick","f":"mango","need":4,"pay":400,"xp":40},
	{"k":"pick","f":"orange","need":4,"pay":450,"xp":45},
	{"k":"pick","f":"strawberry","need":5,"pay":500,"xp":50},
	{"k":"pick","f":"apple","need":5,"pay":550,"xp":55},
	{"k":"pick","f":"lemon","need":5,"pay":600,"xp":60},
	{"k":"pick","f":"banana","need":6,"pay":700,"xp":70},
	{"k":"pick","f":"coconut","need":6,"pay":800,"xp":80},
	{"k":"pick","f":"peach","need":6,"pay":900,"xp":90},
	{"k":"pick","f":"pineapple","need":6,"pay":1000,"xp":100},
	{"k":"pick","f":"dragon","need":7,"pay":1200,"xp":110},
	{"k":"pick","f":"papaya","need":7,"pay":1400,"xp":120},
	{"k":"pick","f":"grapes","need":8,"pay":1600,"xp":130},
	{"k":"pick","f":"watermelon","need":8,"pay":1800,"xp":140},
	{"k":"salad","f":"","need":13,"pay":3000,"xp":250,"n":"FRUIT SALAD: pick one of every fruit"},
	{"k":"speed","f":"","need":12,"pay":4000,"xp":300,"n":"SPEED HARVEST: 12 fruit in 90 seconds","time":90.0},
	{"k":"gold","f":"gold","need":5,"pay":6000,"xp":400,"n":"GOLDEN FRUIT HUNT: find the 5 golden fruit"},
]
const ALL_PAY := 20000
const ALL_XP := 1000
const DAILY_PAY := 1500
const DAILY_XP := 150
const DAILY_NEED := 8

var g
var dry := false
var idx := 0                 # next quest in the chain (QUESTS.size() = chain finished)
var prog := 0
var got := {}                # fruit -> how many picked for ever (the collection)
var all_paid := false
var daily_day := ""          # day the daily harvest was paid
var daily_prog_day := ""
var picks: Array = []        # [{"node": Node3D, "pos": Vector3, "f": String}]
var spawned_for := -2        # quest index the pickups on the ground belong to (-1 = daily)
var root: Node3D
var layer: CanvasLayer
var chip: Label
var arrow: Label
var info: Label
var beam_mat: StandardMaterial3D
var time_left := 0.0
var timing := false
var acc := 0.0
var clk := 0.0
var was_in := false

func _init(main) -> void:
	g = main

func in_garden(p: Vector3) -> bool:
	return absf(p.x) < 106.0 and p.z > 104.0 and p.z < 246.0 and p.y < 30.0

func today() -> String:
	return Time.get_date_string_from_system()

func chain_done() -> bool:
	return idx >= QUESTS.size()

func current() -> Dictionary:
	# The quest to do right now; empty when the chain is finished and today's harvest is paid.
	if not chain_done():
		return QUESTS[idx]
	if daily_day == today():
		return {}
	var names: Array = BLOCKS.keys()
	var f: String = names[hash(today()) % names.size()]
	return {"k":"pick","f":f,"need":DAILY_NEED,"pay":DAILY_PAY,"xp":DAILY_XP,"daily":true}

func title(q: Dictionary) -> String:
	if q.is_empty():
		return "FRUIT GARDEN: all quests done. A new harvest comes tomorrow."
	var head := "DAILY HARVEST" if bool(q.get("daily",false)) else "FRUIT QUEST %d/%d" % [idx+1,QUESTS.size()]
	var t := "%s: %s  (%d/%d)" % [head,qname(q),prog,int(q["need"])]
	if String(q["k"]) == "speed":
		t += "  ·  %ds" % int(ceil(time_left)) if timing else "  ·  timer starts on your first fruit"
	return t

func qname(q: Dictionary) -> String:
	if q.has("n"):
		return String(q["n"])
	return "Pick %d %s" % [int(q["need"]),String(NAMES[q["f"]])]

func kinds_found() -> int:
	var n := 0
	for f in BLOCKS:
		if int(got.get(f,0)) > 0:
			n += 1
	return n

# ---------- fruit on the ground ----------
var open_cache := {}

func spot_in(f: String, rng: RandomNumberGenerator) -> Vector3:
	# Every open spot of this orchard (clear of the shops, roads and paths), worked out once.
	if not open_cache.has(f):
		var b: Array = BLOCKS[f]
		var wide: Array = []
		var tight: Array = []
		var z := float(b[2])+1.5
		while z < float(b[3])-1.0:
			var x := float(b[0])+1.5
			while x < float(b[1])-1.0:
				if g.garden != null and g.garden._ok(x,z,2.5):
					wide.append(Vector3(x,0.0,z))
				elif g.garden != null and g.garden._ok(x,z,1.0):
					tight.append(Vector3(x,0.0,z))
				x += 1.5
			z += 1.5
		open_cache[f] = wide if wide.size() >= 12 else wide+tight
	var list: Array = open_cache[f]
	if list.is_empty():
		var bb: Array = BLOCKS[f]
		return Vector3((float(bb[0])+float(bb[1]))*0.5,0.0,(float(bb[2])+float(bb[3]))*0.5)
	return list[rng.randi_range(0,list.size()-1)]

func clear_picks() -> void:
	for p in picks:
		if is_instance_valid(p["node"]):
			(p["node"] as Node3D).queue_free()
	picks.clear()

func add_pick(f: String, pos: Vector3, shown: String) -> void:
	if root == null:
		root = Node3D.new()
		root.name = "GardenQuests"
		g.add_child(root)
		beam_mat = StandardMaterial3D.new()
		beam_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		beam_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		beam_mat.albedo_color = Color(1.0,0.92,0.5,0.28)
	var n := Node3D.new()
	n.position = pos
	root.add_child(n)
	var col: Color = COLS[shown]
	var ball: MeshInstance3D = g._fc_part(n,g._bsph(0.5),Vector3(0,1.5,0),g._fc_glow(col))
	g._fc_part(n,g._bsph(0.16),Vector3(0.12,2.0,0),g._fc_glow(Color("5fbf4a")))
	var cm := CylinderMesh.new()
	cm.top_radius = 0.12
	cm.bottom_radius = 0.12
	cm.height = 22.0
	cm.radial_segments = 6
	var beam: MeshInstance3D = g._fc_part(n,cm,Vector3(0,13.0,0),beam_mat)
	beam.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	g._fc_part(n,g._fc_torus(0.9,1.05),Vector3(0,0.08,0),g._fc_glow(col))
	if not dry:
		var tw: Tween = n.create_tween()
		tw.set_loops()
		tw.tween_property(ball,"position:y",1.9,0.7).from(1.4).set_trans(Tween.TRANS_SINE)
		tw.tween_property(ball,"position:y",1.4,0.7).set_trans(Tween.TRANS_SINE)
	picks.append({"node":n,"pos":pos,"f":f})

func spawn(q: Dictionary) -> void:
	clear_picks()
	spawned_for = -1 if bool(q.get("daily",false)) else idx
	if q.is_empty():
		spawned_for = -3
		return
	var rng := RandomNumberGenerator.new()
	rng.seed = hash("gq-%d-%d-%s" % [spawned_for,prog,today() if spawned_for == -1 else ""])
	var left: int = int(q["need"])-prog
	var names: Array = BLOCKS.keys()
	match String(q["k"]):
		"pick":
			for i in left:
				add_pick(String(q["f"]),spot_in(String(q["f"]),rng),String(q["f"]))
		"salad":
			for f in names:
				if not salad_has.has(f):
					add_pick(String(f),spot_in(String(f),rng),String(f))
		"speed":
			for i in left:
				var f2: String = ["apple","pineapple","dragon","papaya"][i % 4]
				add_pick(f2,spot_in(f2,rng),f2)
		"gold":
			var order: Array = names.duplicate()
			for i in order.size():
				var j := rng.randi_range(i,order.size()-1)
				var t = order[i]
				order[i] = order[j]
				order[j] = t
			for i in left:
				add_pick(String(order[i]),spot_in(String(order[i]),rng),"gold")

var salad_has := {}

# ---------- picking and rewards ----------
func pay(amount: int, xp: int, text: String) -> void:
	g.cash += amount
	if not g.legacy_rules:
		g.bonus_xp += xp
	if not dry:
		g._show_toast("%s  +$%d  +%d XP" % [text,amount,xp])
		g._feed_add("Fruit Garden: %s (+$%d)" % [text,amount],"")
		g._play_coin()
		g._quick_fx(g.player.position+Vector3(0,1,0))

func pick(i: int) -> void:
	var q := current()
	if q.is_empty() or i < 0 or i >= picks.size():
		return
	var p: Dictionary = picks[i]
	var f := String(p["f"])
	if is_instance_valid(p["node"]):
		(p["node"] as Node3D).queue_free()
	picks.remove_at(i)
	got[f] = int(got.get(f,0))+1
	prog += 1
	if g.daily != null:
		g.daily.bump("fruit")
	if String(q["k"]) == "salad":
		salad_has[f] = true
	if String(q["k"]) == "speed" and not timing:
		timing = true
		time_left = float(q["time"])
	if not dry:
		g._play_coin()
	if prog >= int(q["need"]):
		finish(q)
	refresh()

func finish(q: Dictionary) -> void:
	prog = 0
	timing = false
	salad_has.clear()
	var name_txt := qname(q)
	if bool(q.get("daily",false)):
		daily_day = today()
		pay(int(q["pay"]),int(q["xp"]),"DAILY HARVEST DONE")
	else:
		idx += 1
		pay(int(q["pay"]),int(q["xp"]),"FRUIT QUEST %d/%d DONE: %s" % [idx,QUESTS.size(),name_txt.split(":")[0]])
		if chain_done() and not all_paid:
			all_paid = true
			pay(ALL_PAY,ALL_XP,"ALL %d FRUIT QUESTS DONE! You are the Master Gardener." % QUESTS.size())
	spawn(current())
	if not dry:
		g._save_progress()

func fail_speed() -> void:
	timing = false
	prog = 0
	if not dry:
		g._show_toast("Time's up! The fruit grew back. Try the Speed Harvest again.")
	spawn(current())
	refresh()

# ---------- HUD ----------
func build_hud() -> void:
	layer = CanvasLayer.new()
	layer.layer = 54
	g.add_child(layer)
	chip = Label.new()
	chip.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	chip.size = Vector2(900,34)
	chip.add_theme_font_size_override("font_size",21)
	chip.add_theme_color_override("font_color",Color("fff1b0"))
	chip.add_theme_color_override("font_outline_color",Color("16300f"))
	chip.add_theme_constant_override("outline_size",8)
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(chip)
	arrow = Label.new()
	arrow.text = "▲"
	arrow.add_theme_font_size_override("font_size",64)
	arrow.add_theme_color_override("font_color",Color("ffd24f"))
	arrow.add_theme_color_override("font_outline_color",Color(0,0,0))
	arrow.add_theme_constant_override("outline_size",12)
	arrow.size = Vector2(90,90)
	arrow.pivot_offset = Vector2(45,45)
	arrow.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	arrow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(arrow)
	info = Label.new()
	info.size = Vector2(300,40)
	info.add_theme_font_size_override("font_size",20)
	info.add_theme_color_override("font_color",Color("fff2c0"))
	info.add_theme_color_override("font_outline_color",Color(0,0,0))
	info.add_theme_constant_override("outline_size",8)
	info.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(info)

func refresh() -> void:
	if chip == null:
		return
	chip.text = title(current())+"   ·   collection %d/13" % kinds_found()

func tick(delta: float) -> void:
	if g.player == null:
		return
	var body: Node3D = g.car if g.driving else g.player
	var p: Vector3 = body.position
	var here: bool = in_garden(p) and not g.paused and not (g.explore != null and bool(g.explore.on))
	if not here:
		if layer != null and layer.visible:
			layer.visible = false
		if was_in and not in_garden(p):
			was_in = false
			if timing:
				fail_speed()
		return
	if layer == null:
		build_hud()
	layer.visible = true
	var q := current()
	var want := -3 if q.is_empty() else (-1 if bool(q.get("daily",false)) else idx)
	if spawned_for != want:
		spawn(q)
		refresh()
	if not was_in:
		was_in = true
		refresh()
		if not dry and not q.is_empty():
			g._show_toast("FRUIT GARDEN quests: follow the arrow to the glowing fruit and walk through them.")
	clk += delta
	if timing:
		time_left -= delta
		if time_left <= 0.0:
			fail_speed()
	acc += delta
	if acc > 0.4:
		acc = 0.0
		refresh()
		var vs: Vector2 = g.get_viewport().get_visible_rect().size
		chip.position = Vector2(vs.x*0.5-450.0,218.0)
		arrow.position = Vector2(vs.x*0.5-45.0,250.0)
		info.position = Vector2(vs.x*0.5+44.0,276.0)
	var best := -1
	var bd := 1e9
	var reach := 3.2 if g.driving else 2.2
	for i in picks.size():
		var d := Vector2(p.x-(picks[i]["pos"] as Vector3).x,p.z-(picks[i]["pos"] as Vector3).z).length()
		if d < bd:
			bd = d
			best = i
	if best >= 0 and bd < reach:
		pick(best)
		return
	arrow.visible = best >= 0 and bd > 5.0
	info.visible = best >= 0
	if best < 0:
		return
	var tp: Vector3 = picks[best]["pos"]
	var cam: Camera3D = g.camera
	var fwd := -cam.global_transform.basis.z
	fwd.y = 0.0
	var dir := tp-p
	dir.y = 0.0
	if fwd.length() > 0.01 and dir.length() > 0.1:
		arrow.rotation = -fwd.normalized().signed_angle_to(dir.normalized(),Vector3.UP)
	arrow.scale = Vector2.ONE*(1.0+0.08*sin(clk*6.0))
	info.text = "%d m" % int(bd)

# ---------- save ----------
func save_state(file: ConfigFile) -> void:
	file.set_value("garden_q","idx",idx)
	file.set_value("garden_q","prog",prog)
	file.set_value("garden_q","got",got)
	file.set_value("garden_q","all",all_paid)
	file.set_value("garden_q","daily",daily_day)
	file.set_value("garden_q","salad",salad_has.keys())

func load_state(file: ConfigFile) -> void:
	idx = clampi(int(file.get_value("garden_q","idx",0)),0,QUESTS.size())
	prog = maxi(0,int(file.get_value("garden_q","prog",0)))
	var gt = file.get_value("garden_q","got",{})
	got = gt if gt is Dictionary else {}
	all_paid = bool(file.get_value("garden_q","all",false))
	daily_day = String(file.get_value("garden_q","daily",""))
	salad_has.clear()
	var sh = file.get_value("garden_q","salad",[])
	if sh is Array:
		for f in sh:
			if BLOCKS.has(f):
				salad_has[f] = true
	var q := current()
	if q.is_empty() or String(q["k"]) == "speed":
		prog = 0
	elif String(q["k"]) == "salad":
		prog = salad_has.size()
	else:
		prog = mini(prog,int(q["need"])-1)
	spawned_for = -2

func selftest() -> String:
	# Plays the whole chain by picking every fruit where it stands. Used by the smoke test (dry).
	var cash0: int = g.cash
	var bad := 0
	var guard := 0
	while not chain_done() and guard < 400:
		guard += 1
		var q := current()
		if spawned_for != idx:
			spawn(q)
		if picks.is_empty():
			bad += 1
			break
		if prog == 0:
			for p in picks:
				if not g.garden._ok((p["pos"] as Vector3).x,(p["pos"] as Vector3).z,1.0):
					bad += 1
					print("GQ bad spot ",p["f"]," ",p["pos"])
		pick(0)
	var dq := current()
	spawn(dq)
	var dn := picks.size()
	while not current().is_empty() and guard < 500:
		guard += 1
		pick(0)
	return "chain=%d/%d bad=%d gain=%d kinds=%d daily_spawn=%d daily_paid=%s" % [idx,QUESTS.size(),bad,g.cash-cash0,kinds_found(),dn,str(daily_day == today())]

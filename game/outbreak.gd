extends RefCounted
# v0.63: Outbreak rescue mission, one per world (owned by paris.gd as `ob`).
# Start at the OUTBREAK POST beside the portal. Find 3 survivors (each tells you one step of the valve order),
# then turn the 3 colour valves in that order before the infection spreads. Cartoon zombies stand around; they never chase.
const TIME := 240.0
const PENALTY := 20.0
const DAY_PAY := 4000
const DAY_XP := 400
const FIRST_PAY := 15000
const COLS := [Color("ff4a4a"),Color("4aa0ff"),Color("4aff7a")]
const NAMES := ["RED","BLUE","GREEN"]
const ORD := ["first","second","third"]

var w                      # the Paris world instance
var g                      # main
var active := false
var left := 0.0
var order: Array = []      # valve indices in the right order
var known := 0             # survivors rescued = steps of the order you know
var progress := 0          # valves turned correctly so far
var surv: Array = []       # [Node3D, Vector3 world pos, bool saved]
var valves: Array = []     # [Node3D, Vector3 world pos, Label3D]
var mists: Array = []      # [MeshInstance3D, Vector3 local centre]
var props: Node3D
var layer: CanvasLayer
var hud: Label
var post_pos := Vector3.ZERO
var post_label: Label3D
var sealed := false
var day := ""
var result := ""
var t_acc := 0.0

func _init(world) -> void:
	w = world
	g = world.g

func build_post() -> void:
	var rp: Vector2 = w.RET
	var b := Vector3(rp.x-5.0,0,rp.y)
	post_pos = w.C+b
	g._hm(w.root,b+Vector3(0,0.5,0),Vector3(2.4,1.0,1.0),Color("39452f"),true)
	g._hm(w.root,b+Vector3(0,1.55,0),Vector3(2.6,1.1,0.12),Color("1f3a1f"))
	g._hm(w.root,b+Vector3(0,1.0,0.52),Vector3(2.4,0.18,0.06),Color("f2d13a"))
	post_label = w.label(w.root,"OUTBREAK POST",b+Vector3(0,3.0,0),Color("9dff7a"),48)
	refresh_post()

func refresh_post() -> void:
	if post_label != null:
		post_label.text = "OUTBREAK POST  ·  SEALED" if sealed else "OUTBREAK POST"

func prompt(p: Vector3) -> String:
	if not w.built:
		return ""
	if not active:
		if w.near(p,post_pos,3.6):
			return "START RESCUE"
		return ""
	for i in valves.size():
		if w.near(p,valves[i][1],2.6):
			return "TURN %s VALVE" % NAMES[i]
	return ""

func owns(txt: String) -> bool:
	return txt == "START RESCUE" or txt.begins_with("TURN ")

func interact(txt: String) -> void:
	if txt == "START RESCUE":
		start()
		return
	if not active:
		return
	for i in valves.size():
		if txt == "TURN %s VALVE" % NAMES[i]:
			press_valve(i)
			return

func spot(base: Vector2) -> Vector2:
	for k in 30:
		var a := float(k)*0.9
		var cand := base+Vector2(cos(a),sin(a))*float(k)*1.3
		if not w.in_area(cand.x,cand.y,6.0):
			continue
		if w.in_building(cand,2.0):
			continue
		if g._blocked_at(w.C+Vector3(cand.x,0.9,cand.y),0.5):
			continue
		return cand
	return base

func figure(parent: Node3D, pos: Vector3, body: Color, skin: Color, zombie: bool) -> Node3D:
	var n := Node3D.new()
	n.position = pos
	parent.add_child(n)
	g._hm(n,Vector3(0,0.75,0),Vector3(0.7,1.0,0.4),body)
	g._hm(n,Vector3(-0.2,0.2,0),Vector3(0.24,0.4,0.28),Color("2b3442"))
	g._hm(n,Vector3(0.2,0.2,0),Vector3(0.24,0.4,0.28),Color("2b3442"))
	g._fc_part(n,g._bsph(0.3),Vector3(0,1.55,0),g._material(skin))
	if zombie:
		g._hm(n,Vector3(-0.42,1.15,0.4),Vector3(0.16,0.16,0.8),skin)
		g._hm(n,Vector3(0.42,1.15,0.4),Vector3(0.16,0.16,0.8),skin)
	else:
		g._hm(n,Vector3(-0.48,1.5,0),Vector3(0.16,0.8,0.16),skin)
		g._hm(n,Vector3(0.48,1.5,0),Vector3(0.16,0.8,0.16),skin)
	return n

func mist(parent: Node3D, c: Vector3) -> MeshInstance3D:
	var mi := MeshInstance3D.new()
	var sm := SphereMesh.new()
	sm.radius = 1.0
	sm.height = 2.0
	mi.mesh = sm
	var m := StandardMaterial3D.new()
	m.albedo_color = Color(0.35,1.0,0.35,0.15)
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	mi.material_override = m
	mi.position = c
	mi.scale = Vector3(3,2,3)
	parent.add_child(mi)
	return mi

func start() -> void:
	if active:
		return
	active = true
	result = ""
	left = TIME
	known = 0
	progress = 0
	order = [0,1,2]
	order.shuffle()
	surv.clear()
	valves.clear()
	mists.clear()
	props = Node3D.new()
	props.name = "Outbreak"
	w.root.add_child(props)
	for i in 3:
		var cl: Vector2 = w.W["clues"][i]
		var sp := spot(cl+Vector2(5,5))
		var sn := figure(props,Vector3(sp.x,0,sp.y),Color("3b7fd1"),Color("f1c9a0"),false)
		g._fc_part(sn,g._bsph(0.18),Vector3(0,2.3,0),g._fc_glow(Color("7fd0ff")))
		w.label(sn,"HELP!",Vector3(0,2.9,0),Color("bfe6ff"),44)
		var tw: Tween = g.create_tween()
		tw.set_loops()
		tw.tween_property(sn,"position:y",0.25,0.5).from(0.0)
		tw.tween_property(sn,"position:y",0.0,0.5)
		surv.append([sn,w.C+Vector3(sp.x,0,sp.y),false])
		for k in 2:
			var zs := spot(sp+Vector2(-4.0+8.0*float(k),-3.5))
			var zn := figure(props,Vector3(zs.x,0,zs.y),Color("6a7d3a"),Color("8fcf5a"),true)
			zn.rotation.y = float(i*2+k)*1.3
			var zt: Tween = g.create_tween()
			zt.set_loops()
			zt.tween_property(zn,"rotation:z",0.12,0.8).from(-0.12)
			zt.tween_property(zn,"rotation:z",-0.12,0.8)
		mists.append([mist(props,Vector3(sp.x,1.2,sp.y)),sp])
	var rp: Vector2 = w.RET
	var offs := [Vector2(-11,-6),Vector2(-14,0),Vector2(-11,6)]
	for i in 3:
		var vs := spot(Vector2(rp.x,rp.y)+offs[i])
		g._hm(props,Vector3(vs.x,0.7,vs.y),Vector3(0.6,1.4,0.6),(COLS[i] as Color).darkened(0.35),true)
		g._fc_part(props,g._bsph(0.38),Vector3(vs.x,1.65,vs.y),g._fc_glow(COLS[i]))
		var lb: Label3D = w.label(props,"%s VALVE  OFF" % NAMES[i],Vector3(vs.x,2.5,vs.y),COLS[i],38)
		valves.append([null,w.C+Vector3(vs.x,0,vs.y),lb])
	build_hud()
	update_hud()
	if not w.dry:
		g._show_toast("OUTBREAK! Find 3 survivors in %d minutes. Each knows one step of the valve order." % int(TIME/60.0))
		g._play_coin()

func build_hud() -> void:
	layer = CanvasLayer.new()
	layer.layer = 60
	g.add_child(layer)
	hud = Label.new()
	hud.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var vs: Vector2 = g.get_viewport().get_visible_rect().size
	hud.position = Vector2(vs.x*0.5-330.0,86.0)
	hud.size = Vector2(660,110)
	hud.add_theme_font_size_override("font_size",22)
	hud.add_theme_color_override("font_color",Color("d6ffb8"))
	hud.add_theme_color_override("font_outline_color",Color("0b2a0b"))
	hud.add_theme_constant_override("outline_size",8)
	layer.add_child(hud)

func order_text() -> String:
	var parts := PackedStringArray()
	for k in 3:
		parts.append(NAMES[order[k]] if k < known else "?")
	return " > ".join(parts)

func update_hud() -> void:
	if hud == null:
		return
	var t := maxi(0,int(ceil(left)))
	hud.text = "OUTBREAK   %d:%02d\nSurvivors %d/3     Valve order: %s\n%s" % [t/60,t%60,known,order_text(),"Turn the valves in order!" if known == 3 else "Find the survivors (blue, waving)"]

func tick(delta: float) -> void:
	if not active or g.player == null:
		return
	left -= delta
	t_acc += delta
	var p: Vector3 = g.player.position
	if not w.in_paris(p):
		abort("You left the outbreak zone.")
		return
	if left <= 0.0:
		timeout()
		return
	var grow := 1.0-left/TIME
	for m in mists:
		var s := lerpf(3.0,7.0,grow)
		(m[0] as MeshInstance3D).scale = Vector3(s,s*0.6,s)
	for i in surv.size():
		if not bool(surv[i][2]) and w.near(p,surv[i][1],2.8):
			rescue(i)
	if t_acc >= 0.25:
		t_acc = 0.0
		update_hud()

func rescue(i: int) -> void:
	surv[i][2] = true
	(surv[i][0] as Node3D).visible = false
	known += 1
	if not w.dry:
		g._play_coin()
		g._show_toast("SURVIVOR %d/3 SAVED: \"The %s valve goes %s!\"" % [known,NAMES[order[known-1]],ORD[known-1]])
	update_hud()

func press_valve(i: int) -> void:
	if not active:
		return
	if known < 3:
		if not w.dry:
			g._show_toast("Rescue all 3 survivors first. They know the order.")
		return
	if int(order[progress]) == i:
		progress += 1
		(valves[i][2] as Label3D).text = "%s VALVE  ON" % NAMES[i]
		if not w.dry:
			g._play_coin()
			g._show_toast("%s valve ON (%d/3)" % [NAMES[i],progress])
		if progress == 3:
			seal()
	else:
		progress = 0
		left -= PENALTY
		for k in valves.size():
			(valves[k][2] as Label3D).text = "%s VALVE  OFF" % NAMES[k]
		if not w.dry:
			g._show_toast("WRONG ORDER! Valves reset. -%d seconds." % int(PENALTY))
	update_hud()

func seal() -> void:
	result = "sealed"
	cleanup()
	var today := Time.get_date_string_from_system()
	if day != today:
		day = today
		w.pay(DAY_PAY,DAY_XP,"OUTBREAK SEALED")
	var first := not sealed
	sealed = true
	if first:
		g.cash += FIRST_PAY
		if not w.dry:
			g._show_toast("%s SEALED for good! Bonus +$%d" % [String(w.W["name"]).to_upper(),FIRST_PAY])
			g._feed_add("%s outbreak sealed!" % w.W["name"],"")
	elif not w.dry:
		g._show_toast("Zone sealed again. Daily reward is paid once a day.")
	refresh_post()
	g.paris.check_seal_bonus()
	if not w.dry:
		g._save_progress()

func timeout() -> void:
	result = "timeout"
	cleanup()
	if not w.dry:
		g._show_toast("TIME'S UP. The infection spread. The portal pulls you home.")
	w.go_home()

func abort(msg: String) -> void:
	if not active:
		return
	result = "left"
	cleanup()
	if not w.dry and msg != "":
		g._show_toast(msg)

func cleanup() -> void:
	active = false
	if props != null and is_instance_valid(props):
		props.queue_free()
	props = null
	if layer != null and is_instance_valid(layer):
		layer.queue_free()
	layer = null
	hud = null
	surv.clear()
	valves.clear()
	mists.clear()

func save_state(file: ConfigFile, sec: String) -> void:
	file.set_value(sec,"sealed",sealed)
	file.set_value(sec,"ob_day",day)

func load_state(file: ConfigFile, sec: String) -> void:
	sealed = bool(file.get_value(sec,"sealed",false))
	day = String(file.get_value(sec,"ob_day",""))
	refresh_post()

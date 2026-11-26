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
var zomb: Array = []      # [Node3D, Vector2 home local pos]
var hp := 100.0
var hp_bg: ColorRect
var hp_fill: ColorRect
var hp_lbl: Label
var hurt: ColorRect
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
	fig_seq += 1
	var model: Node3D = g._try_model("res://models/person_%d.glb" % (fig_seq % 4))
	if model == null:
		return block_figure(n,body,skin,zombie)
	n.add_child(model)
	var cols := {}
	if zombie:
		cols = {"Skin":Color("7d9468"),"Shirt":Color("4b4034").lerp(body,0.25),"Pants":Color("2c2e33"),"Shoes":Color("24211f"),"Sole":Color("151515"),
			"Belt":Color("1b1b1b"),"EyeWhite":Color("d9dcae"),"Eye":Color("c81818"),"Pupil":Color("300606"),"Mouth":Color("3a0d0d"),"Brow":Color("1d2216")}
	else:
		cols = {"Skin":skin,"Shirt":body,"Pants":Color("2b3442")}
	var mats := {}
	var stack: Array[Node] = [model]
	while stack.size() > 0:
		var nd: Node = stack.pop_back()
		stack.append_array(nd.get_children())
		if nd is MeshInstance3D and (nd as MeshInstance3D).mesh != null:
			var mi := nd as MeshInstance3D
			for sf in mi.mesh.get_surface_count():
				var src := mi.mesh.surface_get_material(sf)
				var key := src.resource_name if src != null else ""
				if not cols.has(key):
					continue
				if not mats.has(key):
					var m := StandardMaterial3D.new()
					m.albedo_color = cols[key]
					m.roughness = 0.85
					if zombie and key == "Eye":
						m.emission_enabled = true
						m.emission = Color("ff2a1a")
						m.emission_energy_multiplier = 1.6
					mats[key] = m
				mi.set_surface_override_material(sf,mats[key])
	var limb := func(nm: String) -> Node3D: return model.find_child(nm,true,false) as Node3D
	var al: Node3D = limb.call("ArmL")
	var ar: Node3D = limb.call("ArmR")
	var fl: Node3D = limb.call("ForeArmL")
	var fr: Node3D = limb.call("ForeArmR")
	var ll: Node3D = limb.call("LegL")
	var lr: Node3D = limb.call("LegR")
	var hd: Node3D = limb.call("Head")
	var bd: Node3D = limb.call("Body")
	if zombie:
		# Shambling pose: lurching forward, head lolling, arms stretched out in front, slow dragging steps.
		model.rotation.x = 0.22
		if hd != null:
			hd.rotation.z = 0.32
			hd.rotation.x = 0.28
		for a: Node3D in [al,ar]:
			if a != null:
				a.rotation.x = -1.45
		if fl != null:
			fl.rotation.x = -0.25
		if fr != null:
			fr.rotation.x = -0.5
		if ll != null and lr != null:
			var t1 := n.create_tween().set_loops()
			t1.tween_property(ll,"rotation:x",0.4,0.7).from(-0.4).set_trans(Tween.TRANS_SINE)
			t1.tween_property(ll,"rotation:x",-0.4,0.7).set_trans(Tween.TRANS_SINE)
			var t2 := n.create_tween().set_loops()
			t2.tween_property(lr,"rotation:x",-0.4,0.7).from(0.4).set_trans(Tween.TRANS_SINE)
			t2.tween_property(lr,"rotation:x",0.4,0.7).set_trans(Tween.TRANS_SINE)
		if hd != null:
			var t3 := n.create_tween().set_loops()
			t3.tween_property(hd,"rotation:z",0.12,1.1).from(0.4).set_trans(Tween.TRANS_SINE)
			t3.tween_property(hd,"rotation:z",0.4,1.1).set_trans(Tween.TRANS_SINE)
		for a2: Node3D in [al,ar]:
			if a2 != null:
				var t4 := n.create_tween().set_loops()
				t4.tween_property(a2,"rotation:x",-1.25,0.9).from(-1.6).set_trans(Tween.TRANS_SINE)
				t4.tween_property(a2,"rotation:x",-1.6,0.9).set_trans(Tween.TRANS_SINE)
	else:
		# Survivor: waving for help.
		if ar != null:
			ar.rotation.z = -2.6
			var t5 := n.create_tween().set_loops()
			t5.tween_property(ar,"rotation:z",-2.2,0.35).from(-2.9)
			t5.tween_property(ar,"rotation:z",-2.9,0.35)
	return n

func block_figure(n: Node3D, body: Color, skin: Color, zombie: bool) -> Node3D:
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
	zomb.clear()
	hp = 100.0
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
			zomb.append([zn,zs])
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

var vig: ColorRect
var fig_seq := 0
var big: Label
var clk := 0.0

func build_hud() -> void:
	layer = CanvasLayer.new()
	layer.layer = 60
	g.add_child(layer)
	hud = Label.new()
	hud.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var vs: Vector2 = g.get_viewport().get_visible_rect().size
	hud.position = Vector2(vs.x*0.5-330.0,160.0)
	hud.size = Vector2(660,110)
	hud.add_theme_font_size_override("font_size",22)
	hud.add_theme_color_override("font_color",Color("d6ffb8"))
	hud.add_theme_color_override("font_outline_color",Color("0b2a0b"))
	hud.add_theme_constant_override("outline_size",8)
	layer.add_child(hud)
	vig = ColorRect.new()
	vig.color = Color(0.1,0.7,0.1,0.0)
	vig.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vig.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.add_child(vig)
	layer.move_child(vig,0)
	big = Label.new()
	big.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	big.position = Vector2(vs.x*0.5-250.0,6.0)
	big.size = Vector2(500,150)
	big.pivot_offset = Vector2(250,60)
	big.add_theme_font_size_override("font_size",120)
	big.add_theme_color_override("font_color",Color("d6ffb8"))
	big.add_theme_color_override("font_outline_color",Color("0b2a0b"))
	big.add_theme_constant_override("outline_size",20)
	big.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(big)
	hurt = ColorRect.new()
	hurt.color = Color(0.9,0.0,0.0,0.0)
	hurt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hurt.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.add_child(hurt)
	hp_bg = ColorRect.new()
	hp_bg.color = Color(0,0,0,0.65)
	hp_bg.position = Vector2(vs.x*0.5-170.0,vs.y-96.0)
	hp_bg.size = Vector2(340,30)
	hp_bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(hp_bg)
	hp_fill = ColorRect.new()
	hp_fill.position = Vector2(4,4)
	hp_fill.size = Vector2(332,22)
	hp_fill.color = Color("43d65a")
	hp_fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hp_bg.add_child(hp_fill)
	hp_lbl = Label.new()
	hp_lbl.text = "HEALTH"
	hp_lbl.position = Vector2(vs.x*0.5-170.0,vs.y-128.0)
	hp_lbl.size = Vector2(340,28)
	hp_lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	hp_lbl.add_theme_font_size_override("font_size",20)
	hp_lbl.add_theme_color_override("font_outline_color",Color(0,0,0))
	hp_lbl.add_theme_constant_override("outline_size",6)
	layer.add_child(hp_lbl)

func order_text() -> String:
	var parts := PackedStringArray()
	for k in 3:
		parts.append(NAMES[order[k]] if k < known else "?")
	return " > ".join(parts)

func update_hud() -> void:
	if hud == null:
		return
	var t := maxi(0,int(ceil(left)))
	if big != null:
		big.text = "%d:%02d" % [t/60,t%60]
		var urgent := left < 60.0
		var col := Color("ff4a3a") if urgent else (Color("ffd86b") if left < 120.0 else Color("d6ffb8"))
		big.add_theme_color_override("font_color",col)
		var beat := 1.0+(0.12*maxf(0.0,sin(clk*TAU*(2.0 if urgent else 1.0))) if left < 120.0 else 0.0)
		big.scale = Vector2(beat,beat)
	hud.text = "OUTBREAK\nSurvivors %d/3     Valve order: %s\n%s" % [known,order_text(),"Turn the valves in order!" if known == 3 else "Find the survivors (blue, waving)"]

func tick(delta: float) -> void:
	if not active or g.player == null:
		return
	left -= delta
	t_acc += delta
	clk += delta
	var p: Vector3 = g.player.position
	if not w.in_paris(p):
		abort("You left the outbreak zone.")
		return
	if left <= 0.0:
		timeout()
		return
	var grow := 1.0-left/TIME
	if vig != null:
		var pulse := 0.5+0.5*sin(clk*(2.0+6.0*grow))
		vig.color.a = 0.04+0.22*grow+(0.10*pulse*grow if left < 80.0 else 0.0)
	for m in mists:
		var s := lerpf(3.0,7.0,grow)
		(m[0] as MeshInstance3D).scale = Vector3(s,s*0.6,s)
	tick_zombies(delta,p)
	if not active:
		return
	for i in surv.size():
		if not bool(surv[i][2]) and w.near(p,surv[i][1],2.8):
			rescue(i)
	t_acc = 0.0
	update_hud()

func tick_zombies(delta: float, p: Vector3) -> void:
	var lp := Vector2(p.x-w.C.x,p.z-w.C.z)
	var bitten := false
	for z in zomb:
		var zn: Node3D = z[0]
		if not is_instance_valid(zn):
			continue
		var zp := Vector2(zn.position.x,zn.position.z)
		var d := zp.distance_to(lp)
		var home: Vector2 = z[1]
		var target := lp if d < 13.0 else home
		var dir := target-zp
		if dir.length() > 0.8:
			var step := dir.normalized()*minf(2.3*delta,dir.length())
			zn.position.x += step.x
			zn.position.z += step.y
			zn.rotation.y = lerp_angle(zn.rotation.y,atan2(dir.x,dir.y),minf(1.0,6.0*delta))
		if d < 1.5:
			bitten = true
	if bitten and not w.dry:
		hp -= 22.0*delta
		if hurt != null:
			hurt.color.a = 0.35
	elif hp > 0.0 and hp < 100.0:
		hp = minf(100.0,hp+3.0*delta)
	if hurt != null and not bitten:
		hurt.color.a = maxf(0.0,hurt.color.a-1.2*delta)
	if hp_fill != null:
		var f := clampf(hp/100.0,0.0,1.0)
		hp_fill.size.x = 332.0*f
		hp_fill.color = Color("43d65a") if f > 0.5 else (Color("e8c23a") if f > 0.25 else Color("e5392e"))
	if hp <= 0.0:
		die()

func die() -> void:
	if not active:
		return
	result = "died"
	cleanup()
	var rp: Vector2 = w.RET
	w.move_player(w.C+Vector3(rp.x-2.5,0.9,rp.y+3.5))
	if not w.dry:
		g._show_toast("The infected got you. You wake up at the portal.")
	g._refresh_hud()

func rescue(i: int) -> void:
	g.daily.bump("rescue")
	hp = minf(100.0,hp+25.0)
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
	g.daily.bump("seal")
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
	vig = null
	big = null
	hurt = null
	hp_bg = null
	hp_fill = null
	hp_lbl = null
	zomb.clear()
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

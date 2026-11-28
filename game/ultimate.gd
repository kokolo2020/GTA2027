extends RefCounted
# v0.77: THE WORLD EATER, the Ultimate boss.
# When all four city bosses are beaten on the same day it invades the Harbor Dome. It needs 11 or more players:
# with 11 or more every shot hits 20 times harder; with fewer it is far too strong to beat.
# It has its own shape (boss_models.gd), its own attacks and its own health bar. Health is shared online (event "bz" with u=1).

const BossModels := preload("res://boss_models.gd")
const UHP := 150000.0
const UTIME := 600.0
const UNEED := 11
const UPOWER := 20.0
const SHOT := 4.0
const BLAST := 100.0
const GUN_CD := 0.38
const RANGE := 85.0
const NEAR := 150.0          # how close to the Dome a player counts as in the fight
const ENGAGE := 95.0         # it wakes up when a player comes this close
const PAY := 250000
const SCALE := 5.5
const HOVER := 9.0
const ATK := ["eruption","rail","shatter","tentacles","eye"]
const ATK_NAMES := {"eruption":"ERUPTION","rail":"VENOM RAIL","shatter":"SHATTER RING","tentacles":"TENTACLE WALL","eye":"VOID EYE"}

var g
var models
var cu                       # helper: the first world's cure.gd (sounds, fireworks, bars)
var invaded := false
var on := false
var hp := UHP
var t := 0.0
var node: Node3D
var light: OmniLight3D
var mets: Array = []         # [ring, ball, Vector3 local, radius]
var atk_i := 0
var pat := ""
var wait := 5.0
var slam := 0.0
var slam_live := false
var phase := 0
var charge := 0.0
var cd := 0.0
var php := 100.0
var won_day := ""
var sync := 0.0
var clk := 0.0
var scan := 0.0
var shake := 0.0
var calm := 0.0              # after it pulls back it rests for a while
var force_players := 0       # tests only
var party_t := 0.0
var party_next := 0.0
var rm: StandardMaterial3D
# HUD
var layer: CanvasLayer
var fire_btn: Button
var blast_btn: Button
var hp_bg: ColorRect
var hp_fill: ColorRect
var boss_bg: ColorRect
var boss_fill: ColorRect
var boss_lbl: Label
var power_lbl: Label
var hint_lbl: Label
var hurt: ColorRect
var title_lbl: Label
var toast: Label
var stick_view: Control
var title_t := 0.0
var simple_on := false
var hidden: Array = []
var hud_acc := 0.0

func _init(main) -> void:
	g = main

func today() -> String:
	return Time.get_date_string_from_system()

func centre() -> Vector3:
	return g.HUB_C

func helper() -> bool:
	if cu != null:
		return true
	if g.paris != null and g.paris.list.size() > 0:
		cu = g.paris.list[0].cu
		return true
	return false

func near_dome(p: Vector3) -> bool:
	var c := centre()
	return Vector2(p.x-c.x,p.z-c.z).length() < NEAR and p.y < 60.0

func players_here() -> int:
	if force_players > 0:
		return force_players
	var n := 1
	var now := Time.get_ticks_msec()/1000.0
	for id in g.online_peers:
		var peer: Dictionary = g.online_peers[id]
		if now-float(peer.get("seen",0.0)) < 8.0 and near_dome(peer.get("target",Vector3(0,999,0))):
			n += 1
	return n

func power() -> float:
	return UPOWER if players_here() >= UNEED else 1.0

func four_done() -> bool:
	if g.paris == null or g.paris.list.size() < 4:
		return false
	for w in g.paris.list:
		if not (bool(w.cu.boss_won) and String(w.cu.boss_day) == today()):
			return false
	return true

func send(payload: Dictionary) -> void:
	payload["u"] = 1
	payload["w"] = 0
	g._online_event_send("bz",payload)

# ---------- appearing ----------
func summon(mine: bool) -> void:
	if invaded or won_day == today():
		return
	invaded = true
	on = false
	hp = UHP
	t = 0.0
	phase = 0
	atk_i = 0
	charge = 0.0
	php = 100.0
	if mine:
		send({"a":"summon"})
	g._show_toast("THE WORLD EATER is invading the HARBOR DOME! It needs %d players. Go to the Dome and fight it!" % UNEED)
	g._feed_add("THE WORLD EATER is invading Harbor Dome! It needs %d players." % UNEED,"")
	title_t = 4.0
	if title_lbl != null:
		title_lbl.text = "THE WORLD EATER\nINVADES THE HARBOR DOME"
	if helper():
		cu.roar()

func build_node() -> void:
	if node != null and is_instance_valid(node):
		return
	if models == null:
		models = BossModels.new(g)
	node = models.build("ultimate")
	node.scale = Vector3(SCALE,SCALE,SCALE)
	var c := centre()
	node.position = c+Vector3(0,HOVER,0)
	g.add_child(node)
	var lb := Label3D.new()
	lb.text = "THE WORLD EATER"
	lb.font_size = 40
	lb.pixel_size = 0.01
	lb.modulate = Color("d9c2ff")
	lb.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	lb.no_depth_test = true
	lb.position = Vector3(0,6.2,0)
	node.add_child(lb)
	light = OmniLight3D.new()
	light.light_color = Color("8a4aff")
	light.light_energy = 4.0
	light.omni_range = 60.0
	light.shadow_enabled = false
	light.position = Vector3(0,2.9,0)
	node.add_child(light)
	if rm == null:
		rm = StandardMaterial3D.new()
		rm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		rm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		rm.albedo_color = Color(0.62,0.35,1.0,0.85)
	for k in 12:
		var mr := MeshInstance3D.new()
		mr.mesh = g._fc_torus(2.3,2.7)
		mr.material_override = rm
		mr.visible = false
		g.add_child(mr)
		var ball: MeshInstance3D = g._fc_part(g,g._bsph(1.0),Vector3.ZERO,g._fc_glow(Color("b68aff")))
		ball.visible = false
		mets.append([mr,ball,Vector3.ZERO,3.2])

func free_node() -> void:
	if node != null and is_instance_valid(node):
		node.queue_free()
	node = null
	light = null
	for m in mets:
		for q in 2:
			if is_instance_valid(m[q]):
				(m[q] as Node).queue_free()
	mets.clear()
	slam_live = false

# ---------- every frame ----------
func tick(delta: float) -> void:
	if g.player == null or not helper():
		return
	clk += delta
	var p: Vector3 = g.player.position
	if g.paris.player_in_world():
		hud_hide()
		if node != null:
			free_node()
		return
	scan -= delta
	calm = maxf(0.0,calm-delta)
	if not invaded and scan <= 0.0:
		scan = 2.0
		if won_day != today() and four_done():
			summon(true)
	party_tick(delta)
	if not invaded:
		hud_hide()
		return
	var c := centre()
	var d := Vector2(p.x-c.x,p.z-c.z).length()
	if d < 520.0:
		build_node()
	elif node != null and d > 700.0:
		free_node()
	if node == null or not is_instance_valid(node):
		hud(p,d)
		return
	if not on and d < ENGAGE and calm <= 0.0 and not g.paused:
		engage(hp,0.0,true)
	if on:
		fight_tick(delta,p)
	else:
		models.animate(node,clk,0.6)
		var k := clk*0.12
		node.position = c+Vector3(cos(k)*8.0,HOVER+1.2*sin(clk*1.1),sin(k*1.3)*8.0)
		node.rotation.y = lerp_angle(node.rotation.y,atan2(p.x-node.position.x,p.z-node.position.z),minf(1.0,1.5*delta))
	hud(p,d)

func engage(start_hp: float, elapsed: float, mine: bool) -> void:
	if on:
		return
	on = true
	hp = start_hp
	t = elapsed
	wait = 4.0
	slam_live = false
	atk_i = 0
	php = 100.0
	charge = 0.0
	phase = 0
	shake = 2.0
	if mine:
		send({"a":"start","hp":int(hp),"e":int(t)})
	title_t = 3.5
	if title_lbl != null:
		title_lbl.text = "THE WORLD EATER\nHAS AWAKENED"
	if helper():
		cu.roar()
	g._show_toast("THE WORLD EATER is awake! It needs %d players: with %d, every shot hits %dx harder. Stay out of the purple rings!" % [UNEED,UNEED,int(UPOWER)])

func fight_tick(delta: float, p: Vector3) -> void:
	t += delta
	if t > UTIME:
		retreat()
		return
	var c := centre()
	var k := t*(0.2+0.06*float(phase))
	var np := c+Vector3(cos(k)*14.0,HOVER+1.6*sin(t*1.3),sin(k*1.3)*14.0)
	node.position = np
	node.rotation.y = lerp_angle(node.rotation.y,atan2(p.x-np.x,p.z-np.z),minf(1.0,2.5*delta))
	models.animate(node,t,1.0+0.35*float(phase))
	if light != null:
		light.light_energy = move_toward(light.light_energy,4.0+1.5*sin(t*4.0)+float(phase),delta*10.0)
	var np2 := mini(3,int((1.0-clampf(hp/UHP,0.0,1.0))*4.0))
	if np2 > phase:
		phase = np2
		shake = 1.4
		title_t = 2.6
		if title_lbl != null:
			title_lbl.text = ["","THE WORLD EATER\nGROWS ANGRY","THE WORLD EATER\nDOUBLE ATTACKS!","THE WORLD EATER\nFINAL RAGE!"][phase]
		if helper():
			cu.roar()
	# every few seconds an attack: purple rings show where, then they explode
	if not slam_live:
		wait -= delta
		if wait <= 0.0:
			start_attack(p,np)
	else:
		slam -= delta
		for m in mets:
			if (m[1] as MeshInstance3D).visible:
				var tp: Vector3 = m[2]
				(m[1] as MeshInstance3D).position = tp+Vector3(5.0,34.0,0)*clampf(slam/2.0,0.0,1.0)+Vector3(0,1.0,0)
				var s := 1.0+0.12*sin(t*18.0)
				var r := float(m[3])/2.5
				(m[0] as MeshInstance3D).scale = Vector3(r*s,1.0,r*s)
		if slam <= 0.0:
			resolve(p)
	if hp < UHP*0.99 and php < 100.0:
		php = minf(100.0,php+4.0*delta)
	sync += delta
	if sync > 2.0:
		sync = 0.0
		send({"a":"st","hp":int(hp),"e":int(t)})
	if php <= 0.0:
		php = 100.0
		g.paris.go_portal()
		g._show_toast("THE WORLD EATER knocked you out! You wake up at the Portal Summit. Run back in!")

func start_attack(p: Vector3, bp3: Vector3) -> void:
	pat = String(ATK[atk_i % ATK.size()])
	var you := Vector3(p.x,p.y-0.7,p.z)
	var bpos := Vector3(bp3.x,you.y,bp3.z)
	var to_me := you-bpos
	to_me.y = 0.0
	var dir := to_me.normalized() if to_me.length() > 0.5 else Vector3(1,0,0)
	var side := Vector3(-dir.z,0,dir.x)
	for k in mets.size():
		var at := you
		var rad := 3.4
		var used := true
		match pat:
			"rail":
				at = you+dir*(float(k)-5.5)*4.4
			"shatter":
				at = bpos+Vector3(cos(float(k)*TAU/6.0),0,sin(float(k)*TAU/6.0))*9.0 if k < 6 else bpos+Vector3(cos(float(k-6)*TAU/6.0+0.5),0,sin(float(k-6)*TAU/6.0+0.5))*18.0
			"tentacles":
				at = you if k == 0 else (you+Vector3(cos(float(k-1)*TAU/8.0+0.39),0,sin(float(k-1)*TAU/8.0+0.39))*10.0 if k < 9 else you+Vector3(cos(float(k-9)*TAU/3.0),0,sin(float(k-9)*TAU/3.0))*20.0)
			"eye":
				used = k < 6
				rad = 9.0 if k == 0 else 3.4
				at = you if k == 0 else you+Vector3(randf_range(-16.0,16.0),0,randf_range(-16.0,16.0))
			_:
				at = you+Vector3(randf_range(-4.0,4.0),0,randf_range(-4.0,4.0)) if k < 3 else you+Vector3(randf_range(-17.0,17.0),0,randf_range(-17.0,17.0))
		var mt: Array = mets[k]
		mt[2] = at
		mt[3] = rad
		(mt[0] as MeshInstance3D).position = at+Vector3(0,0.15,0)
		(mt[0] as MeshInstance3D).visible = used
		(mt[1] as MeshInstance3D).visible = used
		(mt[1] as MeshInstance3D).scale = Vector3.ONE*(rad/3.4)
	slam = 2.0
	slam_live = true
	title_t = 1.2
	if title_lbl != null:
		title_lbl.text = String(ATK_NAMES[pat])

func resolve(p: Vector3) -> void:
	slam_live = false
	atk_i += 1
	wait = maxf(1.6,3.8-0.6*float(phase))
	if phase >= 2 and atk_i % 2 == 1:
		wait = 0.6
	shake = 0.8
	if helper():
		cu.thud()
	var burned := 0.0
	for m in mets:
		var vis: bool = (m[0] as MeshInstance3D).visible
		(m[0] as MeshInstance3D).visible = false
		(m[1] as MeshInstance3D).visible = false
		if not vis:
			continue
		var at: Vector3 = m[2]
		g._quick_fx(at)
		if Vector2(at.x-p.x,at.z-p.z).length() < float(m[3]):
			burned = maxf(burned,45.0 if float(m[3]) > 5.0 else 26.0)
	if burned > 0.0:
		php -= burned
		if hurt != null:
			hurt.color.a = 0.4

func retreat() -> void:
	# Time ran out: it pulls back, healed, and will come again.
	on = false
	slam_live = false
	for m in mets:
		(m[0] as MeshInstance3D).visible = false
		(m[1] as MeshInstance3D).visible = false
	hp = UHP
	calm = 25.0
	g._show_toast("Time's up! THE WORLD EATER pulls back to heal. Bring %d players and try again." % UNEED)
	title_t = 3.0
	if title_lbl != null:
		title_lbl.text = "TIME'S UP!"

# ---------- fighting back ----------
func fire() -> void:
	if g.player == null or g.paused or cd > 0.0 or not on or node == null:
		return
	cd = GUN_CD
	var p: Vector3 = g.player.position
	if Vector2(p.x-node.position.x,p.z-node.position.z).length() > RANGE:
		g._show_toast("Too far. Get closer to THE WORLD EATER.")
		return
	hit(SHOT*power(),true)
	charge = minf(100.0,charge+5.0)
	g._quick_fx(node.position+Vector3(randf_range(-4.0,4.0),randf_range(-3.0,3.0),randf_range(-4.0,4.0)))

func blast() -> void:
	if g.player == null or g.paused or not on or node == null or charge < 100.0:
		return
	charge = 0.0
	hit(BLAST*power(),true)
	shake = 0.6
	g._quick_fx(node.position)
	g._show_toast("BLAST! -%d on THE WORLD EATER" % int(BLAST*power()))

func hit(dmg: float, mine: bool) -> void:
	if not on or dmg <= 0.0:
		return
	hp -= dmg
	if mine:
		send({"a":"hit","d":snappedf(dmg,0.1)})
	if light != null:
		light.light_energy = 8.0
	if hp <= 0.0:
		if mine:
			send({"a":"win"})
		win()

func win() -> void:
	if not on:
		return
	on = false
	invaded = false
	slam_live = false
	won_day = today()
	for m in mets:
		(m[0] as MeshInstance3D).visible = false
		(m[1] as MeshInstance3D).visible = false
	var lv := 0
	if helper():
		lv = cu.level_up_now()
		cu.fanfare()
	g.cash += PAY
	party_t = 12.0
	party_next = 0.0
	title_t = 6.0
	if title_lbl != null:
		title_lbl.text = "VICTORY!\nTHE WORLD EATER IS DEFEATED"
	g._show_toast("THE WORLD EATER IS DEFEATED! Every player in the fight gets %s%s." % [g._money(PAY)," and goes up a level" if lv > 0 else ""])
	g._feed_add("THE WORLD EATER was defeated at Harbor Dome by %d players! +%s each" % [players_here(),g._money(PAY)],"")
	php = 100.0
	shake = 1.5
	if node != null and is_instance_valid(node):
		var tw: Tween = node.create_tween()
		tw.tween_property(node,"scale",Vector3(0.1,0.1,0.1),2.4)
		tw.parallel().tween_property(node,"rotation:y",node.rotation.y+6.0,2.4)
		tw.tween_callback(free_node)
	if not g.paris.dry:
		g._save_progress()

func party_tick(delta: float) -> void:
	if party_t <= 0.0:
		return
	party_t -= delta
	party_next -= delta
	if party_next <= 0.0 and helper():
		party_next = 0.45
		var c := centre()
		var cols := [Color("ffd84a"),Color("ff6aa8"),Color("6ad8ff"),Color("9aff8a"),Color("c28aff")]
		cu.firework(c+Vector3(randf_range(-30.0,30.0),randf_range(14.0,34.0),randf_range(-30.0,30.0)),cols[randi() % cols.size()])

# ---------- online ----------
func net(p: Dictionary) -> void:
	var a := String(p.get("a",""))
	if a == "summon":
		summon(false)
		return
	if not invaded:
		if (a == "start" or a == "st") and won_day != today() and float(p.get("hp",0.0)) > 0.0:
			summon(false)
		else:
			return
	var rhp := clampf(float(p.get("hp",0.0)),0.0,UHP)
	var e := clampf(float(p.get("e",0.0)),0.0,UTIME)
	if a == "start" or a == "st":
		if not on:
			if node != null and rhp > 0.0 and e < UTIME-5.0 and g.player != null and near_dome(g.player.position):
				engage(rhp,e,false)
			else:
				hp = minf(hp,rhp) if rhp > 0.0 else hp
		else:
			hp = minf(hp,rhp)
			t = maxf(t,e)
	elif a == "hit" and on:
		hit(clampf(float(p.get("d",0.0)),0.0,BLAST*UPOWER),false)
	elif a == "win" and on:
		win()

# ---------- save ----------
func save_state(file: ConfigFile) -> void:
	file.set_value("ultimate","won_day",won_day)

func load_state(file: ConfigFile) -> void:
	won_day = String(file.get_value("ultimate","won_day",""))

# ---------- the screen ----------
func bar(parent: Node, size: Vector2, col: Color) -> Array:
	return cu.bar(parent,Vector2.ZERO,size,col)

func build_hud() -> void:
	layer = CanvasLayer.new()
	layer.layer = 57
	g.add_child(layer)
	hurt = ColorRect.new()
	hurt.color = Color(0.9,0.0,0.0,0.0)
	hurt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hurt.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.add_child(hurt)
	title_lbl = cu.out_label(64,Color("c28aff"))
	title_lbl.size = Vector2(1300,190)
	title_lbl.add_theme_constant_override("outline_size",18)
	title_lbl.add_theme_constant_override("line_spacing",-6)
	layer.add_child(title_lbl)
	fire_btn = g._button("FIRE\ncure gun",fire)
	fire_btn.add_theme_font_size_override("font_size",22)
	fire_btn.add_theme_stylebox_override("normal",g._panel(Color("7a3aff"),22))
	fire_btn.add_theme_stylebox_override("hover",g._panel(Color("9a5aff"),22))
	fire_btn.add_theme_stylebox_override("pressed",g._panel(Color("5a22c0"),22))
	layer.add_child(fire_btn)
	blast_btn = g._button("BLAST",blast)
	blast_btn.add_theme_font_size_override("font_size",19)
	layer.add_child(blast_btn)
	stick_view = Control.new()
	stick_view.mouse_filter = Control.MOUSE_FILTER_IGNORE
	stick_view.size = Vector2(180,180)
	stick_view.draw.connect(func():
		stick_view.draw_circle(Vector2(90,90),86,Color(0.05,0.12,0.18,0.55))
		stick_view.draw_arc(Vector2(90,90),85,0,TAU,64,Color(0.8,0.94,0.95,0.6),2,true)
		stick_view.draw_circle(Vector2(90,90)+(g.stick as Vector2)*58,32,Color(0.6,0.87,0.88,0.85)))
	layer.add_child(stick_view)
	toast = cu.out_label(21,Color("fff2c0"))
	toast.size = Vector2(900,30)
	layer.add_child(toast)
	var hb := bar(layer,Vector2(340,30),Color("43d65a"))
	hp_bg = hb[0]
	hp_fill = hb[1]
	var bb := bar(layer,Vector2(720,30),Color("a050ff"))
	boss_bg = bb[0]
	boss_fill = bb[1]
	boss_lbl = cu.out_label(24,Color("e0c8ff"))
	boss_lbl.size = Vector2(1000,32)
	layer.add_child(boss_lbl)
	power_lbl = cu.out_label(22,Color("ffe28a"))
	power_lbl.size = Vector2(1000,30)
	layer.add_child(power_lbl)
	hint_lbl = cu.out_label(22,Color("e0c8ff"))
	hint_lbl.size = Vector2(1100,30)
	layer.add_child(hint_lbl)

func simple(v: bool) -> void:
	if v == simple_on:
		return
	simple_on = v
	if v:
		hidden.clear()
		for c in g.get_children():
			if (c is CanvasLayer or c is Control) and c != layer and c.visible:
				c.visible = false
				hidden.append(c)
	else:
		for c in hidden:
			if is_instance_valid(c):
				c.visible = true
		hidden.clear()
		g._refresh_hud()

func hud_hide() -> void:
	if layer != null:
		simple(false)
		layer.visible = false

func hud(p: Vector3, d: float) -> void:
	if layer == null:
		build_hud()
	var show: bool = not g.paused and not (g.explore != null and bool(g.explore.on))
	layer.visible = show and (on or invaded)
	simple(on and show)
	if shake > 0.0:
		shake = maxf(0.0,shake-0.016)
		var cam: Camera3D = g.camera
		cam.h_offset = randf_range(-1.0,1.0)*0.25*minf(shake,1.0)
		cam.v_offset = randf_range(-1.0,1.0)*0.25*minf(shake,1.0)
	if hurt.color.a > 0.0:
		hurt.color.a = maxf(0.0,hurt.color.a-0.02)
	title_t = maxf(0.0,title_t-0.016)
	title_lbl.visible = title_t > 0.0
	var vs: Vector2 = g.get_viewport().get_visible_rect().size
	if title_t > 0.0:
		title_lbl.position = Vector2(vs.x*0.5-650.0,vs.y*0.24)
		title_lbl.modulate.a = clampf(title_t*2.0,0.0,1.0)
	cd = maxf(0.0,cd-0.016)
	hud_acc += 0.016
	if hud_acc < 0.1:
		return
	hud_acc = 0.0
	stick_view.visible = simple_on
	toast.visible = simple_on
	if simple_on:
		stick_view.queue_redraw()
		toast.text = String(g.status_label.text) if float(g.toast_time) > 0.0 else ""
	stick_view.position = Vector2(32,vs.y-210.0)
	toast.position = Vector2(vs.x*0.5-450.0,vs.y-150.0)
	fire_btn.visible = on
	blast_btn.visible = on
	fire_btn.position = Vector2(vs.x-432.0,vs.y-228.0)
	fire_btn.size = Vector2(170,92)
	blast_btn.position = Vector2(vs.x-432.0,vs.y-292.0)
	blast_btn.size = Vector2(170,56)
	var ready := charge >= 100.0
	blast_btn.text = "⚡ BLAST!" if ready else "BLAST %d%%" % int(charge)
	var bc := (Color("ffb020") if int(clk*4.0) % 2 == 0 else Color("ff6a2a")) if ready else Color("213d4f").lerp(Color("7a4a1c"),charge/100.0)
	blast_btn.add_theme_stylebox_override("normal",g._panel(bc,18))
	blast_btn.add_theme_stylebox_override("hover",g._panel(bc,18))
	hp_bg.visible = on
	hp_bg.position = Vector2(vs.x*0.5-170.0,vs.y-96.0)
	hp_fill.size.x = 332.0*clampf(php/100.0,0.0,1.0)
	hp_fill.color = Color("43d65a") if php > 50.0 else (Color("e8c23a") if php > 25.0 else Color("e5392e"))
	boss_bg.visible = on
	boss_lbl.visible = on
	power_lbl.visible = on
	hint_lbl.visible = invaded and not on and show
	if invaded and not on:
		hint_lbl.position = Vector2(vs.x*0.5-550.0,150.0)
		hint_lbl.text = "THE WORLD EATER is at the HARBOR DOME  ·  %s" % ("get closer to wake it" if d < 400.0 else "go to the Dome (%d m)" % int(d))
	if on:
		var by := 14.0 if simple_on else 128.0
		boss_lbl.position = Vector2(vs.x*0.5-500.0,by)
		boss_bg.position = Vector2(vs.x*0.5-360.0,by+34.0)
		power_lbl.position = Vector2(vs.x*0.5-500.0,by+66.0)
		boss_fill.size.x = 712.0*clampf(hp/UHP,0.0,1.0)
		var left := maxi(0,int(UTIME-t))
		boss_lbl.text = "THE WORLD EATER   %d:%02d" % [left/60,left % 60]
		var n := players_here()
		if n >= UNEED:
			power_lbl.text = "POWER x%d!  %d players  ·  FIRE!" % [int(UPOWER),n]
			power_lbl.add_theme_color_override("font_color",Color("8dffb0") if int(clk*4.0) % 2 == 0 else Color("ffe28a"))
		else:
			power_lbl.text = "%d/%d players: far too strong! Call everyone to the Dome..." % [n,UNEED]
			power_lbl.add_theme_color_override("font_color",Color("ffb08a"))

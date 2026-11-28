extends RefCounted
# v0.72: the CURE GUN, rescue quests and the city BOSS. One per portal world (owned by paris.gd as `cu`).
# - Infected roam every city. The cure gun (FIRE button, or F) turns them back into people.
# - Daily quests: cure 10 infected, rescue 5 trapped people, cure 2 brutes, beat the boss.
# - The boss sleeps in its lair. Anyone can wake it; it needs 3 players in the city: with 3 or more every shot
#   hits 10 times harder. Waking it (and CALL PLAYERS) puts a JOIN button on every online player's screen.
# Boss health is shared over the online channel (event "bz"); it also works offline (but one player cannot win).

const ROAM := 9
const GUN_RANGE := 24.0
const GUN_CD := 0.38
const SHOT := 4.0
const BOSS_HP := 12000.0
const BOSS_TIME := 300.0
const BOSS_NEED := 3
const BOSS_RANGE := 46.0
const POWER := 10.0
const CALL_CD := 25.0
const BOSS_NAMES := {"paris":"THE IRON GHOUL","tokyo":"THE NEON ONI","newyork":"THE TIMES TITAN","bangkok":"THE RIVER GIANT"}
const Q_CURE := 10
const Q_RESCUE := 5
const Q_BRUTE := 2
const PAYS := [[2000,200],[3000,300],[1500,150]]
const BOSS_FIRST := [25000,2500]
const BOSS_DAILY := [8000,500]

var w
var g
var o
var idx := 0                 # this world's index in worlds.list
var props: Node3D
var roam: Array = []         # [Node3D, Vector2 home (local), kind, hits left, temp]
var respawn: Array = []      # seconds until a cured roamer is replaced
var trapped: Array = []      # [Node3D, Vector2 local, saved]
var day := ""
var cured := 0
var rescued := 0
var brutes := 0
var paid := 0
var trap_mask := 0
var boss_won := false
var boss_day := ""
var hp := 100.0
var cd := 0.0
var clk := 0.0
var acc := 0.0
var warn_t := 0.0
var call_t := -100.0
var force_players := 0       # tests only
var arena_ok := false
var arena_l := Vector2.ZERO
var arena_r := 9.0           # how far the boss paces from the middle of its lair
# boss fight
var b_on := false
var b_hp := 0.0
var b_t := 0.0               # seconds since the boss woke
var b_node: Node3D
var b_ring: MeshInstance3D
var b_light: OmniLight3D
var b_slam := 0.0
var b_slam_at := Vector3.ZERO
var b_slam_live := false
var b_roars := 0
var b_sync := 0.0
var shake := 0.0
var sky := 0.0
# HUD
var layer: CanvasLayer
var fire_btn: Button
var call_btn: Button
var hp_bg: ColorRect
var hp_fill: ColorRect
var hurt: ColorRect
var boss_bg: ColorRect
var boss_fill: ColorRect
var boss_lbl: Label
var power_lbl: Label

func _init(world) -> void:
	w = world
	g = world.g
	o = world.ob

func today() -> String:
	return Time.get_date_string_from_system()

func roll_day() -> void:
	if day != today():
		day = today()
		cured = 0
		rescued = 0
		brutes = 0
		paid = 0
		trap_mask = 0

func boss_name() -> String:
	return String(BOSS_NAMES.get(String(w.W["save"]),"THE BOSS"))

func local(p: Vector3) -> Vector2:
	return Vector2(p.x-w.C.x,p.z-w.C.z)

func world(l: Vector2) -> Vector3:
	return w.C+Vector3(l.x,0,l.y)

func arena() -> Vector2:
	# The boss lair: on open ground between the return portal and the landmark.
	if not arena_ok:
		arena_ok = true
		var lm: Vector2 = w.W.get("lm",Vector2.ZERO)
		var rp: Vector2 = w.RET
		var dir := (lm-rp)
		var base := rp+dir.normalized()*minf(38.0,dir.length()*0.6) if dir.length() > 1.0 else rp+Vector2(30,0)
		# The widest open ground near there: the boss paces a circle, so the whole circle must be clear of buildings.
		for rr: float in [9.0,6.5,4.5]:
			for k in 90:
				var a := float(k)*2.4
				var c := base+Vector2(cos(a),sin(a))*1.6*float(k)
				if not open_at(c) or c.distance_to(rp) < 16.0 or c.distance_to(lm) < w.lm_radius()+rr:
					continue
				var ok := true
				for j in 10:
					var q := c+Vector2(cos(float(j)*TAU/10.0),sin(float(j)*TAU/10.0))*(rr+1.5)
					if w.in_building(q,1.0) or not w.in_area(q.x,q.y,4.0):
						ok = false
						break
				if ok:
					arena_l = c
					arena_r = rr
					return arena_l
		arena_l = free_spot(base)
		arena_r = 3.0
	return arena_l

func arena_pos() -> Vector3:
	return world(arena())

func players_here() -> int:
	if force_players > 0:
		return force_players
	var n := 1
	var now := Time.get_ticks_msec()/1000.0
	for id in g.online_peers:
		var peer: Dictionary = g.online_peers[id]
		if now-float(peer.get("seen",0.0)) < 8.0 and w.in_paris(peer.get("target",Vector3.ZERO)):
			n += 1
	return n

func power() -> float:
	return POWER if players_here() >= BOSS_NEED else 1.0

# ---------- the infected that roam the city ----------
func bases() -> Array:
	var out: Array = []
	for c in w.W["clues"]:
		out.append(c)
	out.append(w.CAFE)
	out.append(w.QUAY)
	out.append(arena()+Vector2(14,10))
	return out

func open_at(s: Vector2) -> bool:
	return w.in_area(s.x,s.y,6.0) and not w.in_building(s,1.5) and s.distance_to(o.inf.post_local()) > float(o.inf.SAFE_R)+6.0

func free_spot(base: Vector2) -> Vector2:
	# Open street near `base`: never inside a building, never in the safe zone.
	var s: Vector2 = o.spot(base)
	if open_at(s):
		return s
	for k in 24:
		var a := float(k)*2.4
		s = o.spot(base+Vector2(cos(a),sin(a))*(6.0+3.0*float(k)))
		if open_at(s):
			return s
	return o.spot(w.RET+(w.RET-o.inf.post_local()).normalized()*14.0)

func add_zombie(s: Vector2, kind: String, temp := false) -> void:
	var cols := {"walker":Color("6a7d3a"),"runner":Color("7a3a3a"),"brute":Color("5a6a35")}
	var zn: Node3D = o.figure(props,Vector3(s.x,0,s.y),cols[kind],Color("8fcf5a"),true)
	if kind == "brute":
		zn.scale = Vector3(1.45,1.45,1.45)
		w.label(zn,"BRUTE",Vector3(0,2.5,0),Color("ff8a5a"),34)
	elif kind == "runner":
		zn.scale = Vector3(0.95,0.95,0.95)
	zn.rotation.y = s.x*0.7
	roam.append([zn,s,kind,3 if kind == "brute" else 1,temp])

func populate() -> void:
	if props != null:
		return
	roll_day()
	props = Node3D.new()
	props.name = "Cure"
	w.root.add_child(props)
	var rng := RandomNumberGenerator.new()
	rng.seed = 7200+idx
	var bs := bases()
	for k in ROAM:
		var a := rng.randf()*TAU
		var s := free_spot((bs[k % bs.size()] as Vector2)+Vector2(cos(a),sin(a))*rng.randf_range(8.0,22.0))
		add_zombie(s,"brute" if k % 4 == 3 else ("runner" if k % 3 == 0 else "walker"))
	# Five trapped people a day, each with two infected standing guard.
	for i in Q_RESCUE:
		if trap_mask & (1 << i):
			trapped.append([null,Vector2.ZERO,true])
			continue
		var a2 := float(i)*TAU/float(Q_RESCUE)+0.5
		var s2 := free_spot((bs[(i+2) % bs.size()] as Vector2)+Vector2(cos(a2),sin(a2))*rng.randf_range(24.0,34.0))
		var pn: Node3D = o.figure(props,Vector3(s2.x,0,s2.y),Color("e0a030"),Color("f1c9a0"),false)
		w.label(pn,"TRAPPED! HELP!",Vector3(0,2.7,0),Color("ffe08a"),40)
		g._fc_part(pn,g._bsph(0.18),Vector3(0,2.25,0),g._fc_glow(Color("ffd24f")))
		trapped.append([pn,s2,false])
		for k in 2:
			add_zombie(free_spot(s2+Vector2(-3.0+6.0*float(k),2.5)),"walker")
	build_lair()

func build_lair() -> void:
	var a := arena()
	var c := Vector3(a.x,0,a.y)
	var lr := maxf(arena_r,5.0)
	g._fc_part(props,g._fc_torus(lr-0.4,lr),c+Vector3(0,0.1,0),g._fc_glow(Color("ff3a2a")))
	g._fc_part(props,g._fc_torus(lr*0.6,lr*0.6+0.2),c+Vector3(0,0.1,0),g._fc_glow(Color("7a1010")))
	for k in 6:
		var ang := float(k)*TAU/6.0
		var pp := c+Vector3(cos(ang)*lr,0,sin(ang)*lr)
		g._hm(props,pp+Vector3(0,1.6,0),Vector3(0.7,3.2,0.7),Color("1b1416"),false,ang)
		g._fc_part(props,g._bsph(0.28),pp+Vector3(0,3.5,0),g._fc_glow(Color("ff4a2a")))
	w.label(props,"BOSS LAIR",c+Vector3(0,6.2,0),Color("ff6a4a"),64)
	w.label(props,"%s  ·  needs %d players" % [boss_name(),BOSS_NEED],c+Vector3(0,5.0,0),Color("ffd0c0"),36)

func despawn() -> void:
	if b_on:
		boss_end(false,true)
	if props != null and is_instance_valid(props):
		props.queue_free()
	props = null
	roam.clear()
	respawn.clear()
	trapped.clear()
	if layer != null and is_instance_valid(layer):
		g.touch_buttons.erase(fire_btn)
		g.touch_buttons.erase(call_btn)
		layer.queue_free()
	layer = null
	hp = 100.0
	set_sky(0.0)

func targets() -> Array:
	return o.zomb if o.active else roam

# ---------- the cure gun ----------
func fire() -> void:
	if g.player == null or g.paused or cd > 0.0 or not w.in_paris(g.player.position) or w.busy():
		return
	cd = GUN_CD
	var p: Vector3 = g.player.position
	var lp := local(p)
	var list := targets()
	var best := -1
	var bd := GUN_RANGE
	for i in list.size():
		var zn: Node3D = list[i][0]
		if not is_instance_valid(zn):
			continue
		var d := Vector2(zn.position.x,zn.position.z).distance_to(lp)
		if d < bd:
			bd = d
			best = i
	var from := p+Vector3(0,0.6,0)
	if best >= 0:
		var zn2: Node3D = list[best][0]
		beam(from,w.C+zn2.position+Vector3(0,1.2*zn2.scale.y,0))
		hit_zombie(list,best)
	elif b_on and is_instance_valid(b_node) and local(w.C+b_node.position).distance_to(lp) < BOSS_RANGE:
		beam(from,w.C+b_node.position+Vector3(0,4.0,0))
		hit_boss(SHOT*power(),true)
	else:
		var fwd: Vector3 = -g.camera.global_transform.basis.z
		fwd.y = 0.0
		beam(from,from+fwd.normalized()*GUN_RANGE)
	zap()

func hit_zombie(list: Array, i: int) -> void:
	var z: Array = list[i]
	var left := (int(z[3]) if z.size() > 3 else 1)-1
	if left > 0:
		z[3] = left
		var zn: Node3D = z[0]
		var tw: Tween = zn.create_tween()
		tw.tween_property(zn,"scale",zn.scale*0.9,0.08)
		tw.tween_property(zn,"scale",zn.scale,0.12)
		return
	cure(list,i)

func cure(list: Array, i: int) -> void:
	var z: Array = list[i]
	var zn: Node3D = z[0]
	var kind := String(z[2]) if z.size() > 2 else "walker"
	var temp := bool(z[4]) if z.size() > 4 else false
	var at := zn.position
	var parent: Node3D = zn.get_parent()
	zn.queue_free()
	list.remove_at(i)
	if list == roam and not temp:
		respawn.append(22.0)
	# The person they were: stands up, waves, and walks off.
	var shirts := [Color("3b7fd1"),Color("d1643b"),Color("48a868"),Color("b05ac8"),Color("d8b03a")]
	var pn: Node3D = o.figure(parent,at,shirts[(cured+idx) % shirts.size()],Color("f1c9a0"),false)
	w.label(pn,"CURED! Thank you!",Vector3(0,2.7,0),Color("9dffb0"),38)
	g._fc_part(pn,g._fc_torus(0.9,1.05),Vector3(0,0.1,0),g._fc_glow(Color("5dffa0")))
	var tw: Tween = pn.create_tween()
	tw.tween_interval(4.0)
	tw.tween_property(pn,"scale",Vector3(0.01,0.01,0.01),0.5)
	tw.tween_callback(pn.queue_free)
	roll_day()
	cured += 1
	g.cash += 40
	if kind == "brute":
		brutes += 1
	if g.daily != null:
		g.daily.bump("cure")
	if not w.dry:
		g._quick_fx(w.C+at+Vector3(0,0.6,0))
	check_quests()

func check_quests() -> void:
	var vals := [cured >= Q_CURE,rescued >= Q_RESCUE,brutes >= Q_BRUTE]
	var names := ["CURED %d INFECTED" % Q_CURE,"RESCUED %d TRAPPED PEOPLE" % Q_RESCUE,"CURED %d BRUTES" % Q_BRUTE]
	for k in 3:
		if bool(vals[k]) and (paid & (1 << k)) == 0:
			paid |= 1 << k
			w.pay(int(PAYS[k][0]),int(PAYS[k][1]),names[k])
			if not w.dry:
				g._save_progress()

func beam(a: Vector3, b: Vector3) -> void:
	if w.dry or w.root == null:
		return
	var mi := MeshInstance3D.new()
	var cm := CylinderMesh.new()
	cm.top_radius = 0.07
	cm.bottom_radius = 0.07
	cm.height = maxf(0.2,a.distance_to(b))
	cm.radial_segments = 6
	mi.mesh = cm
	mi.material_override = g._fc_glow(Color("5dffe0"))
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	g.add_child(mi)
	mi.global_position = (a+b)*0.5
	var dir := (b-a).normalized()
	if absf(dir.dot(Vector3.UP)) < 0.99:
		mi.global_transform.basis = Basis.looking_at(dir,Vector3.UP)*Basis(Vector3.RIGHT,PI*0.5)
	var puff: MeshInstance3D = g._fc_part(g,g._bsph(0.5),Vector3.ZERO,g._fc_glow(Color("b0fff0")))
	puff.global_position = b
	var tw: Tween = g.create_tween()
	tw.tween_property(mi,"scale",Vector3(0.1,1.0,0.1),0.14)
	tw.parallel().tween_property(puff,"scale",Vector3(2.2,2.2,2.2),0.14)
	tw.tween_callback(mi.queue_free)
	tw.tween_callback(puff.queue_free)

func tone(length: float, fn: Callable, db := -9.0) -> void:
	if w.dry or "--smoke-test" in OS.get_cmdline_user_args():
		return
	var gen := AudioStreamGenerator.new()
	gen.mix_rate = 22050.0
	gen.buffer_length = length+0.1
	var sp := AudioStreamPlayer.new()
	sp.stream = gen
	sp.volume_db = db
	g.add_child(sp)
	sp.play()
	var pb := sp.get_stream_playback() as AudioStreamGeneratorPlayback
	if pb == null:
		sp.queue_free()
		return
	var n := int(gen.mix_rate*length)
	for i in n:
		var v: float = fn.call(float(i)/gen.mix_rate)
		pb.push_frame(Vector2(v,v))
	g.get_tree().create_timer(length+0.3).timeout.connect(sp.queue_free)

func zap() -> void:
	tone(0.16,func(t: float) -> float: return sin(TAU*(1500.0-5200.0*t)*t)*0.28*exp(-t*14.0))

func roar() -> void:
	tone(1.3,func(t: float) -> float:
		var f := 62.0+30.0*sin(t*9.0)-18.0*t
		return (signf(sin(TAU*f*t))*0.5+sin(TAU*f*0.5*t)*0.5+sin(TAU*f*2.02*t)*0.25)*0.5*minf(t*8.0,1.0)*exp(-maxf(t-0.5,0.0)*3.0),-3.0)

func thud() -> void:
	tone(0.5,func(t: float) -> float: return sin(TAU*(90.0-110.0*t)*t)*0.7*exp(-t*7.0),-2.0)

# ---------- every frame ----------
func tick(delta: float) -> void:
	if g.player == null or not w.built:
		return
	var p: Vector3 = g.player.position
	if not w.in_paris(p):
		if props != null:
			despawn()
		return
	cd = maxf(0.0,cd-delta)
	clk += delta
	warn_t = maxf(0.0,warn_t-delta)
	if o.active:
		# The outbreak mission has its own zombies and health; the gun works on them.
		if props != null:
			props.visible = false
		hud(p)
		return
	if props == null:
		populate()
		if not w.dry:
			g._show_toast("CURE GUN ready: tap FIRE (or F) to cure the infected. Quests are on the left.")
	props.visible = true
	for i in range(respawn.size()-1,-1,-1):
		respawn[i] = float(respawn[i])-delta
		if float(respawn[i]) <= 0.0:
			respawn.remove_at(i)
			var bs := bases()
			var a := randf()*TAU
			var s := free_spot((bs[randi() % bs.size()] as Vector2)+Vector2(cos(a),sin(a))*randf_range(10.0,24.0))
			if s.distance_to(local(p)) > 16.0:
				add_zombie(s,"runner" if randi() % 3 == 0 else "walker")
			else:
				respawn.append(4.0)
	move_zombies(delta,p)
	tick_trapped(p)
	if b_on:
		boss_tick(delta,p)
	if hp <= 0.0:
		die()
	hud(p)

func move_zombies(delta: float, p: Vector3) -> void:
	var lp := local(p)
	var bitten := false
	var dps := 0.0
	var safe: bool = lp.distance_to(o.inf.post_local()) < float(o.inf.SAFE_R)
	for z in roam:
		var zn: Node3D = z[0]
		if not is_instance_valid(zn):
			continue
		var zp := Vector2(zn.position.x,zn.position.z)
		var d := zp.distance_to(lp)
		var spec: Array = o.inf.SPEC[String(z[2])]
		var target: Vector2 = lp if d < float(spec[1]) and not safe else z[1]
		var dir := target-zp
		if dir.length() > 0.8:
			var step := dir.normalized()*minf(float(spec[0])*delta,dir.length())
			zn.position.x += step.x
			zn.position.z += step.y
			zn.rotation.y = lerp_angle(zn.rotation.y,atan2(dir.x,dir.y),minf(1.0,6.0*delta))
		if d < float(spec[2]) and not safe:
			bitten = true
			dps = maxf(dps,float(spec[3]))
	if bitten and not w.dry:
		damage(dps*delta)
	elif hp > 0.0 and hp < 100.0:
		hp = minf(100.0,hp+(14.0 if safe else 3.0)*delta)

func damage(amount: float) -> void:
	hp -= amount
	if hurt != null:
		hurt.color.a = 0.35

func die() -> void:
	hp = 100.0
	var rp: Vector2 = w.RET
	w.move_player(w.C+Vector3(rp.x-2.5,0.9,rp.y+3.5))
	if not w.dry:
		g._show_toast("The infected got you. You wake up at the portal. The SAFE ZONE heals you." if not b_on else "%s knocked you out! You wake up at the portal. Run back in!" % boss_name())
	g._refresh_hud()

func tick_trapped(p: Vector3) -> void:
	var lp := local(p)
	for i in trapped.size():
		var t: Array = trapped[i]
		if bool(t[2]) or lp.distance_to(t[1]) > 2.8:
			continue
		var guarded := false
		for z in roam:
			if is_instance_valid(z[0]) and Vector2((z[0] as Node3D).position.x,(z[0] as Node3D).position.z).distance_to(t[1]) < 7.0:
				guarded = true
		if guarded:
			if warn_t <= 0.0 and not w.dry:
				warn_t = 4.0
				g._show_toast("Cure the infected around them first! Tap FIRE.")
			continue
		rescue(i)

func rescue(i: int) -> void:
	var t: Array = trapped[i]
	t[2] = true
	roll_day()
	trap_mask |= 1 << i
	rescued += 1
	g.cash += 300
	if g.daily != null:
		g.daily.bump("rescue")
	var pn: Node3D = t[0]
	if is_instance_valid(pn):
		var tw: Tween = pn.create_tween()
		tw.tween_property(pn,"position:y",0.6,0.25)
		tw.tween_property(pn,"position:y",0.0,0.25)
		tw.tween_interval(1.5)
		tw.tween_property(pn,"scale",Vector3(0.01,0.01,0.01),0.5)
		tw.tween_callback(pn.queue_free)
	if not w.dry:
		g._play_coin()
		g._show_toast("RESCUED %d/%d: \"Thank you! I'm running to the safe zone!\"  +$300" % [rescued,Q_RESCUE])
	check_quests()

# ---------- the boss ----------
func prompt(p: Vector3) -> String:
	if not w.built or o.active or props == null:
		return ""
	if not b_on and w.near(p,arena_pos(),7.0):
		return "WAKE THE BOSS"
	return ""

func owns(txt: String) -> bool:
	return txt == "WAKE THE BOSS"

func interact(_txt: String) -> void:
	wake()

func wake() -> void:
	if b_on or props == null:
		return
	boss_start(BOSS_HP,0.0)
	send({"a":"start","hp":int(b_hp),"e":0})
	call_t = clk
	if not w.dry:
		g._feed_add("You woke %s! Every online player got a JOIN button." % boss_name(),"")

func call_help() -> void:
	if clk-call_t < CALL_CD:
		if not w.dry:
			g._show_toast("Call sent. You can call again in %d s." % int(CALL_CD-(clk-call_t)))
		return
	call_t = clk
	send({"a":"call","b":1 if b_on else 0})
	if not w.dry:
		if g.online_on and int(g.online_state) == 3:
			g._show_toast("Called every online player to %s. They get a JOIN button." % w.W["name"])
		else:
			g._show_toast("You are offline. Turn Online on (Menu > Online) so players can join you.")

func send(payload: Dictionary) -> void:
	payload["w"] = idx
	g._online_event_send("bz",payload)

func net(p: Dictionary) -> void:
	# A message from another player in (or calling from) this world.
	var a := String(p.get("a",""))
	var here: bool = g.player != null and w.built and w.in_paris(g.player.position) and props != null and not o.active
	if not here:
		return
	if a == "start" or a == "st":
		var rhp := clampf(float(p.get("hp",0.0)),0.0,BOSS_HP)
		var e := clampf(float(p.get("e",0.0)),0.0,BOSS_TIME)
		if not b_on:
			if rhp > 0.0 and e < BOSS_TIME-5.0:
				boss_start(rhp,e)
		else:
			b_hp = minf(b_hp,rhp)
			b_t = maxf(b_t,e)
	elif a == "hit" and b_on:
		hit_boss(clampf(float(p.get("d",0.0)),0.0,SHOT*POWER),false)
	elif a == "win" and b_on:
		boss_end(true)

func boss_start(start_hp: float, elapsed: float) -> void:
	if b_on or props == null:
		return
	b_on = true
	b_hp = start_hp
	b_t = elapsed
	b_slam = 3.0
	b_slam_live = false
	b_roars = 0
	b_sync = 0.0
	var a := arena()
	b_node = o.figure(props,Vector3(a.x,0,a.y),Color("3a1010"),Color("6a8a50"),true)
	b_node.scale = Vector3(0.3,0.3,0.3)
	var tw: Tween = b_node.create_tween()
	tw.tween_property(b_node,"scale",Vector3(4.2,4.2,4.2),1.4).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	# Horns, burning eyes and a red glow in the chest.
	for sx: float in [-1.0,1.0]:
		var horn: MeshInstance3D = g._fc_part(b_node,g._bcone(0.0,0.07,0.42),Vector3(sx*0.16,1.92,0.02),g._material(Color("1a0d0d")))
		horn.rotation.z = -sx*0.5
		g._fc_part(b_node,g._bsph(0.045),Vector3(sx*0.075,1.66,0.17),g._fc_glow(Color("ff2a10")))
	g._fc_part(b_node,g._bsph(0.16),Vector3(0,1.25,0.12),g._fc_glow(Color("ff3a1a")))
	var lb: Label3D = w.label(b_node,boss_name(),Vector3(0,2.6,0),Color("ff5a3a"),30)
	lb.visibility_range_end = 400.0
	b_light = OmniLight3D.new()
	b_light.light_color = Color("ff2a1a")
	b_light.light_energy = 3.0
	b_light.omni_range = 26.0
	b_light.shadow_enabled = false
	b_light.position = Vector3(a.x,5.0,a.y)
	props.add_child(b_light)
	b_ring = MeshInstance3D.new()
	b_ring.mesh = g._fc_torus(5.0,5.5)
	var rm := StandardMaterial3D.new()
	rm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	rm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	rm.albedo_color = Color(1.0,0.15,0.1,0.8)
	b_ring.material_override = rm
	b_ring.visible = false
	props.add_child(b_ring)
	shake = 1.2
	roar()
	if not w.dry:
		g._show_toast("%s IS AWAKE! It needs %d players: with %d, every shot hits %dx harder. Stay out of the red rings!" % [boss_name(),BOSS_NEED,BOSS_NEED,int(POWER)])

func hit_boss(dmg: float, mine: bool) -> void:
	if not b_on or dmg <= 0.0:
		return
	b_hp -= dmg
	if mine:
		send({"a":"hit","d":snappedf(dmg,0.1)})
	if is_instance_valid(b_light):
		b_light.light_energy = 6.0
	if b_hp <= 0.0:
		if mine:
			send({"a":"win"})
		boss_end(true)

func boss_tick(delta: float, p: Vector3) -> void:
	b_t += delta
	if b_t > BOSS_TIME:
		boss_end(false)
		return
	var a := arena()
	var enraged := b_hp < BOSS_HP*0.5
	if is_instance_valid(b_node):
		var k := b_t*(0.5 if enraged else 0.32)
		var np := Vector2(a.x+cos(k)*arena_r,a.y+sin(k*1.31)*arena_r)
		var mv := np-Vector2(b_node.position.x,b_node.position.z)
		b_node.position.x = np.x
		b_node.position.z = np.y
		b_node.position.y = 0.25*absf(sin(b_t*2.2))
		if mv.length() > 0.001:
			b_node.rotation.y = lerp_angle(b_node.rotation.y,atan2(mv.x,mv.y),minf(1.0,3.0*delta))
		if is_instance_valid(b_light):
			b_light.position = Vector3(np.x,5.0,np.y)
			b_light.light_energy = move_toward(b_light.light_energy,3.0+1.2*sin(b_t*5.0),delta*10.0)
		if np.distance_to(local(p)) < 4.5 and not w.dry:
			damage(30.0*delta)
	# Ground slam: a red ring where you stand, then it explodes.
	b_slam -= delta
	if not b_slam_live and b_slam <= 0.0:
		b_slam_live = true
		b_slam = 1.6
		b_slam_at = Vector3(p.x-w.C.x,0.12,p.z-w.C.z)
		b_ring.position = b_slam_at
		b_ring.visible = true
	elif b_slam_live:
		var s := 1.0+0.15*sin(b_t*20.0)
		b_ring.scale = Vector3(s,1.0,s)
		if b_slam <= 0.0:
			b_slam_live = false
			b_slam = 3.4 if enraged else 5.4
			b_ring.visible = false
			shake = 0.6
			thud()
			if not w.dry:
				g._quick_fx(w.C+b_slam_at)
				if Vector2(b_slam_at.x,b_slam_at.z).distance_to(local(p)) < 5.5:
					damage(38.0)
	# Roars at 75, 50 and 25 percent: runners rush in.
	var stage := 3-int(ceil(clampf(b_hp/BOSS_HP,0.0,1.0)*4.0-0.001))
	if stage > b_roars and b_roars < 3:
		b_roars += 1
		shake = 1.0
		roar()
		for k in 3:
			var ang := float(k)*TAU/3.0+b_t
			add_zombie(o.spot(local(p)+Vector2(cos(ang),sin(ang))*20.0),"runner",true)
		if not w.dry:
			g._show_toast("%s ROARS! Runners are coming for you!" % boss_name())
	b_sync += delta
	if b_sync > 2.0:
		b_sync = 0.0
		send({"a":"st","hp":int(b_hp),"e":int(b_t)})
		if players_here() < BOSS_NEED and clk-call_t > CALL_CD:
			call_t = clk
			send({"a":"call","b":1})

func boss_end(won: bool, quiet := false) -> void:
	if not b_on:
		return
	b_on = false
	b_slam_live = false
	if is_instance_valid(b_ring):
		b_ring.queue_free()
	if is_instance_valid(b_light):
		b_light.queue_free()
	if is_instance_valid(b_node):
		if won and not w.dry:
			var tw: Tween = b_node.create_tween()
			tw.tween_property(b_node,"rotation:x",-1.5,0.9)
			tw.parallel().tween_property(b_node,"scale",Vector3(0.2,0.2,0.2),1.6)
			tw.tween_callback(b_node.queue_free)
		else:
			b_node.queue_free()
	b_node = null
	for i in range(roam.size()-1,-1,-1):
		if bool(roam[i][4]):
			if is_instance_valid(roam[i][0]):
				(roam[i][0] as Node3D).queue_free()
			roam.remove_at(i)
	if quiet:
		return
	if not won:
		if not w.dry:
			g._show_toast("%s went back to sleep. Bring %d players and wake it again!" % [boss_name(),BOSS_NEED])
		return
	shake = 1.5
	roll_day()
	if g.daily != null:
		g.daily.bump("boss")
	if not boss_won:
		boss_won = true
		boss_day = today()
		w.pay(int(BOSS_FIRST[0]),int(BOSS_FIRST[1]),"%s DEFEATED" % boss_name())
	elif boss_day != today():
		boss_day = today()
		w.pay(int(BOSS_DAILY[0]),int(BOSS_DAILY[1]),"%s DEFEATED AGAIN" % boss_name())
	elif not w.dry:
		g._show_toast("%s is down again! The reward is paid once a day." % boss_name())
	if not w.dry:
		g._feed_add("%s defeated in %s by %d players!" % [boss_name(),w.W["name"],players_here()],"")
		g._save_progress()

func goto_arena() -> void:
	# A player who tapped JOIN lands just outside the lair.
	var a := arena()
	var s: Vector2 = o.spot(a+(w.RET-a).normalized()*13.0)
	w.move_player(w.C+Vector3(s.x,0.9,s.y))

# ---------- quest tracker rows ----------
func quest_items(p: Vector3) -> Array:
	roll_day()
	var lp := local(p)
	var near_z := arena_pos()
	var near_b := arena_pos()
	var dz := 1e9
	var db := 1e9
	for z in roam:
		if not is_instance_valid(z[0]):
			continue
		var zl := Vector2((z[0] as Node3D).position.x,(z[0] as Node3D).position.z)
		var d := zl.distance_to(lp)
		if d < dz:
			dz = d
			near_z = world(zl)
		if String(z[2]) == "brute" and d < db:
			db = d
			near_b = world(zl)
	var near_t := near_z
	var dt := 1e9
	for t in trapped:
		if not bool(t[2]) and (t[1] as Vector2).distance_to(lp) < dt:
			dt = (t[1] as Vector2).distance_to(lp)
			near_t = world(t[1])
	var np := players_here()
	return [
		{"n":"Cure the infected with the cure gun (%d/%d)" % [mini(cured,Q_CURE),Q_CURE],"pos":near_z,"done":cured >= Q_CURE},
		{"n":"Rescue the trapped people (%d/%d)" % [mini(rescued,Q_RESCUE),Q_RESCUE],"pos":near_t,"done":rescued >= Q_RESCUE},
		{"n":"Cure the BRUTES, 3 shots each (%d/%d)" % [mini(brutes,Q_BRUTE),Q_BRUTE],"pos":near_b,"done":brutes >= Q_BRUTE},
		{"n":"BOSS: %s (%d/%d players)" % [boss_name(),np,BOSS_NEED],"pos":arena_pos(),"done":boss_day == today()},
	]

# ---------- HUD ----------
func bar(parent: Node, pos: Vector2, size: Vector2, col: Color) -> Array:
	var bg := ColorRect.new()
	bg.color = Color(0,0,0,0.65)
	bg.position = pos
	bg.size = size
	bg.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(bg)
	var fill := ColorRect.new()
	fill.position = Vector2(4,4)
	fill.size = size-Vector2(8,8)
	fill.color = col
	fill.mouse_filter = Control.MOUSE_FILTER_IGNORE
	bg.add_child(fill)
	return [bg,fill]

func out_label(size: int, col: Color) -> Label:
	var l := Label.new()
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.add_theme_font_size_override("font_size",size)
	l.add_theme_color_override("font_color",col)
	l.add_theme_color_override("font_outline_color",Color(0,0,0))
	l.add_theme_constant_override("outline_size",8)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l

func build_hud() -> void:
	layer = CanvasLayer.new()
	layer.layer = 56
	g.add_child(layer)
	hurt = ColorRect.new()
	hurt.color = Color(0.9,0.0,0.0,0.0)
	hurt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hurt.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.add_child(hurt)
	fire_btn = g._button("FIRE\ncure gun",fire)
	fire_btn.add_theme_font_size_override("font_size",22)
	fire_btn.add_theme_stylebox_override("normal",g._panel(Color("12a58a"),22))
	fire_btn.add_theme_stylebox_override("hover",g._panel(Color("18c2a2"),22))
	fire_btn.add_theme_stylebox_override("pressed",g._panel(Color("0c7a66"),22))
	layer.add_child(fire_btn)
	call_btn = g._button("CALL PLAYERS",call_help)
	call_btn.add_theme_font_size_override("font_size",17)
	call_btn.add_theme_stylebox_override("normal",g._panel(Color("b8452f"),12))
	layer.add_child(call_btn)
	var hb := bar(layer,Vector2.ZERO,Vector2(340,30),Color("43d65a"))
	hp_bg = hb[0]
	hp_fill = hb[1]
	var bb := bar(layer,Vector2.ZERO,Vector2(620,30),Color("e5392e"))
	boss_bg = bb[0]
	boss_fill = bb[1]
	boss_lbl = out_label(24,Color("ffb0a0"))
	boss_lbl.size = Vector2(900,32)
	layer.add_child(boss_lbl)
	power_lbl = out_label(22,Color("ffe28a"))
	power_lbl.size = Vector2(900,30)
	layer.add_child(power_lbl)

func hud(p: Vector3) -> void:
	var show: bool = not g.paused and not (g.explore != null and bool(g.explore.on))
	if layer == null:
		build_hud()
	layer.visible = show
	if hurt.color.a > 0.0:
		hurt.color.a = maxf(0.0,hurt.color.a-0.02)
	# Screen shake and the dark red sky belong to the boss.
	var cam: Camera3D = g.camera
	if shake > 0.0:
		shake = maxf(0.0,shake-0.016)
		cam.h_offset = randf_range(-1.0,1.0)*0.25*minf(shake,1.0)
		cam.v_offset = randf_range(-1.0,1.0)*0.25*minf(shake,1.0)
	elif cam.h_offset != 0.0 or cam.v_offset != 0.0:
		cam.h_offset = 0.0
		cam.v_offset = 0.0
	if not o.active:
		set_sky(move_toward(sky,1.0 if b_on else 0.0,0.01))
	acc += 0.016
	if acc < 0.1:
		return
	acc = 0.0
	var vs: Vector2 = g.get_viewport().get_visible_rect().size
	fire_btn.position = Vector2(vs.x-248.0-14.0-170.0,vs.y-124.0-104.0)
	fire_btn.size = Vector2(170,92)
	fire_btn.visible = not w.busy()
	call_btn.position = Vector2(150,172)
	call_btn.size = Vector2(176,38)
	hp_bg.visible = not o.active and (hp < 99.5 or b_on)
	hp_bg.position = Vector2(vs.x*0.5-170.0,vs.y-96.0)
	var f := clampf(hp/100.0,0.0,1.0)
	hp_fill.size.x = 332.0*f
	hp_fill.color = Color("43d65a") if f > 0.5 else (Color("e8c23a") if f > 0.25 else Color("e5392e"))
	boss_bg.visible = b_on
	boss_lbl.visible = b_on
	power_lbl.visible = b_on
	if b_on:
		boss_lbl.position = Vector2(vs.x*0.5-450.0,128.0)
		boss_bg.position = Vector2(vs.x*0.5-310.0,162.0)
		power_lbl.position = Vector2(vs.x*0.5-450.0,194.0)
		boss_fill.size.x = 612.0*clampf(b_hp/BOSS_HP,0.0,1.0)
		var left := maxi(0,int(BOSS_TIME-b_t))
		boss_lbl.text = "%s   %d:%02d" % [boss_name(),left/60,left % 60]
		var np := players_here()
		if np >= BOSS_NEED:
			power_lbl.text = "POWER x%d!  %d players  ·  FIRE!" % [int(POWER),np]
			power_lbl.add_theme_color_override("font_color",Color("8dffb0") if int(clk*4.0) % 2 == 0 else Color("ffe28a"))
		else:
			power_lbl.text = "%d/%d players: too strong alone! Tap CALL PLAYERS" % [np,BOSS_NEED]
			power_lbl.add_theme_color_override("font_color",Color("ffb08a"))

func set_sky(v: float) -> void:
	if is_equal_approx(v,sky):
		return
	sky = v
	if absf(float(g.infect_amt)-v) > 0.004:
		g.infect_amt = v
		g._daynight_apply(true)

# ---------- save ----------
func save_state(file: ConfigFile, sec: String) -> void:
	file.set_value(sec,"cu_day",day)
	file.set_value(sec,"cu_cured",cured)
	file.set_value(sec,"cu_rescued",rescued)
	file.set_value(sec,"cu_brutes",brutes)
	file.set_value(sec,"cu_paid",paid)
	file.set_value(sec,"cu_traps",trap_mask)
	file.set_value(sec,"boss_won",boss_won)
	file.set_value(sec,"boss_day",boss_day)

func load_state(file: ConfigFile, sec: String) -> void:
	day = String(file.get_value(sec,"cu_day",""))
	cured = maxi(0,int(file.get_value(sec,"cu_cured",0)))
	rescued = clampi(int(file.get_value(sec,"cu_rescued",0)),0,Q_RESCUE)
	brutes = maxi(0,int(file.get_value(sec,"cu_brutes",0)))
	paid = int(file.get_value(sec,"cu_paid",0)) & 7
	trap_mask = int(file.get_value(sec,"cu_traps",0)) & ((1 << Q_RESCUE)-1)
	boss_won = bool(file.get_value(sec,"boss_won",false))
	boss_day = String(file.get_value(sec,"boss_day",""))

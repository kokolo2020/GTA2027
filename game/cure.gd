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
const CHARGE_HIT := 5.0      # v0.73: every hit charges the CURE BLAST; a cure charges it more
const CHARGE_CURE := 12.0
const BLAST := 100.0         # boss damage of one blast before the 3-player power (25 shots' worth)
const BLAST_R := 16.0        # every infected this close to you is cured by the blast
const MINION := [3.3,60.0,1.2,6.0]   # the boss's small minions: speed, notice range, bite reach, damage per second (weak)
const MINION_MAX := 10
const MINION_WAVE := 4
const BossModels := preload("res://boss_models.gd")
const BOSS_NAMES := {"paris":"THE EMBER DRAGON","tokyo":"THE NEON SERPENT","newyork":"THE STONE TITAN","bangkok":"THE RIVER KRAKEN"}
# v0.77: each boss is a different creature with its own attacks. atk: the attacks it cycles through
#   slam = a red ring under you; meteor = fireballs around you; breath = a cone of fire from its mouth; line = a row of blasts
#   from it through you; coil = a ring round you (stand in the middle); zigzag = a weaving trail of blasts; stomp = a ring
#   round it; rockfall = rocks over the whole lair; quake = two rings round it; cross = a plus round you;
#   tentacles = a ring of tentacles round you; wave = a wall of water sweeping across.
const ATK_NAMES := {"meteor":"METEOR RAIN","breath":"FIRE BREATH","line":"VENOM STRIKE","coil":"CONSTRICT","zigzag":"VENOM SPIT","stomp":"ROCK STOMP","rockfall":"ROCKFALL","quake":"EARTHQUAKE","cross":"RIVER CROSS","tentacles":"TENTACLE GRAB","wave":"TIDAL WAVE"}
# v0.76: every city's boss is its own monster: look, size, health, speed, signature attack, minions and music pitch.
#   sig: the second attack. meteor = five fireballs around you; line = a row of blasts from the boss straight through you;
#   stomp = everything near the boss explodes (run away from it); cross = a plus-shaped pattern centred on you.
const BOSSES := {
	"paris":{"body":"3a1010","skin":"6a8a50","glow":"ff3a1a","fire":"ff7a1f","scale":3.6,"hp":12000.0,"pace":1.0,"sig":"meteor","sig_name":"METEOR RAIN","minion":"a01818","wave":4,"pitch":1.0,"deco":"horns","model":"dragon","hover":0.55,"atk":["breath","meteor","slam","breath"],"anim":1.0},
	"tokyo":{"body":"2a0f4a","skin":"ff5ad0","glow":"3af0ff","fire":"ff4ae0","scale":3.9,"hp":10000.0,"pace":1.6,"sig":"line","sig_name":"VENOM STRIKE","minion":"d020c0","wave":4,"pitch":1.1,"deco":"oni","model":"serpent","hover":0.0,"atk":["line","coil","zigzag","line"],"anim":1.5},
	"newyork":{"body":"1c1c26","skin":"c9a23a","glow":"ffd23a","fire":"ffe27a","scale":4.6,"hp":15000.0,"pace":0.65,"sig":"stomp","sig_name":"ROCK STOMP","minion":"b08a1a","wave":3,"pitch":0.9,"deco":"crown","model":"golem","hover":0.0,"atk":["slam","stomp","rockfall","quake"],"anim":0.7},
	"bangkok":{"body":"0f3a3a","skin":"3ad0a0","glow":"3affc0","fire":"3ad0ff","scale":4.0,"hp":12000.0,"pace":0.75,"sig":"cross","sig_name":"RIVER CROSS","minion":"1a9a80","wave":6,"pitch":1.0,"deco":"fins","model":"kraken","hover":0.0,"atk":["cross","tentacles","wave"],"anim":1.0},
}
const WIN_PAY := 100000      # every player in the fight, the first win in each city each day
const WIN_AGAIN := 10000     # later wins in the same city on the same day
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
var charge := 0.0            # 0..100, the CURE BLAST meter
var blast_btn: Button
# v0.73: during a boss fight the screen is stripped down to the stick, FIRE, BLAST, the boss and your health
var simple_on := false
var hidden: Array = []
var stick_view: Control
var toast: Label
var leave_btn: Button
var clk := 0.0
var acc := 0.0
var warn_t := 0.0
var call_t := -100.0
var force_players := 0       # tests only
var arena_ok := false
var arena_l := Vector2.ZERO
var arena_r := 9.0           # how far the boss paces from the middle of its lair
var arena_clear := 9.0       # radius of open ground (no buildings, no trees) around the middle of the lair
var sleeper: Node3D          # the boss before it wakes: buried to the chest
var b_rise := 0.0            # seconds since it started climbing out of the ground
var b_fire: Array = []       # the wall of flames round the lair while it is awake
var b_bolt := 4.0            # seconds to the next lightning
var b_enraged := false
# v0.73.1: casting. 1 = cure bolt (one arm thrust forward), 2 = blast (both arms up, then slammed down)
var shield_t := 0.0          # v0.75 tank: seconds of shield left (damage cut by 80%)
var bubble: MeshInstance3D
const SHIELD_TIME := 7.0
const HEAL_R := 22.0
const HEAL_AMT := 60.0
var party_t := 0.0           # seconds of victory fireworks left
var party_next := 0.0
var party_at := Vector3.ZERO
var home_t := 0.0            # after a lost fight: seconds until everyone is sent home
var cast_kind := 0
var cast_lean_on := false    # v0.77.2: the body lean/hop of a cast is on and must be reset afterwards
var cast_t := 0.0
var cast_len := 0.0
var cast_hold := -1.0        # tests only: freeze the cast at this moment
var orb: MeshInstance3D
var b_minion := 6.0          # seconds until the boss throws out its next wave of minions
var b_kind := 0              # (v0.77: unused) which attack is coming
var b_atk := 0               # v0.77: index into this boss's attack list
var b_pat := "slam"          # v0.77: the attack that is on now
var models                   # v0.77: boss_models.gd
var b_mets: Array = []       # meteor rain: [ring, fireball, Vector3 local target]
var flash: ColorRect
var title_lbl: Label
var title_t := 0.0
var music: AudioStreamPlayer
var mus_ev: Array = []       # notes still to render: [type, first sample, samples, freq, volume]
var mus_buf := PackedFloat32Array()
var mus_i := 0
var mus_off := 0
var mus_bytes := PackedByteArray()
var mus_pack := -1
const MUS_SR := 16000
const MUS_LEN := 204800      # 8 bars at 150 bpm
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

func boss() -> Dictionary:
	return BOSSES.get(String(w.W["save"]),BOSSES["paris"])

func bhp() -> float:
	return float(boss()["hp"])

func boss_name() -> String:
	return String(BOSS_NAMES.get(String(w.W["save"]),"THE BOSS"))

func local(p: Vector3) -> Vector2:
	return Vector2(p.x-w.C.x,p.z-w.C.z)

func world(l: Vector2) -> Vector3:
	return w.C+Vector3(l.x,0,l.y)

func arena() -> Vector2:
	# The boss lair: the widest open ground in the city. No buildings and no trees inside the circle,
	# away from the portal, the safe zone and the landmark.
	if arena_ok:
		return arena_l
	arena_ok = true
	var lm: Vector2 = w.W.get("lm",Vector2.ZERO)
	var rp: Vector2 = w.RET
	var area: Rect2 = w.AREA
	var x0 := maxf(area.position.x+26.0,rp.x-170.0)
	var x1 := minf(area.end.x-26.0,rp.x+170.0)
	var z0 := maxf(area.position.y+26.0,rp.y-170.0)
	var z1 := minf(area.end.y-26.0,rp.y+170.0)
	for rr: float in [22.0,18.0,14.0,11.0,8.0]:
		var best := Vector2.ZERO
		var best_score := -1e9
		var z := z0
		while z <= z1:
			var x := x0
			while x <= x1:
				var c := Vector2(x,z)
				x += 7.0
				var dp := c.distance_to(rp)
				if dp < rr+14.0 or c.distance_to(lm) < w.lm_radius()+rr or c.distance_to(o.inf.post_local()) < rr+float(o.inf.SAFE_R)+4.0:
					continue
				if w.in_building(c,1.0):
					continue
				var ok := true
				for j in 24:
					var rad := rr if j < 16 else rr*0.5
					var q := c+Vector2(cos(float(j)*TAU/(16.0 if j < 16 else 8.0)),sin(float(j)*TAU/(16.0 if j < 16 else 8.0)))*rad
					if w.in_building(q,1.0):
						ok = false
						break
				if not ok:
					continue
				var trees := 0
				for t: Vector2 in w.tree_pts:
					if t.distance_to(c) < rr+1.5:
						trees += 1
				var score := -float(trees)*40.0-dp*0.2
				if score > best_score:
					best_score = score
					best = c
			z += 7.0
		if best_score > -1e8 and (best_score > -80.0 or rr <= 8.0):
			arena_l = best
			arena_clear = rr
			arena_r = clampf(rr-8.0,2.5,12.0)
			return arena_l
	arena_l = free_spot(rp+Vector2(30,0))
	arena_clear = 6.0
	arena_r = 2.5
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
	var cols := {"walker":Color("6a7d3a"),"runner":Color("7a3a3a"),"brute":Color("5a6a35"),"minion":Color(String(boss()["minion"]))}
	var zn: Node3D = o.figure(props,Vector3(s.x,0,s.y),cols[kind],Color("8fcf5a"),true)
	if kind == "minion":
		# Small, quick and weak: one shot each. They glow red so you can tell them from the infected.
		zn.scale = Vector3(0.58,0.58,0.58)
		g._fc_part(zn,g._bsph(0.2),Vector3(0,2.15,0),g._fc_glow(Color("ff3a1a")))
		for sx: float in [-1.0,1.0]:
			var horn: MeshInstance3D = g._fc_part(zn,g._bcone(0.0,0.06,0.3),Vector3(sx*0.15,1.9,0.02),g._material(Color("1a0d0d")))
			horn.rotation.z = -sx*0.5
	elif kind == "brute":
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
	# A ritual ground: scorched earth, glowing cracks, a ring of black spikes and the giant half buried in the middle.
	var a := arena()
	var c := Vector3(a.x,0,a.y)
	var lr := maxf(arena_clear-2.0,5.0)
	var rng := RandomNumberGenerator.new()
	rng.seed = 7300+idx
	var scorch := StandardMaterial3D.new()
	scorch.albedo_color = Color(0.05,0.03,0.03,0.82)
	scorch.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	scorch.roughness = 1.0
	g._fc_part(props,g._bcone(lr,lr,0.04),c+Vector3(0,0.06,0),scorch)
	g._fc_part(props,g._fc_torus(lr-0.35,lr),c+Vector3(0,0.12,0),g._fc_glow(Color(String(boss()["glow"]))))
	g._fc_part(props,g._fc_torus(lr*0.55,lr*0.55+0.22),c+Vector3(0,0.12,0),g._fc_glow(Color("a01a10")))
	g._fc_part(props,g._fc_torus(lr*0.22,lr*0.22+0.16),c+Vector3(0,0.12,0),g._fc_glow(Color("ff7a2a")))
	for k in 14:
		var ang := float(k)*TAU/14.0+rng.randf_range(-0.15,0.15)
		var ln := rng.randf_range(lr*0.35,lr*0.9)
		var crack: MeshInstance3D = g._fc_part(props,g._bbox(),c+Vector3(cos(ang)*ln*0.55,0.11,sin(ang)*ln*0.55),g._fc_glow(Color("ff5a1a") if k % 2 == 0 else Color("ffb03a")),Vector3(ln,0.03,rng.randf_range(0.12,0.3)))
		crack.rotation.y = -ang
	var black: StandardMaterial3D = g._material(Color("120c0e"))
	for k in 10:
		var ang2 := float(k)*TAU/10.0+0.2
		var out := Vector3(cos(ang2),0,sin(ang2))
		var h := rng.randf_range(5.0,8.5)
		var spike: MeshInstance3D = g._fc_part(props,g._bcone(0.04,0.9,h),c+out*lr+Vector3(0,h*0.45,0),black)
		spike.rotation = Vector3(out.z*0.32,0,-out.x*0.32)
		g._fc_part(props,g._bcone(0.02,0.4,h*0.5),c+out*(lr+1.3)+Vector3(0,h*0.22,0),black).rotation = Vector3(out.z*-0.25,0,out.x*0.25)
		g._fc_part(props,g._bsph(0.3),c+out*(lr-h*0.14)+Vector3(0,h*0.9,0),g._fc_glow(Color(String(boss()["glow"]))))
	var embers := CPUParticles3D.new()
	embers.position = c+Vector3(0,0.3,0)
	embers.amount = 22
	embers.lifetime = 4.0
	embers.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX
	embers.emission_box_extents = Vector3(lr*0.7,0.1,lr*0.7)
	embers.direction = Vector3(0,1,0)
	embers.spread = 20.0
	embers.gravity = Vector3(0,0.4,0)
	embers.initial_velocity_min = 0.8
	embers.initial_velocity_max = 2.2
	var em := SphereMesh.new()
	em.radius = 0.07
	em.height = 0.14
	em.radial_segments = 4
	em.rings = 2
	em.material = g._fc_glow(Color("ff8a2a"))
	embers.mesh = em
	embers.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	props.add_child(embers)
	var lb1: Label3D = w.label(props,"BOSS LAIR",c+Vector3(0,11.0,0),Color("ff6a4a"),72)
	lb1.visibility_range_end = 300.0
	w.label(props,"%s sleeps here  ·  wake it with %d players" % [boss_name(),BOSS_NEED],c+Vector3(0,9.4,0),Color("ffd0c0"),38).visibility_range_end = 160.0
	make_sleeper()
	music_begin()

func make_sleeper() -> void:
	# The giant, buried to the chest, waiting.
	if props == null or not is_instance_valid(props) or b_on or is_instance_valid(sleeper):
		return
	var a := arena()
	var bd := boss()
	var bs: float = bd["scale"]
	sleeper = creature(String(bd["model"]),Vector3(a.x,-float(BossModels.SINK[String(bd["model"])])*bs,a.y))
	sleeper.scale = Vector3(bs,bs,bs)
	sleeper.rotation.y = atan2(w.RET.x-a.x,w.RET.y-a.y)

func creature(kind: String, pos: Vector3) -> Node3D:
	# v0.77: the boss's own shape (boss_models.gd).
	if models == null:
		models = BossModels.new(g)
	var n: Node3D = models.build(kind)
	n.position = pos
	props.add_child(n)
	return n

func boss_dress(n: Node3D) -> void:
	# Burning eyes and a glowing chest for all of them; the rest is each boss's own.
	var bd := boss()
	var glow := Color(String(bd["glow"]))
	var dark: StandardMaterial3D = g._material(Color("15101a"))
	for sx: float in [-1.0,1.0]:
		g._fc_part(n,g._bsph(0.045),Vector3(sx*0.075,1.66,0.17),g._fc_glow(glow))
	g._fc_part(n,g._bsph(0.16),Vector3(0,1.25,0.12),g._fc_glow(glow))
	match String(bd["deco"]):
		"horns":
			# The Iron Ghoul: short black horns.
			for sx: float in [-1.0,1.0]:
				var horn: MeshInstance3D = g._fc_part(n,g._bcone(0.0,0.07,0.42),Vector3(sx*0.16,1.92,0.02),dark)
				horn.rotation.z = -sx*0.5
		"oni":
			# The Neon Oni: long swept horns, a neon collar and glowing bands on the arms.
			for sx: float in [-1.0,1.0]:
				var h2: MeshInstance3D = g._fc_part(n,g._bcone(0.0,0.06,0.75),Vector3(sx*0.2,2.02,0.0),g._fc_glow(Color("ff4ae0")))
				h2.rotation.z = -sx*0.75
				g._fc_part(n,g._fc_torus(0.09,0.12),Vector3(sx*0.3,1.15,0.0),g._fc_glow(glow)).rotation.z = PI*0.5
			g._fc_part(n,g._fc_torus(0.2,0.25),Vector3(0,1.5,0),g._fc_glow(glow))
			g._fc_part(n,g._fc_torus(0.26,0.3),Vector3(0,0.95,0),g._fc_glow(Color("ff4ae0")))
		"crown":
			# The Times Titan: a golden crown and heavy golden shoulders.
			for k in 7:
				var ca := float(k)*TAU/7.0
				g._fc_part(n,g._bcone(0.0,0.045,0.26),Vector3(cos(ca)*0.14,1.95,sin(ca)*0.14),g._fc_glow(glow))
			g._fc_part(n,g._fc_torus(0.13,0.17),Vector3(0,1.82,0),g._fc_glow(glow))
			for sx: float in [-1.0,1.0]:
				g._fc_part(n,g._bsph(0.17),Vector3(sx*0.3,1.46,0),g._material(Color("c9a23a")))
		"fins":
			# The River Giant: a crest of fins down its back and two tusks.
			for k in 4:
				var fin: MeshInstance3D = g._fc_part(n,g._bcone(0.0,0.1,0.34),Vector3(0,1.85-0.24*float(k),-0.12-0.03*float(k)),g._fc_glow(glow))
				fin.rotation.x = -0.6
			for sx: float in [-1.0,1.0]:
				var tusk: MeshInstance3D = g._fc_part(n,g._bcone(0.0,0.035,0.24),Vector3(sx*0.07,1.6,0.18),g._material(Color("f2ead0")))
				tusk.rotation.x = 0.5

func simple(on: bool) -> void:
	if on == simple_on:
		return
	simple_on = on
	if on:
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

func despawn() -> void:
	simple(false)
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
		g.touch_buttons.erase(blast_btn)
		g.touch_buttons.erase(leave_btn)
		g.touch_buttons.erase(call_btn)
		layer.queue_free()
	layer = null
	flash = null
	title_lbl = null
	title_t = 0.0
	music_stop()
	sleeper = null
	b_fire.clear()
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
	cast(1)
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
	# Turn to face what you shoot, and send the bolt from the casting hand.
	var aim := Vector3.ZERO
	if best >= 0:
		aim = w.C+(list[best][0] as Node3D).position-p
	elif b_on and is_instance_valid(b_node) and local(w.C+b_node.position).distance_to(lp) < BOSS_RANGE:
		aim = w.C+b_node.position-p
	aim.y = 0.0
	if aim.length() > 0.2:
		g.player.rotation.y = atan2(-aim.x,-aim.z)
		from = p+Vector3(0,0.45,0)+aim.normalized()*0.75
	if best >= 0:
		var zn2: Node3D = list[best][0]
		beam(from,w.C+zn2.position+Vector3(0,1.2*zn2.scale.y,0))
		hit_zombie(list,best)
		add_charge(CHARGE_HIT)
	elif b_on and is_instance_valid(b_node) and local(w.C+b_node.position).distance_to(lp) < BOSS_RANGE:
		beam(from,w.C+b_node.position+Vector3(0,4.0,0))
		hit_boss(SHOT*power(),true)
		add_charge(CHARGE_HIT)
	else:
		var fwd: Vector3 = -g.camera.global_transform.basis.z
		fwd.y = 0.0
		beam(from,from+fwd.normalized()*GUN_RANGE)
	zap()

func role() -> int:
	return int(g.paris.role) if g.paris != null else 0

func mhp() -> float:
	# The tank has double health.
	return 200.0 if role() == 1 else 100.0

func add_charge(v: float) -> void:
	var was := charge
	charge = minf(100.0,charge+v)
	if was < 100.0 and charge >= 100.0 and not w.dry:
		g._show_toast(["CURE BLAST READY! Tap BLAST (or G): a huge hit on the boss, and it cures everyone around you.","SHIELD SLAM READY! Tap SHIELD (or G): 7 seconds of shield, and everything around you is knocked out.","HEAL WAVE READY! Tap HEAL (or G): heals you and every player near you."][role()])
		g._play_coin()

func blast() -> void:
	# The special attack: a shockwave that cures every infected near you and hits the boss very hard.
	if g.player == null or g.paused or charge < 100.0 or not w.in_paris(g.player.position) or w.busy():
		return
	charge = 0.0
	cast(2)
	var p: Vector3 = g.player.position
	var lp := local(p)
	var list := targets()
	var n := 0
	var rl := role()
	if rl == 2:
		# HEAL WAVE: you are healed to full, every player near you gets health, the infected close by are cured.
		hp = mhp()
		send({"a":"heal","x":snappedf(lp.x,0.1),"z":snappedf(lp.y,0.1)})
		for i in range(list.size()-1,-1,-1):
			var hz: Node3D = list[i][0]
			if is_instance_valid(hz) and Vector2(hz.position.x,hz.position.z).distance_to(lp) < BLAST_R*0.6:
				cure(list,i)
				n += 1
		if b_on and is_instance_valid(b_node) and local(w.C+b_node.position).distance_to(lp) < BOSS_RANGE:
			hit_boss(BLAST*0.3*power(),true)
		heal_fx(p)
		if not w.dry:
			g._show_toast("HEAL WAVE! You are at full health and players within %d m are healed.%s" % [int(HEAL_R)," %d cured." % n if n > 0 else ""])
		return
	if rl == 1:
		shield_t = SHIELD_TIME
	for i in range(list.size()-1,-1,-1):
		var zn: Node3D = list[i][0]
		if is_instance_valid(zn) and Vector2(zn.position.x,zn.position.z).distance_to(lp) < BLAST_R:
			cure(list,i)
			n += 1
	var hit := false
	if b_on and is_instance_valid(b_node) and local(w.C+b_node.position).distance_to(lp) < BOSS_RANGE:
		hit = true
		beam(p+Vector3(0,0.6,0),w.C+b_node.position+Vector3(0,4.0,0))
		blast_fx(w.C+b_node.position+Vector3(0,0.2,0),9.0)
		hit_boss(BLAST*(0.6 if rl == 1 else 1.0)*power(),true)
	blast_fx(p+Vector3(0,-0.7,0),BLAST_R)
	shake = maxf(shake,0.8)
	thud()
	if not w.dry:
		if rl == 1:
			g._show_toast("SHIELD SLAM! Shield up for %d seconds.%s%s" % [int(SHIELD_TIME)," -%d on %s." % [int(BLAST*0.6*power()),boss_name()] if hit else ""," %d cured." % n if n > 0 else ""])
		elif hit:
			g._show_toast("CURE BLAST! -%d on %s%s" % [int(BLAST*power()),boss_name()," and %d cured" % n if n > 0 else ""])
		else:
			g._show_toast("CURE BLAST! %d cured." % n if n > 0 else "CURE BLAST! Nobody was in range.")

func cast(kind: int) -> void:
	cast_kind = kind
	cast_t = 0.0
	cast_len = 0.6 if kind == 1 else (4.5 if kind == 3 else 1.3)

func cast_pose(person: Dictionary, delta: float) -> void:
	# Laid over the walk every frame: the arms cast the spell, a ball of light sits in the hands.
	if cast_kind == 0 or person.is_empty() or not person.has("limbs"):
		if orb != null and is_instance_valid(orb):
			orb.visible = false
		_cast_body(person,0.0,0.0,0.0)
		return
	cast_t += delta
	var u := (cast_hold if cast_hold >= 0.0 else cast_t)/cast_len
	if u >= 1.0:
		cast_kind = 0
		if orb != null and is_instance_valid(orb):
			orb.visible = false
		_cast_body(person,0.0,0.0,0.0)
		return
	var limbs: Dictionary = person["limbs"]
	var al: Node3D = limbs.get("ArmL")
	var ar: Node3D = limbs.get("ArmR")
	var fl: Node3D = limbs.get("ForeArmL")
	var fr: Node3D = limbs.get("ForeArmR")
	var hd: Node3D = limbs.get("Head")
	if orb == null or not is_instance_valid(orb):
		orb = g._fc_part(g.player,g._bsph(0.22),Vector3.ZERO,g._fc_glow(Color("7dffe8")))
		orb.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	orb.visible = true
	# Which way is "forward" for this body's arms? (People models face one way, the player's the other.)
	var fs := 1.0
	if ar != null and ar.get_parent() is Node3D:
		var fwd: Vector3 = -g.player.global_transform.basis.z
		fs = 1.0 if (ar.get_parent() as Node3D).global_transform.basis.z.dot(fwd) > 0.0 else -1.0
	if cast_kind == 3:
		# Victory cheer: both arms up, pumping.
		orb.visible = false
		var wgt := clampf(minf(u/0.08,(1.0-u)/0.15),0.0,1.0)
		var pump := sin(cast_t*9.0)*0.35
		for arm: Node3D in [al,ar]:
			if arm != null:
				var sd := signf(arm.position.x) if absf(arm.position.x) > 0.001 else 1.0
				arm.rotation.x = lerpf(arm.rotation.x,(-2.75+pump*sd)*fs,wgt)
				arm.rotation.z = lerpf(arm.rotation.z,sd*0.3,wgt)
		for fa2: Node3D in [fl,fr]:
			if fa2 != null:
				fa2.rotation.x = lerpf(fa2.rotation.x,-0.2*fs,wgt)
		if hd != null:
			hd.rotation.x = lerpf(hd.rotation.x,-0.3*fs,wgt)
		_cast_body(person,-0.12*wgt,absf(sin(cast_t*7.0))*0.28*wgt,fs)
	elif cast_kind == 1:
		# Cure bolt: the right arm punches straight out, the left hand steadies it, then both relax.
		var k := clampf(minf(u/0.18,(1.0-u)/0.4),0.0,1.0)
		if ar != null:
			ar.rotation.x = lerpf(ar.rotation.x,-1.5*fs,k)
			ar.rotation.z = lerpf(ar.rotation.z,0.0,k)
		if fr != null:
			fr.rotation.x = lerpf(fr.rotation.x,-0.05*fs,k)
		if al != null:
			al.rotation.x = lerpf(al.rotation.x,-1.05*fs,k)
		if fl != null:
			fl.rotation.x = lerpf(fl.rotation.x,-0.75*fs,k)
		orb.position = Vector3(0.0,0.42,-0.7-0.2*k)
		var s1 := 0.6+0.9*k
		orb.scale = Vector3(s1,s1,s1)
		# the whole body throws itself into the shot: a lunge forward, a little hop
		_cast_body(person,0.32*k,0.12*sin(clampf(u/0.5,0.0,1.0)*PI),fs)
	else:
		# Blast: both arms sweep up over the head while the light grows, then slam down to the ground.
		var up := clampf(u/0.3,0.0,1.0)
		var down := clampf((u-0.5)/0.2,0.0,1.0)
		var out := clampf((1.0-u)/0.2,0.0,1.0)
		var ax := lerpf(-3.0,-0.9,down)*fs
		for arm: Node3D in [al,ar]:
			if arm != null:
				var side := signf(arm.position.x) if absf(arm.position.x) > 0.001 else 1.0
				arm.rotation.x = lerpf(arm.rotation.x,ax,up*out)
				arm.rotation.z = lerpf(arm.rotation.z,side*lerpf(0.45,0.1,down),up*out)
		for fa: Node3D in [fl,fr]:
			if fa != null:
				fa.rotation.x = lerpf(fa.rotation.x,lerpf(-0.35,0.0,down)*fs,up*out)
		if hd != null:
			hd.rotation.x = lerpf(hd.rotation.x,lerpf(-0.45,0.3,down)*fs,up*out)
		orb.position = Vector3(0,lerpf(1.55,-0.6,down),lerpf(-0.1,-0.9,down))
		var s2 := lerpf(0.6,2.2,up)*lerpf(1.0,0.4,down)
		orb.scale = Vector3(s2,s2,s2)
		# crouch, leap up with the arms, then slam down leaning into it
		var crouch := -0.18*clampf(u/0.12,0.0,1.0)*clampf((0.3-u)/0.18,0.0,1.0)
		var leap := 0.55*sin(clampf((u-0.12)/0.5,0.0,1.0)*PI)
		var lean_b := lerpf(-0.22*clampf(u/0.3,0.0,1.0),0.5,down)*out
		_cast_body(person,lean_b,crouch+leap,fs)

func _cast_body(person: Dictionary, lean: float, hop: float, fs: float) -> void:
	# v0.77.2: whole-body motion for a cast: lean (+ = forward) and hop (metres up). Reset when the cast ends.
	if person.is_empty() or not person.has("root"):
		return
	var rn := person["root"] as Node3D
	if rn == null:
		return
	if lean == 0.0 and hop == 0.0:
		if cast_lean_on:
			rn.rotation.x = 0.0
			cast_lean_on = false
		return
	rn.rotation.x = lean*fs
	rn.position.y += hop
	cast_lean_on = true

func heal_fx(at: Vector3) -> void:
	if w.dry:
		return
	var ring := MeshInstance3D.new()
	ring.mesh = g._fc_torus(0.8,1.0)
	var m := StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_color = Color(0.5,1.0,0.6,0.9)
	ring.material_override = m
	g.add_child(ring)
	ring.global_position = at+Vector3(0,-0.7,0)
	var col: MeshInstance3D = g._fc_part(g,g._bcone(1.2,1.2,6.0),Vector3.ZERO,m)
	col.global_position = at+Vector3(0,2.0,0)
	var tw: Tween = g.create_tween()
	tw.tween_property(ring,"scale",Vector3(HEAL_R,1.0,HEAL_R),0.7).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tw.parallel().tween_property(col,"position:y",col.position.y+5.0,0.7)
	tw.parallel().tween_property(m,"albedo_color:a",0.0,0.7)
	tw.tween_callback(ring.queue_free)
	tw.tween_callback(col.queue_free)
	g._play_coin()

func blast_fx(at: Vector3, radius: float) -> void:
	if w.dry:
		return
	var ring := MeshInstance3D.new()
	ring.mesh = g._fc_torus(0.8,1.0)
	var m := StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_color = Color(0.45,1.0,0.9,0.9)
	ring.material_override = m
	ring.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	g.add_child(ring)
	ring.global_position = at
	var col: MeshInstance3D = g._fc_part(g,g._bcone(0.6,1.4,14.0),Vector3.ZERO,m)
	col.global_position = at+Vector3(0,7.0,0)
	var tw: Tween = g.create_tween()
	tw.tween_property(ring,"scale",Vector3(radius,1.0,radius),0.45).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tw.parallel().tween_property(col,"scale",Vector3(0.05,1.0,0.05),0.45)
	tw.parallel().tween_property(m,"albedo_color:a",0.0,0.45)
	tw.tween_callback(ring.queue_free)
	tw.tween_callback(col.queue_free)

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
	if kind == "minion":
		# Minions are not people: they burst into sparks, and charge your blast.
		add_charge(CHARGE_CURE)
		g.cash += 10
		if not w.dry:
			g._quick_fx(w.C+at+Vector3(0,0.3,0))
		return
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
	add_charge(CHARGE_CURE)
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

func thunder() -> void:
	tone(1.1,func(t: float) -> float:
		return (randf()*2.0-1.0)*0.55*exp(-t*3.2)*(0.6+0.4*sin(TAU*38.0*t))+sin(TAU*(70.0-30.0*t)*t)*0.4*exp(-t*5.0),-4.0)

func show_title(big: String, small: String, col := Color("ff5a3a"), hold := 3.2) -> void:
	if title_lbl == null or not is_instance_valid(title_lbl) or w.dry:
		return
	title_lbl.text = "%s\n%s" % [big,small]
	title_lbl.add_theme_color_override("font_color",col)
	title_t = hold

# ---------- v0.76: victory ----------
func level_up_now() -> int:
	# Straight to the next level (0 when already at the top).
	if g.legacy_rules:
		return 0
	var table: Array = g._level_table()
	var lv: int = g._level()
	if lv >= table.size():
		return 0
	g.bonus_xp += maxi(int(table[lv])-int(g._xp()),0)
	return lv+1

func victory() -> void:
	roll_day()
	if g.daily != null:
		g.daily.bump("boss")
	var first_today := boss_day != today()
	boss_won = true
	boss_day = today()
	var amount := WIN_PAY if first_today else WIN_AGAIN
	g.cash += amount
	var new_lv := level_up_now() if first_today else 0
	party_t = 10.0
	party_at = arena_pos()
	hp = mhp()
	if hurt != null and is_instance_valid(hurt):
		hurt.color.a = 0.0
	if w.dry:
		return
	var sub := "+%s" % g._money(amount)+("  ·  LEVEL %d!" % new_lv if new_lv > 0 else "")
	show_title("VICTORY!",sub,Color("ffd84a"),6.0)
	g._show_toast("%s IS DEFEATED! Every player in the fight gets %s%s." % [boss_name(),g._money(amount)," and goes up a level" if new_lv > 0 else ""])
	g._feed_add("%s defeated in %s by %d players! +%s each" % [boss_name(),w.W["name"],players_here(),g._money(amount)],"")
	if flash != null and is_instance_valid(flash):
		flash.color.a = 0.8
	cast(3)
	fanfare()
	# Gold bursts out of the ground where the boss fell.
	var gold := CPUParticles3D.new()
	gold.amount = 90
	gold.lifetime = 2.6
	gold.explosiveness = 0.1
	gold.direction = Vector3(0,1,0)
	gold.spread = 28.0
	gold.gravity = Vector3(0,-9.0,0)
	gold.initial_velocity_min = 9.0
	gold.initial_velocity_max = 15.0
	var coin := CylinderMesh.new()
	coin.top_radius = 0.22
	coin.bottom_radius = 0.22
	coin.height = 0.05
	coin.radial_segments = 8
	coin.material = g._fc_glow(Color("ffd23a"))
	gold.mesh = coin
	gold.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	g.add_child(gold)
	gold.global_position = party_at+Vector3(0,0.5,0)
	g.get_tree().create_timer(6.0).timeout.connect(func(): gold.emitting = false)
	g.get_tree().create_timer(9.5).timeout.connect(gold.queue_free)
	# Three golden rings roll out, and a pillar of light stands where it fell.
	for k in 3:
		var ring := MeshInstance3D.new()
		ring.mesh = g._fc_torus(0.8,1.0)
		var rm := StandardMaterial3D.new()
		rm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		rm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		rm.albedo_color = Color(1.0,0.85,0.3,0.9)
		ring.material_override = rm
		g.add_child(ring)
		ring.global_position = party_at+Vector3(0,0.15,0)
		var tw: Tween = g.create_tween()
		tw.tween_interval(0.35*float(k))
		tw.tween_property(ring,"scale",Vector3(arena_clear+6.0,1.0,arena_clear+6.0),1.2).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
		tw.parallel().tween_property(rm,"albedo_color:a",0.0,1.2)
		tw.tween_callback(ring.queue_free)
	var pm := StandardMaterial3D.new()
	pm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	pm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	pm.albedo_color = Color(1.0,0.9,0.5,0.4)
	var pillar: MeshInstance3D = g._fc_part(g,g._bcone(2.2,3.0,70.0),Vector3.ZERO,pm)
	pillar.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	pillar.global_position = party_at+Vector3(0,35.0,0)
	var ptw: Tween = g.create_tween()
	ptw.tween_interval(7.0)
	ptw.tween_property(pm,"albedo_color:a",0.0,2.5)
	ptw.tween_callback(pillar.queue_free)
	g._save_progress()

func firework(at: Vector3, col: Color) -> void:
	if w.dry:
		return
	var fw := CPUParticles3D.new()
	fw.one_shot = true
	fw.explosiveness = 1.0
	fw.amount = 54
	fw.lifetime = 1.7
	fw.emission_shape = CPUParticles3D.EMISSION_SHAPE_SPHERE
	fw.emission_sphere_radius = 0.3
	fw.direction = Vector3(0,1,0)
	fw.spread = 180.0
	fw.gravity = Vector3(0,-5.0,0)
	fw.initial_velocity_min = 7.0
	fw.initial_velocity_max = 13.0
	fw.damping_min = 2.0
	fw.damping_max = 3.5
	var sm := SphereMesh.new()
	sm.radius = 0.2
	sm.height = 0.4
	sm.radial_segments = 4
	sm.rings = 2
	sm.material = g._fc_glow(col)
	fw.mesh = sm
	fw.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	g.add_child(fw)
	fw.global_position = at
	fw.emitting = true
	g.get_tree().create_timer(2.4).timeout.connect(fw.queue_free)
	tone(0.35,func(t: float) -> float: return (randf()*2.0-1.0)*0.5*exp(-t*9.0)+sin(TAU*(140.0-160.0*t)*t)*0.3*exp(-t*8.0),-8.0)

func fanfare() -> void:
	# Four rising notes and a held chord.
	tone(1.6,func(t: float) -> float:
		var notes := [523.25,659.25,783.99,1046.5]
		var i := mini(int(t/0.16),3)
		var f: float = notes[i]
		var lt := t-0.16*float(i) if i < 3 else t-0.48
		var v := sin(TAU*f*t)*0.5+sin(TAU*f*2.0*t)*0.2
		if i == 3:
			v += sin(TAU*659.25*t)*0.3+sin(TAU*783.99*t)*0.3
			return v*0.45*exp(-lt*1.6)
		return v*0.5*exp(-lt*5.0),-4.0)

func party_tick(delta: float) -> void:
	# Fireworks over the lair for ten seconds after a win.
	if party_t <= 0.0:
		return
	party_t -= delta
	party_next -= delta
	if party_next <= 0.0:
		party_next = 0.42
		var cols := [Color("ffd23a"),Color("ff5a8a"),Color("5ad0ff"),Color("8dffb0"),Color("d98aff"),Color("ffffff")]
		var a := randf()*TAU
		var r := randf_range(4.0,arena_clear+8.0)
		firework(party_at+Vector3(cos(a)*r,randf_range(11.0,24.0),sin(a)*r),cols[randi() % cols.size()])

# ---------- boss music: an original loop, made in code a little each frame so nothing stutters ----------
func music_begin() -> void:
	if w.dry or "--smoke-test" in OS.get_cmdline_user_args() or g.has_meta("boss_music") or not mus_ev.is_empty():
		return
	music_score()

func music_score() -> void:
	mus_buf.resize(MUS_LEN)
	mus_buf.fill(0.0)
	mus_ev.clear()
	mus_i = 0
	mus_off = 0
	mus_pack = -1
	var e8 := 3200                                   # one eighth note at 150 bpm
	var roots := [73.42,73.42,58.27,58.27,87.31,87.31,55.0,55.0]
	var chords := [[146.83,174.61,220.0],[116.54,146.83,174.61],[174.61,220.0,261.63],[110.0,138.59,164.81]]
	var lead := [587.33,0,698.46,659.25, 587.33,0,440.0,0, 466.16,0,587.33,523.25, 466.16,0,349.23,0,
		440.0,0,523.25,440.0, 349.23,0,440.0,0, 440.0,554.37,659.25,880.0, 659.25,0,554.37,0]
	for bar in 8:
		for k in 8:
			var s0 := (bar*8+k)*e8
			mus_ev.append([0,s0,e8,float(roots[bar])*(2.0 if k == 3 or k == 6 else 1.0),0.34])
			mus_ev.append([3,s0,900,0.0,0.1 if k % 2 == 0 else 0.16])
			if k % 2 == 0:
				mus_ev.append([1,s0,2600,0.0,0.6])
			if k == 2 or k == 6:
				mus_ev.append([2,s0,2600,0.0,0.3])
			if bar == 7 and k >= 4:
				mus_ev.append([2,s0,1500,0.0,0.22])
		for q in 4:
			var f: float = float(lead[bar*4+q])
			if f > 0.0:
				mus_ev.append([5,(bar*4+q)*e8*2,9600,f,0.2])
	for ch in 4:
		for note in chords[ch]:
			# long notes are cut into beats so one frame never renders more than a beat of sound
			for seg in 8:
				mus_ev.append([4,ch*16*e8+seg*2*e8,2*e8,float(note),0.085,ch*16*e8])

func music_step(budget_ms: int) -> void:
	# Renders notes until the time for this frame is used up; then packs the samples, then stores the loop.
	if mus_ev.is_empty() and mus_pack < 0:
		return
	var t0 := Time.get_ticks_msec()
	while mus_i < mus_ev.size():
		var ev: Array = mus_ev[mus_i]
		var kind: int = ev[0]
		var s0: int = ev[1]
		var n: int = ev[2]
		var f: float = ev[3]
		var vol: float = ev[4]
		var inv := 1.0/float(MUS_SR)
		for i in n:
			var idx_s := (s0+i) % MUS_LEN
			var t := float(i)*inv
			var v := 0.0
			match kind:
				0:
					var ph := TAU*f*t
					v = (sin(ph)+0.5*sin(ph*2.0)+0.33*sin(ph*3.0))*exp(-t*7.0)
				1:
					v = sin(TAU*(46.0*t+4.2*(1.0-exp(-t*22.0))))*exp(-t*16.0)
				2:
					v = (randf()*2.0-1.0)*exp(-t*20.0)+0.4*sin(TAU*185.0*t)*exp(-t*26.0)
				3:
					v = (randf()*2.0-1.0)*exp(-t*70.0)
				4:
					var ta := float(s0+i-int(ev[5]))*inv
					var ph4 := TAU*f*ta
					v = (sin(ph4)+sin(ph4*1.006)+0.45*sin(ph4*2.0))*(0.7+0.3*sin(TAU*7.5*ta))*minf(ta*18.0,1.0)*minf((3.2-ta)*6.0,1.0)
				5:
					var ph5 := TAU*f*t
					v = sin(ph5)*exp(-t*4.5)+0.4*sin(ph5*2.01)*exp(-t*8.0)
			mus_buf[idx_s] += v*vol
		mus_i += 1
		if Time.get_ticks_msec()-t0 >= budget_ms:
			return
	if mus_pack < 0:
		mus_pack = 0
		mus_bytes.resize(MUS_LEN*2)
	while mus_pack < MUS_LEN:
		var end := mini(MUS_LEN,mus_pack+16000)
		for i in range(mus_pack,end):
			mus_bytes.encode_s16(i*2,int(clampf(mus_buf[i]*0.66,-1.0,1.0)*30000.0))
		mus_pack = end
		if Time.get_ticks_msec()-t0 >= budget_ms:
			return
	var wav := AudioStreamWAV.new()
	wav.format = AudioStreamWAV.FORMAT_16_BITS
	wav.mix_rate = MUS_SR
	wav.stereo = false
	wav.data = mus_bytes
	wav.loop_mode = AudioStreamWAV.LOOP_FORWARD
	wav.loop_begin = 0
	wav.loop_end = MUS_LEN
	g.set_meta("boss_music",wav)
	mus_ev.clear()
	mus_buf = PackedFloat32Array()
	mus_bytes = PackedByteArray()
	mus_pack = -1
	if b_on:
		music_play()

func music_play() -> void:
	if w.dry or not g.has_meta("boss_music") or (music != null and is_instance_valid(music) and music.playing):
		return
	if music == null or not is_instance_valid(music):
		music = AudioStreamPlayer.new()
		music.volume_db = -7.0
		g.add_child(music)
	music.stream = g.get_meta("boss_music")
	music.pitch_scale = float(boss()["pitch"])*(1.12 if b_enraged else 1.0)
	music.play()
	if g.radio_player != null and is_instance_valid(g.radio_player):
		g.radio_player.stream_paused = true

func music_stop() -> void:
	if music != null and is_instance_valid(music):
		music.stop()
	if g.radio_player != null and is_instance_valid(g.radio_player):
		g.radio_player.stream_paused = false

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
	shield_t = maxf(0.0,shield_t-delta)
	if shield_t > 0.0 and (bubble == null or not is_instance_valid(bubble)):
		var bmat := StandardMaterial3D.new()
		bmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		bmat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		bmat.albedo_color = Color(0.45,0.75,1.0,0.28)
		bmat.cull_mode = BaseMaterial3D.CULL_DISABLED
		bubble = g._fc_part(g.player,g._bsph(1.5),Vector3(0,0.2,0),bmat)
		bubble.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	if bubble != null and is_instance_valid(bubble):
		bubble.visible = shield_t > 0.0
	music_step(4)
	party_tick(delta)
	if home_t > 0.0:
		home_t -= delta
		if home_t <= 0.0:
			# The fight was lost: everyone goes home to the Portal Summit.
			w.go_home()
			return
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
		var spec: Array = MINION if String(z[2]) == "minion" else o.inf.SPEC[String(z[2])]
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
	elif hp > 0.0 and hp < mhp():
		hp = minf(mhp(),hp+(14.0 if safe else 3.0)*delta)

func damage(amount: float) -> void:
	hp -= amount*(0.2 if shield_t > 0.0 else 1.0)
	if hurt != null:
		hurt.color.a = 0.35

func die() -> void:
	hp = mhp()
	shield_t = 0.0
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
	if not b_on and w.near(p,arena_pos(),maxf(arena_clear-1.0,7.0)):
		return "WAKE THE BOSS"
	return ""

func owns(txt: String) -> bool:
	return txt == "WAKE THE BOSS"

func interact(_txt: String) -> void:
	wake()

func wake() -> void:
	if b_on or props == null:
		return
	boss_start(bhp(),0.0)
	send({"a":"start","hp":int(b_hp),"e":0})
	call_t = clk
	if not w.dry:
		# Tell the summoner what the call did, so there is no doubt.
		var others := 0
		var now := Time.get_ticks_msec()/1000.0
		for id in g.online_peers:
			if now-float((g.online_peers[id] as Dictionary).get("seen",0.0)) < 8.0:
				others += 1
		if not (g.online_on and int(g.online_state) == 3):
			g._show_toast("You are OFFLINE, so nobody can be called. Turn Online on in the Menu, then wake the boss again.")
		elif others == 0:
			g._show_toast("No other players are online right now. The call keeps going out: anyone who comes online gets a JOIN button.")
		else:
			g._show_toast("Calling %d player%s: a JOIN button is on their screen now." % [others,"" if others == 1 else "s"])

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
		var rhp := clampf(float(p.get("hp",0.0)),0.0,bhp())
		var e := clampf(float(p.get("e",0.0)),0.0,BOSS_TIME)
		if not b_on:
			if rhp > 0.0 and e < BOSS_TIME-5.0:
				boss_start(rhp,e)
		else:
			b_hp = minf(b_hp,rhp)
			b_t = maxf(b_t,e)
	elif a == "hit" and b_on:
		hit_boss(clampf(float(p.get("d",0.0)),0.0,BLAST*POWER),false)
	elif a == "win" and b_on:
		boss_end(true)
	elif a == "heal" and g.player != null:
		# A healer's wave: it reaches you if you stand close enough to them.
		var hc := Vector2(float(p.get("x",1e9)),float(p.get("z",1e9)))
		if hc.distance_to(local(g.player.position)) < HEAL_R and hp < mhp():
			hp = minf(mhp(),hp+HEAL_AMT)
			heal_fx(g.player.position)
			if not w.dry:
				g._show_toast("%s healed you! +%d health" % [g._online_clean_name(String(p.get("n","A healer"))),int(HEAL_AMT)])

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
	if is_instance_valid(sleeper):
		sleeper.queue_free()
	sleeper = null
	var bd := boss()
	var bs: float = bd["scale"]
	var bglow := Color(String(bd["glow"]))
	b_node = creature(String(bd["model"]),Vector3(a.x,-float(BossModels.SINK[String(bd["model"])])*bs,a.y))
	b_node.scale = Vector3(bs,bs,bs)
	b_node.rotation.y = atan2(w.RET.x-a.x,w.RET.y-a.y)
	b_rise = 0.0 if elapsed < 1.0 else 9.0
	b_bolt = 0.4
	b_minion = 6.0
	b_enraged = false
	# A wall of flames closes the ring.
	b_fire.clear()
	var lr := maxf(arena_clear-2.0,5.0)
	for k in 20:
		var fa := float(k)*TAU/20.0
		var fl: MeshInstance3D = g._fc_part(props,g._bcone(0.02,0.55,2.6),Vector3(a.x+cos(fa)*lr,1.3,a.y+sin(fa)*lr),g._fc_glow(Color(String(bd["fire"])) if k % 2 == 0 else bglow.lightened(0.35)))
		b_fire.append(fl)
	show_title(boss_name(),"HAS AWAKENED")
	music_play()
	var lb: Label3D = w.label(b_node,boss_name(),Vector3(0,3.4,0),bglow.lightened(0.2),30)
	lb.visibility_range_end = 400.0
	b_light = OmniLight3D.new()
	b_light.light_color = bglow
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
	rm.albedo_color = Color(bglow.r,bglow.g,bglow.b,0.85)
	b_ring.material_override = rm
	b_ring.visible = false
	props.add_child(b_ring)
	b_mets.clear()
	b_kind = 0
	b_atk = 0
	b_pat = "slam"
	for k in 9:
		var mr := MeshInstance3D.new()
		mr.mesh = g._fc_torus(2.3,2.7)
		mr.material_override = rm
		mr.visible = false
		props.add_child(mr)
		var ball: MeshInstance3D = g._fc_part(props,g._bsph(0.9),Vector3.ZERO,g._fc_glow(Color(String(bd["fire"]))))
		ball.visible = false
		b_mets.append([mr,ball,Vector3.ZERO])
	shake = 2.2
	roar()
	if not w.dry:
		g._show_toast("%s IS AWAKE! It needs %d players: with %d, every shot hits %dx harder. Stay out of the red rings!" % [boss_name(),BOSS_NEED,BOSS_NEED,int(POWER)])

# v0.77.3: your pet fights too. It dashes at the nearest minion and removes it, and with none left it nips at the boss.
const PET_BOSS_DMG := 20.0
var pet_cd := 1.0

func pet_fight(delta: float) -> void:
	if g.pet_on <= 0 or g.pet_node == null or not is_instance_valid(g.pet_node):
		return
	pet_cd -= delta
	if pet_cd > 0.0:
		return
	var pw: Vector3 = g.pet_node.global_position
	var pl: Vector2 = local(pw)
	var best := -1
	var bd := 18.0
	for i in roam.size():
		var z: Array = roam[i]
		if String(z[2]) != "minion" or not is_instance_valid(z[0]):
			continue
		var dd := Vector2(z[0].position.x,z[0].position.z).distance_to(pl)
		if dd < bd:
			bd = dd
			best = i
	var cols := [Color("ffffff"),Color("7ad7ff"),Color("ff5fd2"),Color("ff9a1f"),Color("ffe27a")]
	var pcol: Color = cols[clampi(g.pet_on,0,cols.size()-1)]
	var from: Vector3 = pw-w.C
	if best >= 0:
		pet_cd = 1.4
		var zn: Node3D = roam[best][0]
		var at: Vector3 = zn.position+Vector3(0,0.8,0)
		_pet_bolt(from+Vector3(0,0.5,0),at,pcol)
		_pet_lunge(at-from)
		roam.remove_at(best)
		zn.queue_free()
		add_charge(CHARGE_CURE*0.5)
		if not w.dry:
			g._quick_fx(w.C+at)
		return
	if is_instance_valid(b_node) and b_rise >= 2.4 and Vector2(b_node.position.x,b_node.position.z).distance_to(pl) < 45.0:
		pet_cd = 2.2
		var at2: Vector3 = b_node.position+Vector3(0,float(boss()["scale"])*0.6,0)
		_pet_bolt(from+Vector3(0,0.5,0),at2,pcol)
		_pet_lunge(at2-from)
		hit_boss(PET_BOSS_DMG,true)

func _pet_bolt(a: Vector3, b: Vector3, col: Color) -> void:
	var orb: MeshInstance3D = g._fc_part(props,g._fc_sphere(0.2),a,g._fc_glow(col))
	var tw: Tween = orb.create_tween()
	tw.tween_property(orb,"position",b,0.18)
	tw.tween_callback(orb.queue_free)

func _pet_lunge(dir: Vector3) -> void:
	var d := Vector3(dir.x,0,dir.z)
	if d.length() > 2.0:
		d = d.normalized()*2.0
	var tw: Tween = g.create_tween()
	tw.tween_property(g,"pet_lunge",d,0.1)
	tw.tween_property(g,"pet_lunge",Vector3.ZERO,0.25)

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
	var enraged := b_hp < bhp()*0.5
	if enraged and not b_enraged:
		b_enraged = true
		show_title("ENRAGED!",boss_name()+" is faster and angrier")
		if music != null:
			music.pitch_scale = float(boss()["pitch"])*1.12
	# Flames flicker, lightning strikes.
	for k in b_fire.size():
		if is_instance_valid(b_fire[k]):
			var fs := 1.0+0.35*sin(clk*11.0+float(k)*1.7)+(0.5 if enraged else 0.0)
			(b_fire[k] as MeshInstance3D).scale = Vector3(1.0,fs,1.0)
			(b_fire[k] as MeshInstance3D).position.y = 1.3*fs
	b_bolt -= delta
	if b_bolt <= 0.0:
		b_bolt = randf_range(3.5,6.0) if enraged else randf_range(6.0,10.0)
		if flash != null and is_instance_valid(flash):
			flash.color.a = 0.6
		thunder()
	b_rise += delta
	if is_instance_valid(b_node) and b_rise < 2.4:
		# Climbing out of the ground: the earth shakes, it does not walk yet.
		b_node.position.y = lerpf(-float(BossModels.SINK[String(boss()["model"])])*float(boss()["scale"]),float(boss()["hover"])*float(boss()["scale"]),ease(b_rise/2.4,0.5))
		shake = maxf(shake,0.5)
	elif is_instance_valid(b_node):
		var k := b_t*(0.5 if enraged else 0.32)*float(boss()["pace"])
		var np := Vector2(a.x+cos(k)*arena_r,a.y+sin(k*1.31)*arena_r)
		var mv := np-Vector2(b_node.position.x,b_node.position.z)
		b_node.position.x = np.x
		b_node.position.z = np.y
		var rest := float(boss()["hover"])*float(boss()["scale"])
		b_node.position.y = rest+(0.5*sin(b_t*1.7) if rest > 0.1 else 0.0)
		models.animate(b_node,b_t,float(boss()["anim"])*(1.4 if enraged else 1.0))
		if mv.length() > 0.001:
			b_node.rotation.y = lerp_angle(b_node.rotation.y,atan2(mv.x,mv.y),minf(1.0,3.0*delta))
		if is_instance_valid(b_light):
			b_light.position = Vector3(np.x,5.0,np.y)
			b_light.light_energy = move_toward(b_light.light_energy,3.0+1.2*sin(b_t*5.0),delta*10.0)
		if np.distance_to(local(p)) < 4.5 and not w.dry:
			damage(30.0*delta)
	# Two attacks take turns. Ground slam: one big red ring where you stand, then it explodes.
	# Meteor rain: five small rings around you, a fireball falls on each.
	b_slam -= delta
	if not b_slam_live and b_slam <= 0.0 and b_rise >= 2.4:
		b_slam_live = true
		b_slam_at = Vector3(p.x-w.C.x,0.12,p.z-w.C.z)
		var atk_list: Array = boss()["atk"]
		b_pat = String(atk_list[b_atk % atk_list.size()])
		if b_pat == "slam":
			b_slam = 1.6
			b_ring.position = b_slam_at
			b_ring.visible = true
		else:
			# v0.77: each boss has its own list of attacks, each a different pattern of blasts.
			b_slam = 1.7
			var sig := b_pat
			var bpos := Vector3(b_node.position.x,0.12,b_node.position.z) if is_instance_valid(b_node) else b_slam_at
			var to_me := b_slam_at-bpos
			to_me.y = 0.0
			var dir := to_me.normalized() if to_me.length() > 0.5 else Vector3(1,0,0)
			var side := Vector3(-dir.z,0,dir.x)
			for k in b_mets.size():
				var at := b_slam_at
				var used := true
				match sig:
					"line":
						# a straight row of blasts from the boss through you. Step sideways.
						at = b_slam_at+dir*(float(k)-4.0)*4.6
					"stomp":
						# a ring of blasts all round the boss, and one under it. Get away from it.
						at = bpos if k == 0 else bpos+Vector3(cos(float(k)*TAU/8.0),0,sin(float(k)*TAU/8.0))*7.5
					"cross":
						# a plus centred on you. The corners are safe.
						at = b_slam_at+([Vector3.ZERO,dir,-dir,side,-side,dir*2.0,-dir*2.0,side*2.0,-side*2.0][k] as Vector3)*4.8
					"breath":
						# a cone of fire from the mouth: three rows, three across. The sides are safe.
						at = bpos+dir.rotated(Vector3.UP,(float(k % 3)-1.0)*0.38)*(7.0+5.5*float(k/3))
					"coil":
						# a ring of blasts round you. The middle is safe: stand still.
						used = k < 8
						at = b_slam_at+Vector3(cos(float(k)*TAU/8.0),0,sin(float(k)*TAU/8.0))*6.5
					"zigzag":
						# a weaving trail of blasts from the boss to you.
						at = bpos+dir*clampf(to_me.length(),10.0,30.0)*float(k+1)/9.0+side*(5.0 if k % 2 == 0 else -5.0)
					"rockfall":
						# rocks over the whole lair, and two close to you.
						var ac := Vector3(arena().x,0.12,arena().y)
						at = b_slam_at+Vector3(randf_range(-4.0,4.0),0,randf_range(-4.0,4.0)) if k < 2 else ac+Vector3(randf_range(-1.0,1.0),0,randf_range(-1.0,1.0))*maxf(arena_clear*0.85,6.0)
					"quake":
						# two rings round the boss, with gaps to stand in.
						at = bpos+Vector3(cos(float(k)*TAU/4.0+0.4),0,sin(float(k)*TAU/4.0+0.4))*5.5 if k < 4 else bpos+Vector3(cos(float(k-4)*TAU/5.0),0,sin(float(k-4)*TAU/5.0))*11.5
					"tentacles":
						# one under you and a ring of eight round you at nine steps: move into a gap.
						at = b_slam_at if k == 0 else b_slam_at+Vector3(cos(float(k-1)*TAU/8.0+0.39),0,sin(float(k-1)*TAU/8.0+0.39))*9.0
					"wave":
						# a wall of water in front of the boss, across its path. Run round the end.
						at = bpos+dir*11.0+side*(float(k)-4.0)*4.4
					_:
						# meteor rain: one on you, four scattered round you.
						used = k < 5
						at = b_slam_at+(Vector3.ZERO if k == 0 else Vector3(randf_range(-9.0,9.0),0,randf_range(-9.0,9.0)))
				b_mets[k][2] = at if used else Vector3(0,-500,0)
				(b_mets[k][0] as MeshInstance3D).position = at
				(b_mets[k][0] as MeshInstance3D).visible = used
				(b_mets[k][1] as MeshInstance3D).visible = used
			if not w.dry:
				show_title(String(ATK_NAMES.get(b_pat,"ATTACK")),"")
				title_t = 1.2
	elif b_slam_live and b_pat != "slam":
		for m in b_mets:
			var tp: Vector3 = m[2]
			(m[1] as MeshInstance3D).position = tp+Vector3(4.0,24.0,0)*clampf(b_slam/1.7,0.0,1.0)+Vector3(0,0.9,0)
		if b_slam <= 0.0:
			b_slam_live = false
			b_atk += 1
			b_slam = 3.0 if enraged else 4.6
			shake = 0.7
			thud()
			var burned := false
			for m in b_mets:
				var was_used: bool = (m[0] as MeshInstance3D).visible
				(m[0] as MeshInstance3D).visible = false
				(m[1] as MeshInstance3D).visible = false
				if not w.dry and was_used:
					g._quick_fx(w.C+(m[2] as Vector3))
				if Vector2((m[2] as Vector3).x,(m[2] as Vector3).z).distance_to(local(p)) < 3.2:
					burned = true
			if burned and not w.dry:
				damage(24.0)
	elif b_slam_live:
		var s := 1.0+0.15*sin(b_t*20.0)
		b_ring.scale = Vector3(s,1.0,s)
		if b_slam <= 0.0:
			b_slam_live = false
			b_atk += 1
			b_slam = 3.0 if enraged else 4.6
			b_ring.visible = false
			shake = 0.6
			thud()
			if not w.dry:
				g._quick_fx(w.C+b_slam_at)
				if Vector2(b_slam_at.x,b_slam_at.z).distance_to(local(p)) < 5.5:
					damage(38.0)
	# Minions: every few seconds the boss throws out a wave of small, weak ones that run at the players.
	b_minion -= delta
	if b_minion <= 0.0 and b_rise >= 2.4 and is_instance_valid(b_node):
		b_minion = 8.0 if enraged else 12.0
		var have := 0
		for z in roam:
			if String(z[2]) == "minion":
				have += 1
		var bl := Vector2(b_node.position.x,b_node.position.z)
		var wave: int = int(boss()["wave"])
		for k in mini(wave+(1 if enraged else 0),MINION_MAX-have):
			var ma := float(k)*TAU/float(wave+1)+b_t
			add_zombie(bl+Vector2(cos(ma),sin(ma))*3.5,"minion",true)
		if have < MINION_MAX and not w.dry:
			g._show_toast("%s releases its minions! One shot each: they charge your BLAST." % boss_name())
	pet_fight(delta)
	# Roars at 75, 50 and 25 percent: runners rush in.
	var stage := 3-int(ceil(clampf(b_hp/bhp(),0.0,1.0)*4.0-0.001))
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
		if players_here() < BOSS_NEED and clk-call_t > 8.0:
			call_t = clk
			send({"a":"call","b":1})

func boss_end(won: bool, quiet := false) -> void:
	if not b_on:
		return
	b_on = false
	b_slam_live = false
	music_stop()
	for fl in b_fire:
		if is_instance_valid(fl):
			(fl as MeshInstance3D).queue_free()
	b_fire.clear()
	if not quiet and not w.dry:
		g.get_tree().create_timer(5.0).timeout.connect(make_sleeper)
	for m in b_mets:
		for q in 2:
			if is_instance_valid(m[q]):
				(m[q] as MeshInstance3D).queue_free()
	b_mets.clear()
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
		# Time ran out: the team lost. Everyone is sent home in a moment.
		home_t = 2.5
		if w.dry:
			home_t = 0.0
			w.go_home()
		else:
			show_title("TIME'S UP!","%s wins this round" % boss_name(),Color("ff5a3a"),2.5)
			g._show_toast("Time's up! %s won this round. Back home you go: bring %d players and try again." % [boss_name(),BOSS_NEED])
		return
	shake = 1.5
	victory()

func goto_arena() -> void:
	# A player who tapped JOIN lands just outside the lair.
	var a := arena()
	var s: Vector2 = o.spot(a+(w.RET-a).normalized()*(arena_clear+3.0))
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
	flash = ColorRect.new()
	flash.color = Color(1,1,1,0.0)
	flash.mouse_filter = Control.MOUSE_FILTER_IGNORE
	flash.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.add_child(flash)
	title_lbl = out_label(64,Color("ff5a3a"))
	title_lbl.size = Vector2(1100,190)
	title_lbl.add_theme_constant_override("outline_size",18)
	title_lbl.add_theme_constant_override("line_spacing",-6)
	layer.add_child(title_lbl)
	fire_btn = g._button("FIRE\ncure gun",fire)
	fire_btn.add_theme_font_size_override("font_size",22)
	fire_btn.add_theme_stylebox_override("normal",g._panel(Color("12a58a"),22))
	fire_btn.add_theme_stylebox_override("hover",g._panel(Color("18c2a2"),22))
	fire_btn.add_theme_stylebox_override("pressed",g._panel(Color("0c7a66"),22))
	layer.add_child(fire_btn)
	blast_btn = g._button("BLAST",blast)
	blast_btn.add_theme_font_size_override("font_size",19)
	layer.add_child(blast_btn)
	leave_btn = g._button("LEAVE",func(): w.go_home())
	leave_btn.add_theme_font_size_override("font_size",17)
	layer.add_child(leave_btn)
	stick_view = Control.new()
	stick_view.mouse_filter = Control.MOUSE_FILTER_IGNORE
	stick_view.size = Vector2(180,180)
	stick_view.draw.connect(func():
		stick_view.draw_circle(Vector2(90,90),86,Color(0.05,0.12,0.18,0.55))
		stick_view.draw_arc(Vector2(90,90),85,0,TAU,64,Color(0.8,0.94,0.95,0.6),2,true)
		stick_view.draw_circle(Vector2(90,90)+(g.stick as Vector2)*58,32,Color(0.6,0.87,0.88,0.85)))
	layer.add_child(stick_view)
	toast = out_label(21,Color("fff2c0"))
	toast.size = Vector2(900,30)
	layer.add_child(toast)
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
	# Boss fight = simple screen. The menu (Back / Esc) brings the normal screen back while it is open.
	simple(b_on and show and not o.active)
	stick_view.visible = simple_on
	toast.visible = simple_on
	leave_btn.visible = simple_on
	if simple_on:
		stick_view.queue_redraw()
		toast.text = String(g.status_label.text) if float(g.toast_time) > 0.0 else ""
	if hurt.color.a > 0.0:
		hurt.color.a = maxf(0.0,hurt.color.a-0.02)
	if flash.color.a > 0.0:
		flash.color.a = maxf(0.0,flash.color.a-0.05)
	title_t = maxf(0.0,title_t-0.016)
	title_lbl.visible = title_t > 0.0
	if title_t > 0.0:
		var vs0: Vector2 = g.get_viewport().get_visible_rect().size
		title_lbl.position = Vector2(vs0.x*0.5-550.0,vs0.y*0.26)
		title_lbl.modulate.a = clampf(title_t*2.0,0.0,1.0)
		title_lbl.pivot_offset = Vector2(550,95)
		var ts := 1.0+0.6*clampf(title_t-2.8,0.0,0.4)
		title_lbl.scale = Vector2(ts,ts)
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
	blast_btn.position = Vector2(vs.x-248.0-14.0-170.0,vs.y-124.0-104.0-64.0)
	blast_btn.size = Vector2(170,56)
	blast_btn.visible = not w.busy()
	var ready := charge >= 100.0
	var bname := String(g.paris.ROLES[role()]["btn"])
	blast_btn.text = "⚡ %s!" % bname if ready else "%s %d%%" % [bname,int(charge)]
	var bc := (Color("ffb020") if int(clk*4.0) % 2 == 0 else Color("ff6a2a")) if ready else Color("213d4f").lerp(Color("7a4a1c"),charge/100.0)
	blast_btn.add_theme_stylebox_override("normal",g._panel(bc,18))
	blast_btn.add_theme_stylebox_override("hover",g._panel(bc,18))
	call_btn.position = Vector2(150,172)
	call_btn.size = Vector2(176,38)
	call_btn.visible = not simple_on
	stick_view.position = Vector2(32,vs.y-210.0)
	toast.position = Vector2(vs.x*0.5-450.0,vs.y-150.0)
	leave_btn.position = Vector2(16,16)
	leave_btn.size = Vector2(120,46)
	hp_bg.visible = not o.active and (hp < mhp()-0.5 or b_on)
	hp_bg.position = Vector2(vs.x*0.5-170.0,vs.y-96.0)
	var f := clampf(hp/mhp(),0.0,1.0)
	hp_fill.size.x = 332.0*f
	hp_fill.color = Color("5ab0ff") if shield_t > 0.0 else (Color("43d65a") if f > 0.5 else (Color("e8c23a") if f > 0.25 else Color("e5392e")))
	boss_bg.visible = b_on
	boss_lbl.visible = b_on
	power_lbl.visible = b_on
	if b_on:
		var by := 14.0 if simple_on else 128.0
		boss_lbl.position = Vector2(vs.x*0.5-450.0,by)
		boss_bg.position = Vector2(vs.x*0.5-310.0,by+34.0)
		power_lbl.position = Vector2(vs.x*0.5-450.0,by+66.0)
		boss_fill.size.x = 612.0*clampf(b_hp/bhp(),0.0,1.0)
		var left := maxi(0,int(BOSS_TIME-b_t))
		boss_lbl.text = "%s   %d:%02d" % [boss_name(),left/60,left % 60]
		var np := players_here()
		if np >= BOSS_NEED:
			power_lbl.text = "POWER x%d!  %d players  ·  FIRE!" % [int(POWER),np]
			power_lbl.add_theme_color_override("font_color",Color("8dffb0") if int(clk*4.0) % 2 == 0 else Color("ffe28a"))
		else:
			power_lbl.text = "%d/%d players: too strong alone! Calling all players..." % [np,BOSS_NEED]
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

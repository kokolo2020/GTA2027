# Moved out of main.gd by scripts/extract-module.py (block: v0.50: city careers ... v0.50: homes).
# `game` is the main script: its variables, constants and functions are reached as game.name.
extends RefCounted

var game

func _init(g_main) -> void:
	game = g_main

func _career_rank(i: int) -> int:
	var r = 0
	for k in game.CAREER_RANKS.size():
		if int(game.career_jobs[i]) >= int(game.CAREER_RANKS[k][1]):
			r = k
	return r

func _career_rank_name(i: int) -> String:
	return String(game.CAREER_RANKS[_career_rank(i)][0])

func _career_mult(i: int) -> float:
	return float(game.CAREER_RANKS[_career_rank(i)][2])

func _career_spots() -> Array:
	# Places a job can be: quest stops, checkpoints and direction targets (all on walkable ground,
	# off the road), minus the raceway and anything locked.
	if not game.career_spots.is_empty():
		return game.career_spots
	var raw: Array = []
	for q in game.QUICK:
		raw.append(q["pos"])
	for c in game.CHECKPOINTS:
		if game._place_lock_of(String(c["name"])) < 0 and not game._hidden_place(String(c["name"])):
			raw.append(c["pos"])
	for d in game.DIR_DESTS:
		if game._place_lock_of(String(d["name"])) < 0:
			raw.append(d["pos"])
	for st in game.street_stalls:
		raw.append((st as Vector3)+Vector3(0,0,0))
	for p0 in raw:
		var p = game.road_barrier.kerb_spot(p0)
		if p.x > 200.0 and p.z < -35.0 and p.z > -445.0:
			continue          # raceway
		var dup = false
		for q in game.career_spots:
			if q.distance_to(p) < 20.0:
				dup = true
		if not dup:
			game.career_spots.append(p)
	return game.career_spots

func _career_pick(from: Vector3, dmin: float, dmax: float) -> Vector3:
	var spots = _career_spots()
	var ok: Array = []
	for p in spots:
		var d = Vector2(p.x-from.x,p.z-from.z).length()
		if d >= dmin and d <= dmax:
			ok.append(p)
	if ok.is_empty():
		ok = spots
	return ok[0] if game.career_test else ok[randi() % ok.size()]

func _career_block_reason() -> String:
	if game.race_car:
		return "Finish or quit the race first."
	if game.chase_mode != 0 or game.online_role != 0:
		return "Finish the chase first."
	if game.trial_active >= 0:
		return "Cancel the time trial first."
	if game.bus_riding or game.sky_riding:
		return "Get off first."
	if game.home_in >= 0:
		return "Leave your home first."
	return ""

func _career_start(i: int) -> void:
	if game._level() < int(game.CAREERS[i]["level"]) and not game.career_test:
		game._show_toast("%s opens at level %d." % [game.CAREERS[i]["name"],int(game.CAREERS[i]["level"])])
		return
	var why = _career_block_reason()
	if why != "":
		game._show_toast(why)
		return
	if game.career >= 0:
		_career_end(false)
	game.career = i
	game._apply_car()
	if String(game.CAREERS[i]["id"]) == "police":
		_career_lights(Color("ff3b3b"),Color("3b7bff"))
	if game.paused:
		game._toggle_menu()
	_career_next()
	game._show_toast("Shift started: %s (%s). %s" % [game.CAREERS[i]["name"],_career_rank_name(i),"Get in your car." if not game.driving else "Follow the arrow."])

func _career_lights(left: Color, right: Color) -> void:
	# Roof lights that flash (police from the start of the shift, the ambulance once the patient is on board).
	if not game.career_light.is_empty():
		return
	for sd in [-1,1]:
		var bl = MeshInstance3D.new()
		var bm = BoxMesh.new()
		bm.size = Vector3(0.36,0.12,0.2)
		bl.mesh = bm
		bl.material_override = game._fc_glow(left if sd < 0 else right)
		bl.position = Vector3(float(sd)*0.24,1.27,0.25)
		game.car.add_child(bl)
		game.career_light.append(bl)
		game.police_lights.append([bl,sd])

func _career_lights_off() -> void:
	for bl in game.career_light:
		for L in game.police_lights.duplicate():
			if L[0] == bl:
				game.police_lights.erase(L)
		if is_instance_valid(bl):
			(bl as Node3D).queue_free()
	game.career_light.clear()

func _career_end(announce := true) -> void:
	if game.career < 0:
		return
	if not game.cs.is_empty():
		_cs_finish(false)
	_career_clear_job()
	_career_lights_off()
	_siren(false)
	var was = game.career
	game.career = -1
	game._apply_car()
	if game.cj_bar != null:
		game.cj_bar.hide()
	if announce:
		game._show_toast("Shift over. %s: %d jobs, %s rank." % [game.CAREERS[was]["name"],int(game.career_jobs[was]),_career_rank_name(was)])

func _career_clear_job() -> void:
	for n in game.cj_nodes:
		if is_instance_valid(n):
			(n as Node).queue_free()
	game.cj_nodes.clear()
	if game.cj_hose != null and is_instance_valid(game.cj_hose):
		game.cj_hose.queue_free()
	game.cj_hose = null
	if game.cj_jet != null and is_instance_valid(game.cj_jet):
		game.cj_jet.queue_free()
	game.cj_jet = null
	game.cj = {}

func _cid() -> String:
	return String(game.CAREERS[game.career]["id"]) if game.career >= 0 else ""

func _career_place_name(p: Vector3) -> String:
	# The named place nearest a spot, for "Mia · to Grand Central".
	var best = ""
	var bd = 170.0
	for d in game.DIR_DESTS:
		var q: Vector3 = d["pos"]
		var dd = Vector2(q.x-p.x,q.z-p.z).length()
		if dd < bd:
			bd = dd
			best = String(d["name"])
	return best if best != "" else "across town"

func _career_tag(holder: Node3D, text: String, y: float, col: Color) -> Label3D:
	var tag = Label3D.new()
	tag.text = text
	tag.font_size = 40
	tag.outline_size = 10
	tag.outline_modulate = Color("132b3a")
	tag.modulate = col
	tag.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	tag.fixed_size = true
	tag.pixel_size = 0.0009
	tag.no_depth_test = true
	tag.visibility_range_end = 120.0     # not seen through the whole city
	tag.position = Vector3(0,y,0)
	game._ui3d(tag)
	holder.add_child(tag)
	return tag

func _career_person(at: Vector3, seed_i: int, lying := false, ring_col := Color("ffd23f")) -> Node3D:
	var holder = Node3D.new()
	holder.position = at
	game.add_child(holder)
	var pp = game._cm_person(holder,Vector3.ZERO,randf()*TAU if not game.career_test else 0.0,seed_i)
	if not pp.is_empty():
		pp["walk"] = true
		game._pose_person(pp,0.0,0.0)
		game.cm_people.erase(pp)
		if lying:
			var r: Node3D = (pp["root"] as Node3D).get_parent()
			r.rotation = Vector3(-PI/2.0,r.rotation.y,0)
			r.position.y = 0.25
	holder.set_meta("pp",pp)
	if ring_col.a > 0.0:
		var ring = MeshInstance3D.new()
		var tm = TorusMesh.new()
		tm.inner_radius = 1.3
		tm.outer_radius = 1.6
		ring.mesh = tm
		ring.material_override = game._fc_glow(ring_col)
		ring.position = Vector3(0,0.12,0)
		ring.name = "Ring"
		holder.add_child(ring)
	game.cj_nodes.append(holder)
	return holder

func _cj_pp(holder: Node3D) -> Dictionary:
	return holder.get_meta("pp",{}) if is_instance_valid(holder) else {}

func _cj_anim(holder: Node3D, anim: String) -> void:
	# Career people are posed by code each frame (see _cj_pose_tick): Idle, Walk, Wave, HandsUp.
	if is_instance_valid(holder):
		holder.set_meta("anim",anim)
		_cj_pose(holder)

func _cj_pose(holder: Node3D) -> void:
	var pp = _cj_pp(holder)
	if pp.is_empty():
		return
	var anim = String(holder.get_meta("anim","Idle"))
	if pp.get("ap") != null:
		game._kplay(pp,"Cheer" if anim == "HandsUp" else anim,1.0)
		return
	var limbs: Dictionary = pp.get("limbs",{})
	match anim:
		"Walk":
			game._pose_person(pp,game.clock*9.0,1.0)
		_:
			game._pose_person(pp,0.0,0.0)
	var arm_l: Node3D = limbs.get("ArmL")
	var arm_r: Node3D = limbs.get("ArmR")
	if arm_l == null or arm_r == null:
		return
	match anim:
		"Wave":
			arm_r.rotation = Vector3(-2.7,0,sin(game.clock*10.0)*0.45)
		"HandsUp":
			arm_l.rotation = Vector3(-2.9,0,-0.3)
			arm_r.rotation = Vector3(-2.9,0,0.3)

func _cj_pose_tick() -> void:
	for n in game.cj_nodes:
		if is_instance_valid(n) and (n as Node).has_meta("pp"):
			_cj_pose(n)

func _cj_hands_up(holder: Node3D) -> void:
	_cj_anim(holder,"HandsUp")

func _cj_face(holder: Node3D, at: Vector3) -> void:
	# People face -z, like the player.
	var to = at-holder.global_position
	if Vector2(to.x,to.z).length() > 0.05:
		holder.rotation.y = atan2(-to.x,-to.z)

func _career_fire(at: Vector3) -> Node3D:
	var holder = Node3D.new()
	holder.position = at
	game.add_child(holder)
	var fl = CPUParticles3D.new()
	fl.name = "Flames"
	fl.amount = 40
	fl.lifetime = 0.9
	fl.emission_shape = CPUParticles3D.EMISSION_SHAPE_SPHERE
	fl.emission_sphere_radius = 1.2
	fl.direction = Vector3.UP
	fl.spread = 15.0
	fl.initial_velocity_min = 2.0
	fl.initial_velocity_max = 4.0
	fl.gravity = Vector3(0,1.5,0)
	fl.scale_amount_min = 0.5
	fl.scale_amount_max = 1.1
	var sm = SphereMesh.new()
	sm.radius = 0.35
	sm.height = 0.7
	fl.mesh = sm
	fl.material_override = game._fc_glow(Color("ff7a1a"))
	fl.position = Vector3(0,0.6,0)
	holder.add_child(fl)
	# v0.52: a tall dark smoke column you can see from far across the city.
	var smoke = fl.duplicate() as CPUParticles3D
	smoke.name = "Smoke"
	smoke.amount = 46
	smoke.lifetime = 7.0
	smoke.spread = 8.0
	smoke.initial_velocity_min = 4.0
	smoke.initial_velocity_max = 6.0
	smoke.gravity = Vector3(0.4,0.6,0)
	smoke.damping_min = 0.2
	smoke.damping_max = 0.4
	smoke.scale_amount_min = 3.0
	smoke.scale_amount_max = 6.5
	smoke.material_override = game._material(Color("3a3f45"))
	smoke.position = Vector3(0,2.2,0)
	holder.add_child(smoke)
	var steam = fl.duplicate() as CPUParticles3D
	steam.name = "Steam"
	steam.amount = 36
	steam.lifetime = 2.6
	steam.initial_velocity_min = 2.0
	steam.initial_velocity_max = 3.5
	steam.scale_amount_min = 1.0
	steam.scale_amount_max = 2.2
	steam.material_override = game._material(Color("eef4f7"))
	steam.emitting = false
	steam.position = Vector3(0,0.8,0)
	holder.add_child(steam)
	var ring = MeshInstance3D.new()
	var tm = TorusMesh.new()
	tm.inner_radius = 2.6
	tm.outer_radius = 3.0
	ring.mesh = tm
	ring.material_override = game._fc_glow(Color("ff5a1a"))
	ring.position = Vector3(0,0.12,0)
	ring.name = "Ring"
	holder.add_child(ring)
	game.cj_nodes.append(holder)
	return holder

func _career_next() -> void:
	_career_clear_job()
	if game.career < 0:
		return
	var me: Vector3 = game.car.position if game.driving else game.player.position
	match _cid():
		"taxi":
			var a = _career_pick(me,80.0,380.0)
			var b = _career_pick(a,260.0,900.0)
			var nm: String = game.TAXI_NAMES[0 if game.career_test else randi() % game.TAXI_NAMES.size()]
			var to = _career_place_name(b)
			game.cj = {"stage":0,"step":0,"a":a,"b":b,"t":0.0,"name":nm,"to":to,"fare":0.0,"crash":0,"last":Vector3.INF}
			var h = _career_person(a,3000+randi() % 500)
			_cj_anim(h,"Wave")
			_career_tag(h,"%s · to %s" % [nm,to],2.35,Color("ffe36b"))
			game.cj["p"] = h
		"medic":
			var a = _career_pick(me,100.0,450.0)
			game.cj = {"stage":0,"step":0,"a":a,"b":game.HOSPITAL_DROP,"t":0.0}
			var pat = _career_person(a,3500+randi() % 500,true,Color("ff3b4a"))
			_career_tag(pat,"Patient",1.3,Color("ff9aa5"))
			var by = _career_person(a+Vector3(1.8,0,1.2),3600+randi() % 300,false,Color(0,0,0,0))
			_cj_face(by,a+Vector3(0,0,8))
			_cj_anim(by,"Wave")
			_career_tag(by,"Over here!",2.35,Color("ffffff"))
			game.cj["p"] = pat
			game.cj["by"] = by
		"police":
			var a = _career_pick(me,120.0,450.0)
			var call: String = ["Suspect in a red car","Stolen red car","Red getaway car","Red car ran a red light"][0 if game.career_test else randi() % 4]
			var dir: String = ["north","south","east","west"][0 if game.career_test else randi() % 4]
			game.cj = {"stage":0,"step":0,"a":a,"t":0.0,"call":"%s heading %s near %s" % [call,dir,_career_place_name(a)]}
			_cs_police_radio()
		"fire":
			var a = _career_pick(me,100.0,450.0)
			game.cj = {"stage":0,"step":0,"a":a,"t":0.0,"hp":1.0,"limit":me.distance_to(a)/9.0+35.0,"spray":0.0}
			game.cj["p"] = _career_fire(a)

func _career_target() -> Variant:
	if game.career < 0 or game.cj.is_empty() or int(game.cj["stage"]) >= 3:
		return null
	match _cid():
		"police":
			return null if int(game.cj["stage"]) >= 1 else game.cj["a"]     # the chase guides you once it starts
		"fire":
			return game.cj["a"]
	return game.cj["b"] if int(game.cj["stage"]) == 1 and game.cj.has("b") else game.cj["a"]

func _career_pay(base: int) -> int:
	var pay = int(round(float(base)*_career_mult(game.career)))
	game.cash += pay
	game.bonus_xp += game.CAREER_XP
	game.career_jobs[game.career] = int(game.career_jobs[game.career])+1
	game.career_earned[game.career] = int(game.career_earned[game.career])+pay
	return pay

func _career_rank_line(i: int) -> String:
	var r = _career_rank(i)
	if r+1 >= game.CAREER_RANKS.size():
		return "%s  ·  top rank" % _career_rank_name(i)
	return "%s  ·  %d/%d jobs to %s" % [_career_rank_name(i),int(game.career_jobs[i]),int(game.CAREER_RANKS[r+1][1]),String(game.CAREER_RANKS[r+1][0])]

func _career_job_done(base: int, tip: int, note: String) -> void:
	# The big JOB DONE celebration, then the next job after 3 seconds.
	var before = _career_rank(game.career)
	var pay = _career_pay(base)
	game.cash += tip
	game.career_earned[game.career] = int(game.career_earned[game.career])+tip
	var up = _career_rank(game.career) > before
	var line1 = "Pay %s  ·  Tip %s  ·  +%d XP" % [game._money(pay),game._money(tip),game.CAREER_XP]
	var line2 = ("PROMOTED to %s!" % _career_rank_name(game.career)) if up else _career_rank_line(game.career)
	game._level_up_fx(0,"JOB DONE!","%s\n%s%s" % [line1,line2,("\n"+note) if note != "" else ""])
	game.cj_done_n += 1
	if up:
		game._feed_add("%s was promoted to %s %s!" % [game._my_name(),_career_rank_name(game.career),game.CAREERS[game.career]["name"]],"")
	game.cj["stage"] = 3
	game.cj["step"] = 3
	game.cj["next"] = game.CJ_NEXT
	_siren(false)
	game._save_progress()

func _career_job_failed(msg: String) -> void:
	game._show_toast(msg)
	game.cj["stage"] = 3
	game.cj["step"] = 3
	game.cj["next"] = game.CJ_NEXT
	game.cj["failed"] = true
	_siren(false)

func _career_tick(delta: float) -> void:
	_cs_tick(delta)
	_cj_pose_tick()
	_career_bar_tick()
	if game.career < 0 or game.cj.is_empty() or game.paused or not game.cs.is_empty():
		_fire_hose_tick(false)
		return
	game.cj["t"] = float(game.cj["t"])+delta
	var me: Vector3 = game.car.position if game.driving else game.player.position
	var slow = game.driving and absf(game.car_speed) < 3.5
	var a: Vector3 = game.cj["a"]
	var da = Vector2(me.x-a.x,me.z-a.z).length()
	if int(game.cj["stage"]) == 3:
		game.cj["next"] = float(game.cj["next"])-delta
		if float(game.cj["next"]) <= 0.0:
			_career_next()
		_fire_hose_tick(false)
		return
	match _cid():
		"taxi":
			if int(game.cj["stage"]) == 0:
				if game.driving and slow and da < 9.0:
					_cs_taxi_pickup()
			elif int(game.cj["stage"]) == 1:
				_taxi_meter(delta)
				var b: Vector3 = game.cj["b"]
				if game.driving and slow and Vector2(me.x-b.x,me.z-b.z).length() < 9.0:
					_cs_taxi_dropoff()
		"medic":
			if int(game.cj["stage"]) == 0:
				if game.driving and slow and da < 10.0:
					_cs_medic_load()
			elif int(game.cj["stage"]) == 1:
				if game.driving and slow and Vector2(me.x-game.HOSPITAL_DROP.x,me.z-game.HOSPITAL_DROP.z).length() < 12.0:
					_cs_medic_unload()
		"police":
			if int(game.cj["stage"]) == 0 and game.driving and da < 40.0:
				game.cj["stage"] = 1
				game.cj["step"] = 1
				game.cj["t"] = 0.0
				_siren(true)
				game._chase_start(2)
		"fire":
			if int(game.cj["stage"]) == 0 and not game.driving and da < game.FIRE_SPRAY_RANGE:
				game.cj["stage"] = 1
				game.cj["step"] = 1
				game.cj["late"] = float(game.cj["t"]) > float(game.cj["limit"])
			if int(game.cj["stage"]) == 1:
				var aim = _fire_aimed()
				var spraying = not game.driving and da < game.FIRE_SPRAY_RANGE and aim
				game.cj["spray"] = 1.0 if spraying else 0.0
				if spraying:
					game.cj["hp"] = maxf(0.0,float(game.cj["hp"])-delta/5.0)
				var holder: Node3D = game.cj["p"]
				var fl = holder.get_node_or_null("Flames") as CPUParticles3D
				if fl != null:
					fl.scale_amount_max = 0.3+0.8*float(game.cj["hp"])
					fl.emission_sphere_radius = 0.4+0.8*float(game.cj["hp"])
				if float(game.cj["hp"]) <= 0.0:
					_cs_fire_out()
	_fire_hose_tick(_cid() == "fire" and not game.cj.is_empty() and int(game.cj["stage"]) <= 1)

func _taxi_meter(delta: float) -> void:
	# The fare grows with the distance you drive (up to 2.5x the direct route); bumps cost the tip.
	var b: Vector3 = game.cj["b"]
	var a: Vector3 = game.cj["a"]
	var cap = a.distance_to(b)*0.45*2.5
	var v = Vector2(game.car.velocity.x,game.car.velocity.z).length() if game.driving else 0.0
	game.cj["fare"] = minf(cap,float(game.cj["fare"])+v*delta*0.45)
	var hit = false
	if game.driving:
		for k in game.car.get_slide_collision_count():
			var n = game.car.get_slide_collision(k).get_normal()
			if absf(n.y) < 0.5:
				hit = true
	if hit and absf(float(game.cj.get("speed_was",0.0))) > 7.0 and float(game.cj.get("bump_cd",0.0)) <= 0.0:
		game.cj["crash"] = int(game.cj["crash"])+1
		game.cj["bump_cd"] = 1.5
		game._show_toast("Ouch! %s didn't like that (tip -%d%%)." % [game.cj["name"],25])
	game.cj["bump_cd"] = maxf(0.0,float(game.cj.get("bump_cd",0.0))-delta)
	game.cj["speed_was"] = game.car_speed

func _taxi_tip() -> int:
	var fare = 15.0+float(game.cj["fare"])
	var on_time = float(game.cj["t"]) <= float(game.cj["par"])
	var share = (0.35 if on_time else 0.1)-0.25*0.35*float(game.cj["crash"])
	return maxi(0,int(round(fare*share)))

func _cs_taxi_pickup() -> void:
	var h: Node3D = game.cj["p"]
	var start = h.global_position
	var sx = 1.6 if game.car.global_basis.x.dot(start-game.car.global_position) >= 0.0 else -1.6
	var door = game.car.global_transform*Vector3(sx,0,0.7)
	door.y = start.y
	game.cj["stage"] = 1
	game.cj["step"] = 1
	var b: Vector3 = game.cj["b"]
	game.cj["par"] = (game.cj["a"] as Vector3).distance_to(b)/9.0+20.0
	var ring = h.get_node_or_null("Ring")
	if ring != null:
		ring.queue_free()
	_cs_play("taxi_pickup",3.6,func(t: float) -> void:
		# 0-1.8 s: the passenger walks to the back door. 1.8-3.6 s: the rear-view mirror.
		if t < 1.8:
			var k = clampf(t/1.6,0.0,1.0)
			h.global_position = start.lerp(door,k)
			_cj_face(h,door if k < 1.0 else game.car.global_position)
			_cj_anim(h,"Walk" if k < 1.0 else "Idle")
			_cs_cam(game.car.global_transform*Vector3(-2.2,2.4,8.0),(start+door)/2.0+Vector3(0,0.9,0))
			_cs_mirror(false)
		else:
			_taxi_seat(h)
			_cs_mirror(true)
			_cs_cam(game.car.global_transform*Vector3(-0.05,1.0,-0.5),game.car.global_transform*Vector3(0.38,0.72,0.95),false)
			_cs_caption("%s:  \"To %s, please!\"" % [game.cj["name"],game.cj["to"]])
	,func() -> void:
		_taxi_seat(h)
		_cs_mirror(false)
		game._show_toast("%s: \"To %s, please!\"  Beat %ds for a good tip." % [game.cj["name"],game.cj["to"],int(game.cj["par"])])
	)

func _taxi_seat(h: Node3D) -> void:
	# Sitting in the back seat (behind the front passenger), riding along.
	if h.get_parent() != game.car:
		h.get_parent().remove_child(h)
		game.car.add_child(h)
	h.position = Vector3(0.38,-0.62,0.85)
	h.rotation = Vector3.ZERO      # facing forward, towards the mirror
	h.set_meta("anim","Idle")
	for c in h.get_children():
		if c is Label3D:
			(c as Label3D).hide()

func _cs_taxi_dropoff() -> void:
	var h: Node3D = game.cj["p"]
	# Out on the pavement side.
	var sx = 1.0 if not game._on_road(game.car.global_transform*Vector3(4.2,0,1.4)) or game._on_road(game.car.global_transform*Vector3(-4.2,0,1.4)) else -1.0
	var door = game.car.global_transform*Vector3(1.6*sx,0,0.7)
	var kerb = game.car.global_transform*Vector3(4.2*sx,0,1.4)
	door.y = 0.0
	kerb.y = 0.0
	game.cj["stage"] = 2
	game.cj["step"] = 2
	var tip = _taxi_tip()
	var fare = int(round(15.0+float(game.cj["fare"])))
	_cs_play("taxi_dropoff",3.0,func(t: float) -> void:
		if h.get_parent() == game.car:
			game.car.remove_child(h)
			game.add_child(h)
			h.rotation = Vector3.ZERO
			h.scale = Vector3.ONE
			for c in h.get_children():
				if c is Label3D:
					(c as Label3D).show()
					(c as Label3D).text = "%s · thanks!" % game.cj["name"]
		var k = clampf(t/1.7,0.0,1.0)
		h.global_position = door.lerp(kerb,k)
		if k < 1.0:
			_cj_face(h,kerb)
			_cj_anim(h,"Walk")
		else:
			_cj_face(h,game.car.global_position)
			_cj_anim(h,"Wave")
		_cs_cam(game.car.global_transform*Vector3(1.5,2.4,8.5),kerb+Vector3(0,1.0,0))
	,func() -> void:
		h.global_position = kerb
		_cj_face(h,game.car.global_position)
		_cj_anim(h,"Wave")
		if tip > 0 and int(game.cj["crash"]) == 0:
			game._stat_add("taxi_tip_streak")
		else:
			game.stats["taxi_tip_streak"] = 0.0
		game.stats["taxi_tip_best"] = maxf(float(game.stats.get("taxi_tip_best",0.0)),float(game.stats.get("taxi_tip_streak",0.0)))
		var stars = 5 if tip > 0 and int(game.cj["crash"]) == 0 else (4 if tip > 0 else 3)
		_career_job_done(fare,tip,"%s rated you %s" % [game.cj["name"],"★".repeat(stars)])
	)

func _stretcher(at: Vector3) -> Node3D:
	var s = Node3D.new()
	s.position = at
	game.add_child(s)
	game._box(s,Vector3(0,0.75,0),Vector3(0.7,0.12,2.0),Color("f4f6f8"))
	game._box(s,Vector3(0,0.8,-0.85),Vector3(0.6,0.12,0.3),Color("ffffff"))
	for x in [-0.28,0.28]:
		for z in [-0.8,0.8]:
			game._box(s,Vector3(x,0.35,z),Vector3(0.06,0.7,0.06),Color("9aa3ab"))
	game.cj_nodes.append(s)
	return s

func _cs_medic_load() -> void:
	var pat: Node3D = game.cj["p"]
	var at = pat.global_position
	var st = _stretcher(at)
	var back = game.car.global_transform*Vector3(0,0,3.4)
	back.y = 0.0
	game.cj["stage"] = 1
	game.cj["step"] = 1
	game.cj["t"] = 0.0
	game.cj["limit"] = at.distance_to(game.HOSPITAL_DROP)/9.0+30.0
	var ring = pat.get_node_or_null("Ring")
	if ring != null:
		ring.queue_free()
	pat.get_parent().remove_child(pat)
	st.add_child(pat)
	pat.position = Vector3(0,0.65,0)
	pat.rotation = Vector3.ZERO
	game.cj["st"] = st
	var cam_at = _cs_side_cam(at,back,8.0,3.0)
	_cs_play("medic_load",3.2,func(t: float) -> void:
		var k = clampf((t-0.5)/2.2,0.0,1.0)
		st.global_position = at.lerp(back,k)
		var to = back-at
		if Vector2(to.x,to.z).length() > 0.1:
			st.rotation.y = atan2(to.x,to.z)
		_cs_cam(cam_at,(at+back)/2.0+Vector3(0,0.9,0))
	,func() -> void:
		st.hide()
		var by: Node3D = game.cj.get("by")
		if is_instance_valid(by):
			_cj_anim(by,"Idle")
			for c in by.get_children():
				if c is Label3D:
					(c as Label3D).hide()
		_career_lights(Color("ff3b3b"),Color("f4f6f8"))
		_siren(true)
		game._show_toast("Patient on board! Lights and siren on: get to Harbor General in %ds." % int(game.cj["limit"]))
	)

func _cs_medic_unload() -> void:
	var st: Node3D = game.cj["st"]
	var door = game.HOSPITAL_DOOR
	var inside = game.HOSPITAL_DOOR+Vector3(0,0,3.5)
	# Out of the back of the ambulance, wheeled to the doors and inside.
	var back = game.car.global_transform*Vector3(0,0,4.6)
	back.y = 0.0
	var cam_at = _cs_side_cam(back,door,8.5,5.5)      # high enough to see over the ambulance
	game.cj["stage"] = 2
	game.cj["step"] = 2
	var on_time = float(game.cj["t"]) <= float(game.cj["limit"])
	_siren(false)
	_career_lights_off()
	_cs_play("medic_unload",3.0,func(t: float) -> void:
		st.show()
		var k = clampf(t/1.9,0.0,1.0)
		var k2 = clampf((t-1.9)/0.8,0.0,1.0)
		var from: Vector3 = back if k < 1.0 else door
		var to: Vector3 = door if k < 1.0 else inside
		st.global_position = back.lerp(door,k) if k < 1.0 else door.lerp(inside,k2)
		if Vector2(to.x-from.x,to.z-from.z).length() > 0.1:
			st.rotation.y = atan2(to.x-from.x,to.z-from.z)
		_cs_cam(cam_at,(back+door)/2.0+Vector3(0,0.9,0))
	,func() -> void:
		st.global_position = inside
		st.hide()
		if on_time:
			game._stat_add("medic_ontime")
		_career_job_done(260 if on_time else 140,90 if on_time else 0,"Arrived in time: bonus!" if on_time else "A bit late, but the patient is safe.")
	)

func _cs_police_radio() -> void:
	_cs_play("police_radio",3.4,func(t: float) -> void:
		# A slow push in on the patrol car (or on you), lights flashing, while the call comes in.
		var body: Node3D = game.car if game.driving else game.player
		var k = t/3.4
		var off = Vector3(lerpf(4.5,3.2,k),lerpf(1.9,1.5,k),lerpf(-7.0,-5.2,k))
		_cs_cam(body.global_transform*off,body.global_position+Vector3(0,0.8,0))
		_cs_caption("◉ DISPATCH:  %s. All units respond!" % String(game.cj["call"]),true)
	,func() -> void:
		_cs_caption("")
		game._show_toast("Call: %s. Follow the arrow." % String(game.cj["call"]))
	)

func _career_chase_over(won: bool) -> void:
	# Called from _chase_end while on a police shift.
	if game.career < 0 or _cid() != "police" or game.cj.is_empty():
		return
	if not won:
		_career_job_failed("The suspect got away. Next call coming in.")
		return
	game.cj["stage"] = 2
	game.cj["step"] = 2
	var tr = game.chase_last_thief
	var sus_car = Node3D.new()
	game.add_child(sus_car)
	sus_car.global_transform = tr
	game._box(sus_car,Vector3(0,0.35,0),Vector3(1.8,0.65,3.4),Color("b83a2c"))
	game._box(sus_car,Vector3(0,0.9,0.15),Vector3(1.45,0.65,1.6),Color("1f2a33"))
	game.cj_nodes.append(sus_car)
	var door = tr*Vector3(-1.4,0,0.2)
	var out = tr*Vector3(-3.4,0,0.6)
	door.y = 0.0
	out.y = 0.0
	var sus = _career_person(door,3900,false,Color(0,0,0,0))
	_career_tag(sus,"Suspect",2.35,Color("ffb020"))
	_cs_play("police_arrest",3.4,func(t: float) -> void:
		var k = clampf(t/1.2,0.0,1.0)
		sus.global_position = door.lerp(out,k)
		_cj_face(sus,game.car.global_position)
		if k < 1.0:
			_cj_anim(sus,"Walk")
		else:
			_cj_hands_up(sus)
		# From beside your car, swinging slowly round the suspect.
		var back = game.car.global_position-out
		back.y = 0.0
		back = back.normalized() if back.length() > 0.1 else Vector3(0,0,1)
		var c = out+back.rotated(Vector3.UP,0.5-t*0.25)*7.5+Vector3(0,2.6,0)
		_cs_cam(c,out+Vector3(0,1.1,0))
	,func() -> void:
		sus.global_position = out
		_cj_hands_up(sus)
		game._stat_add("police_catches")
		_career_job_done(380,80 if game.chase_t < 45.0 else 0,"Suspect arrested. Quick catch bonus!" if game.chase_t < 45.0 else "Suspect arrested.")
	)

func _fire_aimed() -> bool:
	if game.driving or game.cj.is_empty() or not game.cj.has("a"):
		return false
	var a: Vector3 = game.cj["a"]
	var to = Vector2(a.x-game.player.position.x,a.z-game.player.position.z)
	if to.length() < 2.0:
		return true
	var fwd = -game.player.global_basis.z
	return Vector2(fwd.x,fwd.z).normalized().dot(to.normalized()) > cos(deg_to_rad(40.0))

func _fire_hose_tick(on: bool) -> void:
	# A hose from the truck to you, and a water jet from your hands while you aim at the fire.
	if not on or game.driving:
		if game.cj_hose != null and is_instance_valid(game.cj_hose):
			game.cj_hose.hide()
		if game.cj_jet != null and is_instance_valid(game.cj_jet):
			game.cj_jet.emitting = false
		return
	if game.cj_hose == null or not is_instance_valid(game.cj_hose):
		game.cj_hose = MeshInstance3D.new()
		var cyl = CylinderMesh.new()
		cyl.top_radius = 0.06
		cyl.bottom_radius = 0.06
		cyl.height = 1.0
		cyl.radial_segments = 6
		game.cj_hose.mesh = cyl
		game.cj_hose.material_override = game._material(Color("c42b2b"))
		game.add_child(game.cj_hose)
	if game.cj_jet == null or not is_instance_valid(game.cj_jet):
		game.cj_jet = CPUParticles3D.new()
		game.cj_jet.amount = 70
		game.cj_jet.lifetime = 0.75
		game.cj_jet.direction = Vector3(0,0.06,-1)
		game.cj_jet.spread = 4.0
		game.cj_jet.initial_velocity_min = 9.0
		game.cj_jet.initial_velocity_max = 10.5
		game.cj_jet.gravity = Vector3(0,-9.0,0)
		game.cj_jet.scale_amount_min = 0.5
		game.cj_jet.scale_amount_max = 1.0
		var sm = SphereMesh.new()
		sm.radius = 0.09
		sm.height = 0.18
		game.cj_jet.mesh = sm
		game.cj_jet.material_override = game._fc_glow(Color("8fd8ff"))
		game.cj_jet.local_coords = true
		game.cj_jet.top_level = true
		game.add_child(game.cj_jet)
	var from = game.car.global_transform*Vector3(0,0.7,2.0)
	var to = game.player.global_transform*Vector3(0.25,1.0,-0.35)
	var mid = (from+to)/2.0
	var len = from.distance_to(to)
	game.cj_hose.show()
	game.cj_hose.global_position = mid
	if len > 0.1:
		var dir = (to-from)/len
		var up = Vector3.UP if absf(dir.dot(Vector3.UP)) < 0.99 else Vector3.FORWARD
		var x = up.cross(dir).normalized()
		game.cj_hose.global_basis = Basis(x,dir,x.cross(dir).normalized()*-1.0).orthonormalized()
	game.cj_hose.scale = Vector3(1,maxf(len,0.1),1)
	# The jet leaves your hands and points the way you face (at the fire when you aim).
	var hand = game.player.global_transform*Vector3(0.0,1.05,-0.45)
	var fwd = -game.player.global_basis.z
	fwd.y = 0.0
	if fwd.length() > 0.01:
		game.cj_jet.global_transform = Transform3D(Basis.looking_at(fwd.normalized(),Vector3.UP),hand)
	game.cj_jet.emitting = float(game.cj.get("spray",0.0)) > 0.0

func _cs_fire_out() -> void:
	var holder: Node3D = game.cj["p"]
	game.cj["stage"] = 2
	game.cj["step"] = 2
	var late = bool(game.cj.get("late",false))
	var at = holder.global_position
	for n in ["Flames","Smoke"]:
		var p = holder.get_node_or_null(n) as CPUParticles3D
		if p != null:
			p.emitting = false
	var steam = holder.get_node_or_null("Steam") as CPUParticles3D
	if steam != null:
		steam.emitting = true
	var ring = holder.get_node_or_null("Ring")
	if ring != null:
		ring.queue_free()
	_cs_play("fire_out",3.2,func(t: float) -> void:
		# From the truck's side of the fire, rising slowly with the steam.
		var back = game.car.global_position-at
		back.y = 0.0
		back = back.normalized() if back.length() > 0.1 else Vector3(0,0,1)
		_cs_cam(at+back.rotated(Vector3.UP,0.35-t*0.2)*12.0+Vector3(0,3.5+t*0.6,0),at+Vector3(0,1.8,0))
	,func() -> void:
		if steam != null:
			steam.emitting = false
		game._stat_add("fire_out")
		_career_job_done(240,0 if late else 70,"Fire's out! Fast response bonus." if not late else "Fire's out!")
	)

func _career_bar_build() -> void:
	game.cj_bar = PanelContainer.new()
	game.cj_bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb = game._panel(Color(0.05,0.1,0.15,0.9),16)
	sb.set_content_margin_all(10)
	sb.border_color = Color("f0bd62")
	sb.set_border_width_all(2)
	game.cj_bar.add_theme_stylebox_override("panel",sb)
	game.hud.get_child(0).add_child(game.cj_bar)
	var col = VBoxContainer.new()
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_theme_constant_override("separation",4)
	game.cj_bar.add_child(col)
	game.cj_bar_title = game._label("",15,Color("f0bd62"))
	game.cj_bar_title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(game.cj_bar_title)
	game.cj_bar_steps = RichTextLabel.new()
	game.cj_bar_steps.bbcode_enabled = true
	game.cj_bar_steps.fit_content = true
	game.cj_bar_steps.scroll_active = false
	game.cj_bar_steps.autowrap_mode = TextServer.AUTOWRAP_OFF
	game.cj_bar_steps.mouse_filter = Control.MOUSE_FILTER_IGNORE
	game.cj_bar_steps.add_theme_font_size_override("normal_font_size",19)
	game.cj_bar_steps.add_theme_font_size_override("bold_font_size",19)
	col.add_child(game.cj_bar_steps)
	game.cj_bar_detail = game._label("",17,Color("dff3ff"))
	game.cj_bar_detail.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(game.cj_bar_detail)
	game.cj_bar.hide()

func _career_steps_bbcode() -> String:
	var steps: Array = game.CAREER_STEPS[_cid()]
	var cur = int(game.cj.get("step",0))
	var parts: Array = []
	for k in steps.size():
		var txt = "%d %s" % [k+1,steps[k]]
		if k < cur:
			parts.append("[color=#5fe08a]✔ %s[/color]" % steps[k])
		elif k == cur:
			parts.append("[b][color=#ffe36b]%s[/color][/b]" % txt)
		else:
			parts.append("[color=#7f97a6]%s[/color]" % txt)
	return "[center]%s[/center]" % "  [color=#7f97a6]→[/color]  ".join(PackedStringArray(parts))

func _career_bar_text() -> String:
	if game.cj.is_empty():
		return ""
	var me: Vector3 = game.car.position if game.driving else game.player.position
	var tgt = _career_target()
	var d = int(Vector2(me.x-(tgt as Vector3).x,me.z-(tgt as Vector3).z).length()) if tgt != null else 0
	var t = float(game.cj["t"])
	if int(game.cj["stage"]) == 3:
		return ("Next call in %d…" if _cid() == "police" else "Next job in %d…") % int(ceil(maxf(float(game.cj["next"]),0.0)))
	match _cid():
		"taxi":
			if int(game.cj["stage"]) == 0:
				return "%s is waiting · to %s  ·  %d m  ·  stop next to them" % [game.cj["name"],game.cj["to"],d]
			return "To %s  ·  %d m  ·  ⏱ %ds  ·  Meter %s%s" % [game.cj["to"],d,maxi(0,int(float(game.cj.get("par",0.0))-t)),game._money(int(15.0+float(game.cj["fare"]))),"  ·  bumps %d" % int(game.cj["crash"]) if int(game.cj["crash"]) > 0 else ""]
		"medic":
			if int(game.cj["stage"]) == 0:
				return "Patient down  ·  %d m  ·  stop by the red ring" % d
			return "Harbor General  ·  %d m  ·  ⏱ %ds" % [d,maxi(0,int(float(game.cj.get("limit",0.0))-t))]
		"police":
			if int(game.cj["stage"]) == 0:
				return "%s  ·  %d m" % [String(game.cj["call"]),d]
			return "Catch the red car!  ·  ⏱ %ds" % maxi(0,int(game.CHASE_TIME-game.chase_t))
		"fire":
			if int(game.cj["stage"]) == 0:
				return "Fire  ·  %d m  ·  ⏱ %ds  ·  %s" % [d,maxi(0,int(float(game.cj["limit"])-t)),"get out by the fire" if d < 30 else "follow the smoke"]
			var meter = "▮".repeat(int(ceil(float(game.cj["hp"])*10.0)))+"▯".repeat(10-int(ceil(float(game.cj["hp"])*10.0)))
			return "Fire %s %d%%  ·  %s" % [meter,int(float(game.cj["hp"])*100.0),"spraying!" if float(game.cj.get("spray",0.0)) > 0.0 else ("face the fire to spray" if d < game.FIRE_SPRAY_RANGE else "get closer")]
	return ""

func _career_bar_tick() -> void:
	if game.career < 0 or game.cj.is_empty():
		if game.cj_bar != null:
			game.cj_bar.hide()
		return
	if game.cj_bar == null:
		_career_bar_build()
	game.cj_bar.visible = not game.paused and game.cs.is_empty() and not game.shot_on and not (game.lvl_root != null and game.lvl_root.visible)
	if not game.cj_bar.visible:
		return
	game.cj_bar_title.text = "%s  ·  %s" % [String(game.CAREERS[game.career]["name"]).to_upper(),_career_rank_line(game.career)]
	var bb = _career_steps_bbcode()
	if game.cj_bar_steps.text != bb:
		game.cj_bar_steps.text = bb
	game.cj_bar_steps.custom_minimum_size.x = 560
	game.cj_bar_detail.text = _career_bar_text()

func _career_hud() -> void:
	# The full-screen HUD's mission panel mirrors the step bar.
	if game.career < 0 or game.cj.is_empty():
		return
	game.mission_label.text = "CAREER  /  %s  ·  %s" % [String(game.CAREERS[game.career]["name"]).to_upper(),_career_rank_name(game.career)]
	game.objective.text = _career_bar_text()

func _cs_play(id: String, dur: float, tick: Callable, end: Callable) -> void:
	if not game.cs.is_empty():
		_cs_finish(true)
	game.cs = {"id":id,"t":0.0,"dur":dur,"tick":tick,"end":end}
	game.cs_n += 1
	game.cs_hid_hud = game.hud.visible
	game.hud.visible = false
	game.cam_lock = true
	game.stick = Vector2.ZERO
	game.car_speed = 0.0
	game.car.velocity = Vector3.ZERO
	_cs_ui(true)
	tick.call(0.0)

func _cs_tick(delta: float) -> void:
	if game.cs.is_empty():
		return
	game.car_speed = 0.0
	game.car.velocity.x = 0.0
	game.car.velocity.z = 0.0
	game.stick = Vector2.ZERO
	if game.paused:
		return
	if game.cs_freeze:
		(game.cs["tick"] as Callable).call(float(game.cs["t"]))
		return
	game.cs["t"] = float(game.cs["t"])+delta
	(game.cs["tick"] as Callable).call(minf(float(game.cs["t"]),float(game.cs["dur"])))
	if float(game.cs["t"]) >= float(game.cs["dur"]):
		_cs_finish(true)

func _cs_skip() -> void:
	if game.cs.is_empty():
		return
	(game.cs["tick"] as Callable).call(float(game.cs["dur"]))
	_cs_finish(true)

func _cs_finish(run_end: bool) -> void:
	if game.cs.is_empty():
		return
	var e: Callable = game.cs["end"]
	game.cs = {}
	if game.cs_hid_hud and not game.shot_on:
		game.hud.visible = true
	game.cs_hid_hud = false
	game.cam_lock = false
	_cs_ui(false)
	_cs_caption("")
	_cs_mirror(false)
	if run_end:
		e.call()
	game._follow_camera(1.0)

func _cs_side_cam(a: Vector3, b: Vector3, dist: float, h: float) -> Vector3:
	# A camera spot beside the path a→b, on whichever side has more open space.
	var mid = (a+b)/2.0
	var dir = Vector3(b.x-a.x,0,b.z-a.z)
	dir = dir.normalized() if dir.length() > 0.1 else Vector3(0,0,1)
	var perp = dir.cross(Vector3.UP)
	var best = mid+perp*dist+Vector3(0,h,0)
	var best_d = -1.0
	for sd in [1.0,-1.0]:
		var c: Vector3 = mid+perp*dist*sd+Vector3(0,h,0)
		var q = PhysicsRayQueryParameters3D.create(mid+Vector3(0,1.0,0),c)
		q.exclude = [game.car.get_rid(),game.player.get_rid()]
		var hit = game.get_world_3d().direct_space_state.intersect_ray(q)
		var free = dist if hit.is_empty() else (hit["position"] as Vector3).distance_to(mid)
		if free > best_d:
			best_d = free
			best = c
	return best

func _cs_cam(from: Vector3, look: Vector3, safe := true) -> void:
	if game.camera == null or from.distance_to(look) < 0.05:
		return
	if safe and game.is_inside_tree():
		# Keep the camera out of walls: if something solid is between the subject and the camera
		# spot, move the camera in front of it.
		var q = PhysicsRayQueryParameters3D.create(look,from)
		q.exclude = [game.car.get_rid(),game.player.get_rid()]
		var hit = game.get_world_3d().direct_space_state.intersect_ray(q)
		if not hit.is_empty():
			from = (hit["position"] as Vector3)+(look-from).normalized()*0.4
	var up = Vector3.UP if absf((look-from).normalized().dot(Vector3.UP)) < 0.98 else Vector3.FORWARD
	game.camera.global_transform = Transform3D(Basis.looking_at(look-from,up),from)

func _cs_ui(on: bool) -> void:
	if game.cs_skip_label == null:
		game.cs_layer = CanvasLayer.new()
		game.cs_layer.layer = 3
		game.add_child(game.cs_layer)
		var root = Control.new()
		root.mouse_filter = Control.MOUSE_FILTER_IGNORE
		root.set_anchors_preset(Control.PRESET_FULL_RECT)
		game.cs_layer.add_child(root)
		for k in 2:
			var bar = ColorRect.new()
			bar.color = Color(0,0,0,0.92)
			bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
			root.add_child(bar)
			game.cs_bars.append(bar)
		game.cs_skip_label = game._label("Tap to skip  ▸▸",17,Color(1,1,1,0.8))
		game.cs_skip_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
		root.add_child(game.cs_skip_label)
		game.cs_caption_label = game._label("",22,Color("ffe36b"))
		game.cs_caption_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
		game.cs_caption_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		game.cs_caption_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		root.add_child(game.cs_caption_label)
		game.cs_mirror = Panel.new()
		game.cs_mirror.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var ms = StyleBoxFlat.new()
		ms.bg_color = Color(0,0,0,0)
		ms.border_color = Color("15191d")
		ms.set_border_width_all(18)
		ms.set_corner_radius_all(60)
		ms.shadow_color = Color(0,0,0,0.5)
		ms.shadow_size = 10
		game.cs_mirror.add_theme_stylebox_override("panel",ms)
		root.add_child(game.cs_mirror)
		game.cs_mirror.hide()
	var view = game.get_viewport().get_visible_rect().size
	var h = view.y*0.11
	(game.cs_bars[0] as ColorRect).position = Vector2.ZERO
	(game.cs_bars[0] as ColorRect).size = Vector2(view.x,h)
	(game.cs_bars[1] as ColorRect).position = Vector2(0,view.y-h)
	(game.cs_bars[1] as ColorRect).size = Vector2(view.x,h)
	for b in game.cs_bars:
		(b as ColorRect).visible = on
		(b as ColorRect).move_to_front()
	game.cs_skip_label.visible = on
	game.cs_skip_label.reset_size()
	game.cs_skip_label.position = Vector2(view.x-game.cs_skip_label.size.x-24.0,view.y-h/2.0-game.cs_skip_label.size.y/2.0)
	game.cs_skip_label.move_to_front()
	game.cs_caption_label.custom_minimum_size.x = view.x*0.8
	game.cs_caption_label.move_to_front()

func _cs_caption(text: String, radio := false) -> void:
	if game.cs_caption_label == null:
		return
	if radio:
		# Police radio: a dark box with a red edge behind the words.
		var rb = game._panel(Color(0.05,0.06,0.08,0.92),12)
		rb.border_color = Color("d4223f")
		rb.set_border_width_all(3)
		rb.set_content_margin_all(14)
		game.cs_caption_label.add_theme_stylebox_override("normal",rb)
	else:
		game.cs_caption_label.remove_theme_stylebox_override("normal")
	game.cs_caption_label.text = text
	game.cs_caption_label.visible = text != ""
	if text != "":
		var view = game.get_viewport().get_visible_rect().size
		game.cs_caption_label.reset_size()
		game.cs_caption_label.position = Vector2(view.x*0.1,view.y*0.89-game.cs_caption_label.size.y-12.0)

func _cs_mirror(on: bool) -> void:
	# The rear-view mirror shot: from the mirror, with the car body hidden like the in-car view.
	if game.cs_mirror == null:
		return
	if on != game.cs_interior:
		game.cs_interior = on
		if on:
			# Like the in-car view: hide the body (and its glow), show the cockpit and who's aboard.
			game.cs_hidden_parts.clear()
			for c in game.car.get_children():
				if c is Node3D and c != game.cockpit and not game.cj_nodes.has(c) and (c as Node3D).visible:
					(c as Node3D).visible = false
					game.cs_hidden_parts.append(c)
			if game.cockpit != null:
				game.cockpit.visible = true
		else:
			for c in game.cs_hidden_parts:
				if is_instance_valid(c):
					(c as Node3D).visible = true
			game.cs_hidden_parts.clear()
			game._apply_view()
	game.cs_mirror.visible = on
	for m in game.cs_mask:
		(m as ColorRect).visible = on
	if on:
		var view = game.get_viewport().get_visible_rect().size
		game.cs_mirror.size = Vector2(view.x*0.62,view.y*0.5)
		game.cs_mirror.position = Vector2((view.x-game.cs_mirror.size.x)/2.0,view.y*0.16)
		if game.cs_mask.is_empty():
			for k in 4:
				var m = ColorRect.new()
				m.color = Color(0.02,0.03,0.04,0.93)
				m.mouse_filter = Control.MOUSE_FILTER_IGNORE
				game.cs_mirror.get_parent().add_child(m)
				game.cs_mask.append(m)
		var r = Rect2(game.cs_mirror.position+Vector2(14,14),game.cs_mirror.size-Vector2(28,28))
		var rects = [Rect2(0,0,view.x,r.position.y),Rect2(0,r.end.y,view.x,view.y-r.end.y),Rect2(0,r.position.y,r.position.x,r.size.y),Rect2(r.end.x,r.position.y,view.x-r.end.x,r.size.y)]
		for k in 4:
			(game.cs_mask[k] as ColorRect).position = rects[k].position
			(game.cs_mask[k] as ColorRect).size = rects[k].size
			(game.cs_mask[k] as ColorRect).move_to_front()
		game.cs_mirror.move_to_front()
		if game.cs_caption_label != null:
			game.cs_caption_label.move_to_front()
		if game.cs_skip_label != null:
			game.cs_skip_label.move_to_front()

func _siren_sound() -> AudioStreamWAV:
	if game.siren_wav != null:
		return game.siren_wav
	var sr = 22050
	var total = sr*2
	var data = PackedByteArray()
	data.resize(total*2)
	var ph = 0.0
	for i in total:
		var t = float(i)/float(sr)
		var f = 760.0 if fmod(t,1.0) < 0.5 else 590.0
		ph += TAU*f/float(sr)
		var v = (0.5*sin(ph)+0.25*sin(ph*2.0))*0.35
		data.encode_s16(i*2,int(clampf(v,-1.0,1.0)*32767.0))
	game.siren_wav = AudioStreamWAV.new()
	game.siren_wav.format = AudioStreamWAV.FORMAT_16_BITS
	game.siren_wav.mix_rate = sr
	game.siren_wav.data = data
	game.siren_wav.loop_mode = AudioStreamWAV.LOOP_FORWARD
	game.siren_wav.loop_end = total
	return game.siren_wav

func _siren(on: bool) -> void:
	if game.siren_player == null:
		game.siren_player = AudioStreamPlayer.new()
		game.siren_player.volume_db = -14.0
		game.add_child(game.siren_player)
	if on and "--smoke-test" not in OS.get_cmdline_user_args():
		if not game.siren_player.playing:
			game.siren_player.stream = _siren_sound()
			game.siren_player.play()
	else:
		game.siren_player.stop()
	game.siren_on = on

func _build_career_panel(root: Control) -> void:
	game.career_panel = PanelContainer.new()
	game.career_panel.add_theme_stylebox_override("panel",game._panel(Color(0.06,0.11,0.16,0.97),26))
	game.career_panel.custom_minimum_size = Vector2(820,0)
	root.add_child(game.career_panel)
	game.extra_panels.append(game.career_panel)
	var col = VBoxContainer.new()
	col.add_theme_constant_override("separation",10)
	game.career_panel.add_child(col)
	col.add_child(game._label("CAREERS",28,Color("f0bd62")))
	var info = game._label("Start a shift and your car becomes the work vehicle. Every job raises your rank: Rookie, Pro (5 jobs), Expert (15), Chief (30), Legend (60). Higher ranks pay more, and every job gives XP.",16,Color("cbd8de"))
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.custom_minimum_size.x = 780
	col.add_child(info)
	for i in game.CAREERS.size():
		var row = HBoxContainer.new()
		row.add_theme_constant_override("separation",10)
		col.add_child(row)
		var t = game._label("",17,Color("dff3ff"))
		t.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		t.custom_minimum_size.x = 560
		t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(t)
		var b = game._button("Start",_career_start.bind(i))
		b.custom_minimum_size = Vector2(190,64)
		b.add_theme_stylebox_override("normal",game._panel((game.CAREERS[i]["body"] as Color).darkened(0.45),16))
		row.add_child(b)
		game.career_rows.append([t,b])
	var foot = HBoxContainer.new()
	foot.add_theme_constant_override("separation",10)
	col.add_child(foot)
	var stop = game._button("End shift",_career_end_close)
	stop.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	foot.add_child(stop)
	var close = game._button("Close",_career_close)
	close.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	foot.add_child(close)
	game.career_panel.hide()

func _open_careers() -> void:
	if not game.paused:
		game._toggle_menu()
	var lv = game._level()
	for i in game.CAREERS.size():
		var C: Dictionary = game.CAREERS[i]
		var r = _career_rank(i)
		var nxt = "  ·  next rank at %d jobs" % int(game.CAREER_RANKS[r+1][1]) if r+1 < game.CAREER_RANKS.size() else "  ·  top rank"
		(game.career_rows[i][0] as Label).text = "%s  ·  %s  ·  %d jobs  ·  pay x%.2f%s\n%s\n%s" % [C["name"],_career_rank_name(i),int(game.career_jobs[i]),_career_mult(i),nxt,C["desc"],_career_ach_line(i)]
		var b: Button = game.career_rows[i][1]
		if lv < int(C["level"]):
			b.text = "Level %d" % int(C["level"])
			b.disabled = true
		else:
			b.disabled = false
			b.text = "On shift" if game.career == i else "Start shift"
	game._open_panel(game.career_panel)

func _career_ach_line(i: int) -> String:
	# v0.52: this career's achievements and how far along you are.
	var id = String(game.CAREERS[i]["id"])
	var parts: Array = []
	for a in game.ACH:
		var key = String(a[3])
		if key != "job_"+id and key != String(game.CAREER_SPECIAL[id]):
			continue
		var nm = String(a[1]).trim_prefix(String(game.CAREERS[i]["name"]).split(" ")[0]+": ")
		if game.ach_got.has(String(a[0])):
			parts.append("✔ %s" % nm)
		else:
			parts.append("%s %d/%d" % [nm,mini(int(game._ach_value(key)),int(a[4])),int(a[4])])
	return "◆ "+"  ·  ".join(PackedStringArray(parts))

func _career_close() -> void:
	if game.paused:
		game._toggle_menu()

func _career_end_close() -> void:
	_career_end()
	_career_close()

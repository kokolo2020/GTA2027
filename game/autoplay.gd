# v0.56.0 Stream Mode: the player walks, visits a biodome, rides the Harbor Loop sky train and wanders the
# crowded city by itself, for a livestream (3 hours by default). Start with --autoplay (hours: --autoplay-hours=N).
# It only injects the on-screen stick (`g.stick`) and calls the same sky-train functions as the buttons.
# `g` is the main script. No `:=` on anything read from `g` (it is a Variant).
extends Node

var g
var wb
var scale_t := 1.0
var duration := 10800.0
var total := 0.0
var state := "boot"
var state_t := 0.0
var rng := RandomNumberGenerator.new()
var route: Array = []
var ri := 0
var dome := 0
var cycles := 0
var rides_left := 0
var stops_planned := 0
var stops_seen := 0
var wander_target := Vector3.ZERO
var wander_centre := Vector3.ZERO
var stuck_t := 0.0
var side_t := 0.0
var side_dir := 1.0
var last_pos := Vector3.ZERO
var check_t := 0.0
var shot_t := 0.0
var shot_n := 0
var dest_station := 0
var getoff_set := false
var strolled := false
var finished := false
var dbg_t := 0.0

func _init(g_main) -> void:
	g = g_main

func _ready() -> void:
	wb = g.world_bio
	rng.randomize()
	for a in OS.get_cmdline_user_args():
		if a.begins_with("--autoplay-hours="):
			duration = float(a.get_slice("=",1))*3600.0
	if OS.get_environment("AUTOPLAY_FAST") != "":
		scale_t = 0.08
	print("AUTOPLAY start duration=%.0fs scale=%.2f" % [duration,scale_t])

func goto(s: String) -> void:
	state = s
	state_t = 0.0
	stuck_t = 0.0
	g.stick = Vector2.ZERO
	print("AUTOPLAY ",s," t=%.0f dome=%d cycles=%d" % [total,dome,cycles])

func steer(target: Vector3, reach := 1.3) -> bool:
	var p: Vector3 = g.player.position
	var off := Vector3(target.x-p.x,0,target.z-p.z)
	if off.length() < reach:
		g.stick = Vector2.ZERO
		return true
	var d := off.normalized()
	var fwd: Vector3 = -g.camera.global_basis.z
	fwd.y = 0
	fwd = fwd.normalized()
	var right: Vector3 = g.camera.global_basis.x
	right.y = 0
	right = right.normalized()
	var v := Vector2(d.dot(right),-d.dot(fwd))
	if side_t > 0.0:
		# stuck: sidestep for a moment
		var perp := Vector3(-d.z,0,d.x)*side_dir
		v = Vector2(perp.dot(right),-perp.dot(fwd))
	g.stick = v.limit_length(1.0)
	return false

func watchdog(delta: float) -> bool:
	# true when the player has not moved for a long time (caller should re-plan)
	check_t += delta
	if side_t > 0.0:
		side_t -= delta
	if check_t >= 1.0:
		check_t = 0.0
		var moved: float = g.player.position.distance_to(last_pos)
		last_pos = g.player.position
		if g.stick.length() > 0.2 and moved < 0.35:
			stuck_t += 1.0
			if stuck_t >= 2.0 and side_t <= 0.0:
				side_t = 1.6
				side_dir = 1.0 if rng.randf() < 0.5 else -1.0
		else:
			stuck_t = maxf(stuck_t-1.0,0.0)
	return stuck_t >= 9.0

func ready_to_play() -> bool:
	return g.booted and not g.paused and not g.crate_open and g.player != null

func _physics_process(delta: float) -> void:
	shot_tick(delta)
	if finished:
		return
	if g.booted and g.crate_open:
		# stream mode never needs the starter crate: close it and stay on foot
		g.crate_done = true
		g.crate_open = false
		if g.crate_root != null:
			g.crate_root.hide()
		g.paused = false
		print("AUTOPLAY skipped the crate screen")
	if not ready_to_play():
		dbg_t += delta
		if dbg_t >= 5.0:
			dbg_t = 0.0
			print("AUTOPLAY waiting: booted=%s paused=%s crate=%s" % [g.booted,g.paused,g.crate_open])
		return
	total += delta
	state_t += delta
	if total >= duration:
		finished = true
		g.stick = Vector2.ZERO
		g._show_toast("Stream mode finished after %.1f hours." % (duration/3600.0))
		print("AUTOPLAY finished")
		return
	if g.driving or g.race_car or g.bus_riding or g.seat_id >= 0:
		# something took the player away (should not happen): get back on foot at the biosphere
		print("AUTOPLAY unexpected ride state, resetting")
		g.driving = false
		goto("to_dome")
		start_dome_route()
		return
	match state:
		"boot":
			g.board_on = false
			g.run_on = false
			start_dome_route()
			goto("to_dome")
		"to_dome":
			walk_route_tick(delta,"dome_quests")
		"dome_quests":
			dome_quest_tick(delta)
		"dome_stroll":
			walk_route_tick(delta,"leave_dome")
		"leave_dome":
			walk_route_tick(delta,"to_station")
		"to_station":
			station_tick(delta)
		"waiting":
			wait_tick(delta)
		"riding":
			ride_tick(delta)
		"city":
			city_tick(delta)

func start_dome_route() -> void:
	var c: Vector3 = wb.C
	var entry: Vector3 = wb.ENTRY
	g.player.position = entry+Vector3(0,0.8,0)
	g.player.velocity = Vector3.ZERO
	g.player.show()
	g.player.get_child(0).set_deferred("disabled",false)
	route = [c+Vector3(0,0,36),c+Vector3(0,0.09,12),c+Vector3(0,0.09,0)]
	route.append_array(wb.visitor_stage_route(dome))
	ri = 0
	strolled = false
	g.run_on = false
	g.board_on = false

func walk_route_tick(delta: float, next_state: String) -> void:
	if ri >= route.size():
		goto(next_state)
		on_enter(next_state)
		return
	if steer(route[ri]):
		ri += 1
	elif watchdog(delta):
		# skip ahead
		ri += 1
		stuck_t = 0.0

func on_enter(s: String) -> void:
	if s == "dome_quests":
		wb.auto_quest = true
	elif s == "leave_dome":
		var back: Array = []
		var stage: Array = wb.visitor_stage_route(dome)
		for k in range(stage.size()-1,-1,-1):
			back.append(stage[k])
		back.append(wb.local_point(dome,0,-RADIUS_OUT,0.09))
		route = back
		ri = 0
	elif s == "to_station":
		prepare_station(5)

const RADIUS_OUT := 42.0

func dome_quest_tick(delta: float) -> void:
	var budget := 240.0*scale_t
	if state_t > budget and not strolled:
		# stroll along both boardwalk arms to look at the animals, then leave
		strolled = true
		route = []
		var arms: Array = wb.path_arms(dome)
		for arm in arms:
			route.append(wb.local_point(dome,0,0,wb.AFRICA_Y))
			for q in arm:
				route.append(wb.local_point(dome,q[0],q[1],wb.AFRICA_Y))
		route.append(wb.local_point(dome,0,0,wb.AFRICA_Y))
		ri = 0
		goto("dome_stroll")
		return
	if wb.task >= 0 and wb.task/3 == dome and wb.active == dome:
		var step: int = wb.quest_step(wb.task)
		var pt: Vector3 = wb.quest_point(dome,wb.task%3,step)
		steer(pt,0.8)
		watchdog(delta)
	else:
		g.stick = Vector2.ZERO

func prepare_station(i: int) -> void:
	dest_station = i
	var e: Vector3 = g.sky_st_info[i]["entrance"]
	var nrm := Vector3(-(g.sky_st_info[i]["dir"] as Vector3).z,0,(g.sky_st_info[i]["dir"] as Vector3).x)*float(g.sky_st_info[i]["side"])
	g.player.position = e+nrm*6.0+Vector3(0,0.9,0)
	g.player.velocity = Vector3.ZERO
	g._follow_camera(1.0)
	route = [e]
	ri = 0

func station_tick(delta: float) -> void:
	var e: Vector3 = g.sky_st_info[dest_station]["entrance"]
	var near: int = g._sky_near()
	if near >= 0:
		g.stick = Vector2.ZERO
		g._sky_enter(near)
		stops_planned = rng.randi_range(2,4)
		stops_seen = 0
		getoff_set = false
		goto("waiting")
		return
	steer(e,0.9)
	if watchdog(delta) or state_t > 90.0:
		# give up walking: stand on the entrance
		g.player.position = e+Vector3(0,0.9,0)
		g.player.velocity = Vector3.ZERO
		stuck_t = 0.0
		state_t = 0.0

func wait_tick(_delta: float) -> void:
	if g.sky_riding:
		goto("riding")
		return
	if g.sky_wait < 0:
		# train never came or we were dropped off: try again from the street
		goto("to_station")
		prepare_station(dest_station)
		return
	if state_t > 240.0:
		g._sky_leave_platform()
		goto("to_station")
		prepare_station(dest_station)

func ride_tick(_delta: float) -> void:
	if not g.sky_riding:
		arrive_city()
		return
	var st: Dictionary = g._sky_state(g.sky_train)
	var dwell: bool = bool(st["dwell"])
	if dwell and int(st["at"]) != last_stop:
		last_stop = int(st["at"])
		stops_seen += 1
		getoff_set = false
	if not dwell and stops_seen >= stops_planned and not getoff_set and g.sky_getoff < 0:
		getoff_set = true
		g._sky_action()

var last_stop := -1

func arrive_city() -> void:
	var near := -1
	var best := 1e9
	for i in g.sky_st_info.size():
		var d: float = g.player.position.distance_to(g.sky_st_info[i]["entrance"])
		if d < best:
			best = d
			near = i
	dest_station = near
	# the crowded plaza is the best place to be seen: half the time we walk there
	wander_centre = g.sky_st_info[near]["entrance"]
	if near == 9 or near == 8 or near == 7:
		wander_centre = g.sky_st_info[near]["entrance"]
	cycles += 1
	pick_wander()
	goto("city")

func pick_wander() -> void:
	var a := rng.randf()*TAU
	var r := rng.randf_range(8.0,32.0)
	wander_target = wander_centre+Vector3(cos(a),0,sin(a))*r

func city_tick(delta: float) -> void:
	var budget := 330.0*scale_t
	if state_t > budget:
		if rides_left <= 0:
			rides_left = 3
		rides_left -= 1
		if rides_left <= 0:
			# back to the biosphere for the next dome
			dome = (dome+1) % 7
			goto("to_dome")
			start_dome_route()
			return
		# next ride: go to the nearest station entrance
		goto("to_station")
		prepare_station(dest_station)
		g.player.position = g.player.position
		return
	if steer(wander_target,2.0):
		if rng.randf() < 0.5:
			g.stick = Vector2.ZERO
		pick_wander()
	elif watchdog(delta):
		stuck_t = 0.0
		pick_wander()

func shot_tick(delta: float) -> void:
	var dir := OS.get_environment("HC_SHOTS")
	if dir == "":
		return
	shot_t += delta
	if shot_t >= 15.0:
		shot_t = 0.0
		shot_n += 1
		var img: Image = get_viewport().get_texture().get_image()
		img.save_png("%s/auto-%03d-%s.png" % [dir,shot_n,state])

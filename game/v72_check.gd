extends RefCounted
# Developer-only checks for v0.72 (run with `-- --v72-check`). Never runs in the shipped game flow.
var g

func _init(main) -> void:
	g = main

func ground_y(x: float, z: float) -> float:
	var q := PhysicsRayQueryParameters3D.create(Vector3(x,40,z),Vector3(x,-6,z))
	q.exclude = [g.player.get_rid(),g.car.get_rid()]
	var hit: Dictionary = g.get_world_3d().direct_space_state.intersect_ray(q)
	return float(hit["position"].y) if not hit.is_empty() else -99.0

func probe(x0: float, x1: float, z0: float, z1: float, st: float) -> void:
	var z := z0
	while z <= z1:
		var line := "%5d " % int(z)
		var x := x0
		while x <= x1:
			var y := ground_y(x,z)
			var ch := " "
			if y > -90.0:
				if y > 1.0:
					ch = str(mini(9,int(y)))
				elif g._blocked_at(Vector3(x,y+1.3,z),1.0):
					ch = "#"
				else:
					ch = "." if y < 0.2 else "+"
			line += ch
			x += st
		print(line)
		z += st

func run() -> void:
	await g.get_tree().physics_frame
	await g.get_tree().physics_frame
	if OS.get_environment("HC_PROBE") != "":
		var a := OS.get_environment("HC_PROBE").split(",")
		probe(float(a[0]),float(a[1]),float(a[2]),float(a[3]),float(a[4]))
		return
	# Never touches the real save: it is put back byte for byte at the end.
	var save_existed := FileAccess.file_exists(g.SAVE_PATH)
	var save_bytes := FileAccess.get_file_as_bytes(g.SAVE_PATH) if save_existed else PackedByteArray()
	if g.crate_open:
		g.crate_done = true
		g.crate_open = false
		if g.crate_root != null:
			g.crate_root.hide()
	g.paused = false
	g.paris.dry = true
	g.gq.idx = 0
	g.gq.prog = 0
	g.gq.got = {}
	g.gq.all_paid = false
	g.gq.daily_day = ""
	g.gq.salad_has.clear()
	if OS.get_environment("HC_V72") == "shots":
		await shots()
	else:
		await checks()
	if save_existed:
		var f := FileAccess.open(g.SAVE_PATH,FileAccess.WRITE)
		f.store_buffer(save_bytes)
		f.close()
	elif FileAccess.file_exists(g.SAVE_PATH):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(g.SAVE_PATH))

func frames(n: int) -> void:
	for i in n:
		await g.get_tree().physics_frame
		await g.get_tree().process_frame

func shots() -> void:
	# Real renders with the normal HUD: the terrace, the garden quest, the cure gun and the boss.
	var ws = g.paris
	ws.go_portal()
	await frames(50)
	await g._save_shot("v72-1-terrace")
	g.cam_lock = true
	g.camera.position = ws.hub_pos+Vector3(0,26,34)
	g.camera.look_at(ws.hub_pos+Vector3(0,2,-4))
	await frames(6)
	await g._save_shot("v72-2-terrace-above")
	g.cam_lock = false
	g.gq.dry = true
	g.player.position = Vector3(-96,0.9,150)
	await frames(50)
	var fp: Vector3 = g.gq.picks[0]["pos"]
	g.player.position = fp+Vector3(4,0.9,6)
	await frames(30)
	await g._save_shot("v72-3-garden-quest")
	var wi := int(OS.get_environment("HC_WORLD")) if OS.get_environment("HC_WORLD") != "" else 0
	var w = ws.list[wi]
	await w.enter()
	await frames(50)
	var cu = w.cu
	var zn: Node3D = cu.roam[1][0]
	g.player.position = w.C+zn.position+Vector3(5,0.9,5)
	await frames(30)
	await g._save_shot("v72-4-cure-gun")
	w.dry = false
	cu.fire()
	await frames(4)
	await g._save_shot("v72-5-shot")
	w.dry = true
	g.player.position = cu.arena_pos()+Vector3(0,0.9,16)
	await frames(30)
	await g._save_shot("v72-6-lair")
	cu.wake()
	cu.force_players = 3
	await frames(110)
	await g._save_shot("v72-7-boss")
	g.cam_lock = true
	var bp: Vector3 = w.C+cu.b_node.position
	var fw: Vector3 = cu.b_node.global_transform.basis.z.normalized()
	g.camera.position = bp+fw*13.0+Vector3(3,2.0,0)
	g.camera.look_at(bp+Vector3(0,4.0,0))
	await frames(6)
	await g._save_shot("v72-8-boss-wide")
	g.cam_lock = false

func checks() -> void:
	var fails := 0
	# 1. leaderboard: levels above 20 are sent capped and shown from XP
	var me: Dictionary = g._lb_me()
	var l1: int = g._lb_level({"level":20,"xp":12550})
	var l2: int = g._lb_level({"level":20,"xp":10450})
	var l3: int = g._lb_level({"level":7,"xp":999999})
	print("LB me_level=",me["level"]," shown=",l1,",",l2,",",l3)
	if int(me["level"]) > 20 or l1 != 21 or l2 != 20 or l3 != 7:
		fails += 1
	# 2. Fruit Garden quests
	var gq = g.gq
	gq.dry = true
	g.player.position = Vector3(-90,0.9,140)
	gq.tick(0.5)
	print("GQ first=",gq.title(gq.current())," picks=",gq.picks.size())
	var r: String = gq.selftest()
	print("GQ ",r)
	if not r.begins_with("chain=16/16 bad=0") or not r.ends_with("daily_paid=true"):
		fails += 1
	var cf := ConfigFile.new()
	gq.save_state(cf)
	gq.idx = 0
	gq.load_state(cf)
	print("GQ reload idx=",gq.idx," all=",gq.all_paid)
	# 3. Portal Terrace: five gates on clear ground, walking through one travels
	var ws = g.paris
	var clear := true
	for gt in ws.gates:
		var gp: Vector3 = gt[0]
		if ground_y(gp.x,gp.z) < -1.0 or absf(ground_y(gp.x,gp.z)) > 0.3:
			clear = false
	print("TERRACE gates=",ws.gates.size()," ground_ok=",clear," centre=",ws.hub_pos)
	if ws.gates.size() != 5 or not clear:
		fails += 1
	ws.go_portal()
	await g.get_tree().physics_frame
	ws.gate_tick(0.1)
	g.player.position = (ws.gates[4][0] as Vector3)+Vector3(0,0.9,0)
	ws.armed = true
	ws.gate_tick(0.1)
	print("TERRACE sky gate locked, still home=",ws.current() == null and not ws.in_sky(g.player.position))
	g.player.position = (ws.gates[1][0] as Vector3)+Vector3(0,0.9,0)
	ws.armed = true
	ws.gate_tick(0.1)
	for k in 8:
		await g.get_tree().physics_frame
	print("TERRACE gate 1 -> ",ws.current().W["name"] if ws.current() != null else "nowhere")
	if ws.current() != ws.list[1]:
		fails += 1
	ws.go_home()
	await g.get_tree().physics_frame
	# 4. cure gun, rescue quests and the boss in every city
	for wi in ws.list.size():
		var w = ws.list[wi]
		var cu = w.cu
		var tag := "CU[%d]" % wi
		await w.enter()
		await g.get_tree().physics_frame
		cu.day = ""
		cu.boss_won = false
		cu.boss_day = ""
		cu.tick(0.1)
		var bad := 0
		for z in cu.roam:
			var zl := Vector2((z[0] as Node3D).position.x,(z[0] as Node3D).position.z)
			if w.in_building(zl,0.5):
				bad += 1
				print(tag," zombie in building ",zl)
		for t in cu.trapped:
			if w.in_building(t[1],0.5):
				bad += 1
				print(tag," trapped in building ",t[1])
		var al: Vector2 = cu.arena()
		if w.in_building(al,3.0) or cu.arena_r < 6.0:
			bad += 1
			print(tag," ARENA TIGHT r=",cu.arena_r)
		print(tag," lair r=",cu.arena_r," from_portal=",int(al.distance_to(w.RET))," roam=",cu.roam.size()," trapped=",cu.trapped.size()," bad_spots=",bad," arena=",al," items=",cu.quest_items(g.player.position).size())
		if cu.roam.size() != cu.ROAM+10 or bad > 0:
			fails += 1
		var cash0: int = g.cash
		# shoot everything
		var guard := 0
		while cu.cured < 12 and guard < 200 and not cu.roam.is_empty():
			guard += 1
			var zn: Node3D = cu.roam[0][0]
			g.player.position = w.C+zn.position+Vector3(3,0.9,0)
			cu.cd = 0.0
			cu.fire()
		print(tag," cured=",cu.cured," brutes=",cu.brutes," paid=",cu.paid," shots=",guard)
		for k in 30:
			if cu.roam.is_empty():
				break
			var zn2: Node3D = cu.roam[0][0]
			g.player.position = w.C+zn2.position+Vector3(3,0.9,0)
			cu.cd = 0.0
			cu.fire()
		for t in cu.trapped:
			g.player.position = cu.world(t[1])+Vector3(0,0.9,0)
			cu.tick_trapped(g.player.position)
		print(tag," rescued=",cu.rescued," brutes=",cu.brutes," paid=",cu.paid," gain=",g.cash-cash0)
		if cu.rescued != 5 or cu.paid != 7:
			fails += 1
		# boss
		g.player.position = cu.arena_pos()+Vector3(4,0.9,0)
		var pr: String = w.prompt()
		w.interact()
		var h0: float = cu.b_hp
		g.player.position = cu.arena_pos()+Vector3(20,0.9,0)
		cu.cd = 0.0
		cu.fire()
		var d1: float = h0-cu.b_hp
		cu.force_players = 3
		cu.cd = 0.0
		cu.fire()
		var d3: float = h0-d1-cu.b_hp
		cu.net({"a":"hit","d":40.0})
		cu.net({"a":"st","hp":5000,"e":30})
		print(tag," boss prompt=",pr," on=",cu.b_on," dmg1=",d1," dmg3=",d3," hp_after_sync=",cu.b_hp," t=",cu.b_t)
		if pr != "WAKE THE BOSS" or not cu.b_on or d1 != 4.0 or d3 != 40.0 or cu.b_hp != 5000.0:
			fails += 1
		for k in 40:
			cu.boss_tick(0.25,g.player.position)
		print(tag," boss ticks: roars=",cu.b_roars," temp_runners=",cu.roam.size()," hp=",cu.hp)
		cu.hp = -1.0
		cu.tick(0.01)
		print(tag," death -> at_portal=",w.near(g.player.position,w.ret_pos,8.0)," hp=",cu.hp," boss_still_on=",cu.b_on)
		var c1: int = g.cash
		cu.hit_boss(99999.0,true)
		print(tag," boss won=",cu.boss_won," on=",cu.b_on," reward=",g.cash-c1," runners_left=",cu.roam.size())
		if not cu.boss_won or cu.b_on or g.cash-c1 != 25000:
			fails += 1
		cu.wake()
		cu.b_t = cu.BOSS_TIME-0.1
		cu.boss_tick(0.3,g.player.position)
		print(tag," timeout -> on=",cu.b_on)
		cu.force_players = 0
		var cf2 := ConfigFile.new()
		w.save_state(cf2)
		w.load_state(cf2)
		w.go_home()
		await g.get_tree().physics_frame
		cu.tick(0.1)
		print(tag," left city: props_freed=",cu.props == null," sky=",g.infect_amt)
		if cu.props != null:
			fails += 1
	# 5. a call for help from another player puts a JOIN row in the feed; JOIN lands at the lair
	ws.net_msg({"i":"p-test","n":"Tester","w":2,"a":"start","hp":12000,"e":0})
	var row := ""
	var inv := {}
	for item in g.feed:
		if item["from"] == "p-test":
			row = String(item["text"])
			inv = item["invite"]
	print("CALL feed=",row," invite=",inv," live=",ws.live_line()," summary=",ws.summary(2))
	g._accept_invite("p-test")
	for k in 10:
		await g.get_tree().physics_frame
	var w2 = ws.list[2]
	print("JOIN in_city=",w2.in_paris(g.player.position)," dist_to_lair=",int(g.player.position.distance_to(w2.cu.arena_pos())))
	if not w2.in_paris(g.player.position) or inv.is_empty():
		fails += 1
	w2.go_home()
	# 6. players inside a portal city are no longer dropped
	g._online_peer_update({"i":"p-far","n":"Far","x":5210.0,"y":0.9,"z":705.0})
	print("PEER in city kept=",g.online_peers.has("p-far")," players_in(2)=",ws.players_in(2))
	if not g.online_peers.has("p-far"):
		fails += 1
	print("V72_CHECK ","OK" if fails == 0 else "FAILED %d" % fails)

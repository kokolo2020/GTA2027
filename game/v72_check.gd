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
	if OS.get_environment("HC_ONLY") == "bosses":
		for wi2 in ws.list.size():
			var wb = ws.list[wi2]
			await wb.enter()
			await frames(40)
			var cb = wb.cu
			cb.force_players = 3
			g.player.position = cb.arena_pos()+Vector3(0,0.9,cb.arena_clear-3.0)
			cb.wake()
			cb.b_rise = 5.0
			cb.b_slam = 0.0
			cb.b_atk = 1
			await frames(14)
			g.cam_lock = true
			var bp2: Vector3 = wb.C+cb.b_node.position
			g.camera.position = bp2+Vector3(7,4.5,cb.arena_clear+2.0)
			g.camera.look_at(bp2+Vector3(0,4.0,0))
			await frames(5)
			await g._save_shot("v76-boss-%d-%s" % [wi2,wb.W["save"]])
			if wi2 == 0:
				wb.dry = false
				cb.boss_day = ""
				cb.hit_boss(99999.0,true)
				g.camera.position = cb.arena_pos()+Vector3(6,5,cb.arena_clear+12.0)
				g.camera.look_at(cb.arena_pos()+Vector3(0,10.0,0))
				await frames(9)
				await g._save_shot("v76-victory")
				wb.dry = true
			else:
				cb.boss_end(false,true)
			g.cam_lock = false
			wb.go_home()
			await frames(10)
		return
	if OS.get_environment("HC_ONLY") == "banner":
		ws.dry = false
		for k in 6:
			ws.net_msg({"i":"p-test","n":"Master Kolo","w":0,"a":"st","hp":9000,"e":10})
			await frames(10)
		await g._save_shot("v75-banner")
		ws.dry = true
		return
	if OS.get_environment("HC_ONLY") == "summit":
		g.cam_lock = true
		g.camera.position = ws.hub_pos+Vector3(0,9,22)
		g.camera.look_at(ws.hub_pos+Vector3(0,1.5,-2))
		await frames(6)
		await g._save_shot("v75-roles")
		g.cam_lock = false
		return
	g.cam_lock = true
	g.camera.position = ws.hub_pos+Vector3(26,16,40)
	g.camera.look_at(ws.hub_pos+Vector3(0,1,-2))
	await frames(6)
	await g._save_shot("v72-2b-summit-side")
	g.camera.position = Vector3(142.3,8.4,6.0)
	g.camera.look_at(ws.hub_pos+Vector3(0,3.0,0))
	await frames(6)
	await g._save_shot("v72-2c-from-lookout")
	g.camera.position = ws.hub_pos+Vector3(0,24,30)
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
	for cp in [[1,0.2,"cast-bolt"],[2,0.28,"cast-blast-up"],[2,0.72,"cast-blast-down"]]:
		cu.cast(int(cp[0]))
		cu.cast_hold = float(cp[1])*cu.cast_len
		await frames(8)
		g.cam_lock = true
		g.camera.position = g.player.position+g.player.global_transform.basis.x*3.4+g.player.global_transform.basis.z*1.2+Vector3(0,0.7,0)
		g.camera.look_at(g.player.position+Vector3(0,0.3,0))
		await frames(4)
		await g._save_shot("v72-5-"+String(cp[2]))
		g.cam_lock = false
	cu.cast_hold = -1.0
	cu.cast_kind = 0
	w.dry = true
	g.player.position = cu.arena_pos()+Vector3(0,0.9,16)
	await frames(30)
	await g._save_shot("v72-6-lair")
	g.cam_lock = true
	g.camera.position = cu.arena_pos()+Vector3(8,6,cu.arena_clear+12.0)
	g.camera.look_at(cu.arena_pos()+Vector3(0,3,0))
	await frames(6)
	await g._save_shot("v72-6b-lair-wide")
	g.cam_lock = false
	w.dry = false
	cu.wake()
	cu.force_players = 3
	await frames(40)
	await g._save_shot("v72-6c-awakens")
	w.dry = true
	await frames(110)
	cu.charge = 100.0
	await frames(10)
	await g._save_shot("v72-7-boss")
	w.dry = false
	cu.blast()
	await frames(6)
	await g._save_shot("v72-7b-blast")
	w.dry = true
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
		if absf(ground_y(gp.x,gp.z)-ws.hub_pos.y) > 0.3:
			clear = false
	# the way from the Summit Lookout across the rock bridge is level and open
	var bz := -6.0
	while bz > -24.0:
		var gy := ground_y(142.3,bz)
		if absf(gy-5.7) > 0.25 or g._blocked_at(Vector3(142.3,gy+1.3,bz),0.5):
			clear = false
			print("TERRACE bridge blocked at z=",bz," y=",gy)
		bz -= 1.0
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
		g.paris.role = 0   # the test must not depend on the role saved in the real game
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
		if w.in_building(al,3.0) or cu.arena_clear < 11.0:
			bad += 1
			print(tag," ARENA TIGHT r=",cu.arena_r)
		var trees_in := 0
		for tp: Vector2 in w.tree_pts:
			if tp.distance_to(al) < cu.arena_clear:
				trees_in += 1
		print(tag," lair clear=",cu.arena_clear," trees_inside=",trees_in," sleeper=",is_instance_valid(cu.sleeper))
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
		print(tag," cured=",cu.cured," brutes=",cu.brutes," paid=",cu.paid," shots=",guard," charge=",cu.charge)
		if cu.charge < 100.0:
			fails += 1
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
		# CURE BLAST: charges with hits, 100 base damage x10 with three players, and resets
		var hb: float = cu.b_hp
		cu.charge = 0.0
		cu.blast()
		var none: float = hb-cu.b_hp
		cu.charge = 100.0
		cu.blast()
		var bd: float = hb-cu.b_hp
		cu.b_hp = hb
		print(tag," blast empty=",none," full=",bd," charge_after=",cu.charge)
		if none != 0.0 or bd != 1000.0 or cu.charge != 0.0:
			fails += 1
		cu.net({"a":"hit","d":40.0})
		cu.net({"a":"st","hp":5000,"e":30})
		print(tag," boss prompt=",pr," on=",cu.b_on," dmg1=",d1," dmg3=",d3," hp_after_sync=",cu.b_hp," t=",cu.b_t)
		if pr != "WAKE THE BOSS" or not cu.b_on or d1 != 4.0 or d3 != 40.0 or cu.b_hp != 5000.0:
			fails += 1
		cu.b_rise = 5.0
		var kinds := {}
		for k in 120:
			cu.boss_tick(0.25,g.player.position)
			if cu.b_slam_live:
				kinds[cu.b_pat] = true
		var minions := 0
		var weakest := 99.0
		for zz in cu.roam:
			if String(zz[2]) == "minion":
				minions += 1
		print(tag," minions out=",minions," bite=",cu.MINION[3]," vs walker ",cu.o.inf.SPEC["walker"][3])
		if minions < 4 or minions > cu.MINION_MAX or float(cu.MINION[3]) >= float(cu.o.inf.SPEC["runner"][3]):
			fails += 1
		print(tag," boss attack types seen=",kinds.size())
		if kinds.size() < 3:
			fails += 1
		print(tag," boss ticks: roars=",cu.b_roars," temp_runners=",cu.roam.size()," hp=",cu.hp)
		cu.hp = -1.0
		cu.tick(0.01)
		print(tag," death -> at_portal=",w.near(g.player.position,w.ret_pos,8.0)," hp=",cu.hp," boss_still_on=",cu.b_on)
		var c1: int = g.cash
		var lv1: int = g._level()
		var top: bool = lv1 >= g._level_table().size()
		cu.hit_boss(99999.0,true)
		print(tag," ",cu.boss_name()," hp=",cu.bhp()," sig=",cu.boss()["sig"]," won=",cu.boss_won," on=",cu.b_on," reward=",g.cash-c1," level ",lv1,"->",g._level()," party=",cu.party_t > 0.0)
		if not cu.boss_won or cu.b_on or g.cash-c1 != 100000 or (not top and g._level() != lv1+1) or cu.party_t <= 0.0:
			fails += 1
		var c2: int = g.cash
		cu.wake()
		cu.hit_boss(99999.0,true)
		print(tag," second win same day pays ",g.cash-c2," level stays ",g._level() == (lv1 if top else lv1+1))
		if g.cash-c2 != 10000:
			fails += 1
		cu.wake()
		cu.b_t = cu.BOSS_TIME-0.1
		cu.boss_tick(0.3,g.player.position)
		await g.get_tree().physics_frame
		print(tag," timeout -> on=",cu.b_on," sent_home=",not w.in_paris(g.player.position))
		if cu.b_on or w.in_paris(g.player.position):
			fails += 1
		await w.enter()
		await g.get_tree().physics_frame
		cu.tick(0.1)
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
	# roles: the stones on the summit set the role; tank has double health and a shield, healer heals
	ws.go_portal()
	await g.get_tree().physics_frame
	var role_ok := true
	for ri in 3:
		g.player.position = ws.hub_pos+(ws.ROLES[ri]["at"] as Vector3)+Vector3(0.5,0.9,0)
		var rp: String = ws.prompt()
		ws.interact()
		if ws.role != ri or not rp.contains(String(ws.ROLES[ri]["n"])):
			role_ok = false
		print("ROLE stone ",ri," prompt=",rp," role=",ws.role)
	var w0 = ws.list[0]
	await w0.enter()
	await g.get_tree().physics_frame
	w0.cu.tick(0.1)
	ws.role = 1
	w0.cu.hp = 200.0
	w0.cu.charge = 100.0
	w0.cu.blast()
	w0.dry = false
	w0.cu.damage(50.0)
	var tank_hp: float = w0.cu.hp
	ws.role = 2
	w0.cu.hp = 20.0
	w0.cu.charge = 100.0
	w0.dry = true
	w0.cu.blast()
	var heal_self: float = w0.cu.hp
	w0.cu.hp = 10.0
	var lp0: Vector2 = w0.cu.local(g.player.position)
	w0.cu.net({"a":"heal","x":lp0.x+5.0,"z":lp0.y,"n":"Medic"})
	var healed: float = w0.cu.hp
	w0.cu.hp = 10.0
	w0.cu.net({"a":"heal","x":lp0.x+80.0,"z":lp0.y,"n":"Medic"})
	var far: float = w0.cu.hp
	ws.role = 0
	w0.cu.hp = 100.0
	w0.cu.shield_t = 0.0
	print("ROLE tank mhp=200 after 50 dmg with shield=",tank_hp," healer self=",heal_self," healed by wave=",healed," out of range=",far)
	if not role_ok or tank_hp != 190.0 or heal_self != 100.0 or healed != 70.0 or far != 10.0:
		fails += 1
	w0.go_home()
	await g.get_tree().physics_frame
	# boss music: the whole loop renders, is loud enough and does not clip
	var cm = ws.list[0].cu
	g.remove_meta("boss_music") if g.has_meta("boss_music") else null
	cm.music_score()
	var events: int = cm.mus_ev.size()
	var steps := 0
	var peak := 0.0
	while not g.has_meta("boss_music") and steps < 100000:
		cm.music_step(50)
		steps += 1
	var wav: AudioStreamWAV = g.get_meta("boss_music") if g.has_meta("boss_music") else null
	var clipped := 0
	if wav != null:
		for k in range(0,wav.data.size(),2):
			var sv := absf(float(wav.data.decode_s16(k))/30000.0)
			peak = maxf(peak,sv)
			if sv >= 0.999:
				clipped += 1
	print("MUSIC clipped samples=",clipped)
	print("MUSIC events=",events," steps=",steps," bytes=",wav.data.size() if wav != null else 0," peak=",snappedf(peak,0.01))
	if wav == null or wav.data.size() != cm.MUS_LEN*2 or peak < 0.3 or clipped > 200:
		fails += 1
	# 5. a call for help from another player puts a JOIN row in the feed; JOIN lands at the lair
	ws.net_msg({"i":"p-test","n":"Tester","w":2,"a":"start","hp":12000,"e":0})
	var row := ""
	var inv := {}
	for item in g.feed:
		if item["from"] == "p-test":
			row = String(item["text"])
			inv = item["invite"]
	# the banner: shown while the fight's heartbeat keeps coming, gone when it stops or you are in that city
	ws.banner_tick()
	var b1: bool = ws.banner_layer != null and ws.banner_layer.visible
	var btxt: String = ws.banner_text.text if ws.banner_text != null else ""
	ws.calls[2][0] = Time.get_ticks_msec()/1000.0-20.0
	ws.banner_tick()
	var b2: bool = ws.banner_layer.visible
	ws.net_msg({"i":"p-test","n":"Tester","w":2,"a":"st","hp":9000,"e":10})
	ws.banner_tick()
	var b3: bool = ws.banner_layer.visible
	print("BANNER on_call=",b1," after_silence=",b2," on_heartbeat=",b3," text=",btxt.replace("\n"," | "))
	if not b1 or b2 or not b3:
		fails += 1
	print("CALL feed=",row," invite=",inv," live=",ws.live_line()," summary=",ws.summary(2))
	g._accept_invite("p-test")
	for k in 10:
		await g.get_tree().physics_frame
	var w2 = ws.list[2]
	ws.banner_tick()
	print("BANNER hidden once in that city=",not ws.banner_layer.visible)
	if ws.banner_layer.visible:
		fails += 1
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

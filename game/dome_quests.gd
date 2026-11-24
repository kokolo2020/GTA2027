extends Node
# v0.56.3 Dome Quests: a generous daily quest list that only exists inside the Harbor Dome.
# Eleven quests (visit the tree, the stage, the Challenge Corner, the snowmen, collect gift boxes,
# hang out, solve the hourly challenge) each pay once a day, plus a big bonus for finishing all ten
# and a daily-visit streak bonus. Twelve gift boxes appear in the dome every day.
# State is saved with the game (dq_* keys); everything resets on a new calendar day.

var g
var chip: Button
var panel: PanelContainer
var title: Label
var box: VBoxContainer
var presents: Array = []        # [Node3D, Vector3 pos, int idx]
var day := ""
var mask := 0                   # quests paid today
var gifts := 0                  # gift boxes taken today
var marks := 0                  # bit 0/1 = snowmen met
var secs := 0.0                 # seconds spent in the dome today
var streak := 0
var last_day := ""
var hr_start := 0
var all_paid := false
var tick_t := 0.0
var cq_orders := 0
var cq_kinds := 0
var cq_special := false
var cq_marks := 0
var lounge_secs := 0.0
var vip_secs := 0.0
var dry := false
var test_log: Array = []

const TREE := Vector3(-8,0,0)          # relative to HUB_C (the giant tree)
const ALL_PAY := 3000
const ALL_XP := 300
const GIFT_N := 12
const QUESTS := [
	{"n":"Walk into the Harbor Dome","pay":200,"xp":20},
	{"n":"Visit the giant Christmas tree","pay":150,"xp":15},
	{"n":"Say hi at the comedy stage","pay":150,"xp":15},
	{"n":"Visit the Challenge Corner","pay":150,"xp":15},
	{"n":"Meet both snowmen","pay":200,"xp":20},
	{"n":"Find 6 gift boxes","pay":600,"xp":50},
	{"n":"Find all 12 gift boxes","pay":1200,"xp":100},
	{"n":"Hang out for 3 minutes","pay":400,"xp":30},
	{"n":"Hang out for 10 minutes","pay":1000,"xp":80},
	{"n":"Solve the hourly challenge","pay":500,"xp":50},
	{"n":"Relax in the VIP Lounge (20 s)","pay":400,"xp":40},
	{"n":"Walk into the Chit Chat Roastery","pay":150,"xp":15},
	{"n":"Say hi to all 3 baristas","pay":250,"xp":25},
	{"n":"Order your first drink","pay":200,"xp":20},
	{"n":"Try 3 different drinks","pay":400,"xp":35},
	{"n":"Try all 6 drinks","pay":1000,"xp":90},
	{"n":"Order the drink of the hour","pay":300,"xp":30},
	{"n":"Order 10 drinks today","pay":700,"xp":60},
	{"n":"Hang out in the Roastery Lounge (2 min)","pay":500,"xp":40},
	{"n":"Bring your coffee to the giant tree","pay":350,"xp":30},
	{"n":"Take your coffee to the VIP Lounge","pay":350,"xp":30},
]
const Q_CAFE := 11

func _init(g_main) -> void:
	g = g_main

func today() -> String:
	return g._quick_today()

func done_count() -> int:
	var n := 0
	for i in QUESTS.size():
		if mask & (1 << i):
			n += 1
	return n

func gift_count() -> int:
	var n := 0
	for i in GIFT_N:
		if gifts & (1 << i):
			n += 1
	return n

func gift_pos(i: int) -> Vector3:
	var a := TAU*float(i)/float(GIFT_N)+0.2
	var r := 12.0+float(i % 4)*7.0
	return g.HUB_C+Vector3(cos(a)*r,0.0,sin(a)*r)

func gift_pay(i: int) -> int:
	return 500 if i % 4 == 3 else 100+((i*37) % 150)

func total_today() -> int:
	var t := 0
	for q in QUESTS:
		t += int(q["pay"])
	for i in GIFT_N:
		t += gift_pay(i)
	return t+ALL_PAY

func quest_pos(i: int) -> Variant:
	match i:
		0: return g.HUB_C
		1: return g.HUB_C+TREE
		2: return g.HUB_STAGE+Vector3(-8,0,0)
		3: return g.hourly.term if g.hourly != null and g.hourly.term != Vector3.INF else null
		4: return g.HUB_STAGE+Vector3(-10,0,-9)
		5, 6:
			for k in GIFT_N:
				if not (gifts & (1 << k)):
					return gift_pos(k)
			return null
		9: return g.hourly.term if g.hourly != null and g.hourly.term != Vector3.INF else null
		10: return g.VIP_C
		11, 12, 13, 14, 15, 16, 17:
			return g.cafe.spot if g.cafe != null and g.cafe.spot != Vector3.INF else null
		18: return g.cafe.lounge_at if g.cafe != null and g.cafe.lounge_at != Vector3.INF else null
		19: return g.HUB_C+TREE
		20: return g.VIP_C
	return null

func progress(i: int) -> String:
	match i:
		4: return "%d/2" % ((1 if (marks & 1) != 0 else 0)+(1 if (marks & 2) != 0 else 0))
		5: return "%d/6" % mini(gift_count(),6)
		6: return "%d/12" % gift_count()
		7: return "%d:%02d/3:00" % [mini(int(secs),180)/60,mini(int(secs),180) % 60]
		8: return "%d:%02d/10:00" % [mini(int(secs),600)/60,mini(int(secs),600) % 60]
		10: return "%ds/20s" % mini(int(vip_secs),20)
		12: return "%d/3" % _bits(cq_marks)
		14: return "%d/3" % mini(_bits(cq_kinds),3)
		15: return "%d/6" % _bits(cq_kinds)
		17: return "%d/10" % mini(cq_orders,10)
		18: return "%d:%02d/2:00" % [mini(int(lounge_secs),120)/60,mini(int(lounge_secs),120) % 60]
	return ""

func _bits(m: int) -> int:
	var n := 0
	for i in 8:
		if m & (1 << i):
			n += 1
	return n

# ---------- state ----------
func new_day(d: String) -> void:
	var yesterday := Time.get_date_string_from_unix_time(int(Time.get_unix_time_from_datetime_string(d+"T00:00:00"))-86400)
	day = d
	streak = streak+1 if last_day == yesterday else (streak if last_day == d else 1)
	mask = 0
	gifts = 0
	marks = 0
	secs = 0.0
	vip_secs = 0.0
	cq_orders = 0
	cq_kinds = 0
	cq_special = false
	cq_marks = 0
	lounge_secs = 0.0
	all_paid = false
	hr_start = g.hr_total
	refresh_presents()

func save_state(file: ConfigFile) -> void:
	file.set_value("domequests","day",day)
	file.set_value("domequests","mask",mask)
	file.set_value("domequests","gifts",gifts)
	file.set_value("domequests","marks",marks)
	file.set_value("domequests","secs",secs)
	file.set_value("domequests","streak",streak)
	file.set_value("domequests","last",last_day)
	file.set_value("domequests","hr_start",hr_start)
	file.set_value("domequests","all",all_paid)
	file.set_value("domequests","cq_orders",cq_orders)
	file.set_value("domequests","cq_kinds",cq_kinds)
	file.set_value("domequests","cq_special",cq_special)
	file.set_value("domequests","cq_marks",cq_marks)
	file.set_value("domequests","lounge_secs",lounge_secs)

func load_state(file: ConfigFile) -> void:
	day = String(file.get_value("domequests","day",""))
	mask = int(file.get_value("domequests","mask",0)) & ((1 << QUESTS.size())-1)
	gifts = int(file.get_value("domequests","gifts",0)) & ((1 << GIFT_N)-1)
	marks = int(file.get_value("domequests","marks",0)) & 3
	secs = float(file.get_value("domequests","secs",0.0))
	streak = maxi(0,int(file.get_value("domequests","streak",0)))
	last_day = String(file.get_value("domequests","last",""))
	hr_start = int(file.get_value("domequests","hr_start",g.hr_total))
	all_paid = bool(file.get_value("domequests","all",false))
	cq_orders = maxi(0,int(file.get_value("domequests","cq_orders",0)))
	cq_kinds = int(file.get_value("domequests","cq_kinds",0)) & 63
	cq_special = bool(file.get_value("domequests","cq_special",false))
	cq_marks = int(file.get_value("domequests","cq_marks",0)) & 7
	lounge_secs = maxf(0.0,float(file.get_value("domequests","lounge_secs",0.0)))
	refresh_presents()

# ---------- rewards ----------
func pay(amount: int, xp: int, text: String) -> void:
	g.cash += amount
	if not g.legacy_rules:
		g.bonus_xp += xp
	if not dry:
		g._show_toast("DOME QUEST: %s  +$%d  +%d XP" % [text,amount,xp])
		g._feed_add("Dome quest: %s (+$%d)" % [text,amount],"")
		if not ("--smoke-test" in OS.get_cmdline_user_args()):
			g._play_coin()
			g._quick_fx(g.player.position+Vector3(0,1,0))
	test_log.append(text)

func award(i: int) -> void:
	if mask & (1 << i):
		return
	mask |= 1 << i
	var q: Dictionary = QUESTS[i]
	var amount := int(q["pay"])
	if i == 0:
		amount += mini(streak,7)*100
	pay(amount,int(q["xp"]),String(q["n"]) if i != 0 else "%s (day %d streak)" % [q["n"],streak])
	if not all_paid and done_count() == QUESTS.size():
		all_paid = true
		pay(ALL_PAY,ALL_XP,"ALL DOME QUESTS DONE")
	if not dry:
		g._save_progress()
		refresh_ui()

func take_gift(i: int) -> void:
	if gifts & (1 << i):
		return
	gifts |= 1 << i
	pay(gift_pay(i),20,"Gift box %d/%d" % [gift_count(),GIFT_N])
	refresh_presents()
	if gift_count() >= 6:
		award(5)
	if gift_count() >= GIFT_N:
		award(6)
	if not dry:
		g._save_progress()
		refresh_ui()

# called by the café when a drink is handed over
func cafe_order(idx: int, special: bool) -> void:
	cq_orders += 1
	cq_kinds |= 1 << clampi(idx,0,5)
	if special:
		cq_special = true
	cafe_check()

func cafe_check() -> void:
	if cq_orders >= 1:
		award(13)
	if _bits(cq_kinds) >= 3:
		award(14)
	if _bits(cq_kinds) >= 6:
		award(15)
	if cq_special:
		award(16)
	if cq_orders >= 10:
		award(17)

# checks for a position (the player's, or a test position)
func check_at(p: Vector3, hr_total_now: int) -> void:
	var c: Vector3 = g.HUB_C
	if Vector2(p.x-c.x,p.z-c.z).length() > g.HUB_R-2.0:
		return
	award(0)
	if Vector2(p.x-(c.x+TREE.x),p.z-(c.z+TREE.z)).length() < 7.0:
		award(1)
	if Vector2(p.x-g.HUB_STAGE.x,p.z-g.HUB_STAGE.z).length() < 11.0:
		award(2)
	if g.hourly != null and g.hourly.term != Vector3.INF and Vector2(p.x-g.hourly.core.x,p.z-g.hourly.core.z).length() < 9.0:
		award(3)
	for k in 2:
		var s: Vector3 = g.HUB_STAGE+Vector3(-10,0,-9.0 if k == 0 else 9.0)
		if Vector2(p.x-s.x,p.z-s.z).length() < 5.0:
			marks |= 1 << k
	if marks == 3:
		award(4)
	for k in GIFT_N:
		if not (gifts & (1 << k)):
			var gp := gift_pos(k)
			if Vector2(p.x-gp.x,p.z-gp.z).length() < 2.4:
				take_gift(k)
	if secs >= 180.0:
		award(7)
	if secs >= 600.0:
		award(8)
	if hr_total_now > hr_start:
		award(9)
	if vip_secs >= 20.0 and Vector2(p.x-g.VIP_C.x,p.z-g.VIP_C.z).length() < 9.0:
		award(10)
	if g.cafe != null and g.cafe.spot != Vector3.INF:
		if Vector2(p.x-g.cafe.spot.x,p.z-g.cafe.spot.z).length() < 9.0:
			award(11)
		for k in 3:
			var sp: Vector3 = g.cafe.counter_spot(k)
			if Vector2(p.x-sp.x,p.z-sp.z).length() < 2.0:
				cq_marks |= 1 << k
		if cq_marks == 7:
			award(12)
		if lounge_secs >= 120.0 and g.cafe.in_lounge(p):
			award(18)
		if g.cafe.holding_cup():
			if Vector2(p.x-(c.x+TREE.x),p.z-(c.z+TREE.z)).length() < 7.0:
				award(19)
			if Vector2(p.x-g.VIP_C.x,p.z-g.VIP_C.z).length() < 9.0:
				award(20)
	cafe_check()

# ---------- 3D gift boxes ----------
func build_presents() -> void:
	var root := Node3D.new()
	root.name = "DomeGifts"
	g.add_child(root)
	for i in GIFT_N:
		var n := Node3D.new()
		n.position = gift_pos(i)+Vector3(0,1.1,0)
		root.add_child(n)
		var golden := i % 4 == 3
		var cols := [Color("ff5a5a"),Color("4aa8ff"),Color("7dff9a")]
		var col: Color = Color("ffd23f") if golden else cols[i % 3]
		var b := BoxMesh.new()
		b.size = Vector3(1.1,0.9,1.1)
		var mi := MeshInstance3D.new()
		mi.mesh = b
		var m := StandardMaterial3D.new()
		m.albedo_color = col
		m.emission_enabled = true
		m.emission = col
		m.emission_energy_multiplier = 1.6 if golden else 0.7
		mi.material_override = m
		n.add_child(mi)
		var rb := BoxMesh.new()
		rb.size = Vector3(1.15,0.95,0.2)
		var ri := MeshInstance3D.new()
		ri.mesh = rb
		var rm := StandardMaterial3D.new()
		rm.albedo_color = Color("fff3c4")
		ri.material_override = rm
		n.add_child(ri)
		var lamp := OmniLight3D.new()
		lamp.light_color = col
		lamp.light_energy = 0.8
		lamp.omni_range = 5.0
		n.add_child(lamp)
		presents.append([n,gift_pos(i),i])
	refresh_presents()

func refresh_presents() -> void:
	for e in presents:
		(e[0] as Node3D).visible = not (gifts & (1 << int(e[2])))

# ---------- UI ----------
func build(root: Control) -> void:
	chip = g._button("",open)
	chip.add_theme_font_size_override("font_size",17)
	chip.add_theme_stylebox_override("normal",g._panel(Color(0.5,0.1,0.18,0.94),18))
	chip.custom_minimum_size = Vector2(0,42)
	root.add_child(chip)
	chip.hide()
	panel = PanelContainer.new()
	panel.add_theme_stylebox_override("panel",g._panel(Color("101a30"),24))
	root.add_child(panel)
	g.extra_panels.append(panel)
	var col := VBoxContainer.new()
	col.add_theme_constant_override("separation",8)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	panel.add_child(col)
	title = g._label("",26,Color("ffd86a"))
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(title)
	var sc := ScrollContainer.new()
	sc.custom_minimum_size = Vector2(620,430)
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	col.add_child(sc)
	box = VBoxContainer.new()
	box.add_theme_constant_override("separation",6)
	box.custom_minimum_size.x = 600
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(box)
	col.add_child(g._button("Close",close))
	panel.hide()
	build_presents()

func in_dome() -> bool:
	return g.player != null and not g.driving and Vector2(g.player.position.x-g.HUB_C.x,g.player.position.z-g.HUB_C.z).length() < g.HUB_R-2.0

func refresh_ui() -> void:
	if chip == null:
		return
	chip.text = "  DOME QUESTS  %d/%d  " % [done_count(),QUESTS.size()]
	if panel != null and panel.visible:
		draw()

func draw() -> void:
	for ch in box.get_children():
		ch.queue_free()
	title.text = "HARBOR DOME QUESTS · day %d streak" % maxi(streak,1)
	for i in QUESTS.size():
		var q: Dictionary = QUESTS[i]
		var ok := (mask & (1 << i)) != 0
		var pr := progress(i)
		var t := "%s  %s  +$%d%s" % ["✓" if ok else "○",q["n"],int(q["pay"]),"  (%s)" % pr if (pr != "" and not ok) else ""]
		var b: Button = g._button(t,guide.bind(i))
		b.add_theme_font_size_override("font_size",17)
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		b.modulate = Color(0.7,1,0.75) if ok else Color.WHITE
		box.add_child(b)
	var foot: Label = g._label("Finish all %d: +$%d and %d XP.  Gift boxes glow around the dome (gold ones pay $500).  Tap a quest to get the arrow.  Resets every day." % [QUESTS.size(),ALL_PAY,ALL_XP],15,Color("cbd8de"))
	foot.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	foot.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(foot)

func guide(i: int) -> void:
	var p = quest_pos(i)
	if p != null and not (mask & (1 << i)):
		g.dir_custom = p
		g.dir_custom_name = String(QUESTS[i]["n"])
	close()

func open() -> void:
	if not g.paused:
		g._toggle_menu()
	draw()
	g._open_panel(panel)

func close() -> void:
	if g.paused:
		g._toggle_menu()

func _process(delta: float) -> void:
	if g == null or not g.booted:
		return
	if in_dome() and not g.paused:
		secs += delta
		if Vector2(g.player.position.x-g.VIP_C.x,g.player.position.z-g.VIP_C.z).length() < 9.0:
			vip_secs += delta
		if g.cafe != null and g.cafe.in_lounge(g.player.position):
			lounge_secs += delta
	tick_t += delta
	if tick_t < 0.25:
		return
	tick_t = 0.0
	if day != today():
		last_day = day if day != "" else last_day
		new_day(today())
		g._save_progress()
	var inside := in_dome()
	if chip != null:
		chip.visible = inside and not g.paused
		if chip.visible:
			chip.text = "  DOME QUESTS  %d/%d  " % [done_count(),QUESTS.size()]
			chip.global_position = Vector2(18.0,242.0)
	var t := Time.get_ticks_msec()*0.001
	for e in presents:
		var n: Node3D = e[0]
		if n.visible:
			n.rotation.y = t*1.4+float(e[2])
			n.position.y = 1.1+sin(t*2.0+float(e[2]))*0.18
	if inside and not g.paused:
		check_at(g.player.position,g.hr_total)

# developer / smoke check: every quest pays exactly once, gifts pay once, the all-done bonus pays once
func selftest() -> String:
	var keep := [day,mask,gifts,marks,secs,streak,last_day,hr_start,all_paid,g.cash,g.bonus_xp,g.quick_test_day,test_log.duplicate(),cq_orders,cq_kinds,cq_special,cq_marks,lounge_secs]
	dry = true
	test_log.clear()
	g.quick_test_day = "2031-03-10"
	last_day = "2031-03-09"
	streak = 2
	new_day("2031-03-10")
	var res := "OK"
	if streak != 3:
		res = "streak %d" % streak
	var c0: int = g.cash
	var c: Vector3 = g.HUB_C
	check_at(c+Vector3(0,0,0),g.hr_total)
	if g.cash-c0 != 200+300:
		res = "welcome pay %d" % (g.cash-c0)
	c0 = g.cash
	check_at(c+Vector3(0,0,0),g.hr_total)
	if g.cash != c0:
		res = "double pay"
	check_at(c+TREE,g.hr_total)
	check_at(g.HUB_STAGE+Vector3(-8,0,0),g.hr_total)
	check_at(g.HUB_STAGE+Vector3(-10,0,-9),g.hr_total)
	check_at(g.HUB_STAGE+Vector3(-10,0,9),g.hr_total)
	for k in GIFT_N:
		check_at(gift_pos(k),g.hr_total)
	if gift_count() != GIFT_N:
		res = "gifts %d" % gift_count()
	secs = 700.0
	vip_secs = 25.0
	if g.cafe != null and g.cafe.spot != Vector3.INF:
		check_at(g.cafe.spot,g.hr_total)
		for k in 3:
			check_at(g.cafe.counter_spot(k),g.hr_total)
		for k in 6:
			cafe_order(k,k == 2)
		lounge_secs = 130.0
		check_at(g.cafe.lounge_at,g.hr_total)
		var keep_hand: float = g.cafe.hand_until
		g.cafe.hand_until = Time.get_ticks_msec()/1000.0+100.0
		check_at(c+TREE,g.hr_total)
		check_at(g.VIP_C,g.hr_total)
		g.cafe.hand_until = keep_hand
		cq_orders = 10
		cafe_check()
	check_at(g.VIP_C,g.hr_total)
	check_at(c,g.hr_total)
	check_at(c,g.hr_total+1)
	if done_count() < QUESTS.size()-1:
		res = "done %d" % done_count()
	if g.hourly != null and g.hourly.term != Vector3.INF:
		check_at(g.hourly.core,g.hr_total+1)
	if done_count() != QUESTS.size() or not all_paid:
		res = "not all done %d" % done_count()
	var c1: int = g.cash
	check_at(c,g.hr_total+1)
	if g.cash != c1:
		res = "paid again"
	day = keep[0]; mask = keep[1]; gifts = keep[2]; marks = keep[3]; secs = keep[4]; streak = keep[5]
	last_day = keep[6]; hr_start = keep[7]; all_paid = keep[8]; g.cash = keep[9]; g.bonus_xp = keep[10]
	g.quick_test_day = keep[11]
	test_log = keep[12]
	cq_orders = keep[13]; cq_kinds = keep[14]; cq_special = keep[15]; cq_marks = keep[16]; lounge_secs = keep[17]
	refresh_presents()
	dry = false
	return res

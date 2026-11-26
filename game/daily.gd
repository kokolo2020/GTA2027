extends RefCounted
# v0.66 Daily goals and login streak: a reason to come back every day.
# State is saved in the "daily" section. Goals reset at local midnight.

var g
var day := ""           # day the goals below belong to
var last_login := ""    # last day the streak reward was paid
var streak := 0
var best := 0
var ids: Array = []     # three goal ids for today
var prog := {}          # goal id -> progress
var paid := {}          # goal id -> true once rewarded
var all_paid := false
var base_quick := 0
var last_cash := -1
var layer: CanvasLayer
var body: Label
var test_day := ""

const POOL := {
	"seal":{"text":"Seal an outbreak","need":1,"pay":4000},
	"rescue":{"text":"Rescue 3 survivors","need":3,"pay":2500},
	"quests":{"text":"Finish 3 daily quests","need":3,"pay":3000},
	"earn":{"text":"Earn $10,000","need":10000,"pay":3000},
}
const ORDER := ["seal","rescue","quests","earn"]
const ALL_PAY := 10000
const ALL_XP := 500

func _init(main) -> void:
	g = main

func live() -> bool:
	# Only real play (no test flags) or my own scripted test (test_day set) may pay out.
	return test_day != "" or OS.get_cmdline_user_args().is_empty()

func today() -> String:
	return test_day if test_day != "" else Time.get_date_string_from_system()

func day_num(d: String) -> int:
	return int(Time.get_unix_time_from_datetime_string(d+"T00:00:00")/86400.0)

func roll(d: String) -> void:
	day = d
	var skip := day_num(d) % ORDER.size()
	ids = []
	for i in ORDER.size():
		if i != skip:
			ids.append(ORDER[i])
	prog = {}
	paid = {}
	all_paid = false
	base_quick = int(g.quick_done)
	last_cash = int(g.cash)

# Called when the game has started: pays the streak reward and shows today's goals.
func check_in() -> void:
	if not live():
		return
	var t := today()
	if day != t:
		roll(t)
	if last_login != t:
		if last_login != "" and day_num(t)-day_num(last_login) == 1:
			streak += 1
		else:
			streak = 1
		last_login = t
		best = maxi(best,streak)
		var cash_r := mini(streak,7)*1500
		var xp_r := 100*mini(streak,7)
		var extra := ""
		if streak % 7 == 0:
			cash_r += 10000
			extra = " Week bonus +$10,000!"
		g.cash += cash_r
		if not g.legacy_rules:
			g.bonus_xp += xp_r
		g._show_toast("Day %d streak! +$%d and %d XP.%s Check Menu > PLAY > Daily goals." % [streak,cash_r,xp_r,extra])
		g._feed_add("Daily streak: day %d" % streak,"")
		if test_day == "":
			g._save_progress()

func bump(id: String, n := 1) -> void:
	if not live():
		return
	if not ids.has(id):
		return
	prog[id] = int(prog.get(id,0))+n
	settle()

func value(id: String) -> int:
	return mini(int(prog.get(id,0)),int(POOL[id]["need"]))

func settle() -> void:
	var done := 0
	for id in ids:
		if value(id) >= int(POOL[id]["need"]):
			done += 1
			if not paid.get(id,false):
				paid[id] = true
				var pay := int(POOL[id]["pay"])
				g.cash += pay
				g._show_toast("Daily goal done: %s  +$%d" % [POOL[id]["text"],pay])
				g._play_coin()
	if done == ids.size() and not all_paid:
		all_paid = true
		g.cash += ALL_PAY
		if not g.legacy_rules:
			g.bonus_xp += ALL_XP
		g._show_toast("ALL DAILY GOALS DONE! Bonus +$%d and %d XP." % [ALL_PAY,ALL_XP])
		g._feed_add("All daily goals finished.","")
	if layer != null and layer.visible:
		refresh()
	if test_day == "":
		g._save_progress()

func tick(_delta: float) -> void:
	if last_login == "" or not live():
		return
	if g.cash < 0:
		return
	if last_cash < 0:
		last_cash = int(g.cash)
	var d := int(g.cash)-last_cash
	last_cash = int(g.cash)
	if d > 0 and d < 200000:
		bump_quiet("earn",d)
	var q := int(g.quick_done)-base_quick
	if q != int(prog.get("quests",0)) and ids.has("quests") and q > 0:
		prog["quests"] = q
		settle()
	if last_login != "" and day != today() and test_day == "":
		roll(today())

func bump_quiet(id: String, n: int) -> void:
	if not ids.has(id):
		return
	prog[id] = int(prog.get(id,0))+n
	if value(id) >= int(POOL[id]["need"]) and not paid.get(id,false):
		settle()

func summary() -> String:
	var lines: Array = []
	lines.append("DAILY GOALS      Streak: day %d  (best %d)" % [streak,best])
	lines.append("")
	for id in ids:
		var need := int(POOL[id]["need"])
		var mark := "[x]" if paid.get(id,false) else "[ ]"
		lines.append("%s  %s   %d / %d   (+$%d)" % [mark,POOL[id]["text"],value(id),need,int(POOL[id]["pay"])])
	lines.append("")
	lines.append("Finish all three: +$%d and %d XP %s" % [ALL_PAY,ALL_XP,"(done!)" if all_paid else ""])
	lines.append("Come back every day: bigger login reward up to day 7, then a week bonus.")
	return "\n".join(PackedStringArray(lines))

func refresh() -> void:
	if body != null:
		body.text = summary()

func open() -> void:
	if layer == null:
		build()
	refresh()
	layer.visible = true

func close() -> void:
	if layer != null:
		layer.visible = false

func build() -> void:
	layer = CanvasLayer.new()
	layer.layer = 70
	g.add_child(layer)
	var vs: Vector2 = g.get_viewport().get_visible_rect().size
	var shade := ColorRect.new()
	shade.color = Color(0,0,0,0.55)
	shade.set_anchors_preset(Control.PRESET_FULL_RECT)
	layer.add_child(shade)
	var panel := Panel.new()
	var w := minf(760.0,vs.x-40.0)
	panel.position = Vector2(vs.x*0.5-w*0.5,vs.y*0.5-190.0)
	panel.size = Vector2(w,380)
	layer.add_child(panel)
	body = Label.new()
	body.position = Vector2(24,20)
	body.size = Vector2(w-48.0,250)
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	body.add_theme_font_size_override("font_size",22)
	panel.add_child(body)
	var b := Button.new()
	b.text = "CLOSE"
	b.position = Vector2(w*0.5-90.0,300)
	b.size = Vector2(180,60)
	b.pressed.connect(close)
	panel.add_child(b)
	layer.visible = false

func save_state(file: ConfigFile) -> void:
	file.set_value("daily","day",day)
	file.set_value("daily","last_login",last_login)
	file.set_value("daily","streak",streak)
	file.set_value("daily","best",best)
	file.set_value("daily","ids",ids)
	file.set_value("daily","prog",prog)
	file.set_value("daily","paid",paid)
	file.set_value("daily","all_paid",all_paid)
	file.set_value("daily","base_quick",base_quick)

func load_state(file: ConfigFile) -> void:
	day = String(file.get_value("daily","day",""))
	last_login = String(file.get_value("daily","last_login",""))
	streak = maxi(0,int(file.get_value("daily","streak",0)))
	best = maxi(0,int(file.get_value("daily","best",0)))
	var i: Array = file.get_value("daily","ids",[])
	ids = i.duplicate()
	prog = (file.get_value("daily","prog",{}) as Dictionary).duplicate()
	paid = (file.get_value("daily","paid",{}) as Dictionary).duplicate()
	all_paid = bool(file.get_value("daily","all_paid",false))
	base_quick = int(file.get_value("daily","base_quick",int(g.quick_done)))
	last_cash = -1
	for id in ids:
		if not POOL.has(id):
			ids = []
			break

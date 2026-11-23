extends Node
# v0.56.1: the Hourly Challenge. A new hard puzzle every hour (same for everyone, from the UTC hour):
# GRID 5x5 (lights out), SLIDE 15 and CODE BREAKER. First solve each hour pays; beating the par pays double.
# The terminal is in the Sun Dome (sun_dome.gd builds it and holds the 3D sign).
const PAY := 900
const XP := 150
const KINDS := ["NEON GRID 5x5","SLIDE 15","CODE BREAKER"]
const DIGIT_COL := [Color("ff5f6d"),Color("ffd84d"),Color("7dff9a"),Color("4fe3ff"),Color("b48cff"),Color("ff9bdc")]
var g
var panel: PanelContainer
var title: Label
var info: Label
var box: VBoxContainer
var hour := -1
var kind := 0
var board: Array = []
var moves := 0
var par := 0
var solved := false
var secret: Array = []
var cur: Array = [0,0,0,0]
var history: Array = []
var cells: Array = []
var hist_label: Label
var tick_t := 0.0
var announced := -1
var test_hour := -1
var solution: Array = []
var dry := false

func _init(g_main) -> void:
	g = g_main

func now_hour() -> int:
	return test_hour if test_hour >= 0 else int(Time.get_unix_time_from_system()/3600.0)

func secs_left() -> int:
	return 3600-(int(Time.get_unix_time_from_system()) % 3600)

func near() -> bool:
	if g.driving or g.player == null or g.paused or g.sun_dome == null:
		return false
	var t: Vector3 = g.sun_dome.term
	return Vector2(g.player.position.x-t.x,g.player.position.z-t.z).length() < 3.4

func button_text() -> String:
	return "HOURLY ✓" if g.hr_done == now_hour() else "HOURLY CHALLENGE"

func build_panel(root: Control) -> void:
	panel = PanelContainer.new()
	panel.add_theme_stylebox_override("panel",g._panel(Color("101a30"),24))
	root.add_child(panel)
	g.extra_panels.append(panel)
	var col := VBoxContainer.new()
	col.add_theme_constant_override("separation",10)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	panel.add_child(col)
	title = g._label("",28,Color("7dffea"))
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(title)
	info = g._label("",17,Color("cbd8de"))
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.custom_minimum_size.x = 560
	info.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(info)
	box = VBoxContainer.new()
	box.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_child(box)
	var row := HBoxContainer.new()
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_theme_constant_override("separation",14)
	row.add_child(g._button("Start over",reset))
	row.add_child(g._button("Close",close))
	col.add_child(row)
	panel.hide()

# ---------- puzzle generation (deterministic per hour) ----------
func neighbours(i: int, n: int) -> Array:
	var out: Array = [i]
	var r := i/n
	var c := i % n
	if r > 0: out.append(i-n)
	if r < n-1: out.append(i+n)
	if c > 0: out.append(i-1)
	if c < n-1: out.append(i+1)
	return out

func flip(i: int) -> void:
	for j in neighbours(i,5):
		board[j] = not board[j]

func make(h: int) -> void:
	hour = h
	kind = h % 3
	moves = 0
	solved = false
	history = []
	cur = [0,0,0,0]
	var rng := RandomNumberGenerator.new()
	rng.seed = hash("harbor-hour-%d" % h)
	if kind == 0:
		board = []
		for i in 25:
			board.append(true)
		while true:
			var picks: Array = []
			while picks.size() < 12:
				var c := rng.randi_range(0,24)
				if not c in picks:
					picks.append(c)
			for c in picks:
				flip(c)
			if not is_done():
				par = 12+2
				solution = picks
				break
			for i in 25:
				board[i] = true
	elif kind == 1:
		board = []
		for i in 15:
			board.append(i+1)
		board.append(0)
		var prev := -1
		var path: Array = []
		for step in 140:
			var b := board.find(0)
			var opts := neighbours(b,4)
			opts.erase(b)
			opts.erase(prev)
			var pick: int = opts[rng.randi_range(0,opts.size()-1)]
			board[b] = board[pick]
			board[pick] = 0
			prev = b
			path.append(b)
		path.reverse()
		solution = path
		par = 0
	else:
		secret = []
		for i in 4:
			secret.append(rng.randi_range(0,5))
		par = 6
		solution = secret.duplicate()

func is_done() -> bool:
	if kind == 0:
		for v in board:
			if not v:
				return false
		return true
	if kind == 1:
		for i in 15:
			if int(board[i]) != i+1:
				return false
		return int(board[15]) == 0
	return false

func tap(i: int) -> void:
	if solved:
		return
	if kind == 0:
		flip(i)
	else:
		var b := board.find(0)
		if not i in neighbours(b,4) or i == b:
			return
		board[b] = board[i]
		board[i] = 0
	moves += 1
	if is_done():
		win()
	draw()

func cycle(slot: int) -> void:
	if solved:
		return
	cur[slot] = (int(cur[slot])+1) % 6
	draw()

func check() -> void:
	if solved or history.size() >= 8:
		return
	var black := 0
	var left_s: Array = []
	var left_g: Array = []
	for i in 4:
		if int(cur[i]) == int(secret[i]):
			black += 1
		else:
			left_s.append(int(secret[i]))
			left_g.append(int(cur[i]))
	var white := 0
	for v in left_g:
		var k := left_s.find(v)
		if k >= 0:
			white += 1
			left_s.remove_at(k)
	history.append([cur.duplicate(),black,white])
	moves = history.size()
	if black == 4:
		win()
	draw()

func win() -> void:
	solved = true
	if dry:
		return
	var h := now_hour()
	if g.hr_done == h:
		g._show_toast("Solved again! The reward is once an hour. Next challenge in %d min." % (secs_left()/60+1))
		return
	g.hr_done = h
	g.hr_total += 1
	var fast := (kind == 0 and moves <= par) or (kind == 2 and moves <= par)
	var pay := PAY*(2 if fast else 1)
	g.cash += pay
	g.bonus_xp += XP
	g._save_progress()
	g._show_toast("HOURLY CHALLENGE SOLVED in %d moves!  +$%d  +%d XP%s" % [moves,pay,XP,"  (PAR BONUS x2!)" if fast else ""])
	g._feed_add("Hourly challenge solved: +$%d" % pay,"")
	if not ("--smoke-test" in OS.get_cmdline_user_args()):
		g._play_coin()
		if g.sun_dome != null:
			g._quick_fx(g.sun_dome.core+Vector3(0,1,0))
	refresh_sign()

# ---------- panel ----------
func open() -> void:
	if hour != now_hour():
		make(now_hour())
	if not g.paused:
		g._toggle_menu()
	cells = []
	for ch in box.get_children():
		ch.queue_free()
	draw()
	g._open_panel(panel)

func close() -> void:
	if g.paused:
		g._toggle_menu()

func reset() -> void:
	make(now_hour())
	cells = []
	for ch in box.get_children():
		ch.queue_free()
	draw()

func style_btn(b: Button, col: Color) -> void:
	for st in ["normal","hover","pressed","focus"]:
		b.add_theme_stylebox_override(st,g._panel(col,14))

func draw() -> void:
	if panel == null:
		return
	if kind == 2:
		draw_code()
		return
	var n := 5 if kind == 0 else 4
	if cells.size() != n*n:
		for ch in box.get_children():
			ch.queue_free()
		cells = []
		var grid := GridContainer.new()
		grid.columns = n
		grid.add_theme_constant_override("h_separation",8)
		grid.add_theme_constant_override("v_separation",8)
		var cc := CenterContainer.new()
		cc.add_child(grid)
		box.add_child(cc)
		for i in n*n:
			var b := Button.new()
			b.custom_minimum_size = Vector2(84,84) if n == 5 else Vector2(92,92)
			b.add_theme_font_size_override("font_size",38)
			b.pressed.connect(tap.bind(i))
			g.touch_buttons.append(b)
			grid.add_child(b)
			cells.append(b)
	for i in n*n:
		var b: Button = cells[i]
		var col: Color
		if kind == 0:
			b.text = ""
			col = Color("4fe3ff") if board[i] else Color("231f4a")
		else:
			var v: int = board[i]
			b.text = "" if v == 0 else str(v)
			col = Color("10101e") if v == 0 else (Color("7dff9a") if v == i+1 else Color("4f7dff"))
			b.add_theme_color_override("font_color",Color("10101e") if v == i+1 else Color("ffffff"))
		style_btn(b,col)
	title.text = "HOURLY CHALLENGE  ·  %s" % KINDS[kind]
	var how := "Tap a tile to flip it and its 4 neighbours. Light all 25. Beat par (%d moves) for DOUBLE." % par if kind == 0 else "Slide the tiles into order 1 to 15, gap last. A tough one: plan row by row."
	info.text = "%s\nMoves: %d%s\n%s" % [how,moves,"   ✓ SOLVED!" if solved else "",reward_line()]

func reward_line() -> String:
	if g.hr_done == now_hour():
		return "You already solved this hour's challenge. A new one comes in %d min." % (secs_left()/60+1)
	return "Reward: $%d and %d XP. New challenge in %d min. Same puzzle for everyone: ask the chat for hints!" % [PAY,XP,secs_left()/60+1]

func draw_code() -> void:
	for ch in box.get_children():
		ch.queue_free()
	cells = []
	var hist := ""
	for row in history:
		var gs := ""
		for d in row[0]:
			gs += "%d " % (int(d)+1)
		hist += "%s  →  %d in place, %d misplaced\n" % [gs,int(row[1]),int(row[2])]
	for k in range(history.size(),8):
		hist += "· · · ·\n"
	hist_label = g._label(hist,22,Color("e8f4ff"))
	box.add_child(hist_label)
	var row_box := HBoxContainer.new()
	row_box.alignment = BoxContainer.ALIGNMENT_CENTER
	row_box.add_theme_constant_override("separation",12)
	for i in 4:
		var b := Button.new()
		b.custom_minimum_size = Vector2(96,96)
		b.text = str(int(cur[i])+1)
		b.add_theme_font_size_override("font_size",42)
		b.add_theme_color_override("font_color",Color("10101e"))
		b.pressed.connect(cycle.bind(i))
		g.touch_buttons.append(b)
		style_btn(b,DIGIT_COL[int(cur[i])])
		row_box.add_child(b)
	var go: Button = g._button("Check",check)
	row_box.add_child(go)
	box.add_child(row_box)
	title.text = "HOURLY CHALLENGE  ·  CODE BREAKER"
	var tail := ""
	if solved:
		tail = "   ✓ CRACKED in %d!" % moves
	elif history.size() >= 8:
		tail = "   Out of guesses. Press Start over to try again."
	info.text = "Crack the secret 4-digit code (digits 1 to 6, repeats allowed). Tap a digit to change it, then Check. 8 guesses. Beat par (%d guesses or fewer) for DOUBLE.%s\n%s" % [par,tail,reward_line()]

# ---------- sign + announcements ----------
func refresh_sign() -> void:
	if g.sun_dome == null or g.sun_dome.hr_sign == null:
		return
	var h := now_hour()
	var nm: String = KINDS[h % 3]
	var m := secs_left()/60
	var s := secs_left() % 60
	if g.hr_done == h:
		g.sun_dome.hr_sign.text = "HOURLY CHALLENGE ✓\nnext in %d:%02d" % [m,s]
	else:
		g.sun_dome.hr_sign.text = "HOURLY CHALLENGE\n%s  ·  +$%d  ·  %d:%02d left" % [nm,PAY,m,s]

func _process(delta: float) -> void:
	tick_t += delta
	if tick_t < 1.0:
		return
	tick_t = 0.0
	refresh_sign()
	var h := now_hour()
	if h != announced and g.sun_dome != null and g.booted and not g.paused:
		announced = h
		if g.hr_done != h:
			g._show_toast("NEW HOURLY CHALLENGE: %s  ·  +$%d  ·  in the Sun Dome" % [KINDS[h % 3],PAY])

# developer check: every hour kind generates a puzzle that is not already solved and can be solved
func selftest() -> String:
	dry = true
	var bad := ""
	for h in range(0,9):
		make(h)
		if kind == 0 or kind == 1:
			if is_done():
				bad += "h%d starts solved; " % h
			for i in solution:
				tap(int(i))
			if not solved:
				bad += "h%d kind%d not solvable; " % [h,kind]
		else:
			cur = solution.duplicate()
			check()
			if not solved:
				bad += "h%d code not crackable; " % h
	dry = false
	hour = -1
	return "OK" if bad == "" else bad

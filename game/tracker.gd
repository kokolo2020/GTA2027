extends RefCounted
# v0.68 Quest tracker for the portal cities: a quest list per city (tap one to track it), a pointer arrow with the
# distance, and a light beam standing at the target. One tracker per world (paris.gd instance, w).

var w
var g
var layer: CanvasLayer
var panel: PanelContainer
var title: Label
var rows_box: VBoxContainer
var toggle: Button
var arrow: Label
var info: Label
var beam: MeshInstance3D
var items: Array = []        # [{"n": text, "pos": Vector3, "done": bool}]
var buttons: Array = []
var sel := -1
var manual := false
var open := true
var acc := 0.0
var clk := 0.0

func _init(world) -> void:
	w = world
	g = world.g

func build() -> void:
	layer = CanvasLayer.new()
	layer.layer = 55
	g.add_child(layer)
	var vs: Vector2 = g.get_viewport().get_visible_rect().size
	toggle = Button.new()
	toggle.text = "QUESTS"
	toggle.position = Vector2(12,172)
	toggle.size = Vector2(130,38)
	toggle.add_theme_font_size_override("font_size",17)
	toggle.pressed.connect(func(): set_open(not open))
	layer.add_child(toggle)
	g.touch_buttons.append(toggle)
	panel = PanelContainer.new()
	panel.position = Vector2(12,214)
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(0.03,0.05,0.09,0.72)
	sb.set_corner_radius_all(10)
	sb.set_content_margin_all(8)
	panel.add_theme_stylebox_override("panel",sb)
	layer.add_child(panel)
	var vb := VBoxContainer.new()
	panel.add_child(vb)
	title = Label.new()
	title.add_theme_font_size_override("font_size",19)
	title.add_theme_color_override("font_color",Color("ffe28a"))
	vb.add_child(title)
	rows_box = VBoxContainer.new()
	rows_box.add_theme_constant_override("separation",0)
	vb.add_child(rows_box)
	arrow = Label.new()
	arrow.text = "▲"
	arrow.add_theme_font_size_override("font_size",72)
	arrow.add_theme_color_override("font_color",Color("ffd24f"))
	arrow.add_theme_color_override("font_outline_color",Color(0,0,0))
	arrow.add_theme_constant_override("outline_size",12)
	arrow.size = Vector2(90,100)
	arrow.pivot_offset = Vector2(45,50)
	arrow.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	arrow.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(arrow)
	info = Label.new()
	info.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	info.size = Vector2(380,60)
	info.add_theme_font_size_override("font_size",22)
	info.add_theme_color_override("font_color",Color("fff2c0"))
	info.add_theme_color_override("font_outline_color",Color(0,0,0))
	info.add_theme_constant_override("outline_size",8)
	info.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(info)
	var bm := CylinderMesh.new()
	bm.top_radius = 0.3
	bm.bottom_radius = 0.3
	bm.height = 70.0
	bm.radial_segments = 8
	beam = MeshInstance3D.new()
	beam.mesh = bm
	var m := StandardMaterial3D.new()
	m.albedo_color = Color(1.0,0.85,0.3,0.32)
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	beam.material_override = m
	beam.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	w.root.add_child(beam)
	place(vs)

func place(vs: Vector2) -> void:
	arrow.position = Vector2(vs.x*0.5-45.0,200.0)
	info.position = Vector2(vs.x*0.5+40.0,225.0)

func set_open(v: bool) -> void:
	open = v
	if panel != null:
		panel.visible = v

func collect() -> void:
	# What can be done in this city right now, in a sensible order.
	w.roll_day()
	items.clear()
	var p: Vector3 = g.player.position
	var today := Time.get_date_string_from_system()
	var qpos := [w.ret_pos,w.lm_pos(),w.cafe_pos+Vector3(0,0,3.0),w.quay_pos]
	for i in range(1,w.QUESTS.size()):
		items.append({"n":String(w.QUESTS[i]["n"]),"pos":qpos[i],"done":(w.mask & (1 << i)) != 0})
	var clues_left: bool = w.clue_count() < 3
	var cp: Vector3 = w.board_pos
	if clues_left:
		var best := 1e9
		for i in 3:
			if (w.clue_mask & (1 << i)) == 0:
				var d := Vector2(p.x-w.clue_world(i).x,p.z-w.clue_world(i).z).length()
				if d < best:
					best = d
					cp = w.clue_world(i)
	items.append({"n":"Find the glowing clues (%d/3)" % w.clue_count(),"pos":cp,"done":not clues_left})
	items.append({"n":"Solve the case at the board","pos":w.board_pos,"done":w.case_day == today,"locked":clues_left})
	var ob = w.ob
	var op: Vector3 = ob.post_pos
	var on := "Seal the outbreak (zombies!)"
	if ob.active:
		var shown := false
		for sv in ob.surv:
			if not bool(sv[2]) and not shown:
				op = sv[1]
				on = "Rescue the survivors (%d/3)" % ob.known
				shown = true
		if not shown and ob.progress < 3 and ob.valves.size() == 3:
			op = ob.valves[int(ob.order[ob.progress])][1]
			on = "Turn the valves in order (%d/3)" % ob.progress
	items.append({"n":on,"pos":op,"done":ob.day == today and not ob.active})
	# v0.72: cure gun, rescue and boss quests (cure.gd)
	if not ob.active:
		items.append_array(w.cu.quest_items(p))
	items.append({"n":"Go home through the portal","pos":w.ret_pos,"done":false})

func pick_default() -> void:
	if manual and sel >= 0 and sel < items.size() and not bool(items[sel]["done"]):
		return
	manual = false
	sel = -1
	for i in items.size():
		if not bool(items[i]["done"]) and not bool(items[i].get("locked",false)) and i < items.size()-1:
			sel = i
			return
	sel = items.size()-1

func rebuild_rows() -> void:
	for b in buttons:
		(b as Node).queue_free()
	buttons.clear()
	var done := 0
	var total := 0
	for i in items.size()-1:
		total += 1
		if bool(items[i]["done"]):
			done += 1
	title.text = "%s  %d/%d" % [String(w.W["name"]).to_upper(),done,total]
	for i in items.size():
		var it: Dictionary = items[i]
		# v0.72: the list is longer now, so finished quests fold away (the title keeps the count) and it stays clear of the joystick.
		if bool(it["done"]) and i != sel:
			continue
		var b := Button.new()
		b.flat = true
		b.alignment = HORIZONTAL_ALIGNMENT_LEFT
		b.add_theme_font_size_override("font_size",15)
		var mark := "✓" if bool(it["done"]) else ("🔒" if bool(it.get("locked",false)) else "○")
		var d := Vector2(g.player.position.x-(it["pos"] as Vector3).x,g.player.position.z-(it["pos"] as Vector3).z).length()
		b.text = "%s %s%s  %dm" % ["▶" if i == sel else "  ",mark+" ",it["n"],int(d)]
		var col := Color("8fe39a") if bool(it["done"]) else (Color("ffe28a") if i == sel else Color("e8eef5"))
		for k in ["font_color","font_hover_color","font_pressed_color","font_focus_color"]:
			b.add_theme_color_override(k,col)
		b.custom_minimum_size = Vector2(0,25)
		var idx := i
		b.pressed.connect(func():
			sel = idx
			manual = true
			rebuild_rows())
		rows_box.add_child(b)
		buttons.append(b)
		g.touch_buttons.append(b)

func tick(delta: float) -> void:
	if g.player == null:
		return
	var p: Vector3 = g.player.position
	var here: bool = w.in_paris(p) and not g.paused and not bool(g.explore.on) and not bool(w.cu.b_on)
	if not here:
		if layer != null and layer.visible:
			layer.visible = false
			beam.visible = false
		return
	if layer == null:
		build()
	if not layer.visible:
		layer.visible = true
		acc = 99.0
	clk += delta
	acc += delta
	if acc > 0.5:
		acc = 0.0
		collect()
		pick_default()
		rebuild_rows()
		var vs: Vector2 = g.get_viewport().get_visible_rect().size
		place(vs)
		var ob = w.ob
		var low: bool = ob.active or w.cu.b_on
		arrow.position.y = 290.0 if low else 200.0
		info.position.y = 315.0 if low else 225.0
	if sel < 0 or sel >= items.size():
		return
	var it: Dictionary = items[sel]
	var tp: Vector3 = it["pos"]
	var cam: Camera3D = g.camera
	var fwd := -cam.global_transform.basis.z
	fwd.y = 0.0
	var dir := tp-p
	dir.y = 0.0
	var dist := dir.length()
	if fwd.length() > 0.01 and dist > 0.1:
		arrow.rotation = -fwd.normalized().signed_angle_to(dir.normalized(),Vector3.UP)
	arrow.visible = dist > 6.0
	arrow.scale = Vector2.ONE*(1.0+0.08*sin(clk*6.0))
	info.text = "%s\n%d m" % [it["n"],int(dist)] if dist > 6.0 else "%s\nHere!" % it["n"]
	beam.visible = dist > 8.0
	beam.position = tp+Vector3(0,34.0,0)

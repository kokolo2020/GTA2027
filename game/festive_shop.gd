extends Node
# v0.56.7: the Christmas Costume Boutique in the Harbor Dome. Try on, buy and wear festive hats, wings and suits.
# Items come from festive.gd (ITEMS). Ownership and what you wear are saved with your progress.
var g
var fest
var own: Array = []        # ids you bought
var worn: Array = []       # ids you wear
var tried: Array = []      # ids you are only trying on (cleared when you leave)
var trying := false
var spot := Vector3.INF    # centre of the boutique floor
var panel: PanelContainer
var info: Label
var list: GridContainer
var shop_root: Node3D
var spin_nodes: Array = []
var spin_t := 0.0

func _init(g_main) -> void:
	g = g_main
	fest = preload("res://festive.gd").new(g_main)

# ---------- the building ----------
func build_boutique(at: Vector3, face_to: Vector3) -> void:
	spot = at
	add_child(fest)
	shop_root = Node3D.new()
	shop_root.name = "CostumeBoutique"
	g.add_child(shop_root)
	var red := Color("c4152d")
	var white := Color("f6f3ec")
	var gold := Color("f0c75e")
	var green := Color("1f6a3a")
	fest.cyl(shop_root,at+Vector3(0,0.1,0),7.4,7.6,0.2,green)
	fest.cyl(shop_root,at+Vector3(0,0.22,0),6.6,6.6,0.05,red)
	fest.torus(shop_root,at+Vector3(0,0.28,0),7.0,0.1,gold,0.8)
	# four candy-cane posts and a striped red canopy
	for k in 4:
		var a := PI/4.0+float(k)*PI/2.0
		var p := at+Vector3(cos(a)*5.6,0,sin(a)*5.6)
		for s in 6:
			fest.cyl(shop_root,p+Vector3(0,0.45+float(s)*0.9,0),0.16,0.16,0.9,red if s % 2 == 0 else white)
		fest.ball(shop_root,p+Vector3(0,5.9,0),Vector3.ONE*0.5,gold,1.0)
	fest.cyl(shop_root,at+Vector3(0,6.4,0),0.2,7.6,1.4,red)
	fest.cyl(shop_root,at+Vector3(0,5.75,0),7.6,7.6,0.12,white)
	fest.torus(shop_root,at+Vector3(0,5.7,0),7.5,0.12,gold,0.8)
	fest.ball(shop_root,at+Vector3(0,7.3,0),Vector3.ONE*0.7,Color("ffe27a"),2.5)
	# sign facing the dome centre
	var d := face_to-at
	d.y = 0.0
	d = d.normalized() if d.length() > 0.01 else Vector3.BACK
	var sign_pos := at+d*5.9+Vector3(0,4.9,0)
	var lab := Label3D.new()
	lab.text = "CHRISTMAS COSTUME BOUTIQUE"
	lab.font_size = 96
	lab.pixel_size = 0.0065
	lab.modulate = Color("fff0b0")
	lab.outline_size = 24
	lab.outline_modulate = Color("7a1020")
	lab.position = sign_pos
	lab.rotation.y = atan2(d.x,d.z)
	shop_root.add_child(lab)
	var sub := Label3D.new()
	sub.text = "Hats · wings · suits"
	sub.font_size = 64
	sub.pixel_size = 0.0055
	sub.modulate = Color("ffffff")
	sub.outline_size = 16
	sub.outline_modulate = Color("1f6a3a")
	sub.position = sign_pos+Vector3(0,-0.75,0)
	sub.rotation.y = lab.rotation.y
	shop_root.add_child(sub)
	# a ring of pedestals with spinning samples
	var items: Array = fest.ITEMS
	var n := mini(items.size(),9)
	for i in n:
		var a2 := float(i)/float(n)*TAU
		var pp := at+Vector3(cos(a2)*3.6,0,sin(a2)*3.6)
		fest.cyl(shop_root,pp+Vector3(0,0.55,0),0.55,0.65,0.7,white)
		fest.torus(shop_root,pp+Vector3(0,0.9,0),0.6,0.04,gold,1.0)
		var holder := Node3D.new()
		holder.position = pp+Vector3(0,1.55,0)
		shop_root.add_child(holder)
		var it: Node3D = fest.build(String(items[i][0]))
		it.scale = Vector3.ONE*1.6
		it.position = Vector3(0,-fest.HEAD_Y*1.6,0)
		holder.add_child(it)
		spin_nodes.append(holder)
	# a gift stack and a small glowing tree at the back
	for k in 5:
		var gp := at-d*5.0+Vector3(float(k-2)*1.1,0.5,0.0)
		fest.box(shop_root,gp+Vector3(0,0,float(k % 2)*0.9),Vector3(0.9,0.9,0.9),[red,green,gold,white,Color("2a6ae8")][k],0.0)
	var omni := OmniLight3D.new()
	omni.position = at+Vector3(0,4.5,0)
	omni.light_color = Color("fff0d0")
	omni.light_energy = 1.2
	omni.omni_range = 14.0
	shop_root.add_child(omni)

func near() -> bool:
	if g.driving or g.player == null or g.paused or spot == Vector3.INF:
		return false
	return Vector2(g.player.position.x-spot.x,g.player.position.z-spot.z).length() < 6.0

func button_text() -> String:
	return "COSTUME BOUTIQUE"

func _process(delta: float) -> void:
	spin_t += delta
	for h in spin_nodes:
		if is_instance_valid(h):
			(h as Node3D).rotation.y = spin_t*1.2
	if worn.size() > 0 or tried.size() > 0:
		fest.spin(g.player_person,spin_t)

# ---------- ownership / wearing ----------
func item(id: String) -> Array:
	for it in fest.ITEMS:
		if String(it[0]) == id:
			return it
	return []

func shown() -> Array:
	return tried if trying else worn

func put_on(list_ids: Array, id: String) -> Array:
	var it := item(id)
	var out: Array = []
	for o in list_ids:
		var ot := item(String(o))
		if not ot.is_empty() and ot[2] == it[2]:
			continue
		out.append(o)
	out.append(id)
	return out

func tint_look(L: Dictionary) -> void:
	for id in shown():
		var sc: Array = fest.suit_colors(String(id))
		if not sc.is_empty():
			L["tcol"] = sc[0]
			L["pcol"] = sc[1]
			L["t"] = 4

func dress_player() -> void:
	if g.player_person.is_empty():
		return
	fest.dress(g.player_person,shown())

# ---------- the panel ----------
func build_panel(root: Control) -> void:
	panel = PanelContainer.new()
	panel.add_theme_stylebox_override("panel",g._panel(Color(0.2,0.04,0.08,0.95),24))
	panel.custom_minimum_size = Vector2(640,0)
	root.add_child(panel)
	g.extra_panels.append(panel)
	var col := VBoxContainer.new()
	col.add_theme_constant_override("separation",8)
	panel.add_child(col)
	col.add_child(g._label("CHRISTMAS COSTUME BOUTIQUE",26,Color("ffe27a")))
	info = g._label("",16,Color("f6e8e8"))
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.custom_minimum_size.x = 600
	col.add_child(info)
	var sc := ScrollContainer.new()
	sc.custom_minimum_size = Vector2(600,300)
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	col.add_child(sc)
	list = GridContainer.new()
	list.columns = 3
	list.add_theme_constant_override("h_separation",8)
	list.add_theme_constant_override("v_separation",8)
	sc.add_child(list)
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation",12)
	row.add_child(g._button("Take all off",strip))
	row.add_child(g._button("Done",close))
	col.add_child(row)
	panel.hide()

func open() -> void:
	trying = false
	tried = worn.duplicate()
	if not g.paused:
		g._toggle_menu()
	g._open_panel(panel)
	g.style_cam_dir = Vector3.ZERO
	if g.camera != null and g.player != null:
		g.style_cam_dir = g.camera.global_position-g.player.global_position
		g.style_cam_dir.y = 0.0
	g.style_cam_dir = g.style_cam_dir.normalized() if g.style_cam_dir.length() > 0.01 else Vector3.BACK
	refresh()

func finish() -> void:
	trying = false
	tried = []
	g._apply_look()
	g._save_progress()

func close() -> void:
	if g.paused:
		g._toggle_menu()

func face_camera() -> void:
	if panel == null or not panel.visible or g.player == null or g.camera == null:
		return
	var f: Vector3 = g.style_cam_dir
	var right := Vector3(-f.z,0,f.x)
	var head: Vector3 = g.player.global_position+Vector3(0,0.35,0)
	g.camera.global_position = head+f*3.1+Vector3(0,0.55,0)
	g.camera.look_at(head-right*1.15+Vector3(0,-0.15,0))
	g.player.rotation.y = lerp_angle(g.player.rotation.y,atan2(-f.x,-f.z),0.3)

func refresh() -> void:
	info.text = "Tap TRY ON to see it on you, then BUY. Owned pieces you can WEAR any time. You have %s." % g._money(g.cash)
	for c in list.get_children():
		for sub in c.find_children("*","Button",true,false):
			g.touch_buttons.erase(sub)
		c.queue_free()
	for it in fest.ITEMS:
		var id := String(it[0])
		var owned := own.has(id)
		var on := (shown().has(id))
		var card := PanelContainer.new()
		var cs: StyleBoxFlat = g._panel(Color("3a1018") if not on else Color("2a4a3a"),14)
		cs.content_margin_left = 8
		cs.content_margin_right = 8
		cs.content_margin_top = 8
		cs.content_margin_bottom = 8
		if on:
			cs.border_color = Color("ffd86a")
			cs.set_border_width_all(3)
		card.add_theme_stylebox_override("panel",cs)
		card.custom_minimum_size = Vector2(190,0)
		list.add_child(card)
		var cv := VBoxContainer.new()
		cv.add_theme_constant_override("separation",4)
		card.add_child(cv)
		var nl: Label = g._label(String(it[1]),16,Color("fff5dc"))
		nl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		nl.custom_minimum_size.x = 172
		cv.add_child(nl)
		cv.add_child(g._label("owned" if owned else g._money(int(it[3])),15,Color("cbd8de")))
		var txt := "TRY ON"
		var c := Color("213d4f")
		if owned and on:
			txt = "TAKE OFF"
			c = Color("2f6b3a")
		elif owned:
			txt = "WEAR"
			c = Color("1f6f8b")
		elif on:
			txt = "BUY " + g._money(int(it[3]))
			c = Color("c0602a") if g.cash >= int(it[3]) else Color("3a2a2a")
		var b: Button = g._button(txt,pick.bind(id))
		b.custom_minimum_size = Vector2(172,42)
		b.add_theme_font_size_override("font_size",16)
		b.add_theme_stylebox_override("normal",g._panel(c,12))
		cv.add_child(b)
	panel.reset_size()
	g._layout_panels()

func pick(id: String) -> void:
	var it := item(id)
	if it.is_empty():
		return
	if own.has(id):
		# wear / take off an owned piece
		var base: Array = worn if not trying else tried
		if base.has(id):
			base = base.filter(func(x): return String(x) != id)
		else:
			base = put_on(base,id)
		worn = base
		tried = worn.duplicate()
		trying = false
	elif shown().has(id) and trying:
		var price := int(it[3])
		if g.cash < price:
			g._show_toast("%s costs %s (you have %s)." % [it[1],g._money(price),g._money(g.cash)])
			return
		g.cash -= price
		own.append(id)
		worn = put_on(worn.filter(func(x): return true),id)
		tried = worn.duplicate()
		trying = false
		g._show_toast("Bought %s for %s! Merry Christmas!" % [it[1],g._money(price)])
		if not ("--smoke-test" in OS.get_cmdline_user_args()):
			g._play_coin()
		g._save_progress()
	else:
		tried = put_on(tried if trying else worn,id)
		trying = true
	g._apply_look()
	refresh()

func strip() -> void:
	worn = []
	tried = []
	trying = false
	g._apply_look()
	g._save_progress()
	refresh()

# ---------- save ----------
func save_to(file: ConfigFile) -> void:
	file.set_value("progress","fest_own",own)
	file.set_value("progress","fest_worn",worn)

func load_from(file: ConfigFile) -> void:
	own = []
	worn = []
	for id in file.get_value("progress","fest_own",[]):
		if not item(String(id)).is_empty() and not own.has(String(id)):
			own.append(String(id))
	for id in file.get_value("progress","fest_worn",[]):
		if own.has(String(id)) and not worn.has(String(id)):
			worn.append(String(id))
	tried = worn.duplicate()

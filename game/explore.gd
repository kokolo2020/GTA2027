extends RefCounted
# v0.62: Explore mode. A free camera tour of Bonkers City, the four city worlds and the sky island.
# No player, no cars, no running: drag left to move, drag right to look, pinch to zoom, UP/DOWN to rise and sink.
# Own overlay and own input; main only calls enter(), input(), tick() and exit(). Talks to main through `g`.
const SPEEDS := [8.0,26.0,80.0]
const SPEED_NAMES := ["SLOW","MEDIUM","FAST"]
const FOV_MIN := 18.0
const FOV_MAX := 85.0

var g
var on := false
var layer: CanvasLayer
var root: Control
var hint: Label
var buttons: Array = []         # [Button, Callable, hold id or ""]
var hidden: Array = []
var touches := {}               # touch index (or -10 for the mouse) -> {kind, origin, pos}
var pinch_d := 0.0
var stick := Vector2.ZERO
var yaw := 0.0
var pitch := -0.2
var fov := 70.0
var pos := Vector3.ZERO
var speed_i := 1
var up_hold := false
var down_hold := false
var hint_t := 0.0
var saved_fov := 70.0
var speed_btn: Button

func noop() -> void:
	pass

func _init(game) -> void:
	g = game

func can_enter() -> bool:
	return g.player != null and not g.driving and not g.bus_riding and not g.race_car and not g.sky_riding and g.seat_id < 0

func enter() -> void:
	if on:
		return
	if not can_enter():
		g._show_toast("Get out of your vehicle or seat first.")
		return
	on = true
	if g.paused and g.menu != null and g.menu.visible:
		g._toggle_menu()
	hidden.clear()
	for c in g.get_children():
		if (c is CanvasLayer or c is Control) and c.visible:
			c.visible = false
			hidden.append(c)
	g.cam_lock = true
	g.player.hide()
	saved_fov = g.camera.fov
	pos = g.camera.global_position
	var e: Vector3 = g.camera.global_basis.get_euler()
	yaw = e.y
	pitch = clampf(e.x,-1.4,1.4)
	fov = 70.0
	stick = Vector2.ZERO
	touches.clear()
	pinch_d = 0.0
	build_ui()
	hint_t = 6.0
	apply_camera()

func exit() -> void:
	if not on:
		return
	on = false
	if layer != null and is_instance_valid(layer):
		layer.queue_free()
	layer = null
	buttons.clear()
	for c in hidden:
		if is_instance_valid(c):
			c.visible = true
	hidden.clear()
	g.cam_lock = false
	g.camera.fov = saved_fov
	g.player.show()
	g._follow_camera(1.0)
	g._refresh_hud()
	g._show_toast("Back in the game.")

func add_button(text: String, cb: Callable, rect: Rect2, hold := "") -> Button:
	var b: Button = g._button(text,noop)
	b.custom_minimum_size = rect.size
	b.size = rect.size
	b.position = rect.position
	b.add_theme_font_size_override("font_size",20)
	root.add_child(b)
	buttons.append([b,cb,hold])
	return b

func build_ui() -> void:
	layer = CanvasLayer.new()
	layer.layer = 80
	g.add_child(layer)
	root = Control.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	layer.add_child(root)
	var vs: Vector2 = g.get_viewport().get_visible_rect().size
	buttons.clear()
	var names := ["City","Paris","Tokyo","New York","Bangkok","Sky"]
	var bw := minf(150.0,(vs.x-230.0)/6.0)
	for i in names.size():
		add_button(names[i],jump.bind(i),Rect2(Vector2(16.0+float(i)*(bw+6.0),16.0),Vector2(bw,54)))
	add_button("EXIT",exit,Rect2(Vector2(vs.x-130.0,16.0),Vector2(114,54)))
	speed_btn = add_button("",cycle_speed,Rect2(Vector2(vs.x-190.0,80.0),Vector2(174,54)))
	add_button("UP",Callable(),Rect2(Vector2(vs.x-110.0,vs.y*0.5),Vector2(94,80)),"up")
	add_button("DOWN",Callable(),Rect2(Vector2(vs.x-110.0,vs.y*0.5+90.0),Vector2(94,80)),"down")
	hint = Label.new()
	hint.text = "EXPLORE   left thumb: move   right thumb: look   two fingers: zoom   UP / DOWN: height"
	hint.position = Vector2(16.0,vs.y-44.0)
	hint.add_theme_font_size_override("font_size",18)
	hint.add_theme_color_override("font_color",Color("ffffff"))
	hint.add_theme_color_override("font_outline_color",Color("0b1a24"))
	hint.add_theme_constant_override("outline_size",6)
	root.add_child(hint)
	update_speed()

func cycle_speed() -> void:
	speed_i = (speed_i+1) % SPEEDS.size()
	update_speed()

func update_speed() -> void:
	if speed_btn != null:
		speed_btn.text = "SPEED: %s" % SPEED_NAMES[speed_i]

func aim(from: Vector3, target: Vector3) -> void:
	pos = from
	var d := target-from
	yaw = atan2(-d.x,-d.z)
	pitch = atan2(d.y,Vector2(d.x,d.z).length())

func jump(i: int) -> void:
	var w = g.paris
	if i == 0:
		aim(g.HUB_C+Vector3(0,70,170),g.HUB_C+Vector3(0,0,10))
	elif i == 5:
		if not w.sky_open():
			g._show_toast("The sky island is locked: %d/%d relics." % [w.relic_count(),w.SKY_NEED])
			return
		w.build_sky()
		aim(w.SKY+Vector3(45,12,60),w.SKY+Vector3(0,4,0))
	else:
		var wd = w.list[i-1]
		wd.ensure_built()
		var C: Vector3 = wd.C
		match String(wd.W["landmark"]):
			"eiffel":
				aim(C+Vector3(170,45,240),C+Vector3(0,70,0))
			"crossing":
				aim(C+Vector3(60,26,90),C+Vector3(0,10,0))
			"times":
				aim(C+Vector3(70,26,80),C+Vector3(0,12,0))
			_:
				aim(C+Vector3(70,30,90),C+Vector3(0,22,0))
	fov = 70.0
	apply_camera()

func min_y() -> float:
	var w = g.paris
	if w != null and w.sky_built and absf(pos.x-w.SKY.x) < 90.0 and absf(pos.z-w.SKY.z) < 90.0:
		return w.SKY.y-90.0
	return 1.6

func apply_camera() -> void:
	pos.y = maxf(pos.y,min_y())
	pitch = clampf(pitch,-1.45,1.45)
	g.camera.global_transform = Transform3D(Basis.from_euler(Vector3(pitch,yaw,0)),pos)
	g.camera.fov = fov

func tick(delta: float) -> void:
	if not on:
		return
	var fwd := Vector3(-sin(yaw),0,-cos(yaw))
	var right := Vector3(cos(yaw),0,-sin(yaw))
	var mv := stick
	var kb := Vector2(
		float(Input.is_physical_key_pressed(KEY_D))-float(Input.is_physical_key_pressed(KEY_A)),
		float(Input.is_physical_key_pressed(KEY_S))-float(Input.is_physical_key_pressed(KEY_W)))
	if kb.length() > 0.0:
		mv = kb.limit_length()
	var sp: float = SPEEDS[speed_i]*(fov/70.0*0.5+0.5)
	var dir := right*mv.x-fwd*mv.y
	pos += dir*sp*delta
	var vy := float(up_hold or Input.is_physical_key_pressed(KEY_E))-float(down_hold or Input.is_physical_key_pressed(KEY_Q))
	pos.y += vy*sp*0.6*delta
	apply_camera()
	if hint != null and hint_t > 0.0:
		hint_t -= delta
		hint.modulate.a = clampf(hint_t,0.0,1.0)

func look(rel: Vector2) -> void:
	var k := 0.0052*(fov/70.0)
	yaw -= rel.x*k
	pitch = clampf(pitch-rel.y*k,-1.45,1.45)

func hit_button(p: Vector2) -> Array:
	for b in buttons:
		var bt: Button = b[0]
		if bt.get_global_rect().has_point(p):
			return b
	return []

func press(id: int, p: Vector2) -> void:
	var b: Array = hit_button(p)
	if not b.is_empty():
		var hold := String(b[2])
		if hold == "up":
			up_hold = true
		elif hold == "down":
			down_hold = true
		elif (b[1] as Callable).is_valid():
			touches[id] = {"kind":"btn","hold":""}
			(b[1] as Callable).call()
			return
		touches[id] = {"kind":"btn","hold":hold}
		return
	var vs: Vector2 = g.get_viewport().get_visible_rect().size
	var kind := "move" if p.x < vs.x*0.45 and p.y > vs.y*0.3 else "look"
	touches[id] = {"kind":kind,"origin":p,"pos":p}

func release(id: int) -> void:
	if not touches.has(id):
		return
	var t: Dictionary = touches[id]
	if String(t["kind"]) == "btn":
		var hold := String(t["hold"])
		if hold == "up":
			up_hold = false
		elif hold == "down":
			down_hold = false
	if String(t["kind"]) == "move":
		stick = Vector2.ZERO
	touches.erase(id)
	pinch_d = 0.0

func drag(id: int, p: Vector2, rel: Vector2) -> void:
	if not touches.has(id):
		return
	var t: Dictionary = touches[id]
	t["pos"] = p
	var free: Array = []
	for k in touches:
		if String(touches[k]["kind"]) != "btn":
			free.append(touches[k])
	if free.size() >= 2:
		stick = Vector2.ZERO
		var d: float = ((free[0]["pos"] as Vector2)-(free[1]["pos"] as Vector2)).length()
		if pinch_d > 0.0 and d > 1.0:
			fov = clampf(fov*pinch_d/d,FOV_MIN,FOV_MAX)
		pinch_d = d
		return
	pinch_d = 0.0
	if String(t["kind"]) == "move":
		stick = ((p-(t["origin"] as Vector2))/65.0).limit_length()
	elif String(t["kind"]) == "look":
		look(rel)

func input(event: InputEvent) -> bool:
	if not on:
		return false
	if event is InputEventKey and event.pressed and not event.echo and (event.keycode == KEY_ESCAPE or event.keycode == KEY_BACK):
		exit()
		return true
	if event is InputEventScreenTouch:
		if event.pressed:
			press(event.index,event.position)
		else:
			release(event.index)
		return true
	if event is InputEventScreenDrag:
		drag(event.index,event.position,event.relative)
		return true
	if event is InputEventMouseButton:
		if event.device == InputEvent.DEVICE_ID_EMULATION:
			return true
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				press(-10,event.position)
			else:
				release(-10)
		elif event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			fov = clampf(fov*0.93,FOV_MIN,FOV_MAX)
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			fov = clampf(fov*1.07,FOV_MIN,FOV_MAX)
		return true
	if event is InputEventMouseMotion:
		if touches.has(-10):
			drag(-10,event.position,event.relative)
		return true
	return true

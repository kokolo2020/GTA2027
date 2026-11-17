extends Node3D
## Harbor City: original single-player driving prototype. No external assets or services.

const PICKUP := Vector3(-32, 0, 26)
const DROPOFF := Vector3(32, 0, -29)
const SAVE_PATH := "user://harbor_save.cfg"
var player: CharacterBody3D
var car: CharacterBody3D
var camera: Camera3D
var marker: Node3D
var hud: CanvasLayer
var objective: Label
var balance_label: Label
var status_label: Label
var action_button: Button
var menu: PanelContainer
var driving := false
var carrying := false
var cash := 0
var deliveries := 0
var car_speed := 0.0
var touch_id := -1
var touch_origin := Vector2.ZERO
var stick := Vector2.ZERO
var mouse_stick := false
var paused := false
var clock := 0.0
var toast_time := 0.0
var joystick: Control
var booted := false
var touch_buttons: Array[Button] = []
var compass: Label
var speed_label: Label

func _ready() -> void:
	Input.emulate_mouse_from_touch = false
	_build_world()
	_build_player()
	_build_car()
	_build_hud()
	_load_progress()
	_refresh_hud()
	_show_toast("Welcome to Harbor City. Walk to the blue car.")
	booted = true
	if "--smoke-test" in OS.get_cmdline_user_args():
		await _smoke_test()

func _material(color: Color) -> StandardMaterial3D:
	var mat := StandardMaterial3D.new()
	mat.albedo_color = color
	mat.roughness = 0.85
	return mat

func _box(parent: Node3D, pos: Vector3, size: Vector3, color: Color, solid := false) -> MeshInstance3D:
	var mesh := MeshInstance3D.new()
	var shape := BoxMesh.new()
	shape.size = size
	mesh.mesh = shape
	mesh.material_override = _material(color)
	mesh.position = pos
	parent.add_child(mesh)
	if solid:
		var body := StaticBody3D.new()
		var collider := CollisionShape3D.new()
		var box := BoxShape3D.new()
		box.size = size
		collider.shape = box
		body.position = pos
		body.add_child(collider)
		parent.add_child(body)
	return mesh

func _sign(text: String, pos: Vector3, tint := Color.WHITE, font_size := 48) -> Label3D:
	var label := Label3D.new()
	label.text = text
	label.font_size = font_size
	label.modulate = tint
	label.position = pos
	label.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	label.outline_size = 8
	label.pixel_size = 0.014
	add_child(label)
	return label

func _build_world() -> void:
	var world_env := WorldEnvironment.new()
	var env := Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("82bfc8")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color("d4e5f1")
	env.ambient_light_energy = 0.65
	world_env.environment = env
	add_child(world_env)
	var sun := DirectionalLight3D.new()
	sun.rotation_degrees = Vector3(-55, -30, 0)
	sun.light_color = Color("fff0cd")
	sun.light_energy = 0.85
	sun.shadow_enabled = true
	add_child(sun)
	_box(self, Vector3(0,-0.35,0), Vector3(112,0.6,112), Color("91ab82"), true)
	_box(self, Vector3(0,-0.65,78), Vector3(230,0.3,55), Color("248caa"))
	_box(self, Vector3(0,0.01,49), Vector3(112,0.1,7), Color("e8d5ad"))
	# Broad avenues make the city readable and forgiving on a touch screen.
	for lane in [-32.0, 0.0, 32.0]:
		_box(self, Vector3(lane,0.01,0), Vector3(9,0.08,104), Color("354653"))
		_box(self, Vector3(0,0.02,lane), Vector3(104,0.08,9), Color("354653"))
		for dash in range(-48,49,8):
			_box(self, Vector3(lane,0.07,dash), Vector3(0.15,0.02,3), Color("e7d9a4"))
			_box(self, Vector3(dash,0.08,lane), Vector3(3,0.02,0.15), Color("e7d9a4"))
	var palette := [Color("dba88e"),Color("e2c994"),Color("a6bcc2"),Color("b3a2ad")]
	var count := 0
	for x in [-46.0,-17.0,17.0,46.0]:
		for z in [-46.0,-17.0,17.0]:
			var height := 4.0 + float(count % 4) * 2.2
			_box(self, Vector3(x,0.12,z), Vector3(15,0.25,15), Color("ccd0c3"))
			_box(self, Vector3(x,height/2.0,z), Vector3(11,height,10), palette[count % 4], true)
			_box(self, Vector3(x,height+0.15,z), Vector3(11.5,0.35,10.5), Color("f2e6d2"))
			for floor_index in range(1,int(height/2.0)+1):
				for column in [-3.2,0.0,3.2]:
					_box(self, Vector3(x+column,float(floor_index)*1.7,z+5.02), Vector3(1.2,0.95,0.06), Color("345361"))
			count += 1
	# Waterfront kiosks and trees.
	for x in [-45.0,-15.0,15.0,45.0]:
		_box(self, Vector3(x,1.8,40), Vector3(8,3.6,6), Color("e1b486"), true)
		_box(self, Vector3(x,3.8,40), Vector3(8.6,0.4,6.7), Color("c36658"))
		for z in [-4.0,26.0]:
			_box(self, Vector3(x+7,1.4,z), Vector3(0.5,2.8,0.5), Color("866743"))
			_box(self, Vector3(x+7,3.3,z), Vector3(3.7,2.6,3.7), Color("547c58"))
	_sign("HARBOR CITY",Vector3(0,5,47),Color("fff3c9"),64)
	_sign("PORT DISPATCH",PICKUP+Vector3(0,4,0),Color("f7da87"))
	_sign("SUNSET MARKET",DROPOFF+Vector3(0,4,0),Color("c2f7e8"))
	_box(self,PICKUP+Vector3(3,0.5,0),Vector3(0.9,1,0.9),Color("c89552"))
	marker = Node3D.new()
	add_child(marker)
	var ring := MeshInstance3D.new()
	var torus := TorusMesh.new()
	torus.inner_radius = 1.6
	torus.outer_radius = 2.0
	ring.mesh = torus
	ring.material_override = _material(Color("f4d06c"))
	marker.add_child(ring)

func _build_player() -> void:
	player = CharacterBody3D.new()
	player.name = "Player"
	player.position = Vector3(7,0.7,7)
	add_child(player)
	var collision := CollisionShape3D.new()
	var capsule := CapsuleShape3D.new()
	capsule.radius = 0.35
	capsule.height = 1.4
	collision.shape = capsule
	player.add_child(collision)
	_box(player, Vector3(0,0,0),Vector3(0.65,0.85,0.4),Color("f2b24a"))
	_box(player, Vector3(0,0.68,0),Vector3(0.46,0.46,0.46),Color("ac7552"))
	_box(player, Vector3(-0.18,-0.58,0),Vector3(0.22,0.55,0.26),Color("263d54"))
	_box(player, Vector3(0.18,-0.58,0),Vector3(0.22,0.55,0.26),Color("263d54"))
	camera = Camera3D.new()
	camera.fov = 55
	camera.far = 230
	add_child(camera)
	camera.current = true
	_follow_camera(1.0)

func _build_car() -> void:
	car = CharacterBody3D.new()
	car.name = "Car"
	car.position = Vector3(1.7,0.8,4)
	add_child(car)
	var collision := CollisionShape3D.new()
	var box := BoxShape3D.new()
	box.size = Vector3(1.7,1.3,3.3)
	collision.shape = box
	car.add_child(collision)
	_box(car,Vector3(0,0,0),Vector3(1.8,0.65,3.4),Color("438fd0"))
	_box(car,Vector3(0,0.55,0.15),Vector3(1.45,0.65,1.6),Color("264d68"))
	_box(car,Vector3(0,0.9,0.15),Vector3(1.5,0.12,1.7),Color("5aa4d5"))
	for x in [-0.91,0.91]:
		for z in [-1.05,1.05]:
			_box(car,Vector3(x,-0.27,z),Vector3(0.3,0.6,0.65),Color("172936"))
	for x in [-0.58,0.58]:
		_box(car,Vector3(x,0,-1.72),Vector3(0.4,0.22,0.05),Color("fff0b8"))
		_box(car,Vector3(x,0,1.72),Vector3(0.4,0.22,0.05),Color("e96963"))

func _label(text: String, size: int, color: Color) -> Label:
	var label := Label.new()
	label.text = text
	label.add_theme_font_size_override("font_size",size)
	label.add_theme_color_override("font_color",color)
	return label

func _button(text: String, pressed: Callable) -> Button:
	var button := Button.new()
	button.text = text
	button.custom_minimum_size = Vector2(170,58)
	button.add_theme_font_size_override("font_size",22)
	button.add_theme_stylebox_override("normal",_panel(Color("213d4f"),18))
	button.add_theme_stylebox_override("hover",_panel(Color("315b6b"),18))
	button.add_theme_stylebox_override("pressed",_panel(Color("176678"),18))
	button.pressed.connect(pressed)
	touch_buttons.append(button)
	return button

func _panel(color: Color, radius := 18) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.set_corner_radius_all(radius)
	style.content_margin_left = 20
	style.content_margin_right = 20
	style.content_margin_top = 14
	style.content_margin_bottom = 14
	return style

func _build_hud() -> void:
	hud = CanvasLayer.new()
	add_child(hud)
	var root := Control.new()
	root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud.add_child(root)
	root.size = get_viewport().get_visible_rect().size
	get_viewport().size_changed.connect(func(): root.size = get_viewport().get_visible_rect().size)
	var info := PanelContainer.new()
	info.position = Vector2(24,24)
	info.custom_minimum_size = Vector2(430,125)
	info.add_theme_stylebox_override("panel",_panel(Color(0.06,0.13,0.18,0.93)))
	root.add_child(info)
	var column := VBoxContainer.new()
	info.add_child(column)
	column.add_child(_label("HARBOR CITY  /  FIRST DRIVE",18,Color("8ddacb")))
	objective = _label("",22,Color("fff5dc"))
	column.add_child(objective)
	balance_label = _label("",18,Color("cbd8de"))
	column.add_child(balance_label)
	compass = _label("",18,Color("f0bd62"))
	column.add_child(compass)
	speed_label = _label("",18,Color("8ddacb"))
	column.add_child(speed_label)
	var pause_button := _button("Menu",_toggle_menu)
	root.add_child(pause_button)
	pause_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	pause_button.position = Vector2(root.size.x-194,24)
	joystick = Control.new()
	joystick.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(joystick)
	joystick.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	joystick.position = Vector2(32,root.size.y-210)
	joystick.size = Vector2(180,180)
	joystick.draw.connect(_draw_joystick)
	action_button = _button("ENTER CAR",_interact)
	root.add_child(action_button)
	action_button.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	action_button.position = Vector2(root.size.x-248,root.size.y-124)
	action_button.size = Vector2(220,80)
	action_button.add_theme_stylebox_override("normal",_panel(Color("f0bd62"),24))
	action_button.add_theme_color_override("font_color",Color("182b38"))
	action_button.add_theme_color_override("font_hover_color",Color("182b38"))
	action_button.add_theme_color_override("font_pressed_color",Color("182b38"))
	action_button.add_theme_stylebox_override("hover",_panel(Color("ffd58c"),24))
	action_button.add_theme_stylebox_override("pressed",_panel(Color("dba54d"),24))
	status_label = _label("",20,Color("fff1c9"))
	root.add_child(status_label)
	status_label.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	status_label.position = Vector2(root.size.x/2-340,root.size.y-48)
	status_label.size = Vector2(680,32)
	status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	status_label.add_theme_color_override("font_shadow_color",Color("132b3a"))
	status_label.add_theme_constant_override("shadow_offset_x",2)
	status_label.add_theme_constant_override("shadow_offset_y",2)
	status_label.add_theme_constant_override("outline_size",4)
	status_label.add_theme_color_override("font_outline_color",Color("132b3a"))
	status_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	menu = PanelContainer.new()
	root.add_child(menu)
	menu.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	menu.position = root.size/2-Vector2(250,185)
	menu.size = Vector2(500,370)
	menu.add_theme_stylebox_override("panel",_panel(Color("132b3a"),24))
	var items := VBoxContainer.new()
	items.add_theme_constant_override("separation",12)
	menu.add_child(items)
	items.add_child(_label("WELCOME TO HARBOR CITY",26,Color("f0bd62")))
	items.add_child(_label("Single-player • Android prototype",19,Color.WHITE))
	items.add_child(_label("Walk or drive to the golden ring.\nPick up a parcel, then deliver it.\nTouch: left stick + right action button.\nKeyboard: WASD / arrows, E to interact.",18,Color("cbd8de")))
	items.add_child(_button("Continue",_toggle_menu))
	items.add_child(_button("Return to the car",_rescue))
	items.add_child(_label("Built with Godot Engine • MIT license\nLicense and attribution: credits.txt in the project",14,Color("8ddacb")))
	menu.hide()
	get_viewport().size_changed.connect(func():
		var view := get_viewport().get_visible_rect().size
		pause_button.position = Vector2(view.x-194,24)
		joystick.position = Vector2(32,view.y-210)
		action_button.position = Vector2(view.x-248,view.y-124)
		status_label.position = Vector2(view.x/2-340,view.y-48)
		menu.position = view/2-Vector2(250,185)
	)

func _draw_joystick() -> void:
	joystick.draw_circle(Vector2(90,90),86,Color(0.05,0.12,0.18,0.55))
	joystick.draw_arc(Vector2(90,90),85,0,TAU,64,Color(0.8,0.94,0.95,0.6),2,true)
	joystick.draw_circle(Vector2(90,90)+stick*58,32,Color(0.6,0.87,0.88,0.85))

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not event.echo:
		if event.keycode == KEY_F12:
			_capture_preview()
		elif event.keycode == KEY_ESCAPE:
			_toggle_menu()
		elif event.keycode == KEY_E and not paused:
			_interact()
	if event is InputEventScreenTouch:
		if event.pressed:
			# Godot mouse emulation handles only the first finger; dispatch touch UI explicitly.
			for button: Button in touch_buttons:
				if button.is_visible_in_tree() and not button.disabled and button.get_global_rect().has_point(event.position):
					if not paused and menu.is_ancestor_of(button):
						continue
					if paused and not menu.is_ancestor_of(button):
						continue
					button.pressed.emit()
					get_viewport().set_input_as_handled()
					return
		if event.pressed and touch_id == -1 and _stick_zone(event.position) and not paused:
			touch_id = event.index
			touch_origin = event.position
			stick = Vector2.ZERO
		elif not event.pressed and event.index == touch_id:
			touch_id = -1
			stick = Vector2.ZERO
	if event is InputEventScreenDrag and event.index == touch_id:
		stick = ((event.position-touch_origin)/65.0).limit_length()
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and _stick_zone(event.position) and not paused:
			mouse_stick = true
			touch_origin = event.position
		elif not event.pressed and mouse_stick:
			mouse_stick = false
			stick = Vector2.ZERO
	if event is InputEventMouseMotion and mouse_stick:
		stick = ((event.position-touch_origin)/65.0).limit_length()
	if joystick:
		joystick.queue_redraw()

func _stick_zone(point: Vector2) -> bool:
	var size := get_viewport().get_visible_rect().size
	return point.x < size.x*0.43 and point.y > size.y*0.45

func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		stick = Vector2.ZERO
		touch_id = -1
		mouse_stick = false
		if booted:
			_save_progress()
	if what == NOTIFICATION_WM_GO_BACK_REQUEST and booted:
		_toggle_menu()

func _physics_process(delta: float) -> void:
	if not booted or paused:
		return
	clock += delta
	var keyboard := Vector2(
		float(Input.is_physical_key_pressed(KEY_D) or Input.is_physical_key_pressed(KEY_RIGHT))-float(Input.is_physical_key_pressed(KEY_A) or Input.is_physical_key_pressed(KEY_LEFT)),
		float(Input.is_physical_key_pressed(KEY_S) or Input.is_physical_key_pressed(KEY_DOWN))-float(Input.is_physical_key_pressed(KEY_W) or Input.is_physical_key_pressed(KEY_UP)))
	var control := keyboard.limit_length() if keyboard.length() > 0 else stick
	# Align movement to the camera's horizontal axes.
	var forward := -camera.global_basis.z
	forward.y = 0
	forward = forward.normalized()
	var right := camera.global_basis.x
	right.y = 0
	var direction := (right.normalized()*control.x-forward*control.y).limit_length()
	if driving:
		car_speed = move_toward(car_speed,control.length()*18.0,delta*9.0)
		if direction.length() > 0.08:
			car.rotation.y = lerp_angle(car.rotation.y,atan2(-direction.x,-direction.z),delta*3.4)
		var movement := -car.global_basis.z*car_speed
		car.velocity.x = movement.x
		car.velocity.z = movement.z
		player.position = car.position
	else:
		player.velocity.x = direction.x*5.0
		player.velocity.z = direction.z*5.0
		if direction.length() > 0.08:
			player.rotation.y = lerp_angle(player.rotation.y,atan2(-direction.x,-direction.z),delta*10)
		player.velocity.y -= 24*delta
		player.move_and_slide()
		car.velocity.x = move_toward(car.velocity.x,0,delta*20)
		car.velocity.z = move_toward(car.velocity.z,0,delta*20)
	car.velocity.y -= 24*delta
	car.move_and_slide()
	if car.is_on_floor():
		car.velocity.y = 0
	if player.position.y < -5 or car.position.y < -5:
		_rescue()
	marker.position = (DROPOFF if carrying else PICKUP)+Vector3(0,0.25+sin(clock*2)*0.12,0)
	marker.rotation.y += delta*0.4
	_follow_camera(delta*5)
	_refresh_hud()
	if toast_time > 0:
		toast_time -= delta
		if toast_time <= 0:
			status_label.text = ""

func _follow_camera(weight: float) -> void:
	var target: Vector3 = car.position if driving else player.position
	camera.position = camera.position.lerp(target+Vector3(11,17,19),minf(weight,1.0))
	camera.look_at(target+Vector3(0,0.5,0))

func _interact() -> void:
	if paused:
		return
	var body: CharacterBody3D = car if driving else player
	var destination: Vector3 = DROPOFF if carrying else PICKUP
	if Vector2(body.position.x-destination.x,body.position.z-destination.z).length() < 4.8:
		if carrying:
			cash += 150
			deliveries += 1
			carrying = false
			_save_progress()
			_show_toast("DELIVERY COMPLETE  +$150  •  Another parcel is at the port.")
		else:
			carrying = true
			_show_toast("Parcel collected. Follow the ring to Sunset Market.")
	elif driving:
		var candidates := [Vector3(2.5,0,0),Vector3(-2.5,0,0),Vector3(0,0,3.2)]
		var found := false
		for offset: Vector3 in candidates:
			var exit_position := car.position+car.global_basis*offset
			exit_position.y += 0.25
			var query := PhysicsShapeQueryParameters3D.new()
			query.shape = player.get_child(0).shape
			query.transform = Transform3D(Basis.IDENTITY,exit_position)
			query.exclude = [player.get_rid()]
			if get_world_3d().direct_space_state.intersect_shape(query,1).is_empty():
				player.position = exit_position
				found = true
				break
		if not found:
			_show_toast("Move the car to an open space before getting out.")
			return
		driving = false
		player.show()
		player.get_child(0).set_deferred("disabled",false)
		car_speed = 0
		car.velocity.x = 0
		car.velocity.z = 0
	elif player.position.distance_to(car.position) < 5.0:
		driving = true
		player.hide()
		player.get_child(0).set_deferred("disabled",true)
		_show_toast("Steer with the stick. Release it to brake.")
	_refresh_hud()

func _refresh_hud() -> void:
	var body: CharacterBody3D = car if driving else player
	var destination: Vector3 = DROPOFF if carrying else PICKUP
	var distance := int(Vector2(body.position.x-destination.x,body.position.z-destination.z).length())
	objective.text = ("Deliver to Sunset Market" if carrying else "Collect a parcel at the port")+"  ·  "+str(distance)+"m"
	balance_label.text = "$%d  ·  %d deliveries  ·  %s" % [cash,deliveries,"Driving" if driving else "On foot"]
	var offset: Vector3 = destination-body.position
	var screen_right := camera.global_basis.x
	var screen_forward := -camera.global_basis.z
	screen_forward.y = 0
	var compass_angle := atan2(offset.dot(screen_right),offset.dot(screen_forward.normalized()))
	var arrows := ["↑","↗","→","↘","↓","↙","←","↖"]
	var arrow_index := posmod(int(round(compass_angle/(PI/4.0))),8)
	compass.text = "%s  %s" % [arrows[arrow_index],"Destination is here" if distance < 5 else "Follow the golden ring"]
	speed_label.text = "%d km/h  •  Release stick to brake" % int(Vector2(car.velocity.x,car.velocity.z).length()*3.6) if driving else "Walk to the blue car to start driving"
	if distance < 5:
		action_button.text = "DELIVER  +$150" if carrying else "PICK UP PARCEL"
		action_button.disabled = false
	else:
		action_button.text = "EXIT CAR" if driving else "ENTER CAR"
		action_button.disabled = not driving and player.position.distance_to(car.position) >= 5.0

func _toggle_menu() -> void:
	paused = not paused
	menu.visible = paused
	stick = Vector2.ZERO
	touch_id = -1
	mouse_stick = false
	joystick.queue_redraw()

func _rescue() -> void:
	car.position = Vector3(1.7,0.8,4)
	car.rotation = Vector3.ZERO
	car.velocity = Vector3.ZERO
	car_speed = 0
	player.position = Vector3(7,0.9,7)
	player.velocity = Vector3.ZERO
	driving = false
	player.show()
	player.get_child(0).set_deferred("disabled",false)
	if paused:
		_toggle_menu()
	_show_toast("Back at the waterfront. Your money is safe.")

func _show_toast(message: String) -> void:
	status_label.text = message
	toast_time = 6.0

func _save_progress() -> void:
	var file := ConfigFile.new()
	file.set_value("progress","cash",cash)
	file.set_value("progress","deliveries",deliveries)
	file.save(SAVE_PATH)

func _load_progress() -> void:
	var file := ConfigFile.new()
	if file.load(SAVE_PATH) == OK:
		cash = maxi(0,int(file.get_value("progress","cash",0)))
		deliveries = maxi(0,int(file.get_value("progress","deliveries",0)))

func _smoke_test() -> void:
	# Exercise the actual mission and driving transitions; preserve the player's save.
	await get_tree().physics_frame
	assert(action_button.position.x > 0 and action_button.position.y > 0,"Action button outside screen")
	assert(joystick.position.y > 0,"Joystick outside screen")
	var original_cash := cash
	var original_deliveries := deliveries
	player.position = car.position+Vector3(2,0,0)
	var left_touch := InputEventScreenTouch.new()
	left_touch.index = 0
	left_touch.pressed = true
	left_touch.position = joystick.position+Vector2(90,90)
	_input(left_touch)
	var action_touch := InputEventScreenTouch.new()
	action_touch.index = 1
	action_touch.pressed = true
	action_touch.position = action_button.position+action_button.size/2
	_refresh_hud()
	_input(action_touch)
	assert(driving and touch_id == 0,"Second-finger car entry failed")
	var start_position := car.position
	stick = Vector2(0,-1)
	for frame in 90:
		await get_tree().physics_frame
	assert(car.position.distance_to(start_position) > 2,"Car did not move under stick input")
	stick = Vector2.ZERO
	touch_id = -1
	await get_tree().physics_frame
	car.position = PICKUP+Vector3(0,0.8,0)
	_interact()
	assert(carrying,"Parcel pickup failed")
	car.position = DROPOFF+Vector3(0,0.8,0)
	_interact()
	assert(not carrying and cash == original_cash+150,"Delivery reward failed")
	_rescue()
	for frame in 30:
		await get_tree().physics_frame
	player.position = car.position+Vector3(2.5,0.2,0)
	_interact()
	await get_tree().physics_frame
	_interact()
	assert(not driving,"Vehicle exit failed in an open area")
	cash = original_cash
	deliveries = original_deliveries
	_save_progress()
	print("HARBOR_SMOKE_OK: two-finger input, drive, pickup, deliver, exit, rescue")
	get_tree().quit()


func _capture_preview() -> void:
	await RenderingServer.frame_post_draw
	var folder := ProjectSettings.globalize_path("user://screenshots")
	DirAccess.make_dir_recursive_absolute(folder)
	var image := get_viewport().get_texture().get_image()
	image.save_png(folder.path_join("harbor-city-gameplay.png"))
	_show_toast("Gameplay screenshot saved.")

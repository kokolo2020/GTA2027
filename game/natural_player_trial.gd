extends RefCounted
## Local playable-character trial. The classic people and saved wardrobe stay intact.

const MODEL := "res://models/natural_player_trial.glb"

static func create(parent: Node3D) -> Dictionary:
	if not ResourceLoader.exists(MODEL):
		return {}
	var scene := load(MODEL) as PackedScene
	if scene == null:
		return {}
	var holder := Node3D.new()
	parent.add_child(holder)
	var model := scene.instantiate() as Node3D
	holder.add_child(model)
	model.rotation.y = PI # Blender -Y forward becomes +Z in glTF; players face -Z.
	model.position.y = -0.029 # Align the sneaker sole with the existing player feet.
	var ap: AnimationPlayer
	var stack: Array[Node] = [model]
	while not stack.is_empty():
		var node: Node = stack.pop_back()
		stack.append_array(node.get_children())
		if node is AnimationPlayer:
			ap = node as AnimationPlayer
	if ap == null:
		holder.queue_free()
		return {}
	for clip in ["Idle","Walk","Run","Sit","Wave","Talk","Cheer"]:
		if not ap.has_animation(clip):
			push_warning("Character trial is missing %s; using the classic player." % clip)
			holder.queue_free()
			return {}
		ap.get_animation(clip).loop_mode = Animation.LOOP_LINEAR
	ap.callback_mode_process = AnimationMixer.ANIMATION_CALLBACK_MODE_PROCESS_MANUAL
	ap.play("Idle")
	ap.advance(0.0)
	# Existing shop code expects these handles; the trial keeps its own fixed tech outfit.
	var mats := {}
	for key in ["Shirt","Pants","Skin","Hair","Shoes","Eye"]:
		mats[key] = StandardMaterial3D.new()
	return {"root":holder,"model":model,"ap":ap,"mats":mats,"limbs":{},
		"idle":"Idle","speed":1.0,"tint":false,"natural_trial":true,"sit_hip":0.841}

static func check(game) -> void:
	var person: Dictionary = game.player_person
	if "--classic-player" in OS.get_cmdline_user_args():
		assert(not person.get("natural_trial",false) and not person.is_empty(),"Classic rollback did not load")
		assert(person["limbs"].get("Head") != null,"Classic character head missing")
		print("HARBOR_CLASSIC_PLAYER_OK")
		game.get_tree().quit()
		return
	assert(person.get("natural_trial",false),"Trial player did not load")
	var ap: AnimationPlayer = person["ap"]
	var model: Node3D = person["model"]
	assert(model.basis.z.dot(Vector3.FORWARD) > 0.99,"Trial player faces backward")
	var saved_look: Dictionary = game.look.duplicate(true)
	for row in [[0.0,"Idle"],[1.0,"Walk"],[1.35,"Run"]]:
		game._pose_person(person,1.2,float(row[0]))
		game._kpeople_tick(0.25)
		assert(ap.current_animation == row[1],"Wrong movement animation")
		assert(ap.current_animation_position > 0.0,"Animation did not advance")
	game._sit_pose(person,0.45,-0.7)
	assert(ap.current_animation == "Sit","Sitting animation missing")
	assert(is_equal_approx(person["root"].position.y,-0.7-(0.841-0.51)),"Wrong seat height")
	person["idle"] = "Idle"
	game._pose_person(person,0.0,0.0)
	for clip in ["Wave","Talk","Cheer"]:
		game._kplay(person,clip)
		game._kpeople_tick(0.2)
		assert(ap.current_animation == clip,"Gesture animation missing")
	game._apply_avatar()
	assert(game.look == saved_look,"Trial changed the saved wardrobe selection")
	assert(not (game.peds[0]["person"] as Dictionary).get("natural_trial",false),"Trial replaced an NPC")
	assert(is_equal_approx(game._player_hat_y(-0.7),0.44),"Trial hat height is wrong")
	var money_before: int = game.cash
	game._toggle_character()
	assert(not game.player_person.get("natural_trial",false),"Settings did not restore Classic")
	assert(game.menu_character_button.text == "Character: Classic","Settings label did not update")
	assert(game.look == saved_look and game.cash == money_before,"Switching changed wardrobe or money")
	game._toggle_character()
	person = game.player_person
	ap = person["ap"]
	assert(person.get("natural_trial",false) and game.natural_player_pref,"Settings did not restore New")
	assert(game.menu_character_button.text == "Character: New","New-character label did not update")
	person["idle"] = "Idle"
	game._pose_person(person,0.0,0.0)
	game._kpeople_tick(0.1)
	print("HARBOR_NATURAL_PLAYER_OK: idle, walk, run, sitting, gestures, facing, hats, wardrobe, NPC isolation and Settings rollback")
	var folder := OS.get_environment("HC_CHARACTER_SHOTS")
	if folder != "":
		DirAccess.make_dir_recursive_absolute(folder)
		game.set_process(false)
		game.set_physics_process(false)
		game.driving = false
		game.player.show()
		# Use clear paving; the historical food-court spawn overlaps a cafe table.
		game.player.position = Vector3(-17,0.82,-6.0)
		game.player.rotation.y = 0.0
		game._set_hat(0)
		game.day_hour_override = 13.0
		game._daynight_apply(true)
		game._shot_enter()
		game.camera.position = game.player.position+Vector3(2.0,0.6,-3.0)
		game.camera.look_at(game.player.position+Vector3(0,0.15,0))
		game.camera.fov = 43.0
		for clip in ["Idle","Walk","Run","Sit"]:
			person["idle"] = "Idle"
			game._pose_person(person,0.0,0.0)
			if clip == "Sit":
				game._sit_pose(person,0.45,-0.7)
			ap.play(clip)
			ap.seek(0.18,true)
			ap.advance(0.0)
			await game.get_tree().process_frame
			await RenderingServer.frame_post_draw
			var result = game.get_viewport().get_texture().get_image().save_png(folder.path_join(clip.to_lower()+".png"))
			assert(result == OK,"Could not save character screenshot")
		person["idle"] = "Idle"
		game._pose_person(person,0.0,0.0)
		game._shot_exit()
		if not game.paused:
			game._toggle_menu()
		game._menu_tab(4)
		await game.get_tree().process_frame
		await RenderingServer.frame_post_draw
		var menu_result = game.get_viewport().get_texture().get_image().save_png(folder.path_join("settings.png"))
		assert(menu_result == OK,"Could not save Settings screenshot")
		print("HARBOR_NATURAL_PLAYER_SHOTS_OK")
	game.get_tree().quit()

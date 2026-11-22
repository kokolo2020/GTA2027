extends RefCounted
## Local playable-character trial. The classic people and saved wardrobe stay intact.

const MODEL := "res://models/natural_player_trial.glb"
const MALE := "res://models/natural_male.glb"
const FEMALE := "res://models/natural_female.glb"
const MALE_CROWD := "res://models/natural_male_crowd.glb"
const FEMALE_CROWD := "res://models/natural_female_crowd.glb"
static var scenes := {}
const PALETTE_KEYS := ["Shirt","Pants","Skin","Hair","Shoes","Eye"]
const CROWD_SHADER := preload("res://natural_crowd.gdshader")

static func sync_palette(person: Dictionary) -> void:
	var shader: ShaderMaterial = person.get("crowd_shader")
	if shader == null:
		return
	for key in PALETTE_KEYS:
		shader.set_shader_parameter("c_"+String(key).to_lower(),(person["mats"][key] as StandardMaterial3D).albedo_color)

static func pack_palette(person: Dictionary) -> Array:
	var result: Array = []
	if person.get("natural_style",false):
		for key in PALETTE_KEYS:
			result.append((person["mats"][key] as StandardMaterial3D).albedo_color.to_html())
	return result

static func apply_palette(person: Dictionary, palette: Variant) -> void:
	if not person.get("natural_style",false) or not palette is Array or palette.size() != PALETTE_KEYS.size():
		return
	for i in PALETTE_KEYS.size():
		var material: StandardMaterial3D = person["mats"][PALETTE_KEYS[i]]
		material.albedo_color = Color.from_string("#"+str(palette[i]),material.albedo_color)
	sync_palette(person)
# Match the game's existing 12.5-radian/second run cadence at full running speed.
const RUN_CYCLES_PER_SECOND := 12.5/TAU

static func pose_run(game, ground_distance: float, delta: float) -> void:
	var person: Dictionary = game.player_person
	var speed := ground_distance/maxf(delta,0.001)
	if speed <= 0.15:
		person.erase("run_rate")
		game._pose_person(person,0.0,0.0)
		return
	var ap: AnimationPlayer = person["ap"]
	var duration := ap.get_animation("Run").length
	var target := duration*RUN_CYCLES_PER_SECOND*clampf(speed/game.RUN_SPEED,0.0,1.25)
	var previous := float(person.get("run_rate",target))
	var rate := lerpf(previous,target,1.0-exp(-12.0*delta))
	person["run_rate"] = rate
	game._pose_person(person,0.0,1.35)
	ap.speed_scale = rate

static func create(parent: Node3D, female := false, crowd := false) -> Dictionary:
	var path: String = (FEMALE_CROWD if female else MALE_CROWD) if crowd else (FEMALE if female else MALE)
	if not ResourceLoader.exists(path):
		return {}
	if not scenes.has(path):
		scenes[path] = load(path) as PackedScene
	var scene: PackedScene = scenes[path]
	if scene == null:
		return {}
	var holder := Node3D.new()
	parent.add_child(holder)
	var model := scene.instantiate() as Node3D
	holder.add_child(model)
	model.rotation.y = PI # Blender -Y forward becomes +Z in glTF; players face -Z.
	model.position.y = -0.029 # Align the sneaker sole with the existing player feet.
	var ap: AnimationPlayer
	var mats := {}
	var crowd_material: ShaderMaterial
	if crowd:
		crowd_material = ShaderMaterial.new()
		crowd_material.shader = CROWD_SHADER
	var stack: Array[Node] = [model]
	while not stack.is_empty():
		var node: Node = stack.pop_back()
		stack.append_array(node.get_children())
		if node is AnimationPlayer:
			ap = node as AnimationPlayer
		if node is MeshInstance3D:
			var mesh_node := node as MeshInstance3D
			if crowd:
				mesh_node.material_override = crowd_material
			for surface in mesh_node.mesh.get_surface_count():
				var material := mesh_node.mesh.surface_get_material(surface) as StandardMaterial3D
				if material == null or material.resource_name not in ["Shirt","Pants","Skin","Hair","Shoes","Eye"]:
					continue
				var key := material.resource_name
				if not mats.has(key):
					mats[key] = material.duplicate()
				mesh_node.set_surface_override_material(surface,mats[key])
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
	var stagger := float(holder.get_instance_id() % 997)/997.0
	if crowd:
		ap.seek(stagger*ap.current_animation_length,true)
	# Existing shop code expects these handles; the trial keeps its own fixed tech outfit.
	for key in ["Shirt","Pants","Skin","Hair","Shoes","Eye"]:
		if not mats.has(key):
			mats[key] = StandardMaterial3D.new()
			(mats[key] as StandardMaterial3D).albedo_color = {"Shirt":Color("173947"),"Pants":Color("263d54"),"Skin":Color("ac7552"),"Hair":Color("2b1d14"),"Shoes":Color("29343d"),"Eye":Color("1c1c22")}[key]
	var person := {"root":holder,"model":model,"ap":ap,"mats":mats,"limbs":{"Body":holder},
		"idle":"Idle","speed":1.0,"tint":false,"natural_trial":not crowd,"natural_style":true,
		"female":female,"sit_hip":0.841,"hat_offset":1.14,"hat_scale":0.83,"acc":stagger*0.25 if crowd else 0.0,"crowd_shader":crowd_material}
	sync_palette(person)
	return person

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
	assert((game.peds[0]["person"] as Dictionary).get("natural_style",false),"City pedestrian kept the old design")
	assert(not (game.peds[0]["person"] as Dictionary).get("natural_trial",false),"Crowd uses the full-rate player path")
	var male_count := 0
	var female_count := 0
	for ped in game.peds:
		var crowd_person: Dictionary = ped["person"]
		assert(crowd_person.get("natural_style",false) and crowd_person.has("ap"),"A pedestrian kept the old body")
		if crowd_person.get("female",false):
			female_count += 1
		else:
			male_count += 1
	assert(male_count > 0 and female_count > 0,"Crowd does not include both adult body types")
	for people in [game.fc_people,game.cm_people,game.bio_people]:
		for crowd_person in people:
			assert(crowd_person.get("natural_style",false),"Standing city character kept its old body")
	# Receiving a body change must rebuild the peer and preserve the sent palette.
	var old_feed: Array = game.feed.duplicate(true)
	var message := {"i":"body-check","n":"Body check","x":-17.0,"y":0.9,"z":-6.0,"d":0,"s":-1,"av":[0,0,0],"nb":2,"nc":pack_palette(person)}
	game._online_peer_update(message)
	var peer: Dictionary = game.online_peers["body-check"]
	assert(peer["person"].get("female",false),"Online female body did not load")
	assert(pack_palette(peer["person"]) == message["nc"],"Online palette differs from the actual avatar")
	var shader: ShaderMaterial = peer["person"]["crowd_shader"]
	assert(shader != null,"Crowd is not using the lightweight material")
	var shader_shirt: Color = shader.get_shader_parameter("c_shirt")
	assert(shader_shirt.is_equal_approx((peer["person"]["mats"]["Shirt"] as StandardMaterial3D).albedo_color),"Crowd tint was not sent to its shader")
	var meshes: Array[Node] = (peer["person"]["model"] as Node).find_children("*","MeshInstance3D",true,false)
	assert(meshes.size() == 1 and (meshes[0] as MeshInstance3D).mesh.get_surface_count() == 1,"Crowd has extra drawing surfaces")
	message["s"] = 0
	game._online_peer_update(message)
	game._online_update_peers(0.1)
	assert(peer["person"]["sat"] and peer["person"]["ap"].current_animation == "Sit","Online female cannot sit")
	message["s"] = -1
	message["nb"] = 1
	game._online_peer_update(message)
	game._online_update_peers(0.1)
	assert(not peer["person"].get("female",false) and peer["person"]["idle"] == "Idle","Online standing/body transition failed")
	message["nb"] = 0
	game._online_peer_update(message)
	assert(not peer["person"].get("natural_style",false),"Online Classic option did not restore Classic")
	game.kpeople.erase(peer["person"])
	peer["node"].queue_free()
	game.online_peers.erase("body-check")
	game.feed = old_feed
	assert(is_equal_approx(game._player_hat_y(-0.7),0.44),"Trial hat height is wrong")
	# Running follows actual displacement, rather than held input or a fixed clip rate.
	pose_run(game,0.15,1.0/60.0)
	var full_rate := ap.speed_scale
	assert(ap.current_animation == "Run" and full_rate > 1.2,"Full-speed run cadence is not synchronized")
	for i in 60:
		pose_run(game,0.075,1.0/60.0)
	assert(is_equal_approx(ap.speed_scale,full_rate*0.5),"Half-speed run does not use half cadence")
	var phase_before := ap.current_animation_position
	pose_run(game,0.075,1.0/60.0)
	assert(is_equal_approx(ap.current_animation_position,phase_before),"Run playback restarts each physics tick")
	pose_run(game,0.0,1.0/60.0)
	assert(ap.current_animation == "Idle","Blocked or stopped player keeps running")
	game._pose_person(person,0.0,1.0)
	assert(ap.current_animation == "Walk" and is_equal_approx(ap.speed_scale,1.1),"Walking cadence changed")
	var camera_before: Vector3 = game.camera.position
	var visible_before: bool = game.player.visible
	game.player.show()
	game.camera.position = game.player.position+Vector3(0,30,50)
	game._pose_person(person,0.0,1.35)
	ap.advance(0.21)
	for i in 4:
		var tick_before := ap.current_animation_position
		game._kpeople_tick(1.0/60.0)
		assert(not is_equal_approx(ap.current_animation_position,tick_before),"Far camera skips player animation frames")
	game.camera.position = camera_before
	game.player.visible = visible_before
	var money_before: int = game.cash
	game._toggle_character()
	assert(game.player_person.get("female",false),"Female player option did not load")
	assert(game.menu_character_button.text == "Character: Female","Female label did not update")
	game._toggle_character()
	assert(not game.player_person.get("natural_trial",false),"Settings did not restore Classic")
	assert(game.menu_character_button.text == "Character: Classic","Settings label did not update")
	assert(game.look == saved_look and game.cash == money_before,"Switching changed wardrobe or money")
	game._toggle_character()
	person = game.player_person
	ap = person["ap"]
	assert(person.get("natural_trial",false) and game.natural_player_pref,"Settings did not restore New")
	assert(game.menu_character_button.text == "Character: Male","Male-character label did not update")
	person["idle"] = "Idle"
	game._pose_person(person,0.0,0.0)
	game._kpeople_tick(0.1)
	print("HARBOR_NATURAL_PLAYER_OK: male/female city, one-surface crowd palette, online body/sitting transitions, movement-linked run cadence, walking unchanged and Classic rollback")
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
		game._toggle_character() # Male -> Female, same camera and real city background.
		game._pose_person(game.player_person,0.0,0.0)
		game._kpeople_tick(0.1)
		await game.get_tree().process_frame
		await RenderingServer.frame_post_draw
		var female_result = game.get_viewport().get_texture().get_image().save_png(folder.path_join("female.png"))
		assert(female_result == OK,"Could not save female character screenshot")
		game._toggle_character() # Female -> Classic -> Male.
		game._toggle_character()
		person = game.player_person
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

# Asia biodome look (matched to the Unity prototype): dense leaf-card forest, bamboo groves,
# blossom trees, ferns and soft light shafts. Everything is generated at runtime, so it adds no download size.
# Used only for dome index 1; world_biosphere.gd calls add_tree(), build_forest() and shafts().
extends RefCounted

var wb
var tex := {}
var mats := {}
var meshes := {}
var pending := {}

func _init(world) -> void:
	wb = world

# ---------- procedural textures ----------

func _in_img(img: Image, x: int, y: int) -> bool:
	return x >= 0 and y >= 0 and x < img.get_width() and y < img.get_height()

func _leaf(img: Image, bx: float, by: float, ang: float, length: float, width: float, col: Color, tapered: bool) -> void:
	var ca := cos(ang)
	var sa := sin(ang)
	var r := int(ceil(length)) + 1
	for yy in range(int(by) - r, int(by) + r + 1):
		for xx in range(int(bx) - r, int(bx) + r + 1):
			if not _in_img(img, xx, yy):
				continue
			var dx := float(xx) - bx
			var dy := float(yy) - by
			var u := dx * ca + dy * sa
			var v := -dx * sa + dy * ca
			if u < 0.0 or u > length:
				continue
			var t := u / length
			var w := width * (pow(1.0 - t, 0.7) if tapered else pow(sin(PI * t), 0.8))
			if absf(v) <= w:
				var c := col
				if absf(v) < 0.7 and not tapered:
					c = col.lightened(0.16)
				else:
					c = col.lerp(col.lightened(0.18), t * 0.5)
				img.set_pixel(xx, yy, c)

func _disc(img: Image, cx: float, cy: float, rad: float, col: Color) -> void:
	for yy in range(int(cy - rad), int(cy + rad) + 1):
		for xx in range(int(cx - rad), int(cx + rad) + 1):
			if _in_img(img, xx, yy) and Vector2(xx - cx, yy - cy).length() <= rad:
				img.set_pixel(xx, yy, col.lerp(col.lightened(0.2), (float(yy) - cy) / rad * -0.5 + 0.5))

func texture(name: String) -> ImageTexture:
	if tex.has(name):
		return tex[name]
	var rng := RandomNumberGenerator.new()
	rng.seed = 4242 + name.length()
	var img := Image.create(128, 128, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	if name == "broad":
		var pal := [Color("1f5a24"), Color("2f7a2f"), Color("3f9438"), Color("57a944"), Color("7cc255")]
		for k in 44:
			var c: Color = pal[(k * 5 / 44) % 5]
			_leaf(img, rng.randf_range(14, 114), rng.randf_range(14, 114), rng.randf() * TAU, rng.randf_range(24, 36), rng.randf_range(8, 12), c, false)
	elif name == "blossom":
		for k in 12:
			_leaf(img, rng.randf_range(20, 108), rng.randf_range(20, 108), rng.randf() * TAU, rng.randf_range(20, 30), rng.randf_range(6, 9), Color("4a8a3c"), false)
		var pal := [Color("e98fb0"), Color("f2b3c9"), Color("f8d2de"), Color("fff0f4")]
		for k in 80:
			_disc(img, rng.randf_range(10, 118), rng.randf_range(10, 118), rng.randf_range(5, 9), pal[rng.randi() % 4])
	else:
		# blade fan: grass, ferns, bamboo sprays
		var pal := [Color("2b6b2a"), Color("3f8a35"), Color("5aa043"), Color("7bb957")]
		for k in 22:
			var a := -PI * 0.5 + rng.randf_range(-1.05, 1.05)
			_leaf(img, 64 + rng.randf_range(-8, 8), 124, a, rng.randf_range(62, 112), rng.randf_range(3.2, 5.5), pal[rng.randi() % 4], true)
	img.generate_mipmaps()
	var t := ImageTexture.create_from_image(img)
	tex[name] = t
	return t

func shaft_texture() -> ImageTexture:
	if tex.has("shaft"):
		return tex["shaft"]
	var img := Image.create(32, 128, false, Image.FORMAT_RGBA8)
	for y in 128:
		for x in 32:
			var fx := 1.0 - absf(float(x) - 15.5) / 16.0
			var fy := sin(PI * float(y) / 127.0)
			img.set_pixel(x, y, Color(1, 1, 1, pow(fx, 1.6) * pow(fy, 0.7)))
	var t := ImageTexture.create_from_image(img)
	tex["shaft"] = t
	return t

func leaf_material(name: String) -> StandardMaterial3D:
	if mats.has(name):
		return mats[name]
	var m := StandardMaterial3D.new()
	m.albedo_texture = texture(name)
	m.albedo_color = Color(0.80, 0.88, 0.80)
	m.vertex_color_use_as_albedo = true
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	m.alpha_scissor_threshold = 0.5
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.roughness = 1.0
	m.metallic_specular = 0.0
	m.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
	mats[name] = m
	return m

func bark_material() -> StandardMaterial3D:
	if mats.has("bark"):
		return mats["bark"]
	var m := StandardMaterial3D.new()
	m.vertex_color_use_as_albedo = true
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.roughness = 1.0
	m.metallic_specular = 0.0
	mats["bark"] = m
	return m

# ---------- mesh building ----------

func _card(st: SurfaceTool, ctr: Vector3, normal: Vector3, size: float, col: Color, tall := 1.0) -> void:
	var n := normal.normalized()
	var right := n.cross(Vector3.UP)
	if right.length() < 0.1:
		right = Vector3.RIGHT
	right = right.normalized()
	var up := right.cross(n).normalized()
	var a := ctr - right * size - up * size * tall
	var b := ctr + right * size - up * size * tall
	var c := ctr + right * size + up * size * tall
	var d := ctr - right * size + up * size * tall
	var uvs := [Vector2(0, 1), Vector2(1, 1), Vector2(1, 0), Vector2(0, 0)]
	var vs := [a, b, c, a, c, d]
	var us := [0, 1, 2, 0, 2, 3]
	for k in 6:
		st.set_color(col)
		st.set_normal(Vector3(0, 1, 0).lerp(n, 0.55).normalized())
		st.set_uv(uvs[us[k]])
		st.add_vertex(vs[k])

func _tube(st: SurfaceTool, pts: Array, radii: Array, sides: int, col: Color) -> void:
	var rings := []
	for k in pts.size():
		var ring := []
		for s in sides:
			var a := TAU * float(s) / sides
			ring.append(pts[k] + Vector3(cos(a) * radii[k], 0, sin(a) * radii[k]))
		rings.append(ring)
	for k in pts.size() - 1:
		for s in sides:
			var s2 := (s + 1) % sides
			var a: Vector3 = rings[k][s]
			var b: Vector3 = rings[k][s2]
			var c: Vector3 = rings[k + 1][s2]
			var d: Vector3 = rings[k + 1][s]
			for v in [a, b, c, a, c, d]:
				st.set_color(col)
				st.add_vertex(v)

func _cluster(st: SurfaceTool, rng: RandomNumberGenerator, centre: Vector3, rad: float, cards: int, size: float, tint: Color) -> void:
	for k in cards:
		var dir := Vector3(rng.randf_range(-1, 1), rng.randf_range(-0.5, 1.0), rng.randf_range(-1, 1)).normalized()
		var p := centre + dir * rad * rng.randf_range(0.35, 1.0)
		var shade := (0.62 + 0.38 * (dir.y * 0.5 + 0.5)) * rng.randf_range(0.88, 1.08)
		var col := Color(tint.r * shade, tint.g * shade, tint.b * shade, 1.0)
		_card(st, p, dir + Vector3(rng.randf_range(-0.4, 0.4), rng.randf_range(0.0, 0.6), rng.randf_range(-0.4, 0.4)), size * rng.randf_range(0.85, 1.2), col)

func make_mesh(kind: String, variant: int) -> ArrayMesh:
	var key := "%s%d" % [kind, variant]
	if meshes.has(key):
		return meshes[key]
	var rng := RandomNumberGenerator.new()
	rng.seed = 900 + variant * 37 + kind.length() * 11
	var trunk := SurfaceTool.new()
	trunk.begin(Mesh.PRIMITIVE_TRIANGLES)
	var leaf := SurfaceTool.new()
	leaf.begin(Mesh.PRIMITIVE_TRIANGLES)
	var tex_name := "broad"
	if kind == "broad":
		var lean := Vector3(rng.randf_range(-0.5, 0.5), 0, rng.randf_range(-0.5, 0.5))
		var pts := [Vector3.ZERO, lean * 0.3 + Vector3(0, 2.0, 0), lean * 0.7 + Vector3(0, 4.0, 0), lean + Vector3(0, 5.8, 0)]
		_tube(trunk, pts, [0.30, 0.22, 0.16, 0.10], 6, Color("4b3b2d"))
		var top: Vector3 = pts[3]
		var centres := [top + Vector3(0, 1.7, 0), top + Vector3(-1.7, 0.5, 0.8), top + Vector3(1.8, 0.7, -0.8), top + Vector3(0.2, 0.2, -1.9), top + Vector3(-0.3, 2.9, 0.2), top + Vector3(0.6, 0.3, 1.8)]
		for c in centres:
			_tube(trunk, [top - Vector3(0, 0.6, 0), c - Vector3(0, 0.9, 0)], [0.07, 0.04], 4, Color("55432f"))
			_cluster(leaf, rng, c, 1.55, 11, 1.25, Color(1, 1, 1))
	elif kind == "blossom":
		tex_name = "blossom"
		var pts := [Vector3.ZERO, Vector3(0.25, 1.4, 0.1), Vector3(-0.1, 2.7, 0.3), Vector3(0.3, 3.7, 0.0)]
		_tube(trunk, pts, [0.34, 0.27, 0.2, 0.12], 6, Color("4a3a30"))
		for k in 5:
			var a := TAU * float(k) / 5.0 + rng.randf()
			var c := Vector3(cos(a) * 2.0, 4.2 + rng.randf_range(-0.3, 0.9), sin(a) * 2.0) + Vector3(0.3, 0, 0)
			_tube(trunk, [Vector3(0.3, 3.2, 0.0), c - Vector3(0, 0.8, 0)], [0.1, 0.05], 4, Color("55402f"))
			_cluster(leaf, rng, c, 1.45, 12, 1.15, Color(1, 1, 1))
		_cluster(leaf, rng, Vector3(0.3, 5.2, 0), 1.5, 9, 1.1, Color(1, 1, 1))
	elif kind == "bamboo":
		tex_name = "blade"
		for s in 7:
			var off := Vector3(rng.randf_range(-0.7, 0.7), 0, rng.randf_range(-0.7, 0.7))
			var hh := rng.randf_range(7.0, 9.4)
			var lean := Vector3(rng.randf_range(-0.9, 0.9), 0, rng.randf_range(-0.9, 0.9))
			var pts := [off, off + lean * 0.2 + Vector3(0, hh * 0.4, 0), off + lean * 0.55 + Vector3(0, hh * 0.75, 0), off + lean + Vector3(0, hh, 0)]
			_tube(trunk, pts, [0.075, 0.065, 0.05, 0.035], 5, Color("7f9f4c").lerp(Color("5f8f3c"), rng.randf()))
			for g in 6:
				var at: Vector3 = pts[2].lerp(pts[3], rng.randf())
				var n := Vector3(rng.randf_range(-1, 1), rng.randf_range(0.2, 1.0), rng.randf_range(-1, 1))
				var shade := rng.randf_range(0.8, 1.1)
				_card(leaf, at + n.normalized() * 0.5, n, 0.85, Color(shade, shade, shade * 0.95, 1), 1.0)
	elif kind == "fern":
		tex_name = "blade"
		for k in 9:
			var a := TAU * float(k) / 9.0 + rng.randf()
			var d := Vector3(cos(a), 0, sin(a))
			var shade := rng.randf_range(0.8, 1.1)
			_card(leaf, d * 0.45 + Vector3(0, 0.42, 0), d * 0.55 + Vector3(0, 0.85, 0), 0.55, Color(shade, shade, shade, 1), 1.0)
	trunk.generate_normals()
	var mesh := trunk.commit()
	leaf.commit(mesh)
	if mesh.get_surface_count() == 1:
		mesh.surface_set_material(0, leaf_material(tex_name))
	else:
		mesh.surface_set_material(0, bark_material())
		mesh.surface_set_material(1, leaf_material(tex_name))
	meshes[key] = mesh
	return mesh

# ---------- placing ----------

func add(kind: String, variant: int, p: Vector3, h: float, yaw: float) -> void:
	var key := "%s%d" % [kind, variant]
	if not pending.has(key):
		pending[key] = {"kind": kind, "variant": variant, "xs": []}
	var s := h / 9.0
	pending[key].xs.append(Transform3D(Basis(Vector3.UP, yaw) * Basis.from_scale(Vector3(s, s, s)), p))

func add_tree(p: Vector3, h: float, seed_v: int) -> void:
	var r := (seed_v * 7919) % 100
	if r < 18:
		add("blossom", seed_v % 2, p, minf(h, 7.0) * 0.95, float(seed_v) * 0.7)
	elif r < 50:
		add("bamboo", seed_v % 3, p, h, float(seed_v) * 1.3)
	else:
		add("broad", seed_v % 3, p, h * 1.25, float(seed_v) * 0.9)

func local_xz(p: Vector3) -> Vector2:
	var c: Vector3 = wb.dome_c(1)
	var forward: Vector3 = (c - wb.C).normalized()
	var right := Vector3(forward.z, 0, -forward.x)
	var d := p - c
	return Vector2(d.dot(right), d.dot(forward))

func clear_spot(q: Vector2, margin: float) -> bool:
	if wb.africa_path_dist(q.x, q.y, 1) < margin:
		return false
	if q.y < -26.0 and absf(q.x) < 7.5:
		return false
	if Vector2(q.x, q.y - 27.0).length() < 5.2:
		return false
	for slot in wb.RESERVE_SLOTS:
		if q.distance_to(Vector2(slot[0], slot[1])) < float(slot[2]) - 0.3:
			return false
	return true

func build_forest(parent: Node3D) -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = 8811
	var c: Vector3 = wb.dome_c(1)
	var forward: Vector3 = (c - wb.C).normalized()
	var right := Vector3(forward.z, 0, -forward.x)
	var spots: Array = []
	# a tall wall of trees along the rim hides the base of the glass
	for k in 130:
		var a := rng.randf() * TAU
		var r := rng.randf_range(31.5, 37.4)
		var q := Vector2(cos(a) * r, sin(a) * r)
		if not clear_spot(q, 2.4):
			continue
		spots.append([q, rng.randf_range(9.0, 13.0)])
	# scattered forest between the habitats
	for k in 360:
		var a := rng.randf() * TAU
		var r := sqrt(rng.randf()) * 31.0
		var q := Vector2(cos(a) * r, sin(a) * r)
		if not clear_spot(q, 3.3):
			continue
		var ok := true
		for s in spots:
			if q.distance_to(s[0]) < 3.0:
				ok = false
				break
		if ok:
			spots.append([q, rng.randf_range(6.0, 10.5)])
	var n := 0
	for s in spots:
		var q: Vector2 = s[0]
		var p: Vector3 = c + right * q.x + forward * q.y
		add_tree(p, float(s[1]), n + 1)
		n += 1
	# ferns and grass tufts on the forest floor
	for k in 420:
		var a := rng.randf() * TAU
		var r := sqrt(rng.randf()) * 35.0
		var q := Vector2(cos(a) * r, sin(a) * r)
		if wb.africa_path_dist(q.x, q.y, 1) < 1.6 or (q.y < -28.0 and absf(q.x) < 4.0):
			continue
		add("fern", k % 2, c + right * q.x + forward * q.y + Vector3(0, 0.05, 0), rng.randf_range(5.0, 9.0), rng.randf() * TAU)
	flush(parent)
	shafts(parent)

func flush(parent: Node3D) -> void:
	for key in pending:
		var item: Dictionary = pending[key]
		var mm := MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = make_mesh(item.kind, item.variant)
		mm.instance_count = item.xs.size()
		for k in item.xs.size():
			mm.set_instance_transform(k, item.xs[k])
		var mi := MultiMeshInstance3D.new()
		mi.multimesh = mm
		mi.name = "Asia_" + key
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		parent.add_child(mi)
	pending.clear()

func shafts(parent: Node3D) -> void:
	var m := StandardMaterial3D.new()
	m.albedo_texture = shaft_texture()
	m.albedo_color = Color(1.0, 0.93, 0.68, 0.13)
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.no_depth_test = false
	var rng := RandomNumberGenerator.new()
	rng.seed = 77
	var c: Vector3 = wb.dome_c(1)
	for k in 9:
		var a := rng.randf() * TAU
		var r := rng.randf_range(4.0, 24.0)
		var quad := QuadMesh.new()
		quad.size = Vector2(rng.randf_range(2.4, 4.2), 32.0)
		for plane in 2:
			var mi := MeshInstance3D.new()
			mi.mesh = quad
			mi.material_override = m
			mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			mi.position = c + Vector3(cos(a) * r, 15.0, sin(a) * r)
			mi.rotation = Vector3(0.0, a + float(plane) * PI * 0.5, 0.32)
			parent.add_child(mi)

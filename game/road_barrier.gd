# v0.55.8: futuristic road barrier. A glowing car-only wall runs along every open road edge so cars stay
# on the roads (people walk straight through it: collision layer 2 is the car layer). It is left open at
# junctions, at the checkpoints and the dome car park, and wherever a road runs into the raceway, the
# airport or the Biosphere (those keep their own fences). A car that still ends up off the road
# (CALL CAR beside a lawn, fast travel) is put back on the nearest road.
# `game` is the main script. No `:=` on anything read from `game` (it is a Variant).
extends RefCounted

var game
var rects: Array = []        # [cx, cz, half x, half z] for every straight road
var gaps: Array = []         # Vector3(x, z, radius): kept open
var boxes: Array = []        # [centre Vector3, size Vector3] of every collision piece
var built := false
var body: StaticBody3D
var off_t := 0.0
var scan_t := 0.0
var last_dist := 0.0
var last_rect := -1
const CELL := 2.0
const OUT := 1.5
const HIGH := 2.0
const THICK := 0.4
const LAYER := 2

func _init(g_main) -> void:
	game = g_main

func in_zone(x: float, z: float) -> bool:
	# The raceway, the airport and everything beyond the city grid (Biosphere, Galleria...) keep their own fences.
	if z < -445.0 or x < -660.0 or x > 640.0 or z > 420.0:
		return false
	if x > 195.0 and z < -35.0:
		return false
	return true

func _inside(i: int, x: float, z: float, grow: float) -> bool:
	var r: Array = rects[i]
	return absf(x-float(r[0])) < float(r[2])+grow and absf(z-float(r[1])) < float(r[3])+grow

func on_road(x: float, z: float, skip := -1) -> bool:
	for i in rects.size():
		if i != skip and _inside(i,x,z,-0.05):
			return true
	return false

func _in_gap(x: float, z: float, extra := 0.0) -> bool:
	for g in gaps:
		if Vector2(x-g.x,z-g.y).length() < g.z+extra:
			return true
	return false

func _solid_cell(i: int, qx: float, qz: float, n: Vector2) -> bool:
	var ox := qx+n.x*OUT
	var oz := qz+n.y*OUT
	if not in_zone(qx,qz) or not in_zone(ox,oz):
		return false
	if on_road(ox,oz) or on_road(qx,qz,i):
		return false
	if _in_gap(qx,qz):
		return false
	return true

func build() -> void:
	if built:
		return
	built = true
	for r in game.road_rects:
		if absf(float(r[2])) > 0.001:
			continue
		rects.append([float(r[0].x),float(r[0].y),float(r[1].x),float(r[1].y)])
	for c in game.CHECKPOINTS:
		if not game._hidden_place(String(c["name"])):
			gaps.append(Vector3(float(c["pos"].x),float(c["pos"].z),14.0))
	gaps.append(Vector3(float(game.HUB_PARK.x),float(game.HUB_PARK.z),14.0))
	for i in rects.size():
		var r: Array = rects[i]
		var cx: float = r[0]
		var cz: float = r[1]
		var hx: float = r[2]
		var hz: float = r[3]
		for side in 4:
			# Road ends stay open (ramps, gates and lots continue them); only the long sides get a wall.
			if maxf(hx,hz) >= 1.5*minf(hx,hz) and ((side < 2) != (hx > hz)):
				continue
			var along_x := side < 2
			var n := Vector2(0.0,-1.0 if side == 0 else 1.0) if along_x else Vector2(-1.0 if side == 2 else 1.0,0.0)
			var length := (hx if along_x else hz)*2.0
			var start := (cx-hx) if along_x else (cz-hz)
			var edge := (cz+n.y*hz) if along_x else (cx+n.x*hx)
			var cells := maxi(1,int(ceil(length/CELL)))
			var cl := length/float(cells)
			var run_a := -1
			for k in cells+1:
				var solid := false
				if k < cells:
					var t := start+(float(k)+0.5)*cl
					solid = _solid_cell(i,t if along_x else edge,edge if along_x else t,n)
				if solid and run_a < 0:
					run_a = k
				elif not solid and run_a >= 0:
					_emit(along_x,start+float(run_a)*cl,start+float(k)*cl,edge,n)
					run_a = -1
	body = StaticBody3D.new()
	body.name = "RoadBarrier"
	body.collision_layer = LAYER
	body.collision_mask = 0
	game.add_child(body)
	for b in boxes:
		var shape := CollisionShape3D.new()
		var box := BoxShape3D.new()
		box.size = b[1]
		shape.shape = box
		shape.position = b[0]
		body.add_child(shape)
	_visuals()

func _emit(along_x: bool, t0: float, t1: float, edge: float, n: Vector2) -> void:
	var pieces := maxi(1,int(ceil((t1-t0)/14.0)))
	var pl := (t1-t0)/float(pieces)
	for p in pieces:
		var tm := t0+(float(p)+0.5)*pl
		if along_x:
			boxes.append([Vector3(tm,HIGH/2.0,edge+n.y*0.3),Vector3(pl,HIGH,THICK)])
		else:
			boxes.append([Vector3(edge+n.x*0.3,HIGH/2.0,tm),Vector3(THICK,HIGH,pl)])

func _visuals() -> void:
	var wall := MultiMesh.new()
	wall.transform_format = MultiMesh.TRANSFORM_3D
	var m1 := BoxMesh.new()
	m1.size = Vector3.ONE
	wall.mesh = m1
	wall.instance_count = boxes.size()
	var rail := MultiMesh.new()
	rail.transform_format = MultiMesh.TRANSFORM_3D
	var m2 := BoxMesh.new()
	m2.size = Vector3.ONE
	rail.mesh = m2
	rail.instance_count = boxes.size()
	for j in boxes.size():
		var c: Vector3 = boxes[j][0]
		var s: Vector3 = boxes[j][1]
		var thin := Vector3(maxf(s.x*0.3,0.12) if s.x < s.z else s.x,1.0,maxf(s.z*0.3,0.12) if s.z < s.x else s.z)
		wall.set_instance_transform(j,Transform3D(Basis.from_scale(thin),Vector3(c.x,0.6,c.z)))
		var rs := Vector3(thin.x,0.1,thin.z)
		rail.set_instance_transform(j,Transform3D(Basis.from_scale(rs),Vector3(c.x,1.15,c.z)))
	var mat1 := StandardMaterial3D.new()
	mat1.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat1.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat1.albedo_color = Color(0.16,0.85,1.0,0.28)
	var mat2 := StandardMaterial3D.new()
	mat2.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat2.albedo_color = Color(0.55,1.0,1.0)
	var a := MultiMeshInstance3D.new()
	a.name = "RoadBarrierGlass"
	a.multimesh = wall
	a.material_override = mat1
	a.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	game.add_child(a)
	var b := MultiMeshInstance3D.new()
	b.name = "RoadBarrierRail"
	b.multimesh = rail
	b.material_override = mat2
	b.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	game.add_child(b)

# ---------- finding the road ----------
func nearest_road(x: float, z: float, margin := 0.0) -> Vector3:
	# Closest point inside any road (kept `margin` m from its edges). road_dist() style distance in last_dist.
	var best := Vector3(x,0.0,z)
	last_dist = INF
	last_rect = -1
	for i in rects.size():
		var r: Array = rects[i]
		var hx := maxf(float(r[2])-margin,0.0)
		var hz := maxf(float(r[3])-margin,0.0)
		var qx := clampf(x,float(r[0])-hx,float(r[0])+hx)
		var qz := clampf(z,float(r[1])-hz,float(r[1])+hz)
		var d := Vector2(x-qx,z-qz).length()
		if d < last_dist:
			last_dist = d
			last_rect = i
			best = Vector3(qx,0.0,qz)
	return best

func road_dist(x: float, z: float) -> float:
	nearest_road(x,z,0.0)
	return last_dist

func cp_car(pos: Vector3) -> Vector3:
	# Where a checkpoint's car appears: on the nearest road when there is one close by.
	if in_zone(pos.x,pos.z) and road_dist(pos.x,pos.z) <= 14.0:
		return _free_road_spot(pos.x,pos.z,0.8)
	return pos+Vector3(4.5,0.8,0)

func _free_road_spot(x: float, z: float, y: float) -> Vector3:
	# On the nearest road, sliding along it until nothing (traffic, a stall) is in the way.
	var v := nearest_road(x,z,1.8)
	var r: Array = rects[last_rect]
	var along := Vector2(1,0) if float(r[2]) > float(r[3]) else Vector2(0,1)
	for slide: float in [0.0,5.0,-5.0,10.0,-10.0,16.0,-16.0,24.0,-24.0]:
		var c := Vector2(v.x,v.z)+along*slide
		if not on_road(c.x,c.y) or game._blocked_at(Vector3(c.x,1.9,c.y),1.2):
			continue
		return Vector3(c.x,y,c.y)
	return Vector3(v.x,y,v.z)

func call_car_spot(spot: Vector3) -> Vector3:
	if in_zone(spot.x,spot.z):
		var d := road_dist(spot.x,spot.z)
		if d > 2.0 and d <= 12.0:
			return _free_road_spot(spot.x,spot.z,spot.y)
	return spot

func kerb_spot(p: Vector3) -> Vector3:
	# A pavement spot on the side of the nearest road, for pick-ups, drop-offs and fires.
	if not in_zone(p.x,p.z):
		return p
	var q := nearest_road(p.x,p.z,0.0)
	var d := last_dist
	if d > 30.0:
		return p
	if d >= 1.5 and d <= 7.0 and not game._blocked_at(p+Vector3(0,1.0,0),0.4):
		return p
	var r: Array = rects[last_rect]
	var n := Vector2.ZERO
	if d > 0.3:
		n = Vector2(p.x-q.x,p.z-q.z).normalized()
		n = Vector2(signf(n.x),0.0) if absf(n.x) > absf(n.y) else Vector2(0.0,signf(n.y))
	else:
		var dl := p.x-(float(r[0])-float(r[2]))
		var dr := (float(r[0])+float(r[2]))-p.x
		var dt := p.z-(float(r[1])-float(r[3]))
		var db := (float(r[1])+float(r[3]))-p.z
		var m := minf(minf(dl,dr),minf(dt,db))
		if m == dl:
			n = Vector2(-1,0)
		elif m == dr:
			n = Vector2(1,0)
		elif m == dt:
			n = Vector2(0,-1)
		else:
			n = Vector2(0,1)
		q = Vector3(clampf(p.x,float(r[0])-float(r[2]),float(r[0])+float(r[2])),0.0,clampf(p.z,float(r[1])-float(r[3]),float(r[1])+float(r[3])))
		if n.x != 0.0:
			q.x = float(r[0])+n.x*float(r[2])
		else:
			q.z = float(r[1])+n.y*float(r[3])
	var along := Vector2(-n.y,n.x)
	for off: float in [2.4,3.4,4.6,6.0]:
		for slide: float in [0.0,3.0,-3.0,6.0,-6.0,10.0,-10.0]:
			var c: Vector2 = Vector2(q.x,q.z)+n*off+along*slide
			if on_road(c.x,c.y) or not in_zone(c.x,c.y):
				continue
			if game._blocked_at(Vector3(c.x,1.0,c.y),0.4):
				continue
			return Vector3(c.x,p.y,c.y)
	return p

# ---------- safety net ----------
func rescue() -> void:
	var p: Vector3 = game.car.position
	var v := nearest_road(p.x,p.z,1.8)
	game.car.position = Vector3(v.x,0.8,v.z)
	game.car.velocity = Vector3.ZERO
	game.car_speed = 0.0
	off_t = 0.0
	game._show_toast("Back on the road.")

func tick(delta: float) -> void:
	if not built or not game.driving or "--smoke-test" in OS.get_cmdline_user_args():
		return
	scan_t -= delta
	if scan_t > 0.0:
		return
	scan_t = 0.4
	var p: Vector3 = game.car.position
	if not in_zone(p.x,p.z) or game.race_car or game.home_in >= 0 or game.trial_active >= 0:
		off_t = 0.0
		return
	if road_dist(p.x,p.z) > 3.5 and not _in_gap(p.x,p.z,8.0):
		off_t += 0.4
		if off_t >= 1.2:
			rescue()
	else:
		off_t = 0.0

# ---------- checks ----------
func smoke() -> void:
	assert(built and boxes.size() > 50,"Road barrier is built along the road edges (%d pieces)" % boxes.size())
	var space = game.get_world_3d().direct_space_state
	var b: Array = boxes[0]
	var c: Vector3 = b[0]
	var s: Vector3 = b[1]
	var across := Vector3(1,0,0) if s.x < s.z else Vector3(0,0,1)
	var q := PhysicsRayQueryParameters3D.create(c-across*3.0+Vector3(0,0.1,0),c+across*3.0+Vector3(0,0.1,0),LAYER)
	q.hit_from_inside = true
	assert(not space.intersect_ray(q).is_empty(),"The road barrier stops cars (car-only layer)")
	for cp in game.CHECKPOINTS:
		if game._hidden_place(String(cp["name"])) or not in_zone(float(cp["pos"].x),float(cp["pos"].z)):
			continue
		var spots: Array = [cp["pos"],cp_car(cp["pos"])]
		for sp in spots:
			for bx in boxes:
				var bc: Vector3 = bx[0]
				var bs: Vector3 = bx[1]
				assert(not (absf(sp.x-bc.x) < bs.x/2.0+0.6 and absf(sp.z-bc.z) < bs.z/2.0+0.6),"The barrier leaves %s open" % cp["name"])
		assert(on_road(cp_car(cp["pos"]).x,cp_car(cp["pos"]).z) or road_dist(cp["pos"].x,cp["pos"].z) > 14.0,"The checkpoint car appears on the road at %s" % cp["name"])
	var far := Vector3(-430,0,-206)
	var back := nearest_road(far.x,far.z,1.8)
	assert(game._on_road(back),"Nearest road point is on a road")
	for sp in game.careers._career_spots():
		if in_zone(sp.x,sp.z) and road_dist(sp.x,sp.z) <= 30.0:
			assert(not game._on_road(sp),"Job stop is on the kerb, not the road")

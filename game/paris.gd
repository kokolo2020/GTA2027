extends RefCounted
# v0.59: Paris portal. The Champ de Mars district around the Eiffel Tower, rebuilt in the game's style from real
# OpenStreetMap streets and building footprints (map/paris_osm.json, (c) OpenStreetMap contributors, ODbL).
# A glowing portal in the Harbor Dome leads there; a return portal in the Champ de Mars brings you back.
# The district is built the first time somebody walks through, so start-up stays fast. Talks to main through `g`.
const S := 0.6                                # Eiffel Tower scale
const ALL_PAY := 1500
const ALL_XP := 150
const ROAD_W := {"primary":13.0,"secondary":11.0,"tertiary":9.0,"residential":7.0,"unclassified":7.0,"living_street":6.0,"service":3.5,"pedestrian":6.0,"footway":2.4,"path":2.0,"cycleway":2.0,"track":3.0}
const VEHICLE := ["primary","secondary","tertiary","residential","unclassified","living_street","service"]
const MAX_TREES := 520
const MAX_LAMPS := 220
const Outbreak := preload("res://outbreak.gd")
const Tracker := preload("res://tracker.gd")
const Cure := preload("res://cure.gd")

# One mesh under construction: flat-shaded triangles with vertex colours.
class MB extends RefCounted:
	var v := PackedVector3Array()
	var n := PackedVector3Array()
	var c := PackedColorArray()
	var walls := PackedVector3Array()
	func tri(a: Vector3, b: Vector3, d: Vector3, nm: Vector3, col: Color, collide := false) -> void:
		# Godot's front faces are clockwise: turn the triangle so it faces along nm.
		if (b-a).cross(d-a).dot(nm) > 0.0:
			var t := b
			b = d
			d = t
		v.append(a)
		v.append(b)
		v.append(d)
		for i in 3:
			n.append(nm)
			c.append(col)
		if collide:
			walls.append(a)
			walls.append(b)
			walls.append(d)
	func quad(a: Vector3, b: Vector3, d: Vector3, e: Vector3, nm: Vector3, col: Color, collide := false) -> void:
		tri(a,b,d,nm,col,collide)
		tri(a,d,e,nm,col,collide)

var g
var W: Dictionary               # v0.60: the world this instance builds (see worlds.gd DEFS)
var C: Vector3                  # world position of the landmark / map origin
var AREA: Rect2                 # x, z, width, depth of the downloaded map, metres from the origin
var RET: Vector2                # return portal, metres from the origin
var CAFE: Vector2
var QUAY: Vector2               # viewpoint for the last quest
var DATA: String
var QUESTS: Array
var facades: Array
var root: Node3D
var built := false
var entering := false
var hub_pos: Vector3
var ret_pos: Vector3
var cafe_pos: Vector3
var quay_pos: Vector3
var day := ""
var mask := 0
var all_paid := false
var visits := 0
var dry := false
var last_prompt := ""
var tick_t := 0.0
var vmat: StandardMaterial3D
var bcells := {}
var rcells := {}
var tree_n := 0
var test_log: Array = []
var clue_mask := 0              # v0.61: mystery case, 3 clues found today
var clue_day := ""
var relic := false              # solved the case at least once = relic kept for ever
var case_day := ""
var clue_nodes: Array = []
var board_pos: Vector3
var ob                          # v0.63: outbreak rescue mission (outbreak.gd)
var trk                         # v0.68: quest tracker and pointer (tracker.gd)
var cu                          # v0.72: cure gun, rescue quests and the city boss (cure.gd)

func _init(game, def: Dictionary, hub: Vector3) -> void:
	g = game
	W = def
	C = def["C"]
	AREA = def["area"]
	RET = def["ret"]
	CAFE = def["cafe"]
	QUAY = def["view"]
	DATA = def["data"]
	QUESTS = def["quests"]
	facades = def["facades"]
	hub_pos = hub
	ret_pos = C+Vector3(RET.x,0,RET.y)
	cafe_pos = C+Vector3(CAFE.x,0,CAFE.y)
	quay_pos = C+Vector3(QUAY.x,0,QUAY.y)
	board_pos = ret_pos+Vector3(5,0,0)
	ob = Outbreak.new(self)
	cu = Cure.new(self)
	trk = Tracker.new(self)

# ---------- helpers ----------
func in_area(x: float, z: float, m := 0.0) -> bool:
	return x >= AREA.position.x-m and x <= AREA.end.x+m and z >= AREA.position.y-m and z <= AREA.end.y+m

func poly_area(p: PackedVector2Array) -> float:
	var a := 0.0
	for i in p.size():
		var q: Vector2 = p[(i+1)%p.size()]
		a += p[i].x*q.y-q.x*p[i].y
	return a*0.5

func to_poly(arr: Array) -> PackedVector2Array:
	var p := PackedVector2Array()
	for q in arr:
		p.append(Vector2(float(q[0]),float(q[1])))
	if p.size() > 2 and p[0].is_equal_approx(p[p.size()-1]):
		p.remove_at(p.size()-1)
	return p

func mm_boxes(xfs: Array, col: Color, mesh: Mesh = null, parent: Node3D = null, vis_end := 0.0) -> void:
	if xfs.is_empty():
		return
	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh if mesh != null else BoxMesh.new()
	mm.instance_count = xfs.size()
	for i in xfs.size():
		mm.set_instance_transform(i,xfs[i])
	var mi := MultiMeshInstance3D.new()
	mi.multimesh = mm
	mi.material_override = g._material(col)
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	if vis_end > 0.0:
		mi.visibility_range_end = vis_end
	(parent if parent != null else root).add_child(mi)

func seg_xf(a: Vector2, b: Vector2, wd: float, y: float, th: float, ext: float) -> Transform3D:
	var dv := b-a
	var ln := dv.length()
	var zd := Vector3(dv.x,0,dv.y)/ln
	var xd := Vector3(zd.z,0,-zd.x)
	return Transform3D(Basis(xd*wd,Vector3.UP*th,zd*(ln+ext)),Vector3((a.x+b.x)*0.5,y,(a.y+b.y)*0.5))

func beam_xf(a: Vector3, b: Vector3, w: float) -> Transform3D:
	var dv := b-a
	var ln := dv.length()
	var z := dv/ln
	var up := Vector3.UP if absf(z.y) < 0.95 else Vector3.RIGHT
	var x := up.cross(z).normalized()
	var y := z.cross(x)
	return Transform3D(Basis(x*w,y*w,z*ln),(a+b)*0.5)

func finish(mb: MB, parent: Node3D, vis_end := 0.0, collide := false) -> void:
	if mb.v.is_empty():
		return
	var arr := []
	arr.resize(Mesh.ARRAY_MAX)
	arr[Mesh.ARRAY_VERTEX] = mb.v
	arr[Mesh.ARRAY_NORMAL] = mb.n
	arr[Mesh.ARRAY_COLOR] = mb.c
	var m := ArrayMesh.new()
	m.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES,arr)
	var mi := MeshInstance3D.new()
	mi.mesh = m
	mi.material_override = vmat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	if vis_end > 0.0:
		mi.visibility_range_end = vis_end
	parent.add_child(mi)
	if collide and not mb.walls.is_empty():
		var body := StaticBody3D.new()
		var cs := CollisionShape3D.new()
		var sh := ConcavePolygonShape3D.new()
		sh.set_faces(mb.walls)
		cs.shape = sh
		body.add_child(cs)
		parent.add_child(body)

func load_data() -> Dictionary:
	var d = null
	if ResourceLoader.exists(DATA):
		var r = load(DATA)
		if r is JSON:
			d = (r as JSON).data
	if d == null:
		d = JSON.parse_string(FileAccess.get_file_as_string(DATA))
	return d if d is Dictionary else {}

# ---------- portals ----------
func make_portal(parent: Node3D, pos: Vector3, title: String, sub: String, col: Color) -> Node3D:
	var n := Node3D.new()
	n.position = pos
	parent.add_child(n)
	g._fc_part(n,g._bcone(4.2,4.4,0.25),Vector3(0,0.12,0),g._material(Color("2b2f45")))
	g._fc_part(n,g._bcone(3.6,3.6,0.06),Vector3(0,0.27,0),g._fc_glow(col))
	for sx: float in [-2.9,2.9]:
		g._fc_part(n,g._bcone(0.35,0.5,5.6),Vector3(sx,2.8,0),g._fc_pearl())
		g._fc_part(n,g._bsph(0.5),Vector3(sx,5.7,0),g._fc_glow(col))
	var pivot := Node3D.new()
	pivot.position = Vector3(0,2.9,0)
	pivot.rotation.x = PI/2.0
	n.add_child(pivot)
	var ring := MeshInstance3D.new()
	ring.mesh = g._fc_torus(2.05,2.5)
	ring.material_override = g._fc_glow(col)
	pivot.add_child(ring)
	g._fc_part(pivot,g._bcone(2.1,2.1,0.04),Vector3.ZERO,g._fc_ghost(col))
	var spinner := Node3D.new()
	pivot.add_child(spinner)
	for k in 6:
		var a := TAU*float(k)/6.0
		var arm: MeshInstance3D = g._fc_part(spinner,g._bbox(),Vector3(cos(a),0,sin(a))*1.0,g._fc_glow(col.lightened(0.4)),Vector3(1.9,0.05,0.2))
		arm.rotation.y = -a
	var tw: Tween = g.create_tween()
	tw.set_loops()
	tw.tween_property(spinner,"rotation:y",TAU,7.0).from(0.0)
	var light := OmniLight3D.new()
	light.light_color = col
	light.light_energy = 1.4
	light.omni_range = 14.0
	light.position = Vector3(0,2.9,1.5)
	n.add_child(light)
	label(n,title,Vector3(0,7.0,0),col.lightened(0.5),64)
	label(n,sub,Vector3(0,6.0,0),Color.WHITE,36)
	return n

func label(parent: Node3D, text: String, pos: Vector3, col: Color, size: int) -> Label3D:
	var l := Label3D.new()
	l.text = text
	l.font_size = size
	l.pixel_size = 0.01
	l.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	l.modulate = col
	l.outline_size = 8
	l.position = pos
	l.visibility_range_end = 90.0
	parent.add_child(l)
	return l

# ---------- the district ----------
func ensure_built() -> void:
	if built:
		return
	built = true
	var t0 := Time.get_ticks_msec()
	root = Node3D.new()
	root.name = String(W["name"])
	root.position = C
	g.add_child(root)
	vmat = StandardMaterial3D.new()
	vmat.vertex_color_use_as_albedo = true
	vmat.albedo_color = Color(0.86,0.86,0.86)
	g._real_setup(vmat,"concrete",Color(0.95,0.95,0.95),0.22)
	vmat.roughness = 0.92
	vmat.metallic_specular = 0.2
	var d: Dictionary = load_data()
	if d.is_empty():
		g._show_toast("%s map data is missing." % W["name"])
		return
	build_ground()
	if bool(W.get("river",false)):
		build_river(d)
	if bool(W.get("water",false)):
		build_water(d)
	build_parks(d)
	build_roads(d)
	build_buildings(d)
	build_trees(d)
	build_lamps(d)
	build_landmark()
	build_cafe()
	make_portal(root,Vector3(RET.x,0,RET.y),"BACK TO CHIT CHAT CITY","Portal home",Color("ffcf6b"))
	build_mystery()
	ob.build_post()
	print("%s built in %d ms" % [W["name"],Time.get_ticks_msec()-t0])

func build_ground() -> void:
	var cx := AREA.position.x+AREA.size.x*0.5
	var cz := AREA.position.y+AREA.size.y*0.5
	g._hm(root,Vector3(cx,-0.3,cz),Vector3(AREA.size.x+60.0,0.6,AREA.size.y+60.0),W["ground"],true)
	# Invisible walls round the edge of the map.
	g._collider(root,Vector3(cx,5,AREA.position.y-14.0),Vector3(AREA.size.x+80.0,12,4))
	g._collider(root,Vector3(cx,5,AREA.end.y+14.0),Vector3(AREA.size.x+80.0,12,4))
	g._collider(root,Vector3(AREA.position.x-14.0,5,cz),Vector3(4,12,AREA.size.y+80.0))
	g._collider(root,Vector3(AREA.end.x+14.0,5,cz),Vector3(4,12,AREA.size.y+80.0))

func build_river(d: Dictionary) -> void:
	# The Seine runs along the left-bank quay (Quai Jacques Chirac): a water ribbon with a stone parapet.
	var pts: Array = []
	for r: Dictionary in d["roads"]:
		if String(r["n"]) == "Quai Jacques Chirac":
			for q in r["p"]:
				if in_area(float(q[0]),float(q[1]),10.0):
					pts.append(Vector2(float(q[0]),float(q[1])))
	pts.sort_custom(func(a: Vector2, b: Vector2) -> bool: return a.x-a.y < b.x-b.y)
	# Average the two carriageways into one clean centre line (30 m steps along the quay).
	var bins := {}
	for q: Vector2 in pts:
		var bk := floori((q.x-q.y)/42.0)
		if not bins.has(bk):
			bins[bk] = [Vector2.ZERO,0]
		bins[bk][0] += q
		bins[bk][1] += 1
	var keys: Array = bins.keys()
	keys.sort()
	pts = []
	for bk in keys:
		pts.append((bins[bk][0] as Vector2)/float(bins[bk][1]))
	var mb := MB.new()
	var wcol := Color("4f7d92")
	for i in range(pts.size()-1):
		var p: Vector2 = pts[i]
		var q: Vector2 = pts[i+1]
		var dv := q-p
		var ln := dv.length()
		if ln < 3.0:
			continue
		var nrm := Vector2(dv.y,-dv.x).normalized()
		if nrm.dot(Vector2(-1,-1)) < 0.0:
			nrm = -nrm
		var a := p+nrm*9.0
		var b := q+nrm*9.0
		var e := p+nrm*130.0
		var f := q+nrm*130.0
		mb.quad(Vector3(a.x,0.12,a.y),Vector3(b.x,0.12,b.y),Vector3(f.x,0.12,f.y),Vector3(e.x,0.12,e.y),Vector3.UP,wcol)
		var mid := (a+b)*0.5
		g._hm(root,Vector3(mid.x,0.55,mid.y),Vector3(ln+1.2,1.1,0.9),Color("b9b3a5"),true,-atan2(dv.y,dv.x))
	finish(mb,root)

func build_water(d: Dictionary) -> void:
	# Rivers and ponds from the map, cut to the map edge so a huge riverbank outline cannot spill over.
	var rect := PackedVector2Array([AREA.position,Vector2(AREA.end.x,AREA.position.y),AREA.end,Vector2(AREA.position.x,AREA.end.y)])
	var mb := MB.new()
	var k := 0
	for wt: Dictionary in d["water"]:
		var poly := to_poly(wt["p"])
		if poly.size() < 3:
			continue
		for piece: PackedVector2Array in Geometry2D.intersect_polygons(poly,rect):
			if piece.size() < 3:
				continue
			var idx := Geometry2D.triangulate_polygon(piece)
			var y := 0.11+float(k)*0.0003
			k += 1
			for t in range(0,idx.size(),3):
				var a: Vector2 = piece[idx[t]]
				var b: Vector2 = piece[idx[t+1]]
				var e: Vector2 = piece[idx[t+2]]
				mb.tri(Vector3(a.x,y,a.y),Vector3(b.x,y,b.y),Vector3(e.x,y,e.y),Vector3.UP,Color("4f8fa6"))
	finish(mb,root)

func build_parks(d: Dictionary) -> void:
	var parks: Array = d["parks"]
	parks.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return absf(poly_area(to_poly(a["p"]))) > absf(poly_area(to_poly(b["p"]))))
	var mb := MB.new()
	var k := 0
	for pk: Dictionary in parks:
		var poly := to_poly(pk["p"])
		if poly.size() < 3:
			continue
		var cen := Vector2.ZERO
		for q in poly:
			cen += q
		cen /= float(poly.size())
		if not in_area(cen.x,cen.y):
			continue
		var idx := Geometry2D.triangulate_polygon(poly)
		var col := Color("7c9a5e").darkened(float((k*5)%7)*0.012)
		var y := 0.03+float(k)*0.0004
		k += 1
		for t in range(0,idx.size(),3):
			var a: Vector2 = poly[idx[t]]
			var b: Vector2 = poly[idx[t+1]]
			var e: Vector2 = poly[idx[t+2]]
			mb.tri(Vector3(a.x,y,a.y),Vector3(b.x,y,b.y),Vector3(e.x,y,e.y),Vector3.UP,col)
	finish(mb,root)
	d["parks_sorted"] = parks

func build_roads(d: Dictionary) -> void:
	var side: Array = []
	var asp: Array = []
	var pav: Array = []
	for r: Dictionary in d["roads"]:
		var h := String(r["h"])
		if not ROAD_W.has(h):
			continue
		var wd: float = ROAD_W[h]
		var veh := h in VEHICLE
		var p := PackedVector2Array()
		for q in r["p"]:
			p.append(Vector2(float(q[0]),float(q[1])))
		for i in range(p.size()-1):
			var a := p[i]
			var b := p[i+1]
			if (b-a).length() < 0.2 or not (in_area(a.x,a.y,6.0) or in_area(b.x,b.y,6.0)):
				continue
			if veh:
				side.append(seg_xf(a,b,wd+5.0,0.05,0.04,1.2))
				asp.append(seg_xf(a,b,wd,0.09,0.04,1.2))
			else:
				pav.append(seg_xf(a,b,wd,0.07,0.04,0.4))
			var steps := maxi(1,int((b-a).length()/3.0))
			for s in steps+1:
				var pt := a.lerp(b,float(s)/float(steps))
				var cx := floori(pt.x/6.0)
				var cz := floori(pt.y/6.0)
				var rad := 1 if veh else 0
				for ox in range(-rad,rad+1):
					for oz in range(-rad,rad+1):
						rcells[Vector2i(cx+ox,cz+oz)] = true
	mm_boxes(side,Color("a39d8e"))
	mm_boxes(asp,Color("47474c"))
	mm_boxes(pav,Color("a69d85"))

func facade_details(dt: MB, a: Vector2, dv: Vector2, ln: float, nm: Vector3, h: float, sd: int) -> void:
	var u := Vector3(dv.x,0,dv.y)/ln
	var o := nm*0.05
	var base := Vector3(a.x,0,a.y)+o
	var shop := minf(4.2,h)
	var up := Vector3.UP
	dt.quad(base,base+u*ln,base+u*ln+up*shop,base+up*shop,nm,Color("4a423a"))
	var cnt := maxi(1,int(ln/3.4))
	var step := ln/float(cnt)
	for j in cnt:
		var c0 := (float(j)+0.5)*step
		var p0 := base+u*(c0-1.1)+o
		var p1 := base+u*(c0+1.1)+o
		dt.quad(p0+up*0.5,p1+up*0.5,p1+up*2.9,p0+up*2.9,nm,Color("86a9bb").darkened(float((sd+j)%4)*0.07))
	var fl := int((h-shop)/3.1)
	cnt = maxi(1,int(ln/2.8))
	step = ln/float(cnt)
	for k in fl:
		var y0 := shop+float(k)*3.1
		if k == 0 or k == 3:
			dt.quad(base+up*(y0+0.2)+o,base+u*ln+up*(y0+0.2)+o,base+u*ln+up*(y0+0.7)+o,base+up*(y0+0.7)+o,nm,Color("3a3d40"))
		for j in cnt:
			var c0 := (float(j)+0.5)*step
			var p0 := base+u*(c0-0.5)+o*2.0
			var p1 := base+u*(c0+0.5)+o*2.0
			dt.quad(p0+up*(y0+0.6),p1+up*(y0+0.6),p1+up*(y0+2.6),p0+up*(y0+2.6),nm,Color("2e3a45").lightened(float((sd+j+k)%5)*0.03))

func dormers(dt: MB, a: Vector2, dv: Vector2, ln: float, nm: Vector3, y0: float) -> void:
	var u := Vector3(dv.x,0,dv.y)/ln
	var base := Vector3(a.x,y0,a.y)+nm*0.05
	var cnt := maxi(1,int(ln/3.0))
	var step := ln/float(cnt)
	for j in cnt:
		var c0 := (float(j)+0.5)*step
		var p0 := base+u*(c0-0.45)
		var p1 := base+u*(c0+0.45)
		dt.quad(p0+Vector3(0,0.8,0),p1+Vector3(0,0.8,0),p1+Vector3(0,2.1,0),p0+Vector3(0,2.1,0),nm,Color("20262d"))

func prism(wb: MB, dt: MB, poly: PackedVector2Array, sgn: float, y0: float, y1: float, col: Color, kind: int, sd: int) -> void:
	var n := poly.size()
	for i in n:
		var a: Vector2 = poly[i]
		var b: Vector2 = poly[(i+1)%n]
		var dv := b-a
		var ln := dv.length()
		if ln < 0.3:
			continue
		var o2 := Vector2(dv.y,-dv.x).normalized()*sgn
		var nm := Vector3(o2.x,0,o2.y)
		wb.quad(Vector3(a.x,y0,a.y),Vector3(b.x,y0,b.y),Vector3(b.x,y1,b.y),Vector3(a.x,y1,a.y),nm,col,kind == 0)
		if kind == 0 and ln >= 4.0:
			facade_details(dt,a,dv,ln,nm,y1,sd+i)
		elif kind == 1 and ln >= 3.0:
			dormers(dt,a,dv,ln,nm,y0)

func cap(mb: MB, poly: PackedVector2Array, y: float, col: Color) -> void:
	var idx := Geometry2D.triangulate_polygon(poly)
	for t in range(0,idx.size(),3):
		var a: Vector2 = poly[idx[t]]
		var b: Vector2 = poly[idx[t+1]]
		var e: Vector2 = poly[idx[t+2]]
		mb.tri(Vector3(a.x,y,a.y),Vector3(b.x,y,b.y),Vector3(e.x,y,e.y),Vector3.UP,col)

func build_buildings(d: Dictionary) -> void:
	var chunks := {}
	var idx := 0
	for b: Dictionary in d["buildings"]:
		idx += 1
		var poly := to_poly(b["p"])
		if poly.size() < 3:
			continue
		var cen := Vector2.ZERO
		for q in poly:
			cen += q
		cen /= float(poly.size())
		if not in_area(cen.x,cen.y,5.0) or cen.length() < float(W["clear"]):
			continue
		var ar := poly_area(poly)
		if absf(ar) < 12.0:
			continue
		var sgn := 1.0 if ar > 0.0 else -1.0
		var hs := String(b["h"]).replace("m","").strip_edges()
		var lvs := String(b["lv"]).strip_edges()
		var hgt := 0.0
		if hs.is_valid_float() and hs.to_float() > 2.0:
			hgt = clampf(hs.to_float(),8.0,float(W["hmax"]))
		else:
			var lv := lvs.to_int() if lvs.is_valid_int() and lvs.to_int() > 0 else int(W["lv"])+(1 if idx % 3 == 0 else 0)
			hgt = clampf(float(lv)*3.3+1.0,8.0,float(W["hmax"]))
		var key := Vector2i(floori(cen.x/120.0),floori(cen.y/120.0))
		if not chunks.has(key):
			chunks[key] = [MB.new(),MB.new()]
		var wb: MB = chunks[key][0]
		var dt: MB = chunks[key][1]
		var ck := Vector2i(floori(cen.x/60.0),floori(cen.y/60.0))
		if not bcells.has(ck):
			bcells[ck] = []
		bcells[ck].append(poly)
		var fac: Color = (facades[idx % facades.size()] as Color).darkened(float(idx % 5)*0.025)
		var roof := (W["roof"] as Color).darkened(float(idx % 4)*0.04)
		var wall_h := hgt
		var mans := bool(W["mansard"]) and hgt > 14.0
		if mans:
			wall_h = hgt-3.2
		prism(wb,dt,poly,sgn,0.0,wall_h,fac,0,idx)
		var done := false
		if mans:
			var ins: Array = Geometry2D.offset_polygon(poly,-1.1,Geometry2D.JOIN_MITER)
			if ins.size() == 1 and (ins[0] as PackedVector2Array).size() >= 3:
				var ip: PackedVector2Array = ins[0]
				var isg := 1.0 if poly_area(ip) > 0.0 else -1.0
				cap(wb,poly,wall_h,Color("bdb29a"))
				prism(wb,dt,ip,isg,wall_h,hgt,roof,1,idx)
				cap(wb,ip,hgt,roof.darkened(0.15))
				done = true
		if not done:
			cap(wb,poly,wall_h,roof.darkened(0.1))
	for key in chunks:
		finish(chunks[key][0],root,0.0,true)
		finish(chunks[key][1],root,170.0)

func in_building(p: Vector2, margin := 0.0) -> bool:
	var ck := Vector2i(floori(p.x/60.0),floori(p.y/60.0))
	for ox in range(-1,2):
		for oz in range(-1,2):
			var k := Vector2i(ck.x+ox,ck.y+oz)
			if not bcells.has(k):
				continue
			for poly: PackedVector2Array in bcells[k]:
				if Geometry2D.is_point_in_polygon(p,poly):
					return true
				if margin > 0.0:
					for i in poly.size():
						var q: Vector2 = Geometry2D.get_closest_point_to_segment(p,poly[i],poly[(i+1)%poly.size()])
						if q.distance_to(p) < margin:
							return true
	return false

func build_trees(d: Dictionary) -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = 7501
	var spots: Array = []
	for pk: Dictionary in d["parks_sorted"]:
		var poly := to_poly(pk["p"])
		if poly.size() < 3:
			continue
		var lo := Vector2(1e9,1e9)
		var hi := Vector2(-1e9,-1e9)
		for q in poly:
			lo = lo.min(q)
			hi = hi.max(q)
		var x := lo.x
		while x < hi.x and spots.size() < MAX_TREES:
			var z := lo.y
			while z < hi.y and spots.size() < MAX_TREES:
				var p := Vector2(x+rng.randf_range(-4,4),z+rng.randf_range(-4,4))
				if in_area(p.x,p.y,-4.0) and p.length() > float(W["clear"])+5.0 and Geometry2D.is_point_in_polygon(p,poly) and not rcells.has(Vector2i(floori(p.x/6.0),floori(p.y/6.0))) and not in_building(p,3.0):
					spots.append(p)
				z += 15.0
			x += 15.0
	for r: Dictionary in d["roads"]:
		var h := String(r["h"])
		if not (h in ["primary","secondary","tertiary","residential"]):
			continue
		var wd: float = ROAD_W[h]
		var acc := 0.0
		var flip := 1.0
		var pr: Array = r["p"]
		for i in range(pr.size()-1):
			var a := Vector2(float(pr[i][0]),float(pr[i][1]))
			var b := Vector2(float(pr[i+1][0]),float(pr[i+1][1]))
			var ln := a.distance_to(b)
			if ln < 0.2:
				continue
			var nrm := Vector2((b-a).y,-(b-a).x).normalized()
			var t := 0.0
			while t < ln and spots.size() < MAX_TREES:
				if acc >= 17.0:
					acc = 0.0
					flip = -flip
					var p := a.lerp(b,t/ln)+nrm*flip*(wd*0.5+2.9)
					if in_area(p.x,p.y,-6.0) and not in_building(p,1.5):
						spots.append(p)
				t += 4.0
				acc += 4.0
	var trunks: Array = []
	var crowns: Array = []
	var cols: Array = []
	for p: Vector2 in spots:
		var sc := rng.randf_range(0.85,1.3)
		trunks.append(Transform3D(Basis.from_scale(Vector3(1,3.4*sc,1)),Vector3(p.x,1.7*sc,p.y)))
		crowns.append(Transform3D(Basis.from_scale(Vector3(3.1*sc,2.7*sc,3.1*sc)),Vector3(p.x,5.4*sc,p.y)))
		cols.append(Color("5f8c4a").lerp(Color("86a84f"),rng.randf()).darkened(rng.randf_range(0.0,0.2)))
	tree_n = spots.size()
	var tm := CylinderMesh.new()
	tm.top_radius = 0.16
	tm.bottom_radius = 0.26
	tm.height = 1.0
	tm.radial_segments = 6
	mm_boxes(trunks,Color("5a4636"),tm)
	var sm := SphereMesh.new()
	sm.radius = 1.0
	sm.height = 2.0
	sm.radial_segments = 10
	sm.rings = 5
	if not crowns.is_empty():
		var mm := MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.use_colors = true
		mm.mesh = sm
		mm.instance_count = crowns.size()
		for i in crowns.size():
			mm.set_instance_transform(i,crowns[i])
			mm.set_instance_color(i,cols[i])
		var mi := MultiMeshInstance3D.new()
		mi.multimesh = mm
		var mat := StandardMaterial3D.new()
		mat.vertex_color_use_as_albedo = true
		mat.roughness = 0.95
		mi.material_override = mat
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(mi)

func build_lamps(d: Dictionary) -> void:
	var poles: Array = []
	var heads: Array = []
	var acc := 0.0
	var flip := 1.0
	for r: Dictionary in d["roads"]:
		var h := String(r["h"])
		if not (h in ["primary","secondary","tertiary","residential"]):
			continue
		var wd: float = ROAD_W[h]
		var pr: Array = r["p"]
		for i in range(pr.size()-1):
			var a := Vector2(float(pr[i][0]),float(pr[i][1]))
			var b := Vector2(float(pr[i+1][0]),float(pr[i+1][1]))
			var ln := a.distance_to(b)
			if ln < 0.2:
				continue
			var nrm := Vector2((b-a).y,-(b-a).x).normalized()
			var t := 0.0
			while t < ln and poles.size() < MAX_LAMPS:
				if acc >= 30.0:
					acc = 0.0
					flip = -flip
					var p := a.lerp(b,t/ln)+nrm*flip*(wd*0.5+1.4)
					if in_area(p.x,p.y,-6.0) and not in_building(p,1.0):
						poles.append(Transform3D(Basis.from_scale(Vector3(0.14,4.6,0.14)),Vector3(p.x,2.3,p.y)))
						heads.append(Transform3D(Basis.from_scale(Vector3(0.5,0.5,0.5)),Vector3(p.x,4.8,p.y)))
				t += 5.0
				acc += 5.0
	mm_boxes(poles,Color("2f4a3a"))
	var sm := SphereMesh.new()
	sm.radius = 1.0
	sm.height = 2.0
	sm.radial_segments = 8
	sm.rings = 4
	if not heads.is_empty():
		var mm := MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = sm
		mm.instance_count = heads.size()
		for i in heads.size():
			mm.set_instance_transform(i,heads[i])
		var mi := MultiMeshInstance3D.new()
		mi.multimesh = mm
		mi.material_override = g._fc_glow(Color("ffe3a6"))
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(mi)

func build_landmark() -> void:
	match String(W["landmark"]):
		"eiffel":
			build_tower()
		"crossing":
			build_crossing()
		"times":
			build_times()
		"prang":
			build_prang()
	if W.has("statue"):
		build_statue(W["statue"])

func lm_radius() -> float:
	return hw(0.0)*S+6.0 if String(W["landmark"]) == "eiffel" else float(W["lm_r"])

func hw(h: float) -> float:
	return 60.5*exp(-h/92.0)+2.0*(1.0-h/345.0)

func build_tower() -> void:
	# Eiffel Tower, 60 % scale: four lattice legs, X-bracing, three platforms and a beacon. Walk under it.
	var hs := [0.0,12.0,24.0,36.0,48.0,57.0,72.0,90.0,115.0,140.0,165.0,190.0,225.0,250.0,276.0,300.0,330.0]
	var xf: Array = []
	for i in range(hs.size()-1):
		var h0: float = hs[i]
		var h1: float = hs[i+1]
		var w0 := hw(h0)
		var w1 := hw(h1)
		for sx: float in [-1.0,1.0]:
			for sz: float in [-1.0,1.0]:
				xf.append(beam_xf(Vector3(sx*w0,h0,sz*w0)*S,Vector3(sx*w1,h1,sz*w1)*S,2.1*S))
				var i0 := maxf(w0-3.2*(1.0-h0/330.0),0.3)
				var i1 := maxf(w1-3.2*(1.0-h1/330.0),0.3)
				xf.append(beam_xf(Vector3(sx*i0,h0,sz*i0)*S,Vector3(sx*i1,h1,sz*i1)*S,1.5*S))
		for face in 4:
			var pa0: Vector3
			var pb0: Vector3
			var pa1: Vector3
			var pb1: Vector3
			if face < 2:
				var fz := -1.0 if face == 0 else 1.0
				pa0 = Vector3(-w0,h0,fz*w0)
				pb0 = Vector3(w0,h0,fz*w0)
				pa1 = Vector3(-w1,h1,fz*w1)
				pb1 = Vector3(w1,h1,fz*w1)
			else:
				var fx := -1.0 if face == 2 else 1.0
				pa0 = Vector3(fx*w0,h0,-w0)
				pb0 = Vector3(fx*w0,h0,w0)
				pa1 = Vector3(fx*w1,h1,-w1)
				pb1 = Vector3(fx*w1,h1,w1)
			xf.append(beam_xf(pa0*S,pb1*S,1.0*S))
			xf.append(beam_xf(pb0*S,pa1*S,1.0*S))
			xf.append(beam_xf(pa1*S,pb1*S,1.2*S))
	mm_boxes(xf,Color("4b3f35"))
	for pl: Array in [[57.0,2.6],[115.0,2.0],[276.0,1.6]]:
		var h: float = pl[0]
		var w := hw(h)*S*2.0+7.0*S
		g._hm(root,Vector3(0,h*S,0),Vector3(w,float(pl[1]),w),Color("7d6e5a"))
	g._fc_part(root,g._bbox(),Vector3(0,(330.0+6.0)*S,0),g._fc_glow(Color("ffdf8a")),Vector3(2.4,4.0,2.4))
	var tl := OmniLight3D.new()
	tl.light_color = Color("ffd78a")
	tl.light_energy = 1.2
	tl.omni_range = 60.0
	tl.position = Vector3(0,40,0)
	root.add_child(tl)
	# Foot piers are solid; the space between the legs stays open.
	var f := hw(0.0)*S
	for sx: float in [-1.0,1.0]:
		for sz: float in [-1.0,1.0]:
			g._hm(root,Vector3(sx*f,4.0,sz*f),Vector3(7.0,8.0,7.0),Color("6d5b49"),true)
	label(root,"EIFFEL TOWER",Vector3(0,16,hw(0.0)*S+4.0),Color("ffe9b0"),60)

func build_cafe() -> void:
	var c := Vector3(CAFE.x,0,CAFE.y)
	var awn: Array = W["awning"]
	g._hm(root,c+Vector3(0,1.7,-1.5),Vector3(7.0,3.4,4.0),Color("efe8d8"),true)
	g._hm(root,c+Vector3(0,3.55,-1.0),Vector3(7.8,0.3,5.6),W["cafe_roof"])
	for k in 7:
		var col: Color = awn[0] if k % 2 == 0 else awn[1]
		var st: MeshInstance3D = g._hm(root,c+Vector3(-3.0+float(k),2.9,1.6),Vector3(1.0,0.1,2.4),col)
		st.rotation.x = 0.22
	g._hm(root,c+Vector3(0,0.55,0.6),Vector3(6.4,1.1,0.8),Color("5a3d2b"),true)
	for k in 5:
		var tp := c+Vector3(-6.0+float(k)*3.0,0,5.6+(k % 2)*1.6)
		g._fc_part(root,g._bcone(0.5,0.5,0.06),tp+Vector3(0,0.78,0),g._material(Color("2f2f33")))
		g._fc_part(root,g._bcone(0.06,0.06,0.78),tp+Vector3(0,0.39,0),g._material(Color("2f2f33")))
		for s: float in [-1.0,1.0]:
			g._hm(root,tp+Vector3(s*0.8,0.45,0),Vector3(0.45,0.9,0.45),Color("4a3a2c"))
	label(root,String(W["cafe_name"]),c+Vector3(0,5.6,0.6),Color("ffe9b0"),56)

func clue_world(i: int) -> Vector3:
	var c: Vector2 = W["clues"][i]
	return C+Vector3(c.x,0,c.y)

func build_mystery() -> void:
	# v0.61: three glowing clues and a case board next to the return portal.
	var b := Vector3(5,0,0)+Vector3(RET.x,0,RET.y)
	g._hm(root,b+Vector3(0,0.5,0),Vector3(2.4,1.0,1.0),Color("4a3a2c"),true)
	g._hm(root,b+Vector3(0,1.55,0),Vector3(2.6,1.1,0.12),Color("2d3a4a"))
	label(root,"CASE BOARD",b+Vector3(0,3.0,0),Color("ffd98a"),48)
	clue_nodes.clear()
	for i in 3:
		var n := Node3D.new()
		n.position = Vector3(W["clues"][i].x,1.5,W["clues"][i].y)
		root.add_child(n)
		g._fc_part(n,g._bsph(0.45),Vector3.ZERO,g._fc_glow(Color("ffd24f")))
		g._fc_part(n,g._bcone(0.04,0.04,2.6),Vector3(0,-0.75,0),g._fc_glow(Color("ffe8a0")))
		var tw: Tween = g.create_tween()
		tw.set_loops()
		tw.tween_property(n,"position:y",2.0,1.2).from(1.5)
		tw.tween_property(n,"position:y",1.5,1.2)
		label(n,"CLUE",Vector3(0,1.1,0),Color("fff0b0"),40)
		clue_nodes.append(n)
	update_clues()

func update_clues() -> void:
	for i in clue_nodes.size():
		(clue_nodes[i] as Node3D).visible = (clue_mask & (1 << i)) == 0

func clue_text(i: int) -> String:
	return String(W["riddles"][i])

func found_clue(i: int) -> void:
	clue_mask |= 1 << i
	update_clues()
	var n := 0
	for k in 3:
		if clue_mask & (1 << k):
			n += 1
	if not dry:
		g._play_coin()
		g._show_toast("CLUE %d/3: %s" % [n,clue_text(i)])
		if n == 3:
			g._feed_add("%s: all clues found. Go to the CASE BOARD by the portal." % W["name"],"")
		g._save_progress()
	test_log.append("clue%d" % i)

func clue_count() -> int:
	var n := 0
	for k in 3:
		if clue_mask & (1 << k):
			n += 1
	return n

func submit_case(code: String) -> bool:
	if code != String(W["code"]):
		if not dry:
			g._show_toast("The lock stays shut. Re-read the riddles.")
		return false
	var today := Time.get_date_string_from_system()
	var first := not relic
	relic = true
	if case_day != today:
		case_day = today
		pay(2000,200,"CASE SOLVED")
	if first:
		g.cash += 10000
		if not dry:
			g._show_toast("RELIC FOUND: %s! The sky world needs 4 relics." % W["relic"])
			g._feed_add("%s relic found: %s" % [W["name"],W["relic"]],"")
	elif not dry:
		g._show_toast("Case solved again. Come back tomorrow for a new case.")
	if not dry:
		g._save_progress()
	return true

func facing(pos: Vector3) -> float:
	# Y rotation that turns a thin panel's front towards the map origin.
	return atan2(-pos.x,-pos.z)

func panel(pos: Vector3, size: Vector2, col: Color, txt: String) -> void:
	var pl: MeshInstance3D = g._fc_part(root,g._bbox(),pos,g._fc_glow(col),Vector3(size.x,size.y,0.6))
	pl.rotation.y = facing(pos)
	g._hm(root,Vector3(pos.x,pos.y*0.5-size.y*0.25,pos.z),Vector3(0.7,pos.y-size.y*0.5,0.7),Color("3a3d44"))
	if txt != "":
		var lb := label(root,txt,pos+Vector3(pos.x,0,pos.z).normalized()*-0.45,Color("1b1b24"),96)
		lb.outline_size = 0
		lb.billboard = BaseMaterial3D.BILLBOARD_DISABLED
		lb.rotation.y = facing(pos)
		lb.pixel_size = 0.03*size.x/12.0
		lb.visibility_range_end = 220.0

func build_crossing() -> void:
	# Shibuya scramble: white bars on four sides and two diagonals, three giant screens round the corners.
	var bars: Array = []
	for arm in 4:
		var ang := float(arm)*PI/2.0
		var dir := Vector3(cos(ang),0,sin(ang))
		var side := Vector3(-dir.z,0,dir.x)
		for k in 9:
			var pos := dir*14.5+side*((float(k)-4.0)*1.7)
			bars.append(Transform3D(Basis(side*0.9,Vector3.UP*0.05,dir*5.0),Vector3(pos.x,0.14,pos.z)))
	for dg in 2:
		var ang := PI/4.0+float(dg)*PI/2.0
		var e := Vector3(cos(ang),0,sin(ang))
		var perp := Vector3(-e.z,0,e.x)
		for k in 14:
			var pos := e*((float(k)-6.5)*1.9)
			bars.append(Transform3D(Basis(e*0.9,Vector3.UP*0.05,perp*5.0),Vector3(pos.x,0.15,pos.z)))
	mm_boxes(bars,Color("f4f4ee"))
	panel(Vector3(30,22,-14),Vector2(18,10),Color("ff4fa3"),"SHIBUYA")
	panel(Vector3(-28,19,18),Vector2(16,9),Color("4fd4ff"),"109")
	panel(Vector3(-6,25,-32),Vector2(20,11),Color("ffd24f"),"TOKYO")
	var tl := OmniLight3D.new()
	tl.light_color = Color("ff9ad0")
	tl.light_energy = 1.4
	tl.omni_range = 55.0
	tl.position = Vector3(0,10,0)
	root.add_child(tl)
	label(root,"SHIBUYA CROSSING",Vector3(0,9,0),Color("ffe9f4"),60)

func build_times() -> void:
	# Times Square: a ring of glowing billboards and the red steps.
	var cols := [Color("ff3b55"),Color("3b8bff"),Color("ffd23b"),Color("3bffa0"),Color("ff3be0"),Color("3be6ff"),Color("ff8a3b")]
	for k in cols.size():
		var ang := float(k)/float(cols.size())*TAU+0.3
		var r := 24.0+float(k%3)*5.0
		panel(Vector3(cos(ang)*r,14.0+float((k*5)%4)*4.0,sin(ang)*r),Vector2(10,13) if k%2 == 0 else Vector2(15,8),cols[k],["BROADWAY","SHOWS","LIVE","NYC","TICKETS","OPEN","HOT"][k])
	for k in 5:
		g._hm(root,Vector3(0,0.45*float(k+1),-24.0-float(k)*2.6),Vector3(13,0.9*float(k+1),2.6),Color("c8312e"),true)
	var tl := OmniLight3D.new()
	tl.light_color = Color("ffb0c0")
	tl.light_energy = 1.4
	tl.omni_range = 55.0
	tl.position = Vector3(0,12,0)
	root.add_child(tl)
	label(root,"TIMES SQUARE",Vector3(0,11,0),Color("fff0c8"),64)

func build_prang() -> void:
	# Wat Arun: a stepped central prang with four small prangs and a spire.
	var cream: Material = g._material(Color("efe6d0"))
	g._hm(root,Vector3(0,1.0,0),Vector3(40,2,40),Color("d6c9ac"),true)
	for t in 5:
		var sz := 30.0-float(t)*5.5
		var y := 2.0+float(t)*7.0
		g._hm(root,Vector3(0,y+3.5,0),Vector3(sz,7.0,sz),Color("fff4dc"),t < 2)
		g._hm(root,Vector3(0,y+7.0,0),Vector3(sz+1.2,0.7,sz+1.2),Color("5db3a8") if t % 2 == 0 else Color("e58aa0"))
	g._fc_part(root,g._bcone(0.2,4.2,24.0),Vector3(0,37.0+12.0,0),cream)
	for sx: float in [-1.0,1.0]:
		for sz: float in [-1.0,1.0]:
			var px := sx*15.0
			var pz := sz*15.0
			g._hm(root,Vector3(px,2.0+7.0,pz),Vector3(5.5,14.0,5.5),Color("efe6d0"),true)
			g._fc_part(root,g._bcone(0.1,2.7,9.0),Vector3(px,2.0+14.0+4.5,pz),cream)
	var tl := OmniLight3D.new()
	tl.light_color = Color("ffe2b0")
	tl.light_energy = 1.2
	tl.omni_range = 60.0
	tl.position = Vector3(0,30,12)
	root.add_child(tl)
	label(root,"WAT ARUN",Vector3(0,16,24),Color("ffe9b0"),64)

func build_statue(sp: Vector2) -> void:
	# A small golden dog on a plinth (Hachiko-style).
	var b := Vector3(sp.x,0,sp.y)
	var gold := Color("c9a46a")
	g._hm(root,b+Vector3(0,0.5,0),Vector3(3.2,1.0,3.2),Color("8c8f96"),true)
	g._hm(root,b+Vector3(0,1.9,0),Vector3(2.4,1.2,1.1),gold)
	g._hm(root,b+Vector3(1.0,2.9,0),Vector3(0.9,0.9,0.9),gold)
	g._hm(root,b+Vector3(1.0,3.5,0.25),Vector3(0.25,0.4,0.2),gold.darkened(0.2))
	g._hm(root,b+Vector3(1.0,3.5,-0.25),Vector3(0.25,0.4,0.2),gold.darkened(0.2))
	g._hm(root,b+Vector3(-1.2,2.0,0),Vector3(0.9,0.25,0.25),gold.darkened(0.1))
	label(root,"HACHIKO",b+Vector3(0,5.2,0),Color("ffe9b0"),52)

# ---------- play ----------
func near(p: Vector3, target: Vector3, r: float) -> bool:
	return Vector2(p.x-target.x,p.z-target.z).length() < r

func in_paris(p: Vector3) -> bool:
	# (name kept from v0.59) true while p is inside this world's map
	return built and in_area(p.x-C.x,p.z-C.z,15.0)

func lm_pos() -> Vector3:
	var l: Vector2 = W.get("lm",Vector2.ZERO)
	return C+Vector3(l.x,0,l.y)

func prompt() -> String:
	if g.player == null or g.paused:
		return ""
	var p: Vector3 = g.player.position
	var op: String = ob.prompt(p)
	if op != "":
		return op
	var cp: String = cu.prompt(p)
	if cp != "":
		return cp
	if built and near(p,ret_pos,4.8):
		return "PORTAL HOME"
	if built and near(p,board_pos,3.8):
		return "SOLVE THE CASE"
	if built and near(p,cafe_pos+Vector3(0,0,3.0),5.0):
		return String(W["order"])
	return ""

func busy() -> bool:
	return g.driving or g.bus_riding or g.race_car or g.sky_riding or g.seat_id >= 0

func interact() -> bool:
	var p := prompt()
	if p == "":
		return false
	if busy():
		g._show_toast("Get out of your vehicle or seat first.")
		return true
	if ob.owns(p):
		ob.interact(p)
	elif cu.owns(p):
		cu.interact(p)
	elif p == "PORTAL HOME":
		go_home()
	elif p == "SOLVE THE CASE":
		roll_day()
		if clue_count() < 3:
			g._show_toast("Find all 3 glowing clues first (%d/3). Look around the map." % clue_count())
		else:
			g._open_case(self)
	else:
		order()
	return true

func move_player(to: Vector3) -> void:
	g._car_away()
	g.player.position = to
	g.player.velocity = Vector3.ZERO
	g.player.show()
	g.player.get_child(0).set_deferred("disabled",false)
	g._follow_camera(1.0)

func enter() -> void:
	if entering:
		return
	entering = true
	g._show_toast("Opening the portal to %s..." % W["name"])
	ensure_built()
	await g.get_tree().physics_frame
	await g.get_tree().physics_frame
	var to_lm := Vector3(-RET.x,0,-RET.y).normalized()
	var spot := ret_pos+to_lm*6.0
	for k in 12:
		var cand := ret_pos+Vector3(to_lm.z,0,-to_lm.x)*float(k)*1.5+to_lm*(6.0+float(k))
		if not g._blocked_at(cand+Vector3(0,0.9,0),0.4):
			spot = cand
			break
	move_player(spot+Vector3(0,0.9,0))
	visits += 1
	award(0)
	if not dry:
		g._show_toast("%s Quests today: %d/%d. Portal home is behind you." % [W["hello"],done_count(),QUESTS.size()])
	g._refresh_hud()
	entering = false

func go_home() -> void:
	ob.abort("Rescue cancelled.")
	g.paris.armed = false
	move_player(hub_pos+Vector3(0,0.9,7.0))
	g._show_toast("Back in Chit Chat City.")
	g._refresh_hud()

func order() -> void:
	award(2)
	g._show_toast(String(W["order_msg"]))

func done_count() -> int:
	var n := 0
	for i in QUESTS.size():
		if mask & (1 << i):
			n += 1
	return n

func roll_day() -> void:
	var today := Time.get_date_string_from_system()
	if clue_day != today:
		clue_day = today
		clue_mask = 0
		update_clues()
	if day != today:
		day = today
		mask = 0
		all_paid = false

func pay(amount: int, xp: int, text: String) -> void:
	g.cash += amount
	if not g.legacy_rules:
		g.bonus_xp += xp
	if not dry:
		var wn := String(W["name"]).to_upper()
		g._show_toast("%s QUEST: %s  +$%d  +%d XP" % [wn,text,amount,xp])
		g._feed_add("%s quest: %s (+$%d)" % [W["name"],text,amount],"")
		if not ("--smoke-test" in OS.get_cmdline_user_args()):
			g._play_coin()
			g._quick_fx(g.player.position+Vector3(0,1,0))
	test_log.append(text)

func award(i: int) -> void:
	roll_day()
	if mask & (1 << i):
		return
	mask |= 1 << i
	var q: Dictionary = QUESTS[i]
	pay(int(q["pay"]),int(q["xp"]),String(q["n"]))
	if not all_paid and done_count() == QUESTS.size():
		all_paid = true
		pay(ALL_PAY,ALL_XP,"ALL %s QUESTS DONE" % String(W["name"]).to_upper())
	if not dry:
		g._save_progress()

func tick(delta: float) -> void:
	ob.tick(delta)
	cu.tick(delta)
	trk.tick(delta)
	tick_t += delta
	if tick_t < 0.25 or g.player == null:
		return
	tick_t = 0.0
	var p: Vector3 = g.player.position
	if in_paris(p) and not busy():
		if near(p,lm_pos(),lm_radius()):
			award(1)
		if near(p,quay_pos,16.0):
			award(3)
		roll_day()
		for i in 3:
			if (clue_mask & (1 << i)) == 0 and near(p,clue_world(i),3.2):
				found_clue(i)
	var pr := prompt()
	if pr != last_prompt:
		last_prompt = pr
		g._refresh_hud()

func save_state(file: ConfigFile) -> void:
	var sec := String(W["save"])
	file.set_value(sec,"day",day)
	file.set_value(sec,"mask",mask)
	file.set_value(sec,"all",all_paid)
	file.set_value(sec,"visits",visits)
	file.set_value(sec,"clue_day",clue_day)
	file.set_value(sec,"clues",clue_mask)
	file.set_value(sec,"relic",relic)
	file.set_value(sec,"case_day",case_day)
	ob.save_state(file,sec)
	cu.save_state(file,sec)

func load_state(file: ConfigFile) -> void:
	var sec := String(W["save"])
	day = String(file.get_value(sec,"day",""))
	mask = int(file.get_value(sec,"mask",0)) & ((1 << QUESTS.size())-1)
	all_paid = bool(file.get_value(sec,"all",false))
	visits = maxi(0,int(file.get_value(sec,"visits",0)))
	clue_day = String(file.get_value(sec,"clue_day",""))
	clue_mask = int(file.get_value(sec,"clues",0)) & 7
	relic = bool(file.get_value(sec,"relic",false))
	case_day = String(file.get_value(sec,"case_day",""))
	ob.load_state(file,sec)
	cu.load_state(file,sec)
	update_clues()

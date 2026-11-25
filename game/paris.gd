extends RefCounted
# v0.59: Paris portal. The Champ de Mars district around the Eiffel Tower, rebuilt in the game's style from real
# OpenStreetMap streets and building footprints (map/paris_osm.json, (c) OpenStreetMap contributors, ODbL).
# A glowing portal in the Harbor Dome leads there; a return portal in the Champ de Mars brings you back.
# The district is built the first time somebody walks through, so start-up stays fast. Talks to main through `g`.
const C := Vector3(900,0,700)                 # world position of the Eiffel Tower
const AREA := Rect2(-256.0,-354.0,951.0,719.0) # x, z, width, depth of the downloaded map, metres from the tower
const S := 0.6                                # Eiffel Tower scale
const PORTAL_REL := Vector3(-126,0,-40)         # hub portal, on the Ridge lawn at world (84,0,-8), relative to HUB_C (210,0,32)
const RET := Vector2(95,115)                  # return portal, in the open lawn of the Champ de Mars
const CAFE := Vector2(65,70)
const QUAY := Vector2(-68.6,-118.0)
const DATA := "res://map/paris_osm.json"
const ALL_PAY := 1500
const ALL_XP := 150
const QUESTS := [
	{"n":"Step through the portal to Paris","pay":300,"xp":30},
	{"n":"Stand under the Eiffel Tower","pay":300,"xp":30},
	{"n":"Order at Café de la Tour","pay":300,"xp":30},
	{"n":"Look at the Seine from the quay","pay":300,"xp":30},
]
const FACADES := [Color("dcd2bb"),Color("e3dac6"),Color("d3c6a9"),Color("e8e0cf"),Color("cfc2a4"),Color("d9cbb0")]
const ROAD_W := {"primary":13.0,"secondary":11.0,"tertiary":9.0,"residential":7.0,"unclassified":7.0,"living_street":6.0,"service":3.5,"pedestrian":6.0,"footway":2.4,"path":2.0,"cycleway":2.0,"track":3.0}
const VEHICLE := ["primary","secondary","tertiary","residential","unclassified","living_street","service"]
const MAX_TREES := 520
const MAX_LAMPS := 220

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
var root: Node3D
var hub_root: Node3D
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

func _init(game) -> void:
	g = game
	hub_pos = g.HUB_C+PORTAL_REL
	ret_pos = C+Vector3(RET.x,0,RET.y)
	cafe_pos = C+Vector3(CAFE.x,0,CAFE.y)
	quay_pos = C+Vector3(QUAY.x,0,QUAY.y)

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

func build_hub() -> void:
	hub_root = Node3D.new()
	hub_root.name = "ParisPortal"
	g.add_child(hub_root)
	make_portal(hub_root,hub_pos,"PARIS","Portal to a real city street · 4 daily quests",Color("8ec5ff"))
	# v0.59.1: a tall light beam so the portal can be seen from across the city
	var bm := StandardMaterial3D.new()
	bm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	bm.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	bm.albedo_color = Color(0.56,0.77,1.0,0.28)
	bm.cull_mode = BaseMaterial3D.CULL_DISABLED
	var cm := CylinderMesh.new()
	cm.top_radius = 1.2
	cm.bottom_radius = 2.6
	cm.height = 140.0
	cm.radial_segments = 12
	cm.rings = 1
	var beam := MeshInstance3D.new()
	beam.mesh = cm
	beam.material_override = bm
	beam.position = hub_pos+Vector3(0,70.0,0)
	beam.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	hub_root.add_child(beam)

func player_in_paris() -> bool:
	if g.player == null:
		return false
	var pp: Vector3 = g.player.position
	return in_paris(pp)

func go_portal() -> void:
	if g.player == null:
		return
	var dir: Vector3 = (g.HUB_C-hub_pos).normalized()
	move_player(hub_pos+dir*7.0+Vector3(0,0.9,0))
	g._show_toast("The Paris portal is right here. Walk up to it and tap ENTER PORTAL: PARIS.")
	g._refresh_hud()

# ---------- the district ----------
func ensure_built() -> void:
	if built:
		return
	built = true
	var t0 := Time.get_ticks_msec()
	root = Node3D.new()
	root.name = "Paris"
	root.position = C
	g.add_child(root)
	vmat = StandardMaterial3D.new()
	vmat.vertex_color_use_as_albedo = true
	vmat.roughness = 0.92
	vmat.metallic_specular = 0.2
	var d: Dictionary = load_data()
	if d.is_empty():
		g._show_toast("Paris map data is missing.")
		return
	build_ground()
	build_river(d)
	build_parks(d)
	build_roads(d)
	build_buildings(d)
	build_trees(d)
	build_lamps(d)
	build_tower()
	build_cafe()
	make_portal(root,Vector3(RET.x,0,RET.y),"BACK TO CHIT CHAT CITY","Portal home",Color("ffcf6b"))
	print("Paris built in %d ms" % (Time.get_ticks_msec()-t0))

func build_ground() -> void:
	var cx := AREA.position.x+AREA.size.x*0.5
	var cz := AREA.position.y+AREA.size.y*0.5
	g._hm(root,Vector3(cx,-0.3,cz),Vector3(AREA.size.x+60.0,0.6,AREA.size.y+60.0),Color("b3ad9f"),true)
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
	mm_boxes(side,Color("c8c1b0"))
	mm_boxes(asp,Color("47474c"))
	mm_boxes(pav,Color("cfc5ab"))

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
		if not in_area(cen.x,cen.y,5.0) or cen.length() < 50.0:
			continue
		var ar := poly_area(poly)
		if absf(ar) < 12.0:
			continue
		var sgn := 1.0 if ar > 0.0 else -1.0
		var hs := String(b["h"]).replace("m","").strip_edges()
		var lvs := String(b["lv"]).strip_edges()
		var hgt := 0.0
		if hs.is_valid_float() and hs.to_float() > 2.0:
			hgt = clampf(hs.to_float(),8.0,40.0)
		else:
			var lv := lvs.to_int() if lvs.is_valid_int() and lvs.to_int() > 0 else 5+(1 if idx % 3 == 0 else 0)
			hgt = clampf(float(lv)*3.3+1.0,8.0,32.0)
		var key := Vector2i(floori(cen.x/120.0),floori(cen.y/120.0))
		if not chunks.has(key):
			chunks[key] = [MB.new(),MB.new()]
		var wb: MB = chunks[key][0]
		var dt: MB = chunks[key][1]
		var ck := Vector2i(floori(cen.x/60.0),floori(cen.y/60.0))
		if not bcells.has(ck):
			bcells[ck] = []
		bcells[ck].append(poly)
		var fac: Color = FACADES[idx % FACADES.size()].darkened(float(idx % 5)*0.025)
		var roof := Color("5d6772").darkened(float(idx % 4)*0.04)
		var wall_h := hgt
		var mans := hgt > 14.0
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
				if in_area(p.x,p.y,-4.0) and p.length() > 55.0 and Geometry2D.is_point_in_polygon(p,poly) and not rcells.has(Vector2i(floori(p.x/6.0),floori(p.y/6.0))) and not in_building(p,3.0):
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
				xf.append(beam_xf(Vector3(sx*w0,h0,sz*w0)*S,Vector3(sx*w1,h1,sz*w1)*S,1.3*S))
				var i0 := maxf(w0-3.2*(1.0-h0/330.0),0.3)
				var i1 := maxf(w1-3.2*(1.0-h1/330.0),0.3)
				xf.append(beam_xf(Vector3(sx*i0,h0,sz*i0)*S,Vector3(sx*i1,h1,sz*i1)*S,0.9*S))
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
			xf.append(beam_xf(pa0*S,pb1*S,0.55*S))
			xf.append(beam_xf(pb0*S,pa1*S,0.55*S))
			xf.append(beam_xf(pa1*S,pb1*S,0.7*S))
	mm_boxes(xf,Color("6d5b49"))
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
	g._hm(root,c+Vector3(0,1.7,-1.5),Vector3(7.0,3.4,4.0),Color("efe8d8"),true)
	g._hm(root,c+Vector3(0,3.55,-1.0),Vector3(7.8,0.3,5.6),Color("2d4a3c"))
	for k in 7:
		var col := Color("b5322e") if k % 2 == 0 else Color("f1ead9")
		var st: MeshInstance3D = g._hm(root,c+Vector3(-3.0+float(k),2.9,1.6),Vector3(1.0,0.1,2.4),col)
		st.rotation.x = 0.22
	g._hm(root,c+Vector3(0,0.55,0.6),Vector3(6.4,1.1,0.8),Color("5a3d2b"),true)
	for k in 5:
		var tp := c+Vector3(-6.0+float(k)*3.0,0,5.6+(k % 2)*1.6)
		g._fc_part(root,g._bcone(0.5,0.5,0.06),tp+Vector3(0,0.78,0),g._material(Color("2f2f33")))
		g._fc_part(root,g._bcone(0.06,0.06,0.78),tp+Vector3(0,0.39,0),g._material(Color("2f2f33")))
		for s: float in [-1.0,1.0]:
			g._hm(root,tp+Vector3(s*0.8,0.45,0),Vector3(0.45,0.9,0.45),Color("4a3a2c"))
	label(root,"CAFÉ DE LA TOUR",c+Vector3(0,5.6,0.6),Color("ffe9b0"),56)

# ---------- play ----------
func near(p: Vector3, target: Vector3, r: float) -> bool:
	return Vector2(p.x-target.x,p.z-target.z).length() < r

func in_paris(p: Vector3) -> bool:
	return built and in_area(p.x-C.x,p.z-C.z,15.0)

func prompt() -> String:
	if g.player == null or g.paused:
		return ""
	var p: Vector3 = g.player.position
	if near(p,hub_pos,4.8):
		return "ENTER PORTAL: PARIS"
	if built and near(p,ret_pos,4.8):
		return "PORTAL HOME"
	if built and near(p,cafe_pos+Vector3(0,0,3.0),5.0):
		return "ORDER A CAFÉ"
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
	if p == "ENTER PORTAL: PARIS":
		enter()
	elif p == "PORTAL HOME":
		go_home()
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
	g._show_toast("Opening the portal to Paris...")
	ensure_built()
	await g.get_tree().physics_frame
	await g.get_tree().physics_frame
	var to_tower := Vector3(-RET.x,0,-RET.y).normalized()
	var spot := ret_pos+to_tower*6.0
	for k in 12:
		var cand := ret_pos+Vector3(to_tower.z,0,-to_tower.x)*float(k)*1.5+to_tower*(6.0+float(k))
		if not g._blocked_at(cand+Vector3(0,0.9,0),0.4):
			spot = cand
			break
	move_player(spot+Vector3(0,0.9,0))
	visits += 1
	award(0)
	if not dry:
		g._show_toast("Bonjour! Welcome to Paris. Quests today: %d/%d. Portal home is behind you." % [done_count(),QUESTS.size()])
	g._refresh_hud()
	entering = false

func go_home() -> void:
	var dir: Vector3 = (g.HUB_C-hub_pos).normalized()
	move_player(hub_pos+dir*6.5+Vector3(0,0.9,0))
	g._show_toast("Back in Chit Chat City.")
	g._refresh_hud()

func order() -> void:
	award(2)
	g._show_toast("Un café au lait, s'il vous plaît! Merci.")

func done_count() -> int:
	var n := 0
	for i in QUESTS.size():
		if mask & (1 << i):
			n += 1
	return n

func roll_day() -> void:
	var today := Time.get_date_string_from_system()
	if day != today:
		day = today
		mask = 0
		all_paid = false

func pay(amount: int, xp: int, text: String) -> void:
	g.cash += amount
	if not g.legacy_rules:
		g.bonus_xp += xp
	if not dry:
		g._show_toast("PARIS QUEST: %s  +$%d  +%d XP" % [text,amount,xp])
		g._feed_add("Paris quest: %s (+$%d)" % [text,amount],"")
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
		pay(ALL_PAY,ALL_XP,"ALL PARIS QUESTS DONE")
	if not dry:
		g._save_progress()

func tick(delta: float) -> void:
	tick_t += delta
	if tick_t < 0.25 or g.player == null:
		return
	tick_t = 0.0
	var p: Vector3 = g.player.position
	if in_paris(p) and not busy():
		if near(p,C,hw(0.0)*S+6.0):
			award(1)
		if near(p,quay_pos,16.0):
			award(3)
	var pr := prompt()
	if pr != last_prompt:
		last_prompt = pr
		g._refresh_hud()

func save_state(file: ConfigFile) -> void:
	file.set_value("paris","day",day)
	file.set_value("paris","mask",mask)
	file.set_value("paris","all",all_paid)
	file.set_value("paris","visits",visits)

func load_state(file: ConfigFile) -> void:
	day = String(file.get_value("paris","day",""))
	mask = int(file.get_value("paris","mask",0)) & ((1 << QUESTS.size())-1)
	all_paid = bool(file.get_value("paris","all",false))
	visits = maxi(0,int(file.get_value("paris","visits",0)))

extends Node
# v0.57.0: the Chit Chat Roastery, a premium coffee house in the Harbor Dome. A curved marble counter, a
# green tile wall, a wood-slat ceiling, brass lamps, candy-stripe columns and three baristas who really make
# your drink. Order from the menu: each drink gives a small perk (a speed burst or bonus XP) and a cup to hold.
# The drink of the hour is 30% off. Original design; not a copy of any real brand.
var g
var fest
var spot := Vector3.INF
var root: Node3D
var panel: PanelContainer
var info: Label
var list: VBoxContainer
var staff: Array = []          # [{person, phi, base}]
var steam: Array = []
var cup_pickup: Node3D
var hand_cup: Node3D
var t := 0.0
var lounge: Node3D
var lounge_at := Vector3.INF
const LOUNGE_R := 8.0
var making_t := 0.0            # >0 while the baristas are preparing an order
var making_id := ""
var hand_until := 0.0
var boost_until := 0.0
var orders := 0
var xp_hour: Dictionary = {}   # drink id -> hour number when it last gave XP

# id, name, price, perk text, kind (speed / xp), amount, cup colour
const DRINKS := [
	["cortado","Midnight Cortado",120,"Night-owl burst: run 20% faster for 90 s","speed",90,"3b2a1f"],
	["honey","Harbor Honey Latte",90,"Cozy: +10 XP (once an hour)","xp",10,"d8a85c"],
	["mango","Neon Mango Cloud",150,"Sparkle: +15 XP (once an hour)","xp",15,"f2a23a"],
	["cold","Cardamom Cold Brew",110,"Night-owl burst: run 20% faster for 90 s","speed",90,"5a3a2a"],
	["matcha","Lantern Matcha",130,"Calm: +15 XP (once an hour)","xp",15,"7fae5c"],
	["gold","Chit Chat Signature",300,"Gold cup, +40 XP (once an hour) and the whole café cheers","xp",40,"f0c75e"],
]

func _init(g_main) -> void:
	g = g_main
	fest = preload("res://festive.gd").new(g_main)

func rng_f(r: RandomNumberGenerator, a: float, b: float) -> float:
	return r.randf_range(a,b)

# local frame: +z is towards the customers (the dome centre), -z is the back wall
func lp(phi: float, rad: float, y: float) -> Vector3:
	return Vector3(sin(phi)*rad,y,cos(phi)*rad)

func prop(parent: Node3D, path: String, pos: Vector3, rot_y: float, sc: float) -> bool:
	if not ResourceLoader.exists(path):
		return false
	var ps: PackedScene = load(path)
	var n: Node3D = ps.instantiate()
	n.position = pos
	n.rotation.y = rot_y
	n.scale = Vector3.ONE*sc
	parent.add_child(n)
	return true

func glass(parent: Node3D, pos: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	var b := BoxMesh.new()
	b.size = size
	var m := StandardMaterial3D.new()
	m.albedo_color = Color(col.r,col.g,col.b,0.28)
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.roughness = 0.1
	return fest.add(parent,b,pos,m)

func tangent_box(parent: Node3D, phi: float, rad: float, y: float, size: Vector3, col: Color, glow := 0.0) -> MeshInstance3D:
	var b: MeshInstance3D = fest.box(parent,lp(phi,rad,y),size,col,glow)
	b.rotation.y = phi
	return b

func build_cafe(at: Vector3, face_to: Vector3) -> void:
	spot = at
	add_child(fest)
	var d := face_to-at
	d.y = 0.0
	d = d.normalized() if d.length() > 0.01 else Vector3.BACK
	root = Node3D.new()
	root.name = "ChitChatRoastery"
	root.position = at
	root.rotation.y = atan2(d.x,d.z)
	root.scale = Vector3.ONE*0.85
	g.add_child(root)
	var gold := Color("e0b85a")
	var brass := Color("c9a24a")
	var r := RandomNumberGenerator.new()
	r.seed = 5150
	# --- terrazzo floor with brass edge ---
	fest.cyl(root,Vector3(0,0.1,0),9.6,9.8,0.2,Color("8f887b"))
	fest.torus(root,Vector3(0,0.22,0),9.55,0.09,brass,0.5)
	var fleck_cols := [Color("e8e2d4"),Color("c4b08a"),Color("3d4a3c"),Color("222222"),Color("c98f6a")]
	for i in 44:
		var a := r.randf()*TAU
		var rr := sqrt(r.randf())*9.0
		var f: MeshInstance3D = fest.cyl(root,Vector3(cos(a)*rr,0.215,sin(a)*rr),0.16+r.randf()*0.22,0.16+r.randf()*0.22,0.02,fleck_cols[r.randi() % fleck_cols.size()])
		f.scale.z = 0.6+r.randf()*0.8
		f.rotation.y = r.randf()*TAU
	# --- green tile wall, curved around the back, with a wood band and a glowing wave ---
	var greens := [Color("5f7f4e"),Color("6c8c58"),Color("587648")]
	var slabs := 26
	for k in slabs:
		var ang := PI-PI*0.38+float(k)/float(slabs-1)*(PI*0.76)
		var ridge := 0.0 if k % 3 != 0 else 0.1
		tangent_box(root,ang,7.9-ridge,2.15,Vector3(0.64,4.3,0.26),greens[k % 3])
		if k % 3 == 0:
			tangent_box(root,ang,7.72,2.15,Vector3(0.18,4.3,0.12),Color("86a672"))
	for k in 20:
		var ang2 := PI-PI*0.38+float(k)/19.0*(PI*0.76)
		tangent_box(root,ang2,7.9,4.75,Vector3(1.0,1.2,0.34),Color("b07a44"))
		var wy := 3.0+sin(float(k)*0.55)*0.35
		tangent_box(root,ang2,7.7,wy,Vector3(0.95,0.07,0.07),Color("ffd98a"),1.6)
	# wall menu boards on brass rails
	var board_names := [["COFFEE",-0.55],["SPECIAL",0.0],["COLD & TEA",0.55]]
	for bn in board_names:
		var ang3: float = PI+float(bn[1])
		tangent_box(root,ang3,7.55,3.5,Vector3(2.0,1.15,0.1),Color("17252b"))
		var bl := Label3D.new()
		bl.text = String(bn[0])
		bl.font_size = 64
		bl.pixel_size = 0.0065
		bl.modulate = Color("ffe9b8")
		bl.outline_size = 8
		bl.position = lp(ang3,7.4,3.55)
		bl.rotation.y = ang3+PI
		root.add_child(bl)
		for sx: float in [-0.85,0.85]:
			var pp := lp(ang3,7.5,3.5)+Vector3(cos(ang3)*float(sx),0,-sin(ang3)*float(sx))
			fest.cyl(root,Vector3(pp.x,4.3,pp.z),0.025,0.025,2.0,brass)
	# --- curved marble counter ---
	var cn := 19
	for k in cn:
		var phi2 := -1.12+float(k)/float(cn-1)*2.24
		tangent_box(root,phi2,4.6,0.55,Vector3(0.98,1.1,1.1),Color("1b1a19"))
		tangent_box(root,phi2,4.62,1.16,Vector3(1.0,0.14,1.34),Color("cbbfae") if k % 2 == 0 else Color("b09a7c"))
		tangent_box(root,phi2,5.3,1.0,Vector3(1.0,0.05,0.06),brass,0.4)
		tangent_box(root,phi2,5.28,0.12,Vector3(0.98,0.05,0.05),Color("ffcf7a"),1.8)
	# back counter with espresso machines and grinders
	for k in 9:
		var phi3 := -0.78+float(k)/8.0*1.56
		tangent_box(root,phi3,2.2,0.55,Vector3(0.9,1.1,0.8),Color("2a2623"))
		tangent_box(root,phi3,2.2,1.14,Vector3(0.94,0.1,0.9),Color("cdbba3"))
	for k in 3:
		var phi4 := -0.52+float(k)*0.52
		if not prop(root,"res://models/cafe_espresso.glb",lp(phi4,2.2,1.19),phi4,0.72):
			tangent_box(root,phi4,2.2,1.55,Vector3(0.7,0.7,0.6),Color("1d1d1f"))
			tangent_box(root,phi4,2.2,1.95,Vector3(0.78,0.08,0.68),brass,0.5)
		if k < 2:
			prop(root,"res://models/cafe_grinder.glb",lp(phi4+0.26,2.2,1.19),phi4+0.26,0.9)
		var sp: Vector3 = lp(phi4,2.2,2.1)
		for si in 2:
			var puff: MeshInstance3D = fest.ball(root,sp,Vector3(0.22,0.22,0.22),Color("ffffff"),0.4)
			puff.visible = false
			steam.append({"node":puff,"base":sp,"ph":float(si)*0.5+float(k)*0.17})
	# pastry display on the counter
	glass(root,lp(0.62,4.62,1.62),Vector3(1.6,0.8,0.9),Color("cfe8ee"))
	if not prop(root,"res://models/cafe_pastry.glb",lp(0.62,4.62,1.22),0.62,0.95):
		fest.box(root,lp(0.62,4.62,1.28),Vector3(1.5,0.1,0.8),Color("f6f3ec"))
	# pickup spot where the finished cup appears
	cup_pickup = Node3D.new()
	cup_pickup.position = lp(0.0,4.62,1.23)
	cup_pickup.visible = false
	root.add_child(cup_pickup)
	build_cup(cup_pickup,Color("f6f3ec"))
	# --- wood-slat swooping ceiling ---
	var woods := [Color("4a3426"),Color("5a4030"),Color("6b4c37"),Color("5a4030"),Color("4a3426"),Color("6b4c37"),Color("7a5842")]
	for k in 7:
		var rad := 9.4-float(k)*1.05
		var slat: MeshInstance3D = fest.cyl(root,Vector3(0,5.0+float(k)*0.17,-1.1-float(k)*0.12),rad,rad,0.26,woods[k])
		slat.scale.z = 0.82
		if k % 2 == 0:
			var rim: MeshInstance3D = fest.torus(root,Vector3(0,5.0+float(k)*0.17+0.04,-1.1-float(k)*0.12),rad,0.05,Color("b8734a"),0.35)
			rim.scale.z = 0.82
	# hanging brass pendants
	for k in 5:
		var pa := -0.9+float(k)*0.45
		var pp2 := lp(pa,3.9,0.0)
		if not prop(root,"res://models/cafe_pendant.glb",Vector3(pp2.x,3.06,pp2.z),0.0,1.0):
			fest.cyl(root,Vector3(pp2.x,4.4,pp2.z),0.015,0.015,1.2,brass)
			fest.cyl(root,Vector3(pp2.x,3.75,pp2.z),0.34,0.34,0.14,Color("c0763f"),0.3)
			fest.ball(root,Vector3(pp2.x,3.62,pp2.z),Vector3(0.3,0.2,0.3),Color("fff0c8"),2.6)
	# --- two candy-stripe columns with big bows ---
	for sx: float in [-1.0,1.0]:
		var cp := Vector3(sx*7.0,0,3.4)
		fest.cyl(root,cp+Vector3(0,0.6,0),0.88,0.92,1.2,Color("708a58"))
		fest.cyl(root,cp+Vector3(0,3.2,0),0.7,0.7,4.2,Color("858a8c"))
		for ri in 3:
			var ry := 1.9+float(ri)*1.15
			for st in 3:
				var rc: MeshInstance3D = fest.torus(root,cp+Vector3(0,ry+float(st)*0.13,0),0.72,0.045,Color("cf2a3c") if st != 1 else Color("f6f3ec"))
				rc.rotation.x = 0.18*float(ri-1)
		fest.ball(root,cp+Vector3(0.64,4.4,0),Vector3(0.7,0.5,0.35),Color("cf2a3c"))
		fest.ball(root,cp+Vector3(0.64,4.4,0.5),Vector3(0.7,0.5,0.35),Color("f6f3ec"))
		fest.ball(root,cp+Vector3(0.64,4.4,0.25),Vector3(0.3,0.3,0.3),Color("cf2a3c"))
	# --- seating: two round tables with stools, two lounge chairs, a ficus ---
	for tp2: Vector3 in [Vector3(-5.2,0,6.2),Vector3(5.4,0,6.0)]:
		fest.cyl(root,tp2+Vector3(0,0.95,0),0.7,0.7,0.07,Color("2c2420"))
		fest.cyl(root,tp2+Vector3(0,0.5,0),0.07,0.07,0.95,brass)
		fest.cyl(root,tp2+Vector3(0,0.24,0),0.4,0.4,0.06,brass)
		for si2 in 3:
			var sa := float(si2)/3.0*TAU+0.5
			var sp2 := tp2+Vector3(cos(sa)*1.15,0,sin(sa)*1.15)
			fest.cyl(root,sp2+Vector3(0,0.6,0),0.26,0.26,0.1,Color("3a5a46"))
			fest.cyl(root,sp2+Vector3(0,0.3,0),0.04,0.04,0.6,brass)
	for lc in [[Vector3(-8.2,0,2.4),0.5],[Vector3(8.3,0,2.3),-0.5]]:
		var lcp: Vector3 = lc[0]
		var lb: MeshInstance3D = fest.box(root,lcp+Vector3(0,0.35,0),Vector3(1.1,0.5,1.1),Color("8c6a4c"))
		lb.rotation.y = float(lc[1])
		var lbk: MeshInstance3D = fest.box(root,lcp+Vector3(0,0.85,-0.45),Vector3(1.1,0.7,0.2),Color("7a5a40"))
		lbk.rotation.y = float(lc[1])
	fest.cyl(root,Vector3(-8.6,0.25,-1.2),0.8,0.9,0.5,Color("3d3a36"))
	fest.cyl(root,Vector3(-8.6,1.3,-1.2),0.1,0.14,2.0,Color("6a4a32"))
	for k in 5:
		fest.ball(root,Vector3(-8.6+sin(float(k)*1.4)*0.6,2.5+float(k)*0.22,-1.2+cos(float(k)*1.4)*0.5),Vector3(1.0,0.8,1.0),Color("2f7a3a"))
	# --- gold sign over the counter ---
	var plate: MeshInstance3D = fest.box(root,Vector3(0,6.35,3.2),Vector3(7.6,1.2,0.16),Color("1a2428"))
	fest.torus(root,Vector3(0,6.35,3.31),0.46,0.04,gold,1.4).rotation.x = PI/2.0
	var title := Label3D.new()
	title.text = "CHIT CHAT ROASTERY"
	title.font_size = 96
	title.pixel_size = 0.0058
	title.modulate = Color("f4d27a")
	title.outline_size = 12
	title.outline_modulate = Color("2a1a08")
	title.position = Vector3(0.45,6.45,3.34)
	root.add_child(title)
	var sub := Label3D.new()
	sub.text = "Small-batch coffee · night-owl specials"
	sub.font_size = 56
	sub.pixel_size = 0.0052
	sub.modulate = Color("ffffff")
	sub.outline_size = 8
	sub.position = Vector3(0.45,5.95,3.34)
	root.add_child(sub)
	plate.name = "Plate"
	# moon-in-a-cup emblem in the ring
	fest.cyl(root,Vector3(0,6.28,3.3),0.17,0.14,0.2,Color("f6f3ec"),0.4).rotation.x = 0.0
	fest.ball(root,Vector3(0,6.55,3.3),Vector3(0.2,0.2,0.04),Color("ffe9a8"),1.8)
	# warm lights
	for lpos: Vector3 in [Vector3(0,4.2,1.0),Vector3(-4.6,3.8,5.0),Vector3(4.6,3.8,5.0)]:
		var om := OmniLight3D.new()
		om.position = lpos
		om.light_color = Color("ffd9a0")
		om.light_energy = 1.1
		om.omni_range = 11.0
		root.add_child(om)
	# --- the baristas ---
	var looks := [
		{"Shirt":Color("22384f"),"Pants":Color("2a2a2e"),"Skin":Color("ac7552"),"Hair":Color("1e140e"),"Shoes":Color("2a2a2a"),"Eye":Color("1c1c22")},
		{"Shirt":Color("2d4a3a"),"Pants":Color("2a2a2e"),"Skin":Color("e0b48c"),"Hair":Color("5a3a22"),"Shoes":Color("2a2a2a"),"Eye":Color("1c1c22")},
		{"Shirt":Color("5a3025"),"Pants":Color("2a2a2e"),"Skin":Color("8c5a3a"),"Hair":Color("14100c"),"Shoes":Color("2a2a2a"),"Eye":Color("1c1c22")},
	]
	for k in 3:
		var phi5 := -0.5+float(k)*0.5
		var person: Dictionary = g._make_person(root,k,looks[k])
		if person.is_empty():
			continue
		var pr: Node3D = person["root"]
		pr.position = lp(phi5,3.3,0.2)
		pr.rotation.y = phi5+PI
		# red apron on the front (the person faces -z in its own space)
		fest.box(pr,Vector3(0,0.82,-0.17),Vector3(0.34,0.56,0.03),Color("a8202f"))
		fest.box(pr,Vector3(0,1.12,-0.17),Vector3(0.22,0.05,0.03),Color("a8202f"))
		staff.append({"person":person,"phi":phi5,"ph":float(k)*1.3})
	# the cup the player holds
	hand_cup = Node3D.new()
	hand_cup.visible = false
	g.add_child(hand_cup)
	build_cup(hand_cup,Color("f6f3ec"))
	build_lounge(face_to+Vector3(-24,0,23))

# ---------- the lounge: a big partitioned hang-out area with booth bays (white, porthole screens, glowing strips) ----------
func build_lounge(at: Vector3) -> void:
	lounge_at = at
	lounge = Node3D.new()
	lounge.name = "RoasteryLounge"
	lounge.position = at
	g.add_child(lounge)
	var pearl := Color("8d8578")
	fest.cyl(lounge,Vector3(0,0.1,0),LOUNGE_R,LOUNGE_R+0.2,0.2,pearl)
	fest.torus(lounge,Vector3(0,0.22,0),LOUNGE_R-0.05,0.08,Color("ffd596"),0.8)
	fest.torus(lounge,Vector3(0,0.22,0),3.2,0.05,Color("e0b85a"),0.8)
	for bi in 4:
		var phi := deg_to_rad(120.0+float(bi)*60.0)
		var tp: Vector3 = lp(phi,4.2,0.0)
		prop(lounge,"res://models/cafe_table.glb",tp,phi,1.0)
		prop(lounge,"res://models/cafe_booth.glb",tp,phi+PI,1.0)
		for j in 3:
			var ang := phi+(float(j)-1.0)*0.36
			prop(lounge,"res://models/cafe_partition.glb",lp(ang,6.95,0.0),ang+PI,1.0)
		var inward := Vector3(-sin(phi),0,-cos(phi))
		var tang := Vector3(cos(phi),0,-sin(phi))
		for sd in [-1.0,1.0]:
			prop(lounge,"res://models/cafe_chair.glb",tp+inward*1.4+tang*0.62*sd,phi,1.0)
		var lamp := OmniLight3D.new()
		lamp.position = lp(phi,4.6,2.6)
		lamp.light_color = Color("ffe0b0")
		lamp.light_energy = 0.6
		lamp.omni_range = 7.0
		lounge.add_child(lamp)
	# the middle: a communal round table with six chairs
	prop(lounge,"res://models/cafe_table.glb",Vector3.ZERO,0.0,1.5)
	for k in 6:
		var a := float(k)/6.0*TAU
		prop(lounge,"res://models/cafe_chair.glb",Vector3(sin(a),0,cos(a))*1.55,a,1.0)
	# oval ceiling light hung over the lounge
	prop(lounge,"res://models/cafe_ringlight.glb",Vector3(0,6.6,0),0.0,1.15)
	var ring_l := OmniLight3D.new()
	ring_l.position = Vector3(0,5.6,0)
	ring_l.light_energy = 0.7
	ring_l.omni_range = 11.0
	ring_l.light_color = Color("fff1d6")
	lounge.add_child(ring_l)
	var lsign := Label3D.new()
	lsign.text = "ROASTERY LOUNGE"
	lsign.font_size = 80
	lsign.pixel_size = 0.006
	lsign.modulate = Color("f4d27a")
	lsign.outline_size = 10
	lsign.outline_modulate = Color("2a1a08")
	lsign.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	lsign.position = Vector3(0,4.3,0)
	lounge.add_child(lsign)
	for k in 3:
		var pa := deg_to_rad(20.0+float(k)*40.0)
		var pp: Vector3 = lp(pa,6.9,0.0)
		fest.cyl(lounge,pp+Vector3(0,0.35,0),0.42,0.34,0.7,Color("f4f6f7"))
		for q in 4:
			fest.ball(lounge,pp+Vector3(sin(float(q)*1.6)*0.25,1.0+float(q)*0.2,cos(float(q)*1.6)*0.25),Vector3(0.7,0.6,0.7),Color("3f8a52"))

func in_lounge(p: Vector3) -> bool:
	return lounge_at != Vector3.INF and Vector2(p.x-lounge_at.x,p.z-lounge_at.z).length() < LOUNGE_R

func counter_spot(k: int) -> Vector3:
	# the three places in front of the counter where you can say hi to a barista (world position)
	return root.to_global(lp(-0.55+float(k)*0.55,5.9,0.0))

func holding_cup() -> bool:
	return Time.get_ticks_msec()/1000.0 < hand_until


func build_cup(parent: Node3D, sleeve: Color) -> void:
	var cup := Node3D.new()
	cup.name = "Cup"
	parent.add_child(cup)
	fest.cyl(cup,Vector3(0,0.0,0),0.1,0.075,0.22,Color("f6f3ec"))
	fest.cyl(cup,Vector3(0,0.0,0),0.104,0.08,0.09,sleeve)
	fest.cyl(cup,Vector3(0,0.125,0),0.108,0.108,0.03,Color("2a2420"))

func tint_cup(parent: Node3D, col: Color) -> void:
	var cup := parent.get_node_or_null("Cup")
	if cup == null or cup.get_child_count() < 2:
		return
	for c in cup.get_children():
		cup.remove_child(c)
		c.queue_free()
	fest.cyl(cup,Vector3(0,0.0,0),0.1,0.075,0.22,Color("f6f3ec"))
	fest.cyl(cup,Vector3(0,0.0,0),0.104,0.08,0.09,col)
	fest.cyl(cup,Vector3(0,0.125,0),0.108,0.108,0.03,Color("2a2420"))

# ---------- interaction ----------
func near() -> bool:
	if g.driving or g.player == null or g.paused or spot == Vector3.INF:
		return false
	return Vector2(g.player.position.x-spot.x,g.player.position.z-spot.z).length() < 7.6

func button_text() -> String:
	return "ORDER COFFEE"

func hour_number() -> int:
	return int(Time.get_unix_time_from_system()/3600.0)

func special_index() -> int:
	return hour_number() % DRINKS.size()

func price_of(i: int) -> int:
	var base: int = int(DRINKS[i][2])
	return int(round(float(base)*0.7)) if i == special_index() else base

func speed_mult() -> float:
	return 1.2 if Time.get_ticks_msec()/1000.0 < boost_until else 1.0

func _process(delta: float) -> void:
	if root == null:
		return
	t += delta
	var player_near: bool = g.player != null and Vector2(g.player.position.x-spot.x,g.player.position.z-spot.z).length() < 42.0
	root.visible = true
	if making_t > 0.0:
		making_t -= delta
		if making_t <= 0.0:
			finish_order()
	var now := Time.get_ticks_msec()/1000.0
	if player_near:
		for s in staff:
			var person: Dictionary = s["person"]
			g._pose_person(person,t*2.0+float(s["ph"]),0.0)
			var busy := making_t > 0.0
			var limbs: Dictionary = person.get("limbs",{})
			var ph: float = float(s["ph"])
			var ar: Node3D = limbs.get("ArmR",null)
			var al: Node3D = limbs.get("ArmL",null)
			if ar != null and al != null:
				var speed := 7.0 if busy else 1.6
				var amp := 0.4 if busy else 0.12
				ar.rotation.x = -1.05+sin(t*speed+ph)*amp
				al.rotation.x = -0.95+sin(t*speed*0.8+ph+1.4)*amp
			var pr: Node3D = person["root"]
			var turn := sin(t*0.5+ph)*0.25
			pr.rotation.y = float(s["phi"])+PI+turn
		for st in steam:
			var n: Node3D = st["node"]
			var show := making_t > 0.0 or int(t*0.4+float(st["ph"])*3.0) % 3 == 0
			n.visible = show
			if show:
				var f: float = fposmod(t*0.45+float(st["ph"]),1.0)
				n.position = (st["base"] as Vector3)+Vector3(0.0,f*1.0,0.0)
				n.scale = Vector3.ONE*(0.16+f*0.24)
	# the held cup follows the player while it lasts
	if hand_cup != null:
		if now < hand_until and g.player != null and not g.driving:
			hand_cup.visible = true
			var yaw: float = g.player.rotation.y
			var side := Vector3(cos(yaw),0,-sin(yaw))
			var fwd := Vector3(-sin(yaw),0,-cos(yaw))
			hand_cup.global_position = g.player.global_position+Vector3(0,0.98,0)+side*0.32+fwd*0.26
		else:
			hand_cup.visible = false

# ---------- ordering ----------
func build_panel(ui: Control) -> void:
	panel = PanelContainer.new()
	panel.add_theme_stylebox_override("panel",g._panel(Color(0.08,0.12,0.1,0.96),24))
	panel.custom_minimum_size = Vector2(600,0)
	ui.add_child(panel)
	g.extra_panels.append(panel)
	var col := VBoxContainer.new()
	col.add_theme_constant_override("separation",8)
	panel.add_child(col)
	col.add_child(g._label("CHIT CHAT ROASTERY",26,Color("f4d27a")))
	info = g._label("",16,Color("e6efe6"))
	info.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	info.custom_minimum_size.x = 560
	col.add_child(info)
	var sc := ScrollContainer.new()
	sc.custom_minimum_size = Vector2(560,300)
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	col.add_child(sc)
	list = VBoxContainer.new()
	list.add_theme_constant_override("separation",8)
	sc.add_child(list)
	col.add_child(g._button("Done",close))
	panel.hide()

func open() -> void:
	if not g.paused:
		g._toggle_menu()
	g._open_panel(panel)
	refresh()

func close() -> void:
	if g.paused:
		g._toggle_menu()

func refresh() -> void:
	var sp := special_index()
	info.text = "Fresh from our baristas. Drink of the hour: %s, 30%% off. You have %s." % [DRINKS[sp][1],g._money(g.cash)]
	for c in list.get_children():
		for sub in c.find_children("*","Button",true,false):
			g.touch_buttons.erase(sub)
		c.queue_free()
	for i in DRINKS.size():
		var dr: Array = DRINKS[i]
		var card := PanelContainer.new()
		var cs: StyleBoxFlat = g._panel(Color("1d2a24") if i != sp else Color("33402a"),14)
		cs.content_margin_left = 10
		cs.content_margin_right = 10
		cs.content_margin_top = 8
		cs.content_margin_bottom = 8
		if i == sp:
			cs.border_color = Color("f4d27a")
			cs.set_border_width_all(3)
		card.add_theme_stylebox_override("panel",cs)
		list.add_child(card)
		var row := HBoxContainer.new()
		row.add_theme_constant_override("separation",10)
		card.add_child(row)
		var txt := VBoxContainer.new()
		txt.custom_minimum_size.x = 360
		row.add_child(txt)
		txt.add_child(g._label(String(dr[1])+("  ·  OFFER" if i == sp else ""),18,Color("fff5dc")))
		var pl: Label = g._label(String(dr[3]),14,Color("b9cbbd"))
		pl.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		pl.custom_minimum_size.x = 350
		txt.add_child(pl)
		var price := price_of(i)
		var b: Button = g._button("ORDER " + g._money(price),pick.bind(i))
		b.custom_minimum_size = Vector2(170,48)
		b.add_theme_font_size_override("font_size",16)
		b.add_theme_stylebox_override("normal",g._panel(Color("b5622b") if g.cash >= price and making_t <= 0.0 else Color("3a3a3a"),12))
		row.add_child(b)
	panel.reset_size()
	g._layout_panels()

func player_name() -> String:
	var n := String(g.online_name)
	return n if n != "" else "Friend"

func pick(i: int) -> void:
	if i < 0 or i >= DRINKS.size():
		return
	if making_t > 0.0:
		g._show_toast("The baristas are still making the last order.")
		return
	var price := price_of(i)
	if g.cash < price:
		g._show_toast("%s costs %s (you have %s)." % [DRINKS[i][1],g._money(price),g._money(g.cash)])
		return
	g.cash -= price
	making_id = String(DRINKS[i][0])
	making_t = 2.8
	orders += 1
	if not ("--smoke-test" in OS.get_cmdline_user_args()):
		g._play_coin()
	g._show_toast("Order in: %s for %s. The baristas are on it!" % [DRINKS[i][1],player_name()])
	if panel != null and panel.visible:
		refresh()

func finish_order() -> void:
	var idx := -1
	for i in DRINKS.size():
		if String(DRINKS[i][0]) == making_id:
			idx = i
	if idx < 0:
		return
	var dr: Array = DRINKS[idx]
	var now := Time.get_ticks_msec()/1000.0
	var msg := "%s! Your %s is ready." % [player_name(),dr[1]]
	if String(dr[4]) == "speed":
		boost_until = now+float(dr[5])
		msg += " Run faster for %d s." % int(dr[5])
	else:
		var hour := hour_number()
		if int(xp_hour.get(making_id,-1)) != hour:
			xp_hour[making_id] = hour
			g.bonus_xp += int(dr[5])
			msg += " +%d XP." % int(dr[5])
		else:
			msg += " (XP perk already used this hour.)"
	var cup_col := Color(String(dr[6]))
	tint_cup(hand_cup,cup_col)
	hand_until = now+(300.0 if making_id == "gold" else 120.0)
	if cup_pickup != null:
		tint_cup(cup_pickup,cup_col)
		cup_pickup.visible = true
		get_tree().create_timer(1.6).timeout.connect(func(): if is_instance_valid(cup_pickup): cup_pickup.visible = false)
	if g.dq != null:
		g.dq.cafe_order(idx,idx == special_index())
	g._show_toast(msg)
	if making_id == "gold":
		g._chat_log_add("Roastery","%s ordered the Chit Chat Signature! Cheers!" % player_name(),false)
	making_id = ""
	if panel != null and panel.visible:
		refresh()

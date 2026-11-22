extends RefCounted
# World Biosphere Phase 1. Stable first 16 species = existing bio_seen save bits.
const C := Vector3(-860,0,-650)
const RADIUS := 38.5
const ORBIT := 115.0
const ENTRY := C+Vector3(0,0,181)
const OCEAN := C+Vector3(-225,0,0)
const NAMES := ["Africa","Asia","South America","Antarctica","Europe","North America","Oceania"]
const COLORS := [Color("e9b75e"),Color("7fbc9c"),Color("4cbf94"),Color("9be6ff"),Color("b2cc7a"),Color("d29562"),Color("64d7d0")]
const GROUNDS := [Color("c6ac67"),Color("508166"),Color("32694a"),Color("dae9f2"),Color("8eaa70"),Color("738b66"),Color("cbd3b1")]
const DOMES := [{"name":"AFRICA"},{"name":"ASIA"},{"name":"SOUTH AMERICA"},{"name":"ANTARCTICA"},{"name":"EUROPE"},{"name":"NORTH AMERICA"},{"name":"OCEANIA"}]
const SPECIES := [
	{"dome":3,"name":"Emperor Penguin","fact":"The biggest penguin: up to 1.2 m tall. Dads keep the egg warm on their feet.","kind":"penguin","n":6,"zone":"in","hab":"Penguin Bay"},
	{"dome":5,"name":"Polar Bear","fact":"Its fur looks white, but its skin is black to soak up the sun.","kind":"polarbear","n":2,"zone":"out","hab":"Polar Coast"},
	{"dome":5,"name":"Arctic Fox","fact":"Its fur turns from brown in summer to snow-white in winter.","kind":"arcticfox","n":2,"zone":"out","hab":"Arctic Tundra"},
	{"dome":5,"name":"Snowy Owl","fact":"Hunts in daylight in the Arctic summer, when the sun never sets.","kind":"owl","n":2,"zone":"fly","hab":"Snowy Owl Peak"},
	{"dome":1,"name":"Spotted Deer","fact":"Fawns are born with white spots that help them hide.","kind":"deer","n":3,"zone":"out","hab":"Blossom Meadow"},
	{"dome":4,"name":"Rabbit","fact":"Rabbits can turn their long ears to hear in every direction.","kind":"rabbit","n":5,"zone":"out","hab":"Bunny Burrows"},
	{"dome":4,"name":"Mallard Duck","fact":"Only the male has the shiny green head.","kind":"duck","n":4,"zone":"swim","hab":"Rain Vortex Pool"},
	{"dome":2,"name":"Butterfly","fact":"Butterflies taste with their feet.","kind":"butterfly","n":10,"zone":"flutter","hab":"Butterfly House"},
	{"dome":0,"name":"Giraffe","fact":"The tallest animal: its tongue is about 50 cm long.","kind":"giraffe","n":2,"zone":"out","hab":"Acacia Plains"},
	{"dome":0,"name":"Zebra","fact":"No two zebras have the same stripes.","kind":"zebra","n":4,"zone":"out","hab":"Zebra Grassland"},
	{"dome":0,"name":"Flamingo","fact":"Flamingos are pink because of the shrimp they eat.","kind":"flamingo","n":6,"zone":"swim","hab":"Coral Lagoon"},
	{"dome":2,"name":"Macaw Parrot","fact":"Macaws can live for 60 years.","kind":"parrot","n":3,"zone":"fly","hab":"Macaw Aviary"},
	{"dome":5,"name":"Moose","fact":"The biggest deer: a male's antlers can be 1.8 m wide.","kind":"moose","n":2,"zone":"out","hab":"Maple Forest"},
	{"dome":5,"name":"Raccoon","fact":"Raccoons feel their food with their sensitive front paws.","kind":"raccoon","n":2,"zone":"out","hab":"Raccoon Hollow"},
	{"dome":5,"name":"Beaver","fact":"Beavers build dams and lodges, and their teeth never stop growing.","kind":"beaver","n":2,"zone":"swim","hab":"Beaver Pond"},
	{"dome":5,"name":"Canada Goose","fact":"Geese fly south in a V shape to save energy.","kind":"goose","n":5,"zone":"out","hab":"Goose Marsh"},
	{"dome": 0, "name": "Elephant", "fact": "Elephants use their trunks to drink, smell and greet friends.", "kind": "elephant", "n": 2, "zone": "out", "hab": "Elephant Habitat"},
	{"dome": 0, "name": "Lion", "fact": "Lions rest together in family groups called prides.", "kind": "lion", "n": 3, "zone": "out", "hab": "Lion Habitat"},
	{"dome": 0, "name": "Rhino", "fact": "Rhino horns are made of keratin, like your fingernails.", "kind": "rhino", "n": 2, "zone": "out", "hab": "Rhino Habitat"},
	{"dome": 0, "name": "Meerkat", "fact": "Meerkats take turns watching for danger.", "kind": "meerkat", "n": 4, "zone": "out", "hab": "Meerkat Habitat"},
	{"dome": 1, "name": "Giant Panda", "fact": "Pandas spend much of their day eating bamboo.", "kind": "panda", "n": 2, "zone": "out", "hab": "Giant Panda Habitat"},
	{"dome": 1, "name": "Tiger", "fact": "Every tiger has its own pattern of stripes.", "kind": "tiger", "n": 2, "zone": "out", "hab": "Tiger Habitat"},
	{"dome": 1, "name": "Red Panda", "fact": "A red panda uses its tail like a warm blanket.", "kind": "redpanda", "n": 2, "zone": "out", "hab": "Red Panda Habitat"},
	{"dome": 1, "name": "Snow Leopard", "fact": "Wide paws help snow leopards walk over snow.", "kind": "snowleopard", "n": 2, "zone": "out", "hab": "Snow Leopard Habitat"},
	{"dome": 1, "name": "Crane", "fact": "Cranes greet one another with dances.", "kind": "crane", "n": 3, "zone": "out", "hab": "Crane Habitat"},
	{"dome": 2, "name": "Jaguar", "fact": "Jaguars are strong swimmers.", "kind": "jaguar", "n": 2, "zone": "out", "hab": "Jaguar Habitat"},
	{"dome": 2, "name": "Sloth", "fact": "Sloths save energy by moving slowly.", "kind": "sloth", "n": 2, "zone": "out", "hab": "Sloth Habitat"},
	{"dome": 2, "name": "Toucan", "fact": "A toucan uses its large beak to help control body heat.", "kind": "toucan", "n": 3, "zone": "fly", "hab": "Toucan Habitat"},
	{"dome": 2, "name": "Monkey", "fact": "Many forest monkeys communicate with calls and gestures.", "kind": "monkey", "n": 3, "zone": "out", "hab": "Monkey Habitat"},
	{"dome": 2, "name": "Poison Frog", "fact": "Bright colors warn predators to keep away.", "kind": "frog", "n": 4, "zone": "out", "hab": "Poison Frog Habitat"},
	{"dome": 3, "name": "Seal", "fact": "Seals can rest on ice and hunt beneath it.", "kind": "seal", "n": 4, "zone": "out", "hab": "Seal Habitat"},
	{"dome": 3, "name": "Orca", "fact": "Orcas are the largest members of the dolphin family.", "kind": "orca", "n": 2, "zone": "swim", "hab": "Orca Habitat"},
	{"dome": 3, "name": "Albatross", "fact": "Albatrosses glide long distances over the ocean.", "kind": "albatross", "n": 3, "zone": "fly", "hab": "Albatross Habitat"},
]
const QUESTS := [
 ["Watering Hole Count","Lion Pride Lookout","Savanna Ranger Trail"],
 ["Panda Snack Run","Lantern Path","Mountain Pavilion Trail"],
 ["Canopy Climb","Frog Hunt","River Rescue"],
 ["Penguin Parade","Ice Floe Hop","Seal Watch"]]
const RANKS := ["Junior Ranger","Ranger","Head Ranger","Wildlife Legend"]
const RANK_AT := [0,3,8,12]
const RARES := ["White Lion","Golden Monkey","Emperor Penguin Chick"]
var g
var root: Node3D
var interiors: Array = []
var animals: Array = []
var markers: Array = []
var rare_nodes: Array = []
var baby_nodes: Array = []
var lanterns: Array = []
var shelters: Array = []
var fences: Array = []
var batches := {}
var mats := {}
var state := {}
var active := -1
var task := -1
var tick_time := 0.0
var interval := 0.0
var last_slot := -1
var test_time := -1.0
var test_day := ""
var panel: PanelContainer
var page := 0
var hud_button: Button
var safari_hint: Label
var panel_body: VBoxContainer
var last_rare := -1
var announced_baby_day := ""
var atmospheres: Array = []
var pending_save := false
var saved_delay := 0.0

func _init(game) -> void:
 g = game
 reset_state()

func reset_state() -> void:
 state = {"visits":0,"pages":0,"quests":{},"steps":{},"photos":{},"ach":{},"rank_jobs":0,"keeper_work_day":"","keeper_step":0,"keeper_day":"","keeper_last":"","streak":0,"shows":{},"rare":{},"babies":{},"world":false,"coop":0}

func load_state(file: ConfigFile) -> void:
 var data = file.get_value("world_biosphere","state",{})
 if data is Dictionary:
  for key in state:
   if data.has(key) and typeof(data[key]) == typeof(state[key]):
    state[key] = data[key]
 # Existing bits keep their species identities. No remapping or truncation beyond appended species.
 g.bio_seen = int(g.bio_seen) & ((1 << SPECIES.size())-1)

func save_state(file: ConfigFile) -> void:
 file.set_value("world_biosphere","state",state)

func changed() -> void:
 pending_save = true
 saved_delay = 0.7

func dome_c(i: int) -> Vector3:
 var a = -PI/2.0+float(i)*TAU/7.0
 return C+Vector3(cos(a),0,sin(a))*ORBIT

func local_point(i: int, x: float, z: float, y := 0.0) -> Vector3:
 # +z points away from the hub. Main promenade stays at local x=0.
 var forward = (dome_c(i)-C).normalized()
 var right = Vector3(forward.z,0,-forward.x)
 return dome_c(i)+right*x+forward*z+Vector3(0,y,0)

func inside(p: Vector3) -> bool:
 if Vector2(p.x-C.x,p.z-C.z).length() < 20.5:
  return true
 for i in 7:
  if Vector2(p.x-dome_c(i).x,p.z-dome_c(i).z).length() < RADIUS+0.6:
   return true
  var v = dome_c(i)-C
  var t = clampf((p-C).dot(v)/v.length_squared(),0,1)
  if Vector2(p.x-C.x-v.x*t,p.z-C.z-v.z*t).length() < 3.3:
   return true
 return false

func dome_at(p: Vector3) -> int:
 for i in 7:
  var c = dome_c(i)
  if Vector2(p.x-c.x,p.z-c.z).length() < RADIUS:
   return i
 return -1

func material(col: Color) -> StandardMaterial3D:
 var key = col.to_html()
 if not mats.has(key):
  mats[key] = g._bio_glass_mat(col,col.a) if col.a<1.0 else g._bio_mat(col.darkened(0.18),0.0,0.85)
 return mats[key]

func shape(parent: Node3D, mesh: Mesh, pos: Vector3, sc: Vector3, col: Color, solid := false, rot := Vector3.ZERO) -> void:
 var mat = material(col)
 var key = "%d:%d:%d" % [parent.get_instance_id(),mesh.get_instance_id(),mat.get_instance_id()]
 if not batches.has(key):
  batches[key] = {"parent":parent,"mesh":mesh,"mat":mat,"xs":[]}
 batches[key]["xs"].append(Transform3D(Basis.from_euler(rot)*Basis.from_scale(sc),pos))
 if solid:
  var body = StaticBody3D.new()
  body.position = pos
  body.rotation = rot
  var cs = CollisionShape3D.new()
  var box = BoxShape3D.new()
  box.size = sc
  cs.shape = box
  body.add_child(cs)
  parent.add_child(body)

func box(parent: Node3D,p: Vector3,size: Vector3,col: Color,solid := false,rot := Vector3.ZERO) -> void:
 shape(parent,g._bbox(),p,size,col,solid,rot)

func ball(parent: Node3D,p: Vector3,size: Vector3,col: Color) -> void:
 shape(parent,g._bsph(1.0),p,size,col)

func beam(parent: Node3D,a: Vector3,b: Vector3,w: float,col: Color,solid := false) -> void:
 var d = b-a
 var b0 = Basis.looking_at(d.normalized(),Vector3.UP) if absf(d.normalized().dot(Vector3.UP)) < 0.99 else Basis.from_euler(Vector3(PI/2,0,0))
 box(parent,(a+b)*0.5,Vector3(w,w,d.length()),col,solid,b0.get_euler())

func text(parent: Node3D,label: String,pos: Vector3,col := Color.WHITE,size := 40,range_m := 65.0) -> Label3D:
 var n = Label3D.new()
 n.text = label
 n.font_size = size
 n.pixel_size = 0.008
 n.billboard = BaseMaterial3D.BILLBOARD_ENABLED
 n.modulate = col
 n.outline_size = 5
 n.position = pos
 n.visibility_range_end = range_m
 parent.add_child(n)
 return n

func flush() -> void:
 for key in batches:
  var b = batches[key]
  var mm = MultiMesh.new()
  mm.transform_format = MultiMesh.TRANSFORM_3D
  mm.mesh = b.mesh
  mm.instance_count = b.xs.size()
  for k in b.xs.size():
   mm.set_instance_transform(k,b.xs[k])
  var mi = MultiMeshInstance3D.new()
  mi.multimesh = mm
  mi.material_override = b.mat
  mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
  b.parent.add_child(mi)
 batches.clear()

func disc(parent: Node3D,c: Vector3,r: float,th: float,col: Color,solid := false) -> void:
 var mesh = g._bcone(r,r,th)
 shape(parent,mesh,c,Vector3.ONE,col)
 if solid:
  g._bio_cyl_col_on(parent,c,r,th)

func entrance_ramp(centre: Vector3,outward: Vector3,radius: float,width: float,col: Color,low := -0.05,high := 0.09,approach := 1.5,parent: Node3D = null) -> void:
 # The grass is at -0.05 m and each floor disc ends at +0.09 m. A capsule cannot
 # step over that vertical rim; bridge both surfaces with a gentle, solid slope.
 var a = centre+outward*(radius+approach)+Vector3(0,low,0)
 var b = centre+outward*(radius-approach)+Vector3(0,high,0)
 var x = (b-a).normalized()
 var z = x.cross(Vector3.UP).normalized()
 var y = z.cross(x).normalized()
 var basis = Basis(x,y,z)
 var thickness = 0.16
 box(root if parent==null else parent,(a+b)*0.5-y*thickness*0.5,Vector3(a.distance_to(b)+0.1,thickness,width),col,true,basis.get_euler())

func build() -> void:
 root = Node3D.new()
 root.name = "WorldBiosphere"
 root.set_meta("static_floor",true)
 g.add_child(root)
 g.bio_root = root
 # A connected, empty western land shelf. Existing city/Galleria geometry stays untouched.
 box(root,Vector3(-915,-0.35,-650),Vector3(450,0.6,400),Color("7b9d72"),true)
 box(root,Vector3(-760,0.01,-458),Vector3(210,0.08,12),Color("728c80"))
 g._collider(root,Vector3(-760,-0.3,-458),Vector3(210,0.6,14))
 g._floor_note(Vector3(-760,0.01,-458),Vector3(210,0.08,12))
 box(root,C+Vector3(0,0.02,102),Vector3(7,0.08,163),Color("e4e5d5"))
 disc(root,C+Vector3(0,0.03,0),20,0.12,Color("e9ecde"),true)
 entrance_ramp(C,Vector3(0,0,1),20,7.0,Color("e9ecde"))
 # Entrance gate arch where the walk from the city meets the hub.
 for gx in [-6.5,6.5]:
  beam(root,C+Vector3(gx,0,34),C+Vector3(gx,7,34),0.7,Color("94e8cf"))
 beam(root,C+Vector3(-6.5,7,34),C+Vector3(6.5,7,34),0.7,Color("94e8cf"))
 text(root,"WORLD BIOSPHERE",C+Vector3(0,8.4,34),Color("c4fff1"),56,90)
 shell(root,C,20,14,Color("94e8cf"),false)
 text(root,"WORLD BIOSPHERE",C+Vector3(0,10,8),Color("c4fff1"),72,220)
 text(root,"One world · Seven continents",C+Vector3(0,7.8,8),Color.WHITE,34,100)
 text(root,"PASSPORT & RANGER DESK\nSpot wildlife · Help keepers · Take photos",C+Vector3(-6,2.6,5),Color("244b3c"),36,35)
 box(root,C+Vector3(-6,0.65,5),Vector3(4,1.3,1.6),Color("4a7f64"),true)
 text(root,"FREE ENTRY · All open habitats",C+Vector3(-6,3.8,5),Color("b7f3d4"),28,35)
 g.bio_people.append(g._cm_person(root,C+Vector3(-7,0,3),0.0,77))
 g.bio_nav = g._nav_area("World Biosphere Hub",C.x-32,C.z-32,C.x+32,C.z+32,[C+Vector3(0,0,12)],func(p):return Vector2(p.x-C.x,p.z-C.z).length()<19.0)
 g.bio_nav["root"] = root
 for k in 14:
  var p = C+Vector3(cos(k*TAU/14),0,sin(k*TAU/14))*15
  g._nav_spot(g.bio_nav,p,C,2,5)
 for i in 7:
  var c = dome_c(i)
  var dir = (c-C).normalized()
  entrance_ramp(C,dir,20,5.6,Color("e7e9db"))
  entrance_ramp(c,-dir,RADIUS,5.6,GROUNDS[i])
  var a = C+dir*19.5
  var b = c-dir*(RADIUS-0.5)
  beam(root,a+Vector3(0,0.08,0),b+Vector3(0,0.08,0),0.12,Color("a7ddc3"))
  var yaw = atan2(dir.x,dir.z)
  box(root,(a+b)*0.5+Vector3(0,0.03,0),Vector3(5.6,0.12,a.distance_to(b)+1),Color("e7e9db"),false,Vector3(0,yaw,0))
  # Tunnel handrails and regularly spaced illuminated portal frames.
  for side in [-1,1]:
   var cross = Vector3(dir.z,0,-dir.x)*side*2.9
   beam(root,a+cross+Vector3(0,1.0,0),b+cross+Vector3(0,1.0,0),0.12,COLORS[i],true)
  for k in 5:
   var p = a.lerp(b,float(k)/4.0)
   for side in [-1,1]:
    beam(root,p+Vector3(dir.z,0,-dir.x)*side*2.9,p+Vector3(dir.z,0,-dir.x)*side*2.9+Vector3(0,4.4,0),0.13,COLORS[i])
   beam(root,p+Vector3(dir.z,0,-dir.x)*2.9+Vector3(0,4.4,0),p-Vector3(dir.z,0,-dir.x)*2.9+Vector3(0,4.4,0),0.13,COLORS[i])
  text(root,NAMES[i]+(" · PHASE 2" if i>=4 else ""),C+dir*28+Vector3(0,3.8,0),COLORS[i],38,60)
  gate(i,C+dir*23,dir)
  disc(root,c+Vector3(0,0.03,0),RADIUS,0.12,GROUNDS[i],true)
  shell(root,c,RADIUS,30,COLORS[i],true)
  # Each dome's own gate arch over its door.
  var door_p = c-dir*RADIUS
  var door_s = Vector3(dir.z,0,-dir.x)*6.5
  beam(root,door_p+door_s,door_p+door_s+Vector3(0,6.5,0),0.6,COLORS[i])
  beam(root,door_p-door_s,door_p-door_s+Vector3(0,6.5,0),0.6,COLORS[i])
  beam(root,door_p+door_s+Vector3(0,6.5,0),door_p-door_s+Vector3(0,6.5,0),0.6,COLORS[i])
  text(root,NAMES[i].to_upper()+" DOME",door_p+Vector3(0,7.8,0),COLORS[i],44,60)
  var detail = Node3D.new()
  detail.name = NAMES[i].replace(" ","")+"Interior"
  root.add_child(detail)
  interiors.append(detail)
  landscape(i,detail)
  habitats(i,detail)
  if i<4:
   rich_landscape(i,detail)
   habitat_layers(i,detail)
  if i<4:
   quest_markers(i,detail)
  else:
   text(detail,"CONSERVATION PREVIEW\nMore habitats & quests in Phase 2",c+Vector3(0,4,0),Color.WHITE,40,50)
  if i<4:
   for step in 3:
    var p = local_point(i,7,-29+step*20)
    var marker = Node3D.new()
    marker.position = p
    detail.add_child(marker)
    g._fc_part(marker,g._bcone(0.2,0.4,0.5),Vector3(0,0.35,0),g._fc_glow(Color("ffda6b")))
    var label = text(marker,"",Vector3(0,1.6,0),Color("ffe599"),26,18)
    shelters.append({"node":marker,"label":label,"dome":i,"step":step})
  detail.visible = false
 # Phase 3 reserves three times the old floor area. No ocean dome or animals built yet.
 disc(root,OCEAN+Vector3(0,0.05,0),49.1,0.12,Color("538f9b"))
 text(root,"OCEAN WORLD\nPHASE 3 · FUTURE EXPANSION",OCEAN+Vector3(0,6,0),Color("a9efff"),54,120)
 for k in 24:
  var a = OCEAN+Vector3(cos(k*TAU/24),0,sin(k*TAU/24))*49.1
  var b = OCEAN+Vector3(cos((k+1)*TAU/24),0,sin((k+1)*TAU/24))*49.1
  beam(root,a+Vector3(0,1.2,0),b+Vector3(0,1.2,0),0.16,Color("d9be69"),true)
 text(root,"WORLD BIOSPHERE · LEVEL 7",ENTRY+Vector3(0,4,0),Color("d5fff0"),54,90)
 flush()

func shell(parent: Node3D,c: Vector3,r: float,h: float,col: Color,wall: bool) -> void:
 var st = SurfaceTool.new()
 st.begin(Mesh.PRIMITIVE_TRIANGLES)
 var sides = 32
 var rings = 7
 for j in rings:
  for k in sides:
   var points = []
   for v in [Vector2(k,j),Vector2(k+1,j),Vector2(k,j+1),Vector2(k+1,j+1)]:
    var t = v.y/float(rings)*PI/2
    var ang = v.x/float(sides)*TAU
    points.append(c+Vector3(cos(ang)*r*cos(t),4+h*sin(t),sin(ang)*r*cos(t)))
   for idx in [0,2,1,1,2,3]:
    st.add_vertex(points[idx])
   var frame = col.lightened(0.45)
   beam(parent,points[0],points[1],0.14,frame)
   beam(parent,points[0],points[2],0.18,frame)
   if j<6:
    beam(parent,points[0] if (j+k)%2==0 else points[1],points[3] if (j+k)%2==0 else points[2],0.11,frame)
 st.generate_normals()
 var mi = MeshInstance3D.new()
 mi.mesh = st.commit()
 mi.material_override = g._bio_glass_mat(col.lightened(0.4),0.09)
 mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
 parent.add_child(mi)
 if not wall:
  return
 var toward = (C-c).normalized()
 for k in 48:
  var u = (k+0.5)*TAU/48
  var dir = Vector3(cos(u),0,sin(u))
  # A clear door, centred on the tunnel axis: about 15 m wide, whichever way the dome faces.
  if absf(angle_difference(atan2(toward.z,toward.x),u))<deg_to_rad(11.0):
   continue
  var p = c+dir*r
  var glazing = col.lightened(0.4)
  glazing.a = 0.14
  box(parent,p+Vector3(0,2,0),Vector3(0.22,4,r*TAU/48+0.05),glazing,true,Vector3(0,-u,0))
  box(parent,p+Vector3(0,0.18,0),Vector3(0.3,0.36,r*TAU/48+0.05),Color("dce6df"),false,Vector3(0,-u,0))

func gate(i: int,p: Vector3,dir: Vector3) -> void:
 var n = Node3D.new()
 n.position = p
 n.rotation.y = atan2(dir.x,dir.z)
 root.add_child(n)
 var panels = Node3D.new()
 n.add_child(panels)
 g._fc_part(panels,g._bbox(),Vector3(0,1.3,0),g._bio_glass_mat(COLORS[i],0.25),Vector3(5.6,2.6,0.08))
 var bar = StandardMaterial3D.new()
 bar.emission_enabled = true
 g._fc_part(n,g._bbox(),Vector3(0,3,0),bar,Vector3(5.6,0.12,0.15))
 var label = text(n,"",Vector3(0,3.5,0),Color.WHITE,28,20)
 var body = StaticBody3D.new()
 var cs = CollisionShape3D.new()
 var sh = BoxShape3D.new()
 sh.size = Vector3(5.6,3,0.3)
 cs.shape = sh
 cs.position.y = 1.5
 body.collision_layer = 0
 body.collision_mask = 0
 body.add_child(cs)
 n.add_child(body)
 g.bio_gates.append({"pos":p,"dir":dir,"dist":23.0,"body":body,"panels":panels,"bar":bar,"label":label,"state":-1})

func nature(parent: Node3D,name: String,p: Vector3,scale_value: float,yaw := 0.0) -> void:
 var mesh = g._bio_nature_mesh(name)
 if mesh==null:
  return
 var key = "%d:nature:%s" % [parent.get_instance_id(),name]
 if not batches.has(key):
  batches[key] = {"parent":parent,"mesh":mesh,"mat":material(Color("d6e9f2")) if name=="nature_bush_snow" else null,"xs":[]}
 batches[key].xs.append(Transform3D(Basis(Vector3.UP,yaw)*Basis.from_scale(Vector3.ONE*scale_value),p))

func tree(parent: Node3D,p: Vector3,h: float,col: Color,style := 0) -> void:
 if style==1:
  # Clustered bamboo with branching leaf sprays; all pieces share cached meshes/materials.
  for stem in 3:
   var q = p+Vector3((stem-1)*0.28,0,stem%2*0.25)
   shape(parent,g._bcone(0.055,0.085,h),q+Vector3(0,h/2,0),Vector3.ONE,Color("538253"))
   for k in 4:
    var a = float(k)*2.4+stem
    var tip = q+Vector3(cos(a)*1.0,h*(0.48+k*0.13),sin(a))
    beam(parent,q+Vector3(0,h*(0.45+k*0.13),0),tip,0.04,Color("718a4d"))
    shape(parent,g._blow(0.7),tip,Vector3(1,0.1,0.4),Color("4f9663"),false,Vector3(0,a,0.2))
 else:
  nature(parent,"nature_acacia" if style==2 else "nature_oak2",p,h/(6.5 if style==2 else 5.5),p.x*0.41+p.z*0.17)

func landscape(i: int,parent: Node3D) -> void:
 var c = dome_c(i)
 backdrop(i,parent)
 # Each continent has its own visitor trail; animal enclosures stay unchanged.
 ground_trails(i,parent)
 var rng = RandomNumberGenerator.new()
 rng.seed = 5300+i
 for k in (65 if i==1 or i==2 else 28):
  var a = rng.randf()*TAU
  var r = rng.randf_range(26,35)
  var p = c+Vector3(cos(a),0,sin(a))*r
  var outward = (c-C).normalized()
  var across = Vector3(outward.z,0,-outward.x)
  if absf((p-c).dot(across))<7 or absf((p-c).dot(outward))<6:
   continue
  if i==2 and (p-c).dot(across)>-8 and (p-c).dot(outward)>17:
   continue # Keep the tree-fort approach clear below its raised crowns.
  if i==3:
   shape(parent,g._blow(1.0),p+Vector3(0,2,0),Vector3(3,3+rng.randf()*3,2),Color("b5d6e9"))
  else:
   tree(parent,p,rng.randf_range(4,8),[Color("859c46"),Color("76a95e"),Color("247253"),Color.WHITE,Color("80a95c"),Color("b97242"),Color("428f68")][i],1 if i==1 else (2 if i==0 else 0))
 match i:
  0:
   disc(parent,local_point(i,0,16,0.16),6.0,0.08,Color("65aaba"))
   for k in 7:
    ball(parent,local_point(i,26+k%2,-13+k*3,1.8),Vector3(3.4,2.5+k%3,2.8),Color("a88056"))
   g._fc_part(parent,g._bsph(3.5),local_point(i,0,33,14),g._fc_glow(Color("ffba75")),Vector3(1,1,0.2))
   text(parent,"SAVANNA · WATERING HOLE",local_point(i,0,25,8),Color("fff2bd"),28)
  1:
   for k in 5:
    shape(parent,g._bcone(0,5.5,11.0+k%2*4.0),local_point(i,12+k*4,19,5.5+k%2*2),Vector3.ONE,Color("7a918b"))
   for k in 4:
    box(parent,local_point(i,-26,8+k*3,0.3+k*0.35),Vector3(12-k,0.5,2.6),Color("8ba54d"))
   var p = local_point(i,0,16)
   for side in [-1,1]:
    for z in [-2,2]:
     box(parent,p+Vector3(side*3,2.2,z*1.0),Vector3(0.22,4.4,0.22),Color("a34d3a"))
   box(parent,p+Vector3(0,4.5,0),Vector3(7,0.3,5.5),Color("5a746b"))
   shape(parent,g._bcone(0,4.6,1.7),p+Vector3(0,5.3,0),Vector3(1,1,0.8),Color("406b62"))
   text(parent,"BAMBOO VALLEY · MOUNTAIN PAVILION",local_point(i,0,25,8),Color("e0ffe7"),28)
  2:
   var p = local_point(i,25,20)
   for k in 5:
    ball(parent,p+Vector3(k-2,3+k,0),Vector3(4,5,3),Color("59766c"))
   box(parent,p+Vector3(0,5,2.5),Vector3(3,9,0.1),Color("90ddeb"))
   for k in 6:
    disc(parent,local_point(i,8+k*2,-18+k*5,0.16),3.2,0.06,Color("5bb9ba"))
   # Continuous ramp to a canopy bridge; visitors can walk the whole route.
   var a = local_point(i,-9.5,-25,0.09)
   var middle = local_point(i,-9.5,-12,3.0)
   var b = local_point(i,-4,-8,5.5)
   var e = local_point(i,-4,23,5.5)
   walkway(parent,a,middle,3.0,0.0,2.0)
   walkway(parent,middle,b,3.0,2.0,2.0)
   walkway(parent,b,e,3.0,2.0,3.0)
   disc(parent,e-Vector3(0,0.15,0),3,0.3,Color("b09260"),true)
   text(parent,"RAINFOREST · CANOPY BRIDGE",local_point(i,0,-30,3),Color("ceffec"),28)
  3:
   disc(parent,local_point(i,20,14,0.15),11,0.08,Color("2e809c"))
   for k in 7:
    disc(parent,local_point(i,15+k%3*3,8+k*1.8,0.26),1.3,0.12,Color("edfaff"))
   # Cave uses a clear tunnel beneath three ice blocks, reachable from the promenade.
   for side in [-1,1]:
    box(parent,local_point(i,side*4,26,2),Vector3(2,4,7),Color("b1d5e8"),true)
   box(parent,local_point(i,0,26,4.3),Vector3(10,0.6,7),Color("d9f5ff"),true)

   text(parent,"POLAR COAST · ICE CAVE",local_point(i,0,25,8),Color("def7ff"),28)

func walkway(parent: Node3D,a: Vector3,b: Vector3,w: float,open_start := 0.0,open_end := 0.0) -> void:
 var d = b-a
 var across = Vector3(d.z,0,-d.x).normalized()
 # Slab's Y is perpendicular to the ramp, so its top follows the slope.
 var x = d.normalized()
 var z = x.cross(Vector3.UP).normalized()
 var y = z.cross(x).normalized()
 var size = Vector3(d.length()+0.3,0.22,w)
 var rot = Basis(x,y,z).get_euler()
 box(parent,(a+b)*0.5-Vector3(0,0.11,0),size,Color("b29462"),true,rot)
 if d.length()>open_start+open_end+0.05:
  for side in [-1,1]:
   beam(parent,a+d.normalized()*open_start+across*side*w/2+Vector3(0,1.1,0),b-d.normalized()*open_end+across*side*w/2+Vector3(0,1.1,0),0.12,Color("dfcd9e"),true)
func habitats(i: int,parent: Node3D) -> void:
 var ids = []
 for si in SPECIES.size():
  if int(SPECIES[si].dome)==i:
   ids.append(si)
 for k in ids.size():
  var si = ids[k]
  var side = -1 if k%2==0 else 1
  var row = k/2
  var p = local_point(i,side*18,-22+row*14)
  var r = 5.6
  if i==3 and SPECIES[si].kind=="orca":
   p = local_point(i,22,17)
   r = 7.0
  fences.append({"dome":i,"c":p,"r":r,"si":si})
  for seg in 20:
   var a = p+Vector3(cos(seg*TAU/20),0,sin(seg*TAU/20))*r
   var b = p+Vector3(cos((seg+1)*TAU/20),0,sin((seg+1)*TAU/20))*r
   beam(parent,a+Vector3(0,1.0,0),b+Vector3(0,1.0,0),0.17,Color("9cae97"),true)
   if seg%2==0:
    beam(parent,a,a+Vector3(0,1.2,0),0.12,Color("d6e5d2"))
  if SPECIES[si].zone=="swim":
   disc(parent,p+Vector3(0,0.15,0),r-0.3,0.08,Color("509daa"))
  var inward = (local_point(i,0,-22+row*14)-p).normalized()
  text(parent,SPECIES[si].name,p+inward*(r+0.3)+Vector3(0,1.8,0),Color("f6f4d7"),28,22)
  var sign = p+inward*(r+1.3)
  g.bio_hab[si] = {"type":"pen","c":p,"r":r-1.4,"rmin":0.0,"sign":sign}
  g.bio_pens.append([i,p,r])
  for n in int(SPECIES[si].n):
   spawn_animal(si,n,parent,p,r-1.5)
 # Families are visible every day; the sticker is tied to the daily birth announcement.
 if i==0 or i==3:
  var si = 17 if i==0 else 0
  var home = g.bio_hab[si]
  for k in 3:
   var a = spawn_animal(si,20+k,parent,home.c,float(home.r))
   a.node.scale = Vector3.ONE*0.42
   a.baby = true
   a.node.name = "LionCub" if i==0 else "PenguinChick"
   baby_nodes.append(a)
 if i==1 or i==2:
  var si = 20 if i==1 else 28
  var home = g.bio_hab[si]
  var a = spawn_animal(si,30,parent,home.c,float(home.r))
  a.node.scale = Vector3.ONE*0.45
  a.baby = true
  baby_nodes.append(a)
 # Rare models are original variants, attached to the proper dome, never outside a fence.
 var rare_index = [0,2,3].find(i)
 if rare_index>=0:
  var si = [17,28,0][rare_index]
  var home = g.bio_hab[si]
  var a = spawn_animal(si,50,parent,home.c,float(home.r))
  a.rare = rare_index
  a.node.name = RARES[rare_index].replace(" ","")
  a.node.visible = false
  if rare_index==2:
   a.node.scale = Vector3.ONE*0.45
  else:
   recolor(a.node,Color("f3ead5") if rare_index==0 else Color("edc45d"))
  rare_nodes.append(a)

func recolor(n: Node,col: Color) -> void:
 if n is MeshInstance3D and n.mesh!=null:
  for surface in n.mesh.get_surface_count():
   var mat = n.mesh.surface_get_material(surface)
   if mat!=null and (mat.resource_name.begins_with("World_lion") or mat.resource_name.begins_with("World_monkey")):
    n.set_surface_override_material(surface,material(col))
 for child in n.get_children():
  recolor(child,col)

func spawn_animal(si: int,k: int,parent: Node3D,p: Vector3,r: float) -> Dictionary:
 var s = SPECIES[si]
 var node = Node3D.new()
 parent.add_child(node)
 var a = {"node":node,"si":si,"kind":s.kind,"dome":s.dome,"c":p,"r":r,"phase":float(k)*1.7,"legs":[],"wings":[],"head":null,"k":k,"speed":0.8,"target":p,"feeding":false,"base_y":p.y}
 if s.kind=="butterfly":
  g._bio_make_butterfly(a)
 elif not g._bio_load_animal(a):
  # Deterministic lightweight fallback when a model is unavailable.
  g._bio_make_quad(a,{"body":Vector3(0.5,0.6,1.0),"col":COLORS[int(s.dome)],"leg":0.5,"legr":0.09,"head":0.25,"neck":0.2,"necka":0.8,"ears":0.12,"tail":0.2,"snout":Color("32291f")})
 var ang = k*2.3
 node.position = p+Vector3(cos(ang),0.1,sin(ang))*r*0.65
 a.target = node.position
 animals.append(a)
 g.bio_animals.append(a)
 return a

func quest_markers(i: int,parent: Node3D) -> void:
 for q in 3:
  for step in 3:
   var p = quest_point(i,q,step)
   var n = Node3D.new()
   n.position = p
   parent.add_child(n)
   g._fc_part(n,g._bsph(0.22),Vector3(0,0.5,0),g._fc_glow(COLORS[i]))
   var label = text(n,"",Vector3(0,1.25,0),Color.WHITE,28,18)
   markers.append({"node":n,"label":label,"dome":i,"q":q,"step":step})
   n.visible = false
   if i==1 and q==1:
    box(parent,p+Vector3(0,1.5,0),Vector3(0.1,3,0.1),Color("755942"))
    var lantern = g._fc_part(parent,g._bcone(0.3,0.3,0.7),p+Vector3(0,2.6,0),material(Color("b8643a")))
    lanterns.append({"node":lantern,"step":step})
   if i==2 and q==1:
    ball(parent,p+Vector3(0,0.18,0),Vector3(0.22,0.13,0.3),[Color("ff634d"),Color("56c9ff"),Color("ffe65c")][step])
    for side in [-1,1]:
     ball(parent,p+Vector3(side*0.2,0.1,0),Vector3(0.1,0.06,0.2),Color("6fc650"))
   if i==3 and q==1:
    disc(parent,p-Vector3(0,0.1,0),1.6,0.2,Color("eafaff"),true)
    floe_approach(parent,Vector3(p.x,0,p.z))

func quest_point(i: int,q: int,step: int) -> Vector3:
 if i==2 and q==0:
  return local_point(i,[-9.5,-4.0,-4.0][step],[-24.0,-8.0,22.0][step],[0.314,5.5,5.5][step])
 if i==3 and q==1:
  return local_point(i,0,[-14.0,0.0,14.0][step],0.22)
 if i==1 and q==0:
  return local_point(i,[-6.0,6.0,10.0][step],[-22.0,-7.0,-22.0][step])
 if i==0 and q==1:
  return local_point(i,-10.8,4.0+step*2.0)
 if i==3 and q==0:
  return local_point(i,-10.8,-24.0+step*2.0)
 if (i==0 and q==0) or (i==3 and q==2):
  return local_point(i,0,-18.0+step*14.0)
 return local_point(i,(-7.0 if q==1 else 7.0),-22.0+step*21.0)

func now() -> float:
 return test_time if test_time>=0 else Time.get_unix_time_from_system()

func today() -> String:
 return test_day if test_day!="" else g._pz_today()

func day_number(day: String) -> int:
 return int(Time.get_unix_time_from_datetime_string(day+"T00:00:00"))/86400

func feeding(i: int,t := -1.0) -> Dictionary:
 var n = now() if t<0 else t
 var offset = i*35.0
 var slot = floori((n-offset)/180.0)
 var phase = fposmod(n-offset,180.0)
 return {"slot":slot,"active":phase<25.0,"left":25.0-phase if phase<25 else 180-phase}

func rare_event(t := -1.0) -> Dictionary:
 var n = now() if t<0 else t
 var slot = floori(n/300.0)
 var rng = RandomNumberGenerator.new()
 rng.seed = slot*7919+5301
 return {"slot":slot,"kind":int(rng.randi()%3),"active":rng.randf()<0.42 and fposmod(n,300)<75}

func baby_dome(day: String) -> int:
 return posmod(day_number(day)*17+53,4)

func rank_index() -> int:
 var result = 0
 for i in 4:
  if int(state.rank_jobs)>=RANK_AT[i]:
   result = i
 return result

func rank_name() -> String:
 return RANKS[rank_index()]

func reward(amount: int,xp: int,message: String) -> void:
 g.cash += amount
 g.bonus_xp += xp
 g._feed_add(message+" · +$%d · +%d XP" % [amount,xp],"")
 g._show_toast(message+"! +$%d · +%d XP" % [amount,xp])
 changed()

func achieve(id: String,title: String,pay := 100) -> void:
 if state.ach.has(id):
  return
 state.ach[id] = title
 reward(pay,20,"Wildlife badge: "+title)

func species_mask(i: int) -> int:
 var mask = 0
 for si in SPECIES.size():
  if int(SPECIES[si].dome)==i:
   mask |= 1<<si
 return mask

func page_ready(i: int) -> bool:
 if i>=4:
  return false # Phase 2 pages cannot claim unfinished habitats or quests.
 var all_quests = true
 for q in 3:
  all_quests = all_quests and state.quests.has(str(i*3+q))
 var mask = species_mask(i)
 return (int(state.visits)&(1<<i))!=0 and (int(g.bio_seen)&mask)==mask and all_quests

func finish_passport() -> void:
 if int(state.pages)==127 and not bool(state.world):
  state.world = true
  achieve("world","World Explorer",2500)
  g._show_toast("WORLD EXPLORER! Your title and gold ring are unlocked.")

func claim_page(i: int) -> void:
 if not page_ready(i) or int(state.pages)&(1<<i):
  return
 state.pages = int(state.pages)|(1<<i)
 achieve("page_%d"%i,NAMES[i]+" Ranger",400)
 finish_passport()
 changed()
 refresh_panel()

func spot(si: int) -> void:
 if si<0 or si>=SPECIES.size() or int(g.bio_seen)&(1<<si):
  return
 g.bio_seen = int(g.bio_seen)|(1<<si)
 g._show_toast("SPOTTED: "+SPECIES[si].name+" · "+SPECIES[si].fact)
 changed()

func start_quest(i: int,q: int) -> void:
 if i>=4 or state.quests.has(str(i*3+q)):
  return
 task = i*3+q
 close_panel()
 g._show_toast(QUESTS[i][q]+" · Follow the glowing ranger markers in "+NAMES[i]+".")

func quest_step(id: int) -> int:
 return int(state.steps.get(str(id),0))

func coop_near(p: Vector3) -> bool:
 for id in g.online_peers:
  var peer = g.online_peers[id]
  if not bool(peer.get("driving",true)) and peer.has("node"):
   # Peer seen uses monotonic milliseconds, independent of the calendar/show clock.
   if Time.get_ticks_msec()/1000.0-float(peer.get("seen",0)) < g.ONLINE_TIMEOUT and peer.node.global_position.distance_to(p)<12:
    return true
 return false

func advance_quest(id: int) -> void:
 var key = str(id)
 if state.quests.has(key):
  return
 var step = quest_step(id)+1
 state.steps[key] = mini(step,3)
 if step>=3:
  state.quests[key] = true
  state.rank_jobs = int(state.rank_jobs)+1
  var i = id/3
  var q = id%3
  var coop = coop_near(g.player.position)
  reward(180+(60 if coop else 0),45,QUESTS[i][q]+(" · Friends bonus" if coop else ""))
  if coop:
   state.coop = int(state.coop)+1
   achieve("coop","Ranger Teamwork")
  achieve("first_quest","Helping Hand")
  if rank_index()>0:
   achieve("rank_%d"%rank_index(),rank_name(),200)
  task = -1
 else:
  g._show_toast("Ranger task · %d/3" % step)
 changed()

func prompt() -> String:
 if not g.place_open[1] or g.driving or g.player==null or g.paused:
  return ""
 if g.player.position.distance_to(C+Vector3(0,0.8,7))<7:
  return "BIOSPHERE PASSPORT"
 if task>=0 and active==task/3:
  var p = quest_point(active,task%3,quest_step(task))
  if g.player.position.distance_to(p+Vector3(0,0.8,0))<3:
   if task==4 and not dusk():
    return "LANTERNS · COME AT DUSK"
   return ["COUNT WILDLIFE","CHECK LOOKOUT","STAMP TRAIL"][task%3] if active==0 else ("LIGHT LANTERN" if task==4 else "RANGER TASK")
 if active>=0 and keeper_here():
  return "KEEPER: "+keeper().kind.to_upper()
 return ""

func dusk() -> bool:
 return float(g._game_hour())>=17 or float(g._game_hour())<6

func interact() -> bool:
 var label = prompt()
 if label=="":
  return false
 if label=="BIOSPHERE PASSPORT":
  open_panel()
  return true
 if task>=0 and active==task/3 and g.player.position.distance_to(quest_point(active,task%3,quest_step(task))+Vector3(0,0.8,0))<3:
  if task==4 and not dusk():
   g._show_toast("Lanterns are for dusk: Menu > Settings > Time, choose Sunset or Night.")
   return true
  if task==0 or task==11:
   var show = feeding(active)
   if not show.active:
    g._show_toast("Count arriving animals during feeding. Next show in %d seconds." % ceili(show.left))
    return true
   var arrivals = 0
   for a in animals:
    if int(a.dome)==active and not a.get("upper",false) and (task!=11 or int(a.si)==30) and bool(a.feeding) and a.node.position.distance_to(a.target)<0.6:
     arrivals += 1
   if arrivals<quest_step(task)+1:
    g._show_toast("Wait for animals to gather, then count the next arrival.")
    return true
  if task==1:
   var cubs = baby_nodes.filter(func(a):return int(a.dome)==0)
   if cubs.is_empty() or cubs[quest_step(task)%cubs.size()].node.global_position.distance_to(g.player.position)>17:
    g._show_toast("Look into the lion habitat from the viewing path to find the cub.")
    return true
  if task==3 and quest_step(task)==2:
   for a in animals:
    if int(a.si)==20:
     a["manual_feed"] = now()+30
  if task==9:
   # Chicks return to their parents before the next marker can count.
   var chicks = baby_nodes.filter(func(a):return int(a.dome)==3)
   if not chicks.is_empty():
    var a = chicks[quest_step(task)%chicks.size()]
    a["parade"] = true
    a["parent_target"] = a.c
    if a.node.position.distance_to(a.c)>0.7:
     g._show_toast("The chick is following the keeper home. Stay close and check again.")
     return true
  advance_quest(task)
  return true
 if keeper_here():
  finish_keeper()
 return true

func keeper(day := "") -> Dictionary:
 var date = today() if day=="" else day
 var rng = RandomNumberGenerator.new()
 rng.seed = day_number(date)*31+5300
 var i = int(rng.randi()%4)
 var kind = ["feed","clean","count","rescue"][int(rng.randi()%4)]
 var step = int(state.keeper_step) if state.keeper_work_day==date else 0
 return {"dome":i,"kind":kind,"p":local_point(i,7,-29+step*20),"step":step}

func keeper_here() -> bool:
 var k = keeper()
 return state.keeper_day!=today() and active==int(k.dome) and g.player.position.distance_to(k.p+Vector3(0,0.8,0))<3

func finish_keeper() -> void:
 if not keeper_here():
  return
 var day = today()
 var k = keeper()
 if state.keeper_work_day!=day:
  state.keeper_work_day = day
  state.keeper_step = 0
 state.keeper_step = int(state.keeper_step)+1
 if k.kind=="feed":
  for a in animals:
   if int(a.dome)==active and not a.has("rare"):
    a["manual_feed"] = now()+30
 elif k.kind=="rescue":
  for a in baby_nodes:
   if int(a.dome)==active:
    a["parade"] = true
    a["parent_target"] = a.c
 if int(state.keeper_step)<3:
  g._show_toast("Daily Keeper: "+k.kind+" · %d/3 · follow the next yellow marker"%int(state.keeper_step))
  changed()
  return
 if k.kind=="count":
  var count = animals.filter(func(a):return int(a.dome)==active and not a.has("rare")).size()
  g._show_toast("Keeper count: %d animals checked safely from the path."%count)
 state.streak = int(state.streak)+1 if state.keeper_last!="" and day_number(day)-day_number(state.keeper_last)==1 else 1
 state.keeper_day = day
 state.keeper_last = day
 reward(120+mini(int(state.streak),7)*25,30,"Daily Keeper · "+k.kind+" complete · %d day streak"%state.streak)
 achieve("keeper","Daily Keeper")
 if int(state.streak)>=3:
  achieve("streak","Three Day Keeper",250)
 changed()

func photo_target() -> int:
 if active<0 or g.camera==null:
  return -1
 var best = 0.992
 var selected = -1
 var camera: Camera3D = g.camera
 for a in animals:
  if int(a.dome)!=active or not a.node.is_visible_in_tree():
   continue
  var p = a.node.global_position+Vector3(0,0.65,0)
  var d = p-camera.global_position
  if d.length()>30 or d.length()<0.4 or not camera.is_position_in_frustum(p):
   continue
  var dot = -camera.global_basis.z.dot(d.normalized())
  if dot<=best:
   continue
  var ray = PhysicsRayQueryParameters3D.create(camera.global_position,p,1)
  ray.exclude = [g.player.get_rid(),g.car.get_rid()]
  if not g.get_world_3d().direct_space_state.intersect_ray(ray).is_empty():
   continue
  best = dot
  selected = int(a.si)
 return selected

func photo_capture() -> void:
 if not g.shot_on:
  return
 var si = photo_target()
 if si<0:
  return
 var key = str(si)
 var stars = 3 if SPECIES[si].kind in ["snowleopard","orca","jaguar"] else (2 if SPECIES[si].zone=="fly" else 1)
 if not state.photos.has(key):
  state.photos[key] = stars
  reward(35*stars,10,"Photo Safari: "+SPECIES[si].name+" "+"★".repeat(stars))
  achieve("photo","Photo Safari")
  if state.photos.size()>=10:
   achieve("photo10","Wildlife Photographer",300)
  changed()
func tick(delta: float) -> void:
 if g.player==null or not g.place_open[1]:
  return
 if pending_save:
  saved_delay -= delta
  if saved_delay<=0:
   pending_save = false
   g._save_progress()
 interval -= delta
 if interval>0:
  return
 var dt = 0.2
 interval = dt
 var me = g.car if g.driving else g.player
 var next = dome_at(me.position)
 if next!=active:
  active = next
  for i in interiors.size():
   interiors[i].visible = i==active
 if active>=0 and not g.paused:
  if not int(state.visits)&(1<<active):
   state.visits = int(state.visits)|(1<<active)
   achieve("visit","First Continent")
   g._show_toast("Passport visit stamp: "+NAMES[active])
   changed()
  var baby_day = today()
  if baby_dome(baby_day)==active and not state.babies.has(baby_day):
   state.babies[baby_day] = active
   reward(75,15,"Welcome Baby! "+NAMES[active]+" sticker")
   achieve("baby","Welcome Baby")
 if announced_baby_day!=today():
  announced_baby_day = today()
  g._feed_add("WELCOME BABY: a new arrival in "+NAMES[baby_dome(today())]+" today. Visit for a sticker!","")
 var rare = rare_event()
 if rare.active and int(rare.slot)!=last_rare:
  last_rare = int(rare.slot)
  g._feed_add("RARE SIGHTING: "+RARES[int(rare.kind)]+" · "+NAMES[[0,2,3][int(rare.kind)]],"")
 for f in atmospheres:
  f.node.emitting = int(f.dome)==active
  f.node.process_mode = Node.PROCESS_MODE_INHERIT if int(f.dome)==active else Node.PROCESS_MODE_DISABLED
 for a in rare_nodes:
  a.node.visible = bool(rare.active) and int(a.rare)==int(rare.kind)
  if a.node.is_visible_in_tree() and a.node.global_position.distance_to(me.position)<17 and g.camera.is_position_in_frustum(a.node.global_position):
   var key = str(rare.slot)
   if not state.rare.has(key):
    state.rare[key] = int(rare.kind)
    # Keep bounded event records rather than growing a save forever.
    if state.rare.size()>32:
     state.rare.erase(state.rare.keys()[0])
    reward(600,100,"Rare spotted: "+RARES[int(rare.kind)])
    achieve("rare","Rare Encounter",250)
 var show = feeding(maxi(active,0))
 if active>=0:
  var showkey = "%d:%d" % [active,int(show.slot)]
  if show.active and not state.shows.has(showkey) and g._bio_pass_ok() and not g.driving:
   state.shows[showkey] = true
   if state.shows.size()>32:
    state.shows.erase(state.shows.keys()[0])
   reward(45,10,NAMES[active]+" feeding show")
   achieve("feeding","Feeding Time")
 for a in animals:
  if int(a.dome)!=active or not a.node.visible or g.paused:
   continue
  animate_animal(a,dt,bool(show.active))
  var p = a.node.global_position+Vector3(0,0.7,0)
  if not a.has("rare") and me.position.distance_to(p)<17 and g.camera.is_position_in_frustum(p):
   spot(int(a.si))
 for m in markers:
  m.node.visible = active==int(m.dome) and task==int(m.dome)*3+int(m.q) and quest_step(task)==int(m.step)
  if m.node.visible:
   m.label.text = QUESTS[active][task%3]+" · %d/3" % (int(m.step)+1)
 var keeper_task = keeper()
 for station in shelters:
  station.node.visible = active==int(station.dome) and active==int(keeper_task.dome) and int(station.step)==int(keeper_task.step) and state.keeper_day!=today()
  if station.node.visible:
   station.label.text = "DAILY KEEPER · "+keeper_task.kind.to_upper()+" · %d/3"%(int(keeper_task.step)+1)
 for l in lanterns:
  if int(state.steps.get("4",0))>int(l.step):
   l.node.material_override = g._fc_glow(Color("ffd283"))
 if g.my_ring!=null:
  g.my_ring.set_meta("world_explorer",bool(state.world))
 if hud_button==null:
  var layer = CanvasLayer.new()
  layer.layer = 4
  g.add_child(layer)
  hud_button = g._button("PASSPORT",open_panel)
  layer.add_child(hud_button)
  hud_button.position = Vector2(12,155)
  hud_button.custom_minimum_size = Vector2(150,40)
  safari_hint = Label.new()
  safari_hint.position = Vector2(12,202)
  safari_hint.add_theme_color_override("font_shadow_color",Color.BLACK)
  safari_hint.add_theme_constant_override("shadow_offset_x",2)
  safari_hint.add_theme_constant_override("shadow_offset_y",2)
  layer.add_child(safari_hint)
 var width = g.get_viewport().get_visible_rect().size.x
 hud_button.position = Vector2(maxf(180,width*0.5-90),156)
 safari_hint.position = hud_button.position+Vector2(0,46)
 var nearby = me.position.distance_to(C)<200
 hud_button.visible = nearby and not g.paused and not g.shot_on
 safari_hint.visible = hud_button.visible
 if active>=0:
  safari_hint.text = NAMES[active]+" · "+rank_name()+"\n"+("Feeding now!" if show.active else "Feeding in %ds" % ceili(show.left))
  if task>=0:
   safari_hint.text += "\n"+QUESTS[task/3][task%3]+" · %d/3"%quest_step(task)
 else:
  safari_hint.text = "World Biosphere · Visit the ranger desk"
 if g.shot_on:
  # A centered animal is captured on the normal Photo-mode tap to return.
  safari_hint.visible = false

func animate_animal(a: Dictionary,delta: float,show: bool) -> void:
 var node: Node3D = a.node
 a.phase = float(a.phase)+delta
 var ph = float(a.phase)
 var centre: Vector3 = a.c
 var radius = float(a.r)
 if a.get("upper_motion","")=="glide":
  var angle = ph*0.25+int(a.k)*1.7
  node.position = centre+Vector3(cos(angle)*radius*0.72,3+sin(ph*0.8)*0.4,sin(angle)*radius*0.72)
  var flight_dir = Vector3(-sin(angle),0,cos(angle))
  node.rotation.y = atan2(-flight_dir.x,-flight_dir.z)
  node.rotation.z = sin(ph*0.5+int(a.k))*0.1
  for leg in a.legs:
   leg.rotation.x = 0.55
  for k in a.wings.size():
   a.wings[k].rotation.z = sin(ph*4)*0.45*(1 if k==0 else -1)
  return
 if a.get("upper_motion","")=="hang":
  node.position = centre+Vector3(sin(ph*0.4)*0.12,-0.15,cos(ph*0.3)*0.12)
  node.rotation.x = PI
  return
 if a.get("upper_motion","")=="perch":
  node.position = centre+Vector3(0,0.12,0)
  node.rotation.y = sin(ph*0.35+int(a.k))*0.12
  return
 show = show or float(a.get("manual_feed",0))>now()
 a.feeding = show
 if a.get("parade",false):
  a.target = a.get("parent_target",centre)
 elif show:
  var toward = (dome_c(int(a.dome))-centre).normalized()
  a.target = centre+toward*radius*0.6+Vector3(0,0.1,0)
 elif node.position.distance_to(a.target)<0.3:
  var t = ph*0.7+int(a.k)*2.2
  a.target = centre+Vector3(cos(t),0.1,sin(t))*radius*0.75
 var d: Vector3 = a.target-node.position
 d.y = 0
 var moving = d.length()>0.2
 if moving:
  node.position += d.normalized()*minf(delta*(1.6 if show else 0.65),d.length())
  node.rotation.y = lerp_angle(node.rotation.y,atan2(-d.x,-d.z),delta*3)
 var zone = "fly" if a.get("upper_motion","")=="glide" else SPECIES[int(a.si)].zone
 var base = float(a.get("base_y",0))
 node.position.y = base+(0.16 if zone=="swim" or a.kind=="penguin" else 0.1)
 if zone=="fly":
  node.position.y = base+3.0+0.4*sin(ph*1.3)
 for k in a.legs.size():
  a.legs[k].rotation.x = sin(ph*4.2)*0.28*(1 if k%2==0 else -1) if moving else 0
 for k in a.wings.size():
  a.wings[k].rotation.z = sin(ph*7)*0.4*(1 if k==0 else -1)

func reset_stick() -> void:
 # The panel swallows the finger-up of the joystick touch; without this the joystick ignores new touches.
 g.stick = Vector2.ZERO
 g.touch_id = -1
 g.mouse_stick = false
 g.joystick.queue_redraw()

func close_panel() -> void:
 if panel!=null:
  panel.hide()
 g.paused = false
 reset_stick()

func open_panel() -> void:
 if g.menu!=null:
  g.menu.hide()
 if panel==null:
  var layer = CanvasLayer.new()
  layer.layer = 30
  g.add_child(layer)
  panel = PanelContainer.new()
  panel.add_theme_stylebox_override("panel",g._panel(Color("152f32"),18))
  layer.add_child(panel)
  var scroll = ScrollContainer.new()
  panel.add_child(scroll)
  scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
  panel_body = VBoxContainer.new()
  panel_body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
  panel_body.add_theme_constant_override("separation",10)
  scroll.add_child(panel_body)
 var size = g.get_viewport().get_visible_rect().size
 panel.position = Vector2(24,24)
 panel.size = size-Vector2(48,48)
 panel.show()
 g.paused = true
 reset_stick()
 refresh_panel()

func ui_label(value: String,color := Color.WHITE,size := 20) -> void:
 var n = Label.new()
 n.text = value
 n.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
 n.add_theme_color_override("font_color",color)
 n.add_theme_font_size_override("font_size",size)
 panel_body.add_child(n)

func ui_button(value: String,fn: Callable) -> void:
 var n = g._button(value,fn)
 n.custom_minimum_size.y = 44
 panel_body.add_child(n)

func select_page(i: int) -> void:
 page = i
 refresh_panel()

func forget_buttons(n: Node) -> void:
 # Freed buttons must leave the game's touch-button list, or every later screen touch errors out.
 if n is Button:
  g.touch_buttons.erase(n)
 for c in n.get_children():
  forget_buttons(c)

func refresh_panel() -> void:
 if panel_body==null or not panel.visible:
  return
 for child in panel_body.get_children():
  forget_buttons(child)
  panel_body.remove_child(child)
  child.queue_free()
 ui_label("WORLD BIOSPHERE · PASSPORT",Color("bdffe1"),28)
 ui_button("CLOSE · BACK TO CITY",close_panel)
 ui_label(rank_name()+" · %d ranger quests · %d/7 continent badges" % [int(state.rank_jobs),g._bits(int(state.pages))])
 var choices = HFlowContainer.new()
 panel_body.add_child(choices)
 for i in 7:
  var b = g._button(NAMES[i]+(" ✓" if int(state.pages)&(1<<i) else ""),select_page.bind(i))
  choices.add_child(b)
 ui_label(NAMES[page].to_upper(),COLORS[page],26)
 if page<4:
  ui_label(["LAYERS · grassland, kopje ledges and flamingo flight zone","LAYERS · bamboo forest, snow-leopard cliffs, red-panda trees and crane flight zone","LAYERS · forest floor, sloth branches, monkey canopy and macaw sky habitat","LAYERS · frozen shore, raised penguin colony, albatross cliffs and flight zone"][page],Color("b4e5d6"),18)
 ui_button("FREE ENTRY ✓",g._bio_buy_pass)
 var mask = species_mask(page)
 var count = g._bits(int(g.bio_seen)&mask)
 var completed = 0
 if page<4:
  for q in 3:
   completed += 1 if state.quests.has(str(page*3+q)) else 0
 ui_label("VISIT %s   ·   WILDLIFE %d/%d   ·   QUESTS %d/3" % ["STAMPED" if int(state.visits)&(1<<page) else "NOT YET",count,g._bits(mask),completed])
 if page>=4:
  ui_label("Phase 2 preview. Existing conservation animals remain here so older spotting progress stays useful. Full habitat quests and page completion open in Phase 2. Ocean World is reserved for Phase 3.")
 else:
  for q in 3:
   var id = page*3+q
   ui_button(QUESTS[page][q]+(" · DONE ✓" if state.quests.has(str(id)) else " · START / CONTINUE %d/3"%quest_step(id)),start_quest.bind(page,q))
  ui_button("CONTINENT BADGE CLAIMED ✓" if int(state.pages)&(1<<page) else ("CLAIM CONTINENT BADGE +$400" if page_ready(page) else "PAGE BADGE · visit, spot all wildlife & finish 3 quests"),claim_page.bind(page))
  ui_label("Lantern Path: visit at Sunset or Night. Count quests: wait for a feeding show. Penguin Parade: help a chick return before checking the next marker. All markers are reached from visitor paths.",Color("b4d8c9"),17)
 var show = feeding(page)
 ui_label("FEEDING: "+("SHOW NOW · +$45 for attending" if show.active else "next in %d seconds" % ceili(show.left))+" · park clock keeps running in every day/night setting")
 ui_label("PHOTO SAFARI · Tap the camera icon, center an animal from the path, then tap to take the photo and return. Avoid walls blocking the view.",Color("b1e6f7"))
 for si in SPECIES.size():
  if int(SPECIES[si].dome)!=page:
   continue
  ui_label(("✓ " if int(g.bio_seen)&(1<<si) else "○ ")+SPECIES[si].name+" · Photo "+("★".repeat(int(state.photos[str(si)])) if state.photos.has(str(si)) else "—"),Color("fff0c4"),18)
 var k = keeper()
 ui_label("DAILY KEEPER · "+k.kind.capitalize()+" · "+NAMES[int(k.dome)]+(" · DONE ✓" if state.keeper_day==today() else " · yellow marker by the dome entrance")+"\nStreak: %d days. Consecutive days add a bonus; missing a day resets the streak, not your badges."%int(state.streak))
 ui_label("TODAY'S BABY · "+NAMES[baby_dome(today())]+" · visit for a Welcome Baby sticker. Rare sightings appear in the city feed. Complete quests near a friend on foot for +$60.")
 ui_label("WILDLIFE BADGES · %d earned"%state.ach.size(),Color("ffe09b"),22)
 for id in state.ach:
  ui_label("✓ "+str(state.ach[id]),Color("d2e8bb"),17)
 ui_label("Full seven-page passport: World Explorer title + gold ring. Phase 1 includes four quest pages; remaining pages arrive in Phase 2.")
func smoke() -> void:
 var keep = {"state":state.duplicate(true),"seen":g.bio_seen,"cash":g.cash,"xp":g.bonus_xp,"pass":g.bio_pass_day,"player":g.player.transform,"driving":g.driving,"paused":g.paused,"active":active,"task":task,"day":test_day,"time":test_time,"hour":g.day_hour_override,"peers":g.online_peers.duplicate(),"shot":g.shot_on}
 reset_state()
 g.driving = false
 g.paused = false
 g.bio_pass_day = today()
 g._bio_gates_update()
 assert(interiors.size()==7 and g.bio_gates.size()==7,"Seven domes and pass gates")
 smoke_entry_movement()
 assert(OCEAN.distance_to(C)>ORBIT+RADIUS+49.1,"Ocean World has a separate 3x area reservation")
 assert(g.GA_C==Vector3(-330,0,-600),"Galleria stays in place")
 var original = ["penguin","polarbear","arcticfox","owl","deer","rabbit","duck","butterfly","giraffe","zebra","flamingo","parrot","moose","raccoon","beaver","goose"]
 for si in 16:
  assert(SPECIES[si].kind==original[si],"Existing spotting bits stay stable")
 g.bio_seen = 0xa55a
 var prior = ConfigFile.new()
 load_state(prior)
 assert(g.bio_seen==0xa55a,"Old save migration preserves every spotted bit")
 for i in 7:
  var c = dome_c(i)
  assert(g._place_lock_of("World Biosphere")==1,"Directions and level lock identify World Biosphere")
  assert(Vector2(c.x-g.GA_C.x,c.z-g.GA_C.z).length()>200,"Campus clears Galleria")
  for j in range(i+1,7):
   assert(c.distance_to(dome_c(j))>RADIUS*2+15,"Dome shells do not overlap")
  # Traverse the full spoke and central promenade, with paid gates physically open.
  for k in 35:
   var p = C.lerp(c,float(k)/34.0)+Vector3(0,1.0,0)
   assert(not g._blocked_at(p,0.3),"Walkable spoke %d at %s by %s" % [i,p,g._blocker(p,0.3)])
  var trail = ground_route(i)
  for segment in range(1,trail.size()):
   var a: Vector3 = trail[segment-1]
   var b: Vector3 = trail[segment]
   for sample in 15:
    var p = a.lerp(b,float(sample)/14)+Vector3(0,0.9,0)
    assert(not g._blocked_at(p,0.25),"Clear unique visitor trail %d at %s" % [i,p])
  g.player.position = c+Vector3(0,0.9,0)
  interval = 0
  tick(0.2)
  assert(active==i and interiors[i].visible,"Current dome shown")
  for j in 7:
   assert(interiors[j].visible==(j==i),"Only current dome interior is drawn")
  var ground = PhysicsRayQueryParameters3D.create(c+Vector3(0,2,0),c-Vector3(0,1,0),1)
  ground.exclude = [g.player.get_rid(),g.car.get_rid()]
  assert(not g.get_world_3d().direct_space_state.intersect_ray(ground).is_empty(),"Solid dome floors")
 for f in fences:
  assert(f.c.distance_to(dome_c(int(f.dome)))+float(f.r)<RADIUS-0.2,"Fenced animal habitat stays inside dome")
  for a in animals:
   if int(a.si)==int(f.si) and not a.get("upper",false):
    for k in 20:
     animate_animal(a,0.2,false)
    var p = a.node.position-a.c
    assert(Vector2(p.x,p.z).length()<float(f.r)-0.6,"Animals stay behind fences")
 var upper_count = 0
 for a in animals:
  if not a.get("upper",false):
   continue
  upper_count += 1
  for step in 50:
   animate_animal(a,0.2,false)
  var rel = a.node.position-a.c
  assert(Vector2(rel.x,rel.z).length()<=float(a.r)+0.5,"Upper wildlife stays within its habitat")
  assert(a.node.position.y>float(a.base_y)-1.5,"Upper wildlife stays on its layer")
  var c = dome_c(int(a.dome))
  assert(Vector2(a.node.position.x-c.x,a.node.position.z-c.z).length()<RADIUS-2,"Flying wildlife remains inside its glass dome")
 assert(upper_count>=24,"Four domes have populated upper habitat layers")
 # Every quest goes through the same proximity and interaction actions as play.
 g.bio_seen = (1<<SPECIES.size())-1
 for i in 4:
  active = i
  g.player.position = dome_c(i)+Vector3(0,0.9,0)
  for q in 3:
   var id = i*3+q
   start_quest(i,q)
   if id==4:
    g.day_hour_override = 13
    g.player.position = quest_point(i,q,0)+Vector3(0,0.8,0)
    assert(interact() and quest_step(id)==0,"Lanterns require dusk")
   g.day_hour_override = 18.5
   test_time = 18000+i*35+20
   for a in animals:
    if int(a.dome)==i:
     animate_animal(a,0.2,true)
     a.node.position = a.target
   for k in 3:
    var target = quest_point(i,q,k)
    assert(not g._blocked_at(target+Vector3(0,0.85,0),0.25),"Quest marker can be reached: %d at %s"%[id,target])
    g.player.position = target+Vector3(0,0.8,0)
    if id==9:
     for a in baby_nodes:
      if int(a.dome)==3:
       a.node.position = a.c
    assert(interact(),"Quest interaction available")
    assert(quest_step(id)==k+1,"Quest step advances %d: %d" % [id,k])
   assert(state.quests.has(str(id)),"Quest complete")
   var cash = g.cash
   advance_quest(id)
   assert(g.cash==cash,"Quest reward once")
  claim_page(i)
  assert(int(state.pages)&(1<<i),"Passport page can complete")
  var cash = g.cash
  claim_page(i)
  assert(g.cash==cash,"Passport stamp and reward once")
 assert(rank_index()==3,"Twelve quests earn Wildlife Legend")
 var feed = feeding(0,18020)
 assert(feed.active and not feeding(0,18026).active and feeding(0,18180).slot==int(feed.slot)+1,"Feeding schedule boundaries")
 test_time = 18020
 active = 0
 g.player.position = dome_c(0)+Vector3(0,0.8,0)
 interval = 0
 tick(0.2)
 var cash = g.cash
 interval = 0
 tick(0.2)
 assert(g.cash==cash,"Feeding show attendance pays once")
 for day in ["2026-11-20","2026-11-21","2026-11-22"]:
  test_day = day
  var k = keeper()
  active = int(k.dome)
  for step in 3:
   g.player.position = keeper().p+Vector3(0,0.8,0)
   finish_keeper()
  assert(state.keeper_day==day,"Daily task completes")
  var cash2 = g.cash
  finish_keeper()
  assert(g.cash==cash2,"Keeper only pays once daily")
 assert(int(state.streak)==3,"Consecutive keeper days build streak")
 test_day = "2026-11-24"
 active = int(keeper().dome)
 for step in 3:
  g.player.position = keeper().p+Vector3(0,0.8,0)
  finish_keeper()
 assert(int(state.streak)==1,"Missing a day resets streak only")
 # A recent nearby on-foot peer enables co-op; stale/distant/driving peers do not.
 var peer_node = Node3D.new()
 g.add_child(peer_node)
 peer_node.position = g.player.position+Vector3(3,0,0)
 g.online_peers = {"wb_coop":{"node":peer_node,"driving":false,"seen":Time.get_ticks_msec()/1000.0}}
 assert(coop_near(g.player.position),"Nearby friends co-op")
 g.online_peers.wb_coop.seen = -100
 assert(not coop_near(g.player.position),"Stale peers cannot earn co-op")
 g.online_peers = keep.peers
 peer_node.queue_free()
 # Aim the real camera at a real animal. A wall blocks detection, and off-center targets do not count.
 var camera_keep = g.camera.global_transform
 active = 0
 for i in 7:
  interiors[i].visible = i==active
 var a = animals.filter(func(an):return int(an.si)==8)[0]
 var inward = (dome_c(0)-a.c).normalized()
 g.camera.global_position = a.c+inward*9+Vector3(0,3,0)
 g.camera.look_at(a.node.global_position+Vector3(0,0.65,0))
 assert(photo_target()>=0,"Centered animal photo detection")
 g.shot_on = true
 photo_capture()
 assert(not state.photos.is_empty(),"Safari photos enter album")
 var photos = state.photos.size()
 var photo_cash = g.cash
 photo_capture()
 assert(state.photos.size()==photos and g.cash==photo_cash,"Photo rewards once")
 g.camera.rotate_y(PI)
 assert(photo_target()==-1,"Off-center animal is not photographed")
 g.camera.global_transform = camera_keep
 # Future completion logic is available but Phase 2 pages cannot be claimed early.
 state.pages = 127
 finish_passport()
 assert(state.world and state.ach.has("world"),"Full passport title and gold ring")
 var world_cash = g.cash
 finish_passport()
 assert(g.cash==world_cash,"World Explorer reward once")
 var saved = ConfigFile.new()
 save_state(saved)
 var expected = state.duplicate(true)
 reset_state()
 load_state(saved)
 assert(state==expected,"Passport, photos, quest steps, rank and daily state persist")
 # Restore all player state; the external test wrapper restores the full original save bytes.
 state = keep.state
 g.bio_seen = keep.seen
 g.cash = keep.cash
 g.bonus_xp = keep.xp
 g.bio_pass_day = keep.pass
 g.player.transform = keep.player
 g.driving = keep.driving
 g.paused = keep.paused
 g.shot_on = keep.shot
 active = keep.active
 task = keep.task
 test_day = keep.day
 test_time = keep.time
 g.day_hour_override = keep.hour
 pending_save = false
 g._bio_gates_update()
 for i in 7:
  interiors[i].visible = i==active
 print("WORLD_BIOSPHERE_OK: seven walkable domes, fenced wildlife, 12 quest flows, passport rewards once, feeding clock, photos, keeper streak, co-op, legacy save bits")

func screenshots() -> void:
 g.place_test_level = 40
 g._places_refresh()
 g.paused = false
 g.driving = false
 g.cam_lock = true
 g.set_process(false)
 g.set_physics_process(false)
 g.world_env_res.fog_enabled = false
 g.player.position = C+Vector3(0,0.9,0)
 g.bio_pass_day = today()
 for child in g.get_children():
  if child is CanvasLayer or child is Control:
   child.hide()
 for i in 7:
  active = i
  for f in atmospheres:
   f.node.emitting = int(f.dome)==i
   f.node.process_mode = Node.PROCESS_MODE_INHERIT if int(f.dome)==i else Node.PROCESS_MODE_DISABLED
  for j in 7:
   interiors[j].visible = j==i
  for animal in animals:
   if int(animal.dome)==i:
    animate_animal(animal,2.0,false)
  g.player.position = dome_c(i)+Vector3(0,0.9,0)
  g.camera.global_position = local_point(i,0,-30,2.4)
  g.camera.look_at(local_point(i,0,8,3.5))
  await g._save_shot(NAMES[i].to_lower().replace(" ","-"))
 # Views from the actual upper visitor stages show the occupied vertical layers.
 g.player.hide()
 var viewpoints = [Vector3(9.5,6.2,20),Vector3(8.5,8.0,16),Vector3(15.5,7.0,21),Vector3(-28,9.8,11)]
 var targets = [Vector3(-10,10,4),Vector3(-14,13,3),Vector3(10,13,-5),Vector3(-15,15,14)]
 for i in 4:
  for j in 7:
   interiors[j].visible = j==i
  g.camera.fov = 70
  g.camera.global_position = local_point(i,viewpoints[i].x,viewpoints[i].z,viewpoints[i].y)
  g.camera.look_at(local_point(i,targets[i].x,targets[i].z,targets[i].y))
  await g._save_shot(NAMES[i].to_lower().replace(" ","-")+"-layers")
 for detail in interiors:
  detail.hide()
 g.camera.global_position = C+Vector3(5,270,310)
 g.camera.far = 1200
 g.world_env_res.fog_enabled = false
 g.camera.look_at(C)
 await g._save_shot("campus")
 page = 0
 open_panel()
 await g._save_shot("passport")
 print("WORLD_BIOSPHERE_SHOTS_OK")

func backdrop(i: int,parent: Node3D) -> void:
 # Each active dome has its own interior sky. Other interiors (including this sky) are hidden.
 var st = SurfaceTool.new()
 st.begin(Mesh.PRIMITIVE_TRIANGLES)
 var c = dome_c(i)
 for j in 8:
  for k in 32:
   var ps = []
   for q in [Vector2(k,j),Vector2(k+1,j),Vector2(k,j+1),Vector2(k+1,j+1)]:
    var a = q.x*TAU/32
    var t = q.y*PI/16
    ps.append(c+Vector3(cos(a)*40*cos(t),3+35*sin(t),sin(a)*40*cos(t)))
   for n in [0,2,1,1,2,3]:
    st.add_vertex(ps[n])
 st.generate_normals()
 var sh = Shader.new()
 sh.code = "shader_type spatial; render_mode unshaded,cull_disabled; uniform vec4 low:source_color; uniform vec4 high:source_color; uniform bool aurora=false; varying vec3 p; void vertex(){p=VERTEX;} void fragment(){vec3 col=mix(low.rgb,high.rgb,smoothstep(3.0,32.0,p.y)); if(aurora && p.y>12.0){float wave=sin(p.x*0.22+p.z*0.13+TIME*0.3+p.y*0.17); col+=vec3(0.12,0.7,0.5)*pow(max(0.0,wave),14.0)*smoothstep(12.0,26.0,p.y);} ALBEDO=col;}"
 var mat = ShaderMaterial.new()
 mat.shader = sh
 mat.set_shader_parameter("low",[Color("e1a76d"),Color("b0c9bd"),Color("689d8a"),Color("658bb0"),Color("b5c3ac"),Color("b2c4bc"),Color("83c8cf")][i])
 mat.set_shader_parameter("high",[Color("77768b"),Color("73969b"),Color("2d655c"),Color("172946"),Color("6e9d9d"),Color("5a8894"),Color("4b8caa")][i])
 mat.set_shader_parameter("aurora",i==3)
 var mi = MeshInstance3D.new()
 mi.mesh = st.commit()
 mi.material_override = mat
 mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
 parent.add_child(mi)

func smoke_entry_movement() -> void:
 # Point probes above floor level missed the old 14 cm lips. Move the complete
 # player capsule through each entrance in both directions, at all three speeds.
 var player: CharacterBody3D = g.player
 var keep = {"transform":player.transform,"velocity":player.velocity,"board":g.board_on,"run":g.run_on,"shape_disabled":player.get_child(0).disabled,"pass":g.bio_pass_day}
 player.get_child(0).disabled = false
 for mode in ["walk","run","board"]:
  g.board_on = mode=="board"
  g.run_on = mode=="run"
  var speed = g._walk_speed()
  # A legacy paid pass still allows access; the current free-entry policy is unchanged.
  g.bio_pass_day = today()
  g._bio_gates_update()
  walk_route(mode+" hub",[C+Vector3(0,0,36),C+Vector3(0,0.09,12)],speed)
  for i in 7:
   var c = dome_c(i)
   walk_route(mode+" "+NAMES[i],[C+Vector3(0,0.09,0),c+Vector3(0,0.09,0)],speed)
  for i in 7:
   walk_route(mode+" visitor trail "+NAMES[i],ground_route(i),speed)
  walk_route(mode+" canopy",[local_point(2,-9.5,-25,0.09),local_point(2,-9.5,-12,3.0),local_point(2,-4,-8,5.5),local_point(2,-4,23,5.5),local_point(2,15.5,23,5.5)],speed)
  walk_route(mode+" safari lookout",[local_point(0,9.5,-25,0.09),local_point(0,9.5,-3,4.5),local_point(0,9.5,24,4.5),local_point(0,7,24,4.5)],speed)
  walk_route(mode+" cloud forest",asia_route(),speed)
  walk_route(mode+" glacier climb",antarctic_route(),speed)

 g.bio_pass_day = keep.pass
 g.board_on = keep.board
 g.run_on = keep.run
 player.transform = keep.transform
 player.velocity = keep.velocity
 player.get_child(0).disabled = keep.shape_disabled
 g._bio_gates_update()
 print("WORLD_BIOSPHERE_ENTRY_OK: hub, seven distinct visitor trails, safari lookout, rain-vortex terrace, tree fort and glacier summit; both directions, walk/run/hoverboard")

func walk_route(label: String,points: Array,speed: float) -> void:
 var player: CharacterBody3D = g.player
 for reverse in [false,true]:
  var route = points.duplicate()
  if reverse:
   route.reverse()
  player.position = route[0]+Vector3(0,0.7,0)
  player.velocity = Vector3.ZERO
  for segment in range(1,route.size()):
   var target: Vector3 = route[segment]
   var dt = maxf(g.get_physics_process_delta_time(),0.001)
   var steps = ceili(player.position.distance_to(target)/speed/dt)*3+120
   for step in steps:
    var offset = Vector3(target.x-player.position.x,0,target.z-player.position.z)
    if offset.length()<0.45:
     break
    var dir = offset.normalized()
    player.velocity = Vector3(dir.x*speed,player.velocity.y-24*dt,dir.z*speed)
    player.move_and_slide()
   var left = Vector2(player.position.x-target.x,player.position.z-target.z).length()
   var obstacle = ""
   for k in player.get_slide_collision_count():
    var hit = player.get_slide_collision(k)
    obstacle += "%s at %s normal %s; " % [hit.get_collider().get_path(),hit.get_position(),hit.get_normal()]
   assert(left<0.6,"Entry movement blocked: %s reverse=%s segment=%d left=%.2f by %s"%[label,reverse,segment,left,obstacle])
   # At a fast downhill bend the board can briefly be above the landing.
   # Brake and let the real capsule settle; an unsupported platform still fails.
   for settle in 45:
    player.velocity = Vector3(0,player.velocity.y-24*dt,0)
    player.move_and_slide()
   assert(absf(player.position.y-target.y-0.7)<0.4,"Route floor height: %s reverse=%s segment=%d position=%s floor=%s velocity=%s" % [label,reverse,segment,player.position,target,player.velocity])

func rich_landscape(i: int,parent: Node3D) -> void:
 # Match the older Biosphere's planted conservatory look, with all vegetation
 # instanced under the current dome's interior rather than drawn across the campus.
 var centre = dome_c(i)

 var rng = RandomNumberGenerator.new()
 rng.seed = 54030+i
 for k in 360:
  var p = local_point(i,rng.randf_range(-34,34),rng.randf_range(-32,32),0.1)
  var c = dome_c(i)
  if Vector2(p.x-c.x,p.z-c.z).length()>RADIUS-2 or not planting_clear(i,p):
   continue
  var plants = ["nature_grass_dry","nature_fern","nature_fern","nature_bush_snow"]
  var shrub = ["nature_bush_dry","nature_bush_flower","nature_bush","nature_bush_snow"]
  nature(parent,shrub[i] if k%3==0 else plants[i],p,rng.randf_range(0.65,1.3),rng.randf()*TAU)
  var outward = (c-C).normalized()
  var across = Vector3(outward.z,0,-outward.x)
  var tree_clear = absf((p-c).dot(across))>10 and absf((p-c).dot(outward))>7 and (p-c).length()>19 and not (i==2 and x_layer(p,i)>-8 and z_layer(p,i)>17)
  if i==1 and k%9==0 and tree_clear:
   nature(parent,"nature_cherry" if k%2==0 else "nature_cherry2",p,0.8+rng.randf()*0.4,rng.randf()*TAU)
  if i==2 and k%15==0 and tree_clear:
   nature(parent,"nature_oak",p,1.4+rng.randf()*0.4,rng.randf()*TAU)
 for side in [-1,1]:
  for z in range(-30,31,5):
   var p = local_point(i,side*3.3,z,0.1)
   if not planting_clear(i,p):
    continue
   nature(parent,["nature_bush_dry","nature_bush_flower","nature_fern","nature_bush_snow"][i],p,0.7,float(z)*0.4)
 if i==0:
  africa_lookout(parent)
  for side in [-1,1]:
   for z in [-18,0,18]:
    nature(parent,"nature_acacia",local_point(i,side*29,z,0.1),1.15,float(z)*0.1)
 elif i==1:
  asia_rainwalk(parent)
  soft_mist(i,parent,local_point(i,25,19,7),Vector3(5,1,3))
 elif i==2:
  # A second canopy span brings the player next to the large waterfall.
  var a = local_point(i,-4,23,5.5)
  var b = local_point(i,15.5,23,5.5)
  walkway(parent,a,b,3.0,3.0,0.0)
  tree_fort(parent)
  glass_edge(parent,local_point(i,-4,23,5.5),local_point(i,15.5,23,5.5),3.0,COLORS[i],3.0,0.0)
  waterfall(i,parent,local_point(i,24,18,0.2),5.0,19.0)
  soft_mist(i,parent,local_point(i,24,18,1),Vector3(3,0.4,2))
  for k in 3:
   tall_tree(parent,local_point(i,-22+k*8,23,0.1),2.0+k*0.1,4.0,"nature_oak")
 elif i==3:
  # An ice mountain is a sculpted mass, rather than a bare flat courtyard.
  var p = local_point(i,-20,16)
  for k in 5:
   var q = p+Vector3((k-2)*2.1,0,k%2*1.4)
   shape(parent,g._bcone(0.2,3.8,8.0+k%3*2.0),q+Vector3(0,4.0+k%3,0),Vector3.ONE,Color("bcdeed"))
  antarctic_spiral(parent)
  for k in 7:
   # Antarctic planting is replaced by frost-covered rock and snow banks.
   var q = local_point(i,-30+k*9,28,0.3)
   shape(parent,g._blow(1.0),q,Vector3(1.8,0.65,1.4),Color("f1f8fc"))

func planting_clear(i: int,p: Vector3) -> bool:
 var c = dome_c(i)
 var forward = (c-C).normalized()
 var side = Vector3(forward.z,0,-forward.x)
 var rel = p-c
 var x = rel.dot(side)
 var z = rel.dot(forward)
 var trails = ground_route(i)
 for k in range(1,trails.size()):
  var a: Vector3 = trails[k-1]
  var b: Vector3 = trails[k]
  var ab = b-a
  var t = clampf((p-a).dot(ab)/ab.length_squared(),0,1)
  if p.distance_to(a+ab*t)<2.8:
   return false
 # Do not put bushes on a quest marker, keeper station, elevated ramp or sign viewing spot.
 for q in 3:
  for step in 3:
   if p.distance_to(quest_point(i,q,step))<2:
    return false
 if i==0 and absf(x-9.5)<2.0 and z>-26 and z<25:
  return false
 if i==2 and (absf(x+4)<2.0 or absf(x+9.5)<2.0):
  return false
 for step in 3:
  if p.distance_to(local_point(i,7,-29+step*20))<2:
   return false
 for f in fences:
  if int(f.dome)==i and p.distance_to(f.c)>float(f.r) and p.distance_to(f.c)<float(f.r)+1.8:
   return false
 return true

func rain_ring(parent: Node3D) -> void:
 var i = 1
 var centre = local_point(i,0,16)
 var radius = 8.5
 var height = 6.0
 var toward = (dome_c(i)-C).normalized()
 var right = Vector3(toward.z,0,-toward.x)
 var join = local_point(i,-radius,16,height)
 # Segmented terrace with pale supporting columns and transparent, colored balustrades.
 for k in 32:
  var a = centre+right*cos(k*TAU/32)*radius+toward*sin(k*TAU/32)*radius+Vector3(0,height,0)
  var b = centre+right*cos((k+1)*TAU/32)*radius+toward*sin((k+1)*TAU/32)*radius+Vector3(0,height,0)
  var d = (b-a).normalized()
  var across = Vector3(d.z,0,-d.x)
  var x = d
  var z = x.cross(Vector3.UP).normalized()
  var y = z.cross(x)
  box(parent,(a+b)*0.5-Vector3(0,0.13,0),Vector3(a.distance_to(b)+0.2,0.26,2.6),Color("e1e8df"),true,Basis(x,y,z).get_euler())
  # Leave an unrailed landing opening on the near side of the ring.
  if (a.lerp(b,0.5)-join).length()>2.4:
   glass_edge(parent,a,b,2.6,COLORS[i])
  if k%4==0:
   beam(parent,Vector3(a.x,0.1,a.z),a-Vector3(0,0.13,0),0.28,Color("e3e9e2"))
   var ornament = a+across*0.75
   nature(parent,"nature_bush_flower" if i==1 else ("nature_bush_snow" if i==3 else "nature_bush_dry"),ornament,0.45,float(k))
 text(parent,"CLOUD WATERFALL TERRACE",centre+Vector3(0,height+2.3,0),Color("f0fff7"),28,50)

func glass_edge(parent: Node3D,a: Vector3,b: Vector3,width: float,col: Color,open_start := 0.0,open_end := 0.0) -> void:
 var axis = (b-a).normalized()
 a += axis*open_start
 b -= axis*open_end
 var d = b-a
 var sideways = Vector3(d.z,0,-d.x).normalized()
 for side in [-1,1]:
  var p = a+sideways*width*0.5*side+Vector3(0,0.65,0)
  var q = b+sideways*width*0.5*side+Vector3(0,0.65,0)
  var mi = g._fc_part(parent,g._bbox(),(p+q)*0.5,g._bio_glass_mat(col,0.22),Vector3(0.04,0.9,d.length()))
  mi.rotation = Basis.looking_at(d.normalized(),Vector3.UP).get_euler()
  beam(parent,p+Vector3(0,0.5,0),q+Vector3(0,0.5,0),0.08,col)

func waterfall(i: int,parent: Node3D,p: Vector3,width: float,height: float) -> void:
 var sh = Shader.new()
 sh.code = "shader_type spatial; render_mode cull_disabled,unshaded,blend_mix; varying vec3 p; void vertex(){p=VERTEX;} void fragment(){float stripe=sin(p.x*14.0+sin(p.y*0.9-TIME*4.0)); float flow=sin(p.y*4.0-TIME*12.0+p.x*2.0); ALBEDO=mix(vec3(0.24,0.64,0.77),vec3(0.85,0.97,1.0),stripe*0.24+flow*0.14+0.42); ALPHA=0.6;}"
 var mat = ShaderMaterial.new()
 mat.shader = sh
 var mesh = QuadMesh.new()
 mesh.size = Vector2(width,height)
 var node = MeshInstance3D.new()
 node.mesh = mesh
 node.material_override = mat
 node.position = p+Vector3(0,height/2,0)
 var face = dome_c(i)-p
 face.y = 0
 node.rotation.y = atan2(face.x,face.z)
 parent.add_child(node)
 for k in 7:
  var q = p+Vector3((k-3)*1.3,0,-2.5)
  shape(parent,g._blow(1.0),q+Vector3(0,5+k%3*2.4,0),Vector3(2.5,7+k%3*2.4,2.5),Color("778d83"))
 disc(parent,p+Vector3(0,0.15,0),4.0,0.08,Color("5ea8b4"))

func soft_mist(i: int,parent: Node3D,p: Vector3,extent: Vector3) -> void:
 var mist = CPUParticles3D.new()
 mist.amount = 28
 mist.lifetime = 4
 mist.preprocess = 3
 mist.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX
 mist.emission_box_extents = extent
 mist.position = p
 mist.direction = Vector3(0,1,0)
 mist.gravity = Vector3(0,0.1,0)
 mist.initial_velocity_min = 0.15
 mist.initial_velocity_max = 0.4
 mist.scale_amount_min = 0.3
 mist.scale_amount_max = 0.9
 var mesh = SphereMesh.new()
 mesh.radius = 0.4
 mesh.height = 0.5
 mesh.radial_segments = 8
 mesh.rings = 4
 var mat = StandardMaterial3D.new()
 mat.albedo_color = Color(0.8,0.95,0.96,0.12)
 mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
 mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
 mesh.material = mat
 mist.mesh = mesh
 mist.emitting = false
 parent.add_child(mist)
 atmospheres.append({"node":mist,"dome":i})

func ground_route(i: int) -> Array:
 var routes = [
  [Vector2(0,-36),Vector2(0,-17),Vector2(-7,-4),Vector2(0,6),Vector2(8,14),Vector2(8,23),Vector2(0,31)],
  [Vector2(0,-36),Vector2(-7,-24),Vector2(7,-10),Vector2(-7,0),Vector2(-10,10),Vector2(-5,24),Vector2(0,31)],
  [Vector2(0,-36),Vector2(0,-20),Vector2(-7,-9),Vector2(0,2),Vector2(7,14),Vector2(0,31)],
  [Vector2(0,-36),Vector2(0,-14),Vector2(0,0),Vector2(-12,-1),Vector2(-26,-1),Vector2(-26,9),Vector2(-20,9),Vector2(-26,9),Vector2(-26,-1),Vector2(-12,-1),Vector2(0,0),Vector2(0,14),Vector2(0,31)],
  [Vector2(0,-36),Vector2(0,-12),Vector2(-10,-2),Vector2(-10,15),Vector2(0,28),Vector2(10,15),Vector2(10,-2),Vector2(0,-12)],
  [Vector2(0,-36),Vector2(7,-25),Vector2(-7,-12),Vector2(7,2),Vector2(-7,15),Vector2(0,31)],
  [Vector2(0,-36),Vector2(0,-12),Vector2(-12,5),Vector2(0,24),Vector2(12,5),Vector2(0,-12)]
 ]
 var result = []
 for p in routes[i]:
  result.append(local_point(i,p.x,p.y,0.09))
 return result

func ground_trails(i: int,parent: Node3D) -> void:
 var route = ground_route(i)
 var color = [Color("d9c38f"),Color("d9d8c4"),Color("b9a681"),Color("adcbdc"),Color("d4c5b3"),Color("bdab8d"),Color("e8d7ac")][i]
 for k in range(1,route.size()):
  var a: Vector3 = route[k-1]
  var b: Vector3 = route[k]
  var d = b-a
  var yaw = atan2(d.x,d.z)
  box(parent,(a+b)*0.5+Vector3(0,0.035,0),Vector3(3.8,0.04,d.length()+0.15),color,false,Vector3(0,yaw,0))

func africa_lookout(parent: Node3D) -> void:
 var i = 0
 var a = local_point(i,9.5,-25,0.09)
 var b = local_point(i,9.5,-3,4.5)
 var e = local_point(i,9.5,24,4.5)
 walkway(parent,a,b,3.0,0,2)
 walkway(parent,b,e,3.0,2,4)
 glass_edge(parent,a,b,3.0,COLORS[i],0,2)
 var centre = local_point(i,7,24,4.5)
 box(parent,centre-Vector3(0,0.15,0),Vector3(7,0.3,8),Color("c9ad76"),true)
 for z in [-18,-8,2,12,21]:
  var top = 4.5 if z>=-3 else lerpf(0.09,4.5,float(z+25)/22.0)
  beam(parent,local_point(i,9.5,z,0.09),local_point(i,9.5,z,top-0.15),0.25,Color("e7d7b6"))
 for side in [-1,1]:
  beam(parent,centre+Vector3(side*2.8,0,2.5),centre+Vector3(side*2.8,3.2,2.5),0.18,Color("c9b686"))
 var roof = g._bcone(0.05,4.8,1.0).duplicate()
 roof.radial_segments = 6
 shape(parent,roof,centre+Vector3(0,3.5,0),Vector3(1,1,0.8),Color("f2dcb0"))
 text(parent,"SAVANNA SAFARI LOOKOUT",centre+Vector3(0,2.0,0),Color("fff3d6"),26,45)

func asia_route() -> Array:
 var points = []
 for k in 25:
  var u = float(k)/24
  var a = lerpf(-PI/2,PI,u)
  points.append(local_point(1,cos(a)*12,16+sin(a)*12,lerpf(0.09,6.0,minf(u*24.0/22.0,1.0))))
 points.append(local_point(1,-8.5,16,6.0))
 return points

func asia_rainwalk(parent: Node3D) -> void:
 var points = asia_route()
 for k in range(1,points.size()):
  var last = k==points.size()-1
  var turning = k==points.size()-2
  walkway(parent,points[k-1],points[k],3.0,2.0 if last else 0.0,2.0 if last or turning else 0.0)
  if not last:
   glass_edge(parent,points[k-1],points[k],3.0,COLORS[1],0.0,2.0 if turning else 0.0)
 rain_ring(parent)
 var p = local_point(1,0,16)
 disc(parent,p+Vector3(0,0.16,0),4.2,0.08,Color("70b4b7"))
 var shader = Shader.new()
 shader.code = "shader_type spatial; render_mode unshaded,cull_disabled,blend_mix; varying vec3 p; void vertex(){p=VERTEX;} void fragment(){float flow=sin(p.y*3.0-TIME*10.0+sin(p.x*7.0+p.z*6.0)); ALBEDO=mix(vec3(0.3,0.65,0.76),vec3(0.9,0.98,1.0),0.6+flow*0.25); ALPHA=0.36+flow*0.1;}"
 var mat = ShaderMaterial.new()
 mat.shader = shader
 for layer in 2:
  var mesh = CylinderMesh.new()
  mesh.top_radius = 1.5+layer*0.6
  mesh.bottom_radius = 2.2+layer*0.6
  mesh.height = 23
  mesh.cap_top = false
  mesh.cap_bottom = false
  mesh.radial_segments = 28
  mesh.rings = 4
  g._fc_part(parent,mesh,p+Vector3(0,11.7,0),mat)
 shape(parent,g._fc_torus(2.6,3.0),p+Vector3(0,23.3,0),Vector3(1,0.2,1),Color("dbebe8"))
 soft_mist(1,parent,p+Vector3(0,0.8,0),Vector3(3,0.4,3))
 text(parent,"CLOUD FOREST · RAIN OCULUS",p+Vector3(0,25,0),Color("e5ffff"),30,70)

func antarctic_route() -> Array:
 var points = []
 for k in 25:
  var u = float(k)/24
  var a = lerpf(-PI/2,PI,u)
  points.append(local_point(3,-20+cos(a)*7,16+sin(a)*7,lerpf(0.09,8.0,minf(u*24.0/22.0,1.0))))
 points.append(local_point(3,-27,12.5,8.0))
 return points

func antarctic_spiral(parent: Node3D) -> void:
 var points = antarctic_route()
 for k in range(1,points.size()):
  walkway(parent,points[k-1],points[k],2.8,0,2.5 if k==points.size()-1 else 0.0)
  var d = (points[k]-points[k-1]).normalized()
  var side = Vector3(d.z,0,-d.x)
  for sd in [-1,1]:
   # Cold blue edge bands replace the rainforest/bamboo glass-balcony language.
   beam(parent,points[k-1]+side*sd*1.35+Vector3(0,0.18,0),points[k]+side*sd*1.35+Vector3(0,0.18,0),0.09,Color("a6eaff"))
  if k%6==0:
   var p: Vector3 = points[k]
   beam(parent,Vector3(p.x,0.09,p.z),p-Vector3(0,0.15,0),0.32,Color("d9eff7"))
 var top: Vector3 = points[points.size()-1]
 disc(parent,top-Vector3(0,0.15,0),2.6,0.3,Color("deeff7"),true)
 text(parent,"GLACIER SUMMIT · AURORA WATCH",top+Vector3(0,2,0),Color("c5f6ff"),25,45)

func tree_fort(parent: Node3D) -> void:
 var centre = local_point(2,18,23,5.5)
 var outward = (dome_c(2)-C).normalized()
 var across = Vector3(outward.z,0,-outward.x)
 var rot = Basis(across,Vector3.UP,outward).get_euler()
 # Four timber strips leave a three-metre opening for the living tree trunk.
 for sd in [-1,1]:
  box(parent,centre+outward*sd*2.5-Vector3(0,0.15,0),Vector3(8,0.3,2),Color("a08354"),true,rot)
  box(parent,centre+across*sd*2.75-Vector3(0,0.15,0),Vector3(2.5,0.3,3),Color("a08354"),true,rot)
 tall_tree(parent,local_point(2,18,23,0.09),1.8,4.5,"nature_oak")
 for sd in [-1,1]:
  beam(parent,centre+across*sd*3.8+outward*3.4+Vector3(0,1,0),centre+across*sd*3.8-outward*3.4+Vector3(0,1,0),0.12,Color("d0b27b"))
 text(parent,"RAINFOREST TREE FORT",centre+Vector3(0,2.6,0),Color("d2ffe0"),27,45)

func floe_approach(parent: Node3D,p: Vector3) -> void:
 # A continuous ice bevel is walkable from every direction, including the
 # branch to the glacier trail; isolated ramps only covered the main axis.
 shape(parent,g._bcone(1.6,2.2,0.13),p+Vector3(0,0.155,0),Vector3.ONE,Color("d7edf6"))
 var vertices = PackedVector3Array()
 for k in 24:
  var a = float(k)*TAU/24
  vertices.append(Vector3(cos(a)*2.2,-0.065,sin(a)*2.2))
  vertices.append(Vector3(cos(a)*1.6,0.065,sin(a)*1.6))
 var convex = ConvexPolygonShape3D.new()
 convex.points = vertices
 var shape = CollisionShape3D.new()
 shape.shape = convex
 var body = StaticBody3D.new()
 body.name = "IceFloeBevel"
 body.position = p+Vector3(0,0.155,0)
 body.add_child(shape)
 parent.add_child(body)

func habitat_layers(i: int,parent: Node3D) -> void:
 # Extra instances reuse existing species bits: no new spotting requirement or
 # loss of progress for a page that players have already completed.
 if i==0:
  var rock: Vector3 = g.bio_hab[17].c
  high_habitat(parent,rock,7.0,3.8,Color("ac8b60"),false)
  for k in 2:
   upper_animal(17,70+k,parent,rock+Vector3(0,7,0),2.5,"walk")
  for k in 2:
   upper_animal(19,74+k,parent,g.bio_hab[19].c+Vector3(0,4.5,0),2.0,"walk")
  high_habitat(parent,g.bio_hab[19].c,4.5,3.0,Color("a38b64"),false)
  for k in 4:
   upper_animal(10,80+k,parent,local_point(i,0,5,11+k%2*2.0),10.0,"glide")
  text(parent,"KOPJE HEIGHTS · LIONS & MEERKATS",rock+Vector3(0,9,0),Color("fff0cc"),24,45)
 elif i==1:
  var cliff: Vector3 = g.bio_hab[23].c
  high_habitat(parent,cliff,11.0,3.8,Color("a8bfc4"),false)
  for k in 2:
   upper_animal(23,70+k,parent,cliff+Vector3(0,11,0),2.4,"walk")
  var tree: Vector3 = g.bio_hab[22].c
  high_habitat(parent,tree,9.0,3.3,Color("9b855d"),true)
  for k in 2:
   upper_animal(22,74+k,parent,tree+Vector3(0,9,0),2.1,"walk")
  for k in 3:
   upper_animal(24,80+k,parent,local_point(i,0,4,12+k%2*2.0),10.0,"glide")
  text(parent,"HIGHLAND CLIFFS · SNOW LEOPARDS",cliff+Vector3(0,13,0),Color("e4f4ff"),24,45)
 elif i==2:
  var tree: Vector3 = g.bio_hab[28].c
  high_habitat(parent,tree,12.0,3.4,Color("8e7951"),true)
  for k in 3:
   upper_animal(28,70+k,parent,tree+Vector3(0,12,0),2.2,"walk")
  var branch: Vector3 = g.bio_hab[26].c
  tall_tree(parent,branch,2.6,9.5,"nature_oak")
  beam(parent,branch+Vector3(-2,14,0),branch+Vector3(2,14,0),0.28,Color("7b6745"))
  for k in 2:
   upper_animal(26,74+k,parent,branch+Vector3(-0.8+k*1.6,13.8,0),0.3,"hang")
  for k in 4:
   upper_animal(11,80+k,parent,local_point(i,0,5,14+k%2*2.0),11.0,"glide")
  text(parent,"CANOPY WILDLIFE · MONKEYS & SLOTHS",tree+Vector3(0,14,0),Color("d3ffdf"),24,45)
 elif i==3:
  var ice: Vector3 = g.bio_hab[0].c
  high_habitat(parent,ice,3.5,3.5,Color("d9eff6"),false)
  for k in 3:
   var a = upper_animal(0,70+k,parent,ice+Vector3(0,3.5,0),2.2,"walk")
   if k==2:
    a.node.scale = Vector3.ONE*0.45
  var nest = local_point(i,-20,16)
  high_habitat(parent,nest,14,3.5,Color("d1e8f3"),false)
  for k in 2:
   upper_animal(32,74+k,parent,nest+Vector3(-0.8+k*1.6,14,0),0.3,"perch")
  for k in 3:
   upper_animal(32,80+k,parent,local_point(i,0,7,14+k%2*2.0),11.0,"glide")
  text(parent,"ICE-CLIFF NESTS · ALBATROSS",nest+Vector3(0,16,0),Color("d9f6ff"),24,50)

func upper_animal(si: int,k: int,parent: Node3D,c: Vector3,r: float,motion: String) -> Dictionary:
 var a = spawn_animal(si,k,parent,c,r)
 a["upper"] = true
 a["upper_motion"] = motion
 a["base_y"] = c.y
 if motion=="glide":
  # The outer glass dome is the flight enclosure; keep the whole circuit inside it.
  a.node.rotation.z = 0.1*sin(float(k))
  for name in ["WingL","WingR"]:
   var wing = a.node.find_child(name,true,false)
   if wing!=null and not a.wings.has(wing):
    a.wings.append(wing)
 return a

func high_habitat(parent: Node3D,c: Vector3,height: float,radius: float,col: Color,tree: bool) -> void:
 if tree:
  tall_tree(parent,c,2.6,height-2.5,"nature_oak2")
  for sd in [-1,1]:
   beam(parent,c+Vector3(0,height*0.55,0),c+Vector3(sd*radius,height-0.2,0),0.28,Color("7c6848"))
 else:
  for k in 4:
   var p = c+Vector3(cos(k*TAU/4)*1.4,height*0.44,sin(k*TAU/4)*1.4)
   shape(parent,g._blow(1),p,Vector3(radius*0.7,height*0.55,radius*0.7),col)
 var top = c+Vector3(0,height,0)
 disc(parent,top-Vector3(0,0.15,0),radius,0.3,col,true)
 for k in 16:
  var a = top+Vector3(cos(k*TAU/16),0,sin(k*TAU/16))*radius
  var b = top+Vector3(cos((k+1)*TAU/16),0,sin((k+1)*TAU/16))*radius
  beam(parent,a+Vector3(0,0.9,0),b+Vector3(0,0.9,0),0.1,Color("c8d9d1"),true)

func x_layer(p: Vector3,i: int) -> float:
 var forward = (dome_c(i)-C).normalized()
 return (p-dome_c(i)).dot(Vector3(forward.z,0,-forward.x))

func z_layer(p: Vector3,i: int) -> float:
 return (p-dome_c(i)).dot((dome_c(i)-C).normalized())

func tall_tree(parent: Node3D,p: Vector3,scale_value: float,raise: float,kind: String) -> void:
 # Raise the leafy crown above visitor/animal platforms and extend its trunk
 # down to the floor, so the new upper paths do not disappear inside leaf cards.
 nature(parent,kind,p+Vector3(0,raise,0),scale_value,0.5)
 shape(parent,g._bcone(0.42,0.68,raise+0.5),p+Vector3(0,(raise+0.5)/2,0),Vector3.ONE,Color("795d40"))

extends RefCounted
# World Biosphere Phases 1 and 2. Stable first 16 species = existing bio_seen save bits.
const C := Vector3(-860,0,-650)
const RADIUS := 38.5
const RING_R := 72.0 # v0.55.3: open ground loop linking neighbouring dome doors
const ORBIT := 115.0
const ENTRY := C+Vector3(0,0,181)
const OCEAN := C+Vector3(-225,0,0)
const NAMES := ["Africa","Asia","South America","Antarctica","Europe","North America","Oceania"]
const COLORS := [Color("e9b75e"),Color("7fbc9c"),Color("4cbf94"),Color("9be6ff"),Color("b2cc7a"),Color("d29562"),Color("64d7d0")]
const GROUNDS := [Color("b4923c"),Color("508166"),Color("32694a"),Color("dae9f2"),Color("8eaa70"),Color("738b66"),Color("b87a52")]
const DOMES := [{"name":"AFRICA"},{"name":"ASIA"},{"name":"SOUTH AMERICA"},{"name":"ANTARCTICA"},{"name":"EUROPE"},{"name":"NORTH AMERICA"},{"name":"OCEANIA"}]
const SPECIES := [
	{"dome":3,"name":"Emperor Penguin","fact":"The biggest penguin: up to 1.2 m tall. Dads keep the egg warm on their feet.","kind":"penguin","n":6,"zone":"in","hab":"Penguin Bay"},
	{"dome":5,"name":"Polar Bear","fact":"Its fur looks white, but its skin is black to soak up the sun.","kind":"polarbear","n":2,"zone":"out","hab":"Polar Coast"},
	{"dome":5,"name":"Arctic Fox","fact":"Its fur turns from brown in summer to snow-white in winter.","kind":"arcticfox","n":2,"zone":"out","hab":"Arctic Tundra"},
	{"dome":5,"name":"Snowy Owl","fact":"Hunts in daylight in the Arctic summer, when the sun never sets.","kind":"owl","n":2,"zone":"fly","hab":"Snowy Owl Peak"},
	{"dome":4,"name":"Spotted Deer","fact":"Fawns are born with white spots that help them hide.","kind":"deer","n":3,"zone":"out","hab":"Blossom Meadow"},
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
	{"dome": 4, "name": "Woodland Owl", "fact": "Owls fly quietly thanks to soft feather edges.", "kind": "europeanowl", "n": 2, "zone": "fly", "hab": "Woodland Owl Habitat"},
	{"dome": 4, "name": "Brown Bear", "fact": "Brown bears use their strong sense of smell to find food.", "kind": "brownbear", "n": 2, "zone": "out", "hab": "Brown Bear Habitat"},
	{"dome": 4, "name": "Wolf", "fact": "Wolf families communicate with calls and body language.", "kind": "wolf", "n": 3, "zone": "out", "hab": "Wolf Habitat"},
	{"dome": 4, "name": "Hedgehog", "fact": "A hedgehog curls up to protect its soft belly.", "kind": "hedgehog", "n": 4, "zone": "out", "hab": "Hedgehog Habitat"},
	{"dome": 4, "name": "White Stork", "fact": "Storks build large nests and return to them each year.", "kind": "stork", "n": 3, "zone": "out", "hab": "White Stork Habitat"},
	{"dome": 5, "name": "Bald Eagle", "fact": "Bald eagles use broad wings to soar above water.", "kind": "baldeagle", "n": 2, "zone": "fly", "hab": "Bald Eagle Habitat"},
	{"dome": 5, "name": "Bison", "fact": "Bison graze together and help maintain grasslands.", "kind": "bison", "n": 3, "zone": "out", "hab": "Bison Habitat"},
	{"dome": 6, "name": "Kangaroo and Joey", "fact": "A young kangaroo is called a joey and grows in a pouch.", "kind": "kangaroo", "n": 3, "zone": "out", "hab": "Kangaroo and Joey Habitat"},
	{"dome": 6, "name": "Koala", "fact": "Koalas rest in eucalyptus trees and eat their leaves.", "kind": "koala", "n": 3, "zone": "out", "hab": "Koala Habitat"},
	{"dome": 6, "name": "Emu", "fact": "Emus cannot fly but can run on powerful legs.", "kind": "emu", "n": 3, "zone": "out", "hab": "Emu Habitat"},
	{"dome": 6, "name": "Platypus", "fact": "Platypuses find underwater food using their sensitive bills.", "kind": "platypus", "n": 3, "zone": "swim", "hab": "Platypus Habitat"},
	{"dome": 6, "name": "Wombat", "fact": "Wombats dig burrows with strong claws.", "kind": "wombat", "n": 3, "zone": "out", "hab": "Wombat Habitat"},
	{"dome": 6, "name": "Cockatoo", "fact": "Cockatoos use their crests to communicate.", "kind": "cockatoo", "n": 4, "zone": "fly", "hab": "Cockatoo Habitat"},
]
const QUESTS := [
 ["Watering Hole Count","Lion Pride Lookout","Savanna Ranger Trail"],
 ["Panda Snack Run","Lantern Path","Mountain Pavilion Trail"],
 ["Canopy Climb","Frog Hunt","River Rescue"],
 ["Penguin Parade","Ice Floe Hop","Seal Watch"],
 ["Wolf Pack Tracker","Meadow Ranger","Stork Supper Watch"],
 ["Beaver Dam Builder","Eagle Rim Trail","Arctic Patrol"],
 ["Joey Hide and Seek","Billabong Health Check","Coastal Cockatoo Trail"]]
const RANKS := ["Junior Ranger","Ranger","Head Ranger","Wildlife Legend"]
const RANK_AT := [0,3,8,12]
const RARES := ["White Lion","Golden Monkey","Emperor Penguin Chick","White Stag","Spirit Bison","Golden Wombat"]
const RARE_DOMES := [0,2,3,4,5,6]
const RARE_SPECIES := [17,28,0,4,39,44]
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
var keeper_projects: Array = []
var dome_animals := [[],[],[],[],[],[],[]]
var wildlife_motion_clock := 0.0
var refined_materials := {}
var walk_surfaces: Array = []
var raised_boundaries: Array = []
var scenery_bounds: Array = []
var scenery_group := ""
var rail_mesh: BoxMesh
var parked_nests := {}
var loaded_dome := -1
var exterior_visuals: Array = []
var normal_camera_far := 1000.0
var camera_far_saved := false
var guard_batches := {}
var walk_meshes := {}
var campus_paths: Array = []
var last_load_us := 0
var mobile_textures := {}
var saved_quality := {}
var building_walkway := false
var animal_structure := false
var stuck_seconds := 0.0
var stuck_anchor := Vector3.ZERO
var rescue_cooldown := 0.0
var safety_enabled := true
var profile_usec := 0
var profile_calls := 0
var profile_load_us := 0
var profile_worst := 0

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
 if solid and not building_walkway and not animal_structure and pos.y>0.5 and sc.y<0.6 and sc.x>1.0 and sc.z>1.0 and Basis.from_euler(rot).y.dot(Vector3.UP)>0.99:
  var along = Basis.from_euler(rot).z*sc.z*0.5
  register_walk(parent,pos-along+Vector3(0,sc.y*0.5,0),pos+along+Vector3(0,sc.y*0.5,0),sc.x,"raised")
 var mat = material(col)
 var key = "%d:%d:%d" % [parent.get_instance_id(),mesh.get_instance_id(),mat.get_instance_id()]
 if not batches.has(key):
  batches[key] = {"parent":parent,"mesh":mesh,"mat":mat,"xs":[]}
 batches[key]["xs"].append(Transform3D(Basis.from_euler(rot)*Basis.from_scale(sc),pos))
 if not solid and not building_walkway and not animal_structure and (mesh is SphereMesh or mesh is CylinderMesh or scenery_group!=""):
  record_scenery(parent,key,batches[key].xs.size()-1,mesh,scenery_group)
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
 if d.length()<0.0001:
  return
 if rail_mesh==null:
  rail_mesh = BoxMesh.new()
  rail_mesh.size = Vector3.ONE
 var z = d.normalized()
 var x = Vector3.UP.cross(z).normalized() if absf(z.dot(Vector3.UP))<0.99 else Vector3.RIGHT
 var y = z.cross(x).normalized()
 var basis = Basis(x,y,z)
 shape(parent,rail_mesh,(a+b)*0.5,Vector3(w,w,d.length()),col,solid,basis.get_euler())
 var mat = material(col)
 var key = "%d:%d:%d" % [parent.get_instance_id(),rail_mesh.get_instance_id(),mat.get_instance_id()]
 batches[key].xs[-1] = Transform3D(Basis(x*w,y*w,d),(a+b)*0.5)


func text(parent: Node3D,label: String,pos: Vector3,col := Color.WHITE,size := 40,range_m := 65.0) -> Label3D:
 var n = Label3D.new()
 n.text = label
 n.font_size = size
 n.pixel_size = 0.008
 n.billboard = BaseMaterial3D.BILLBOARD_ENABLED
 n.modulate = col
 n.outline_size = 3
 n.position = pos
 n.visibility_range_end = minf(range_m,28.0) if detail_index(parent)>=0 and size<45 else range_m
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
 for item in scenery_bounds:
  if item.has("node") or batches.has(item.get("key","")):
   item["checked_bounds"] = scenery_aabb(item)
 batches.clear()

func disc(parent: Node3D,c: Vector3,r: float,th: float,col: Color,solid := false) -> void:
 var mesh = g._bcone(r,r,th)
 var old_structure = animal_structure
 if solid:
  animal_structure = true
 shape(parent,mesh,c,Vector3.ONE,col)
 animal_structure = old_structure
 if solid:
  g._bio_cyl_col_on(parent,c,r,th)
  if c.y>0.5 and not animal_structure:
   register_deck(parent,c+Vector3(0,th*0.5,0),r)

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
 if "--bench" in OS.get_cmdline_user_args():
  root.tree_exiting.connect(profile_report)
 root.set_meta("static_floor",true)
 g.add_child(root)
 g.bio_root = root
 # A connected, empty western land shelf. Existing city/Galleria geometry stays untouched.
 box(root,Vector3(-915,-0.35,-650),Vector3(450,0.6,400),Color("7b9d72"),true)
 box(root,Vector3(-760,0.01,-458),Vector3(210,0.08,12),Color("728c80"))
 g._collider(root,Vector3(-760,-0.3,-458),Vector3(210,0.6,14))
 g._floor_note(Vector3(-760,0.01,-458),Vector3(210,0.08,12))
 box(root,C+Vector3(0,-0.065,102),Vector3(7,0.06,163),Color("e4e5d5"))
 disc(root,C+Vector3(0,0.03,0),18.5,0.12,Color("e9ecde"),true)
 rim_bevel(root,C,20,Color("e9ecde"))
 # Vehicle-only bollards preserve the car exclusion now that the floor rim is walkable.
 for x in [-3.25,-1.95,-0.65,0.65,1.95,3.25]:
  disc(root,C+Vector3(x,0.5,24),0.13,1.1,Color("a6d9c8"),true)
 # Entrance gate arch where the walk from the city meets the hub.
 for gx in [-6.5,6.5]:
  # v0.55.3 old look: pearl pillars with a glowing green strip and a pearl sign bar.
  shape(root,g._bcone(0.45,0.6,7.2),C+Vector3(gx,3.6,34),Vector3.ONE,Color("f4f7f9"))
  beam(root,C+Vector3(gx,0.2,33.6),C+Vector3(gx,6.8,33.6),0.12,Color("7dff9a"))
 box(root,C+Vector3(0,7.3,34),Vector3(14.2,1.3,0.7),Color("f4f7f9"))
 beam(root,C+Vector3(-6.8,6.7,33.6),C+Vector3(6.8,6.7,33.6),0.1,Color("7dff9a"))
 text(root,"WORLD BIOSPHERE",C+Vector3(0,8.4,34),Color("c4fff1"),56,90)
 shell(root,C,20,14,Color("35d6a4"),false)
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
  rim_bevel(root,c,RADIUS,GROUNDS[i])
  var a = C+dir*19.5
  var b = c-dir*(RADIUS-0.5)
  beam(root,a+Vector3(0,-0.04,0),b+Vector3(0,-0.04,0),0.12,Color("a7ddc3"))
  var yaw = atan2(dir.x,dir.z)
  box(root,(a+b)*0.5+Vector3(0,-0.065,0),Vector3(5.6,0.06,a.distance_to(b)+1),Color("e7e9db"),false,Vector3(0,yaw,0))
  # The open paths below retain low side guards without roofs.
  text(root,NAMES[i],C+dir*28+Vector3(0,3.8,0),COLORS[i],38,60)
  text(root,"FREE ENTRY",C+dir*23+Vector3(0,3.5,0),COLORS[i],28,24)
  disc(root,c+Vector3(0,0.03,0),RADIUS-1.5,0.12,GROUNDS[i],true)
  shell(root,c,RADIUS,30,COLORS[i],true)
  # Each dome's own gate arch over its door.
  var door_p = c-dir*RADIUS
  var door_s = Vector3(dir.z,0,-dir.x)*6.5
  beam(root,door_p+door_s,door_p+door_s+Vector3(0,6.5,0),0.6,COLORS[i])
  beam(root,door_p-door_s,door_p-door_s+Vector3(0,6.5,0),0.6,COLORS[i])
  beam(root,door_p+door_s+Vector3(0,6.5,0),door_p-door_s+Vector3(0,6.5,0),0.6,COLORS[i])
  text(root,NAMES[i].to_upper()+" DOME",door_p+Vector3(0,7.8,0),COLORS[i],44,60)
  # v0.55.3: bright gold door frame and ENTER sign so the door is easy to find from outside.
  var gold_door = Color("ffe08a")
  beam(root,door_p+door_s*0.45,door_p+door_s*0.45+Vector3(0,5.6,0),0.35,gold_door)
  beam(root,door_p-door_s*0.45,door_p-door_s*0.45+Vector3(0,5.6,0),0.35,gold_door)
  beam(root,door_p+door_s*0.45+Vector3(0,5.6,0),door_p-door_s*0.45+Vector3(0,5.6,0),0.35,gold_door)
  text(root,"⬇ ENTER ⬇",door_p+Vector3(0,9.4,0),Color("fff3b0"),80,100).pixel_size = 0.014
  var detail = Node3D.new()
  detail.name = NAMES[i].replace(" ","")+"Interior"
  root.add_child(detail)
  interiors.append(detail)
  detail.visible = false
 # Phase 3 reserves three times the old floor area. No ocean dome or animals built yet.
 disc(root,OCEAN+Vector3(0,0.05,0),49.1,0.12,Color("538f9b"))
 text(root,"OCEAN WORLD\nPHASE 3 · FUTURE EXPANSION",OCEAN+Vector3(0,6,0),Color("a9efff"),54,120)
 for k in 24:
  var a = OCEAN+Vector3(cos(k*TAU/24),0,sin(k*TAU/24))*49.1
  var b = OCEAN+Vector3(cos((k+1)*TAU/24),0,sin((k+1)*TAU/24))*49.1
  beam(root,a+Vector3(0,1.2,0),b+Vector3(0,1.2,0),0.16,Color("d9be69"),true)
 text(root,"WORLD BIOSPHERE · LEVEL 7",ENTRY+Vector3(0,4,0),Color("d5fff0"),54,90)
 build_open_paths()
 build_dome_loop()
 outside_signposts()
 build_garden_edges()
 register_habitats()
 flush_guard_batches(root)
 flush()
 capture_exterior(root)

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
   # v0.55.3: the old Biosphere look: thick, saturated coloured ribs (not thin pale lines).
   var frame = Color.from_hsv(col.h,minf(1.0,col.s*1.35+0.12),minf(1.0,col.v*1.05+0.05))
   var sc = clampf(r/38.5,0.6,1.0)
   beam(parent,points[0],points[1],0.42*sc,frame)
   beam(parent,points[0],points[2],0.52*sc,frame)
   if j<6:
    beam(parent,points[0] if (j+k)%2==0 else points[1],points[3] if (j+k)%2==0 else points[2],0.30*sc,frame)
 st.generate_normals()
 var mi = MeshInstance3D.new()
 var shell_mesh = st.commit()
 mi.mesh = shell_mesh
 mi.material_override = g._bio_glass_mat(col.lightened(0.4),0.15)
 mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
 if detail_index(parent)<0:
  parent.add_child(mi)
 else:
  mi.free()
 # v0.55.3: visible lower walls (they were collision-only, so domes looked like a bare roof on an empty
 # base): a solid coloured plinth, tinted glazing above it, thick posts and bright door jambs. Built for the
 # exterior and for the interior, leaving the same 5.6 m door gap toward the hub.
 var toward_hub = (C-c).normalized()
 var door_angle = atan2(toward_hub.z,toward_hub.x)
 var door_half = asin(2.8/r)
 var plinth = SurfaceTool.new()
 plinth.begin(Mesh.PRIMITIVE_TRIANGLES)
 var glaze = SurfaceTool.new()
 glaze.begin(Mesh.PRIMITIVE_TRIANGLES)
 var wall_frame = Color.from_hsv(col.h,minf(1.0,col.s*1.35+0.12),minf(1.0,col.v*1.05+0.05))
 var wall_segments = 96
 for k in wall_segments:
  var wa = door_angle+door_half+float(k)*(TAU-2*door_half)/wall_segments
  var wb = door_angle+door_half+float(k+1)*(TAU-2*door_half)/wall_segments
  var pa = c+Vector3(cos(wa)*r,0,sin(wa)*r)
  var pb = c+Vector3(cos(wb)*r,0,sin(wb)*r)
  for quad in [[-0.05,1.1,plinth],[1.1,4.2,glaze]]:
   var lo: float = quad[0]
   var hi: float = quad[1]
   var st2: SurfaceTool = quad[2]
   for v in [pa+Vector3(0,lo,0),pb+Vector3(0,lo,0),pa+Vector3(0,hi,0),pa+Vector3(0,hi,0),pb+Vector3(0,lo,0),pb+Vector3(0,hi,0)]:
    st2.add_vertex(v)
  if k%4==0:
   beam(parent,pa+Vector3(0,-0.05,0),pa+Vector3(0,4.4,0),0.34,wall_frame)
 beam(parent,c+Vector3(cos(door_angle+door_half),0,sin(door_angle+door_half))*r+Vector3(0,-0.05,0),c+Vector3(cos(door_angle+door_half),0,sin(door_angle+door_half))*r+Vector3(0,5.0,0),0.55,Color("ffe08a"))
 beam(parent,c+Vector3(cos(door_angle-door_half),0,sin(door_angle-door_half))*r+Vector3(0,-0.05,0),c+Vector3(cos(door_angle-door_half),0,sin(door_angle-door_half))*r+Vector3(0,5.0,0),0.55,Color("ffe08a"))
 plinth.generate_normals()
 glaze.generate_normals()
 var plinth_mi = MeshInstance3D.new()
 plinth_mi.mesh = plinth.commit()
 var plinth_mat = material(col.darkened(0.2)).duplicate() as StandardMaterial3D
 plinth_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
 plinth_mi.material_override = plinth_mat
 plinth_mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
 parent.add_child(plinth_mi)
 var glaze_mi = MeshInstance3D.new()
 glaze_mi.mesh = glaze.commit()
 glaze_mi.material_override = g._bio_glass_mat(col.lightened(0.3),0.32)
 glaze_mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
 parent.add_child(glaze_mi)
 if not wall:
  return
 # The upper glass is solid too; elevated decks cannot create an exit above
 # the sealed lower perimeter. Only the 5.6 m door below remains open.
 var roof_body = StaticBody3D.new()
 roof_body.name = "ClosedDomeShell"+str(dome_at(c))
 var roof_shape = CollisionShape3D.new()
 var roof_collision = ConcavePolygonShape3D.new()
 roof_collision.backface_collision = true
 roof_collision.set_faces(shell_mesh.get_faces())
 roof_shape.shape = roof_collision
 roof_body.add_child(roof_shape)
 parent.add_child(roof_body)
 var toward = (C-c).normalized()
 var centre_angle = atan2(toward.z,toward.x)
 var half_door = asin(2.8/r)
 var segments = 96
 for k in segments:
  var a = centre_angle+half_door+float(k)*(TAU-2*half_door)/segments
  var b = centre_angle+half_door+float(k+1)*(TAU-2*half_door)/segments
  var from = c+Vector3(cos(a)*r,-0.05,sin(a)*r)
  var to = c+Vector3(cos(b)*r,-0.05,sin(b)*r)
  collision_wall(parent,from,to,4.2)
  beam(parent,from+Vector3(0,0.25,0),to+Vector3(0,0.25,0),0.20,Color("dce6df"))
  if k%3==0:
   beam(parent,from,from+Vector3(0,4.2,0),0.12,col)
 # The tunnel meets these jambs exactly; players cannot slip around the door sides.
 for side in [-1,1]:
  var dir = Vector3(cos(centre_angle+side*half_door),0,sin(centre_angle+side*half_door))
  var jamb = c+dir*r
  beam(parent,jamb,jamb+Vector3(0,4.2,0),0.16,col)

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
 var mesh = foliage_mesh(name)
 if mesh!=null and not mesh.has_meta("mobile_foliage"):
  for surface in mesh.get_surface_count():
   var source = mesh.surface_get_material(surface)
   if source is BaseMaterial3D:
    var copy = source.duplicate() as BaseMaterial3D
    if copy.transparency!=BaseMaterial3D.TRANSPARENCY_DISABLED:
     copy.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
     copy.alpha_scissor_threshold = 0.45
    mesh.surface_set_material(surface,copy)
  mesh.set_meta("mobile_foliage",true)
 if mesh==null:
  return
 var key = "%d:nature:%s" % [parent.get_instance_id(),name]
 if not batches.has(key):
  batches[key] = {"parent":parent,"mesh":mesh,"mat":material(Color("d6e9f2")) if name=="nature_bush_snow" else null,"xs":[]}
 batches[key].xs.append(Transform3D(Basis(Vector3.UP,yaw)*Basis.from_scale(Vector3.ONE*scale_value),p))
 if not animal_structure:
  record_scenery(parent,key,batches[key].xs.size()-1,mesh,scenery_group)

func tree(parent: Node3D,p: Vector3,h: float,col: Color,style := 0) -> void:
 var old_group = scenery_group
 scenery_group = "Plant:%d:%s" % [parent.get_instance_id(),str(p)]
 tree_parts(parent,p,h,col,style)
 scenery_group = old_group

func tree_parts(parent: Node3D,p: Vector3,h: float,col: Color,style: int) -> void:
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
 for k in (65 if i==1 or i==2 else 28 if i<4 else 0):
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
   scenery_group = "AsiaPavilion"
   var p = local_point(i,0,16)
   for side in [-1,1]:
    for z in [-2,2]:
     box(parent,p+Vector3(side*3,2.2,z*1.0),Vector3(0.22,4.4,0.22),Color("a34d3a"))
   box(parent,p+Vector3(0,4.5,0),Vector3(7,0.3,5.5),Color("5a746b"))
   shape(parent,g._bcone(0,4.6,1.7),p+Vector3(0,5.3,0),Vector3(1,1,0.8),Color("406b62"))
   scenery_group = ""
   text(parent,"BAMBOO VALLEY · MOUNTAIN PAVILION",local_point(i,0,25,8),Color("e0ffe7"),28)
  2:
   var p = local_point(i,25,20)
   for k in 5:
    ball(parent,p+Vector3(k-2,3+k,0),Vector3(4,5,3),Color("59766c"))
   box(parent,p+Vector3(0,5,2.5),Vector3(3,9,0.1),Color("90ddeb"))
   for k in 6:
    disc(parent,local_point(i,8+k*2,-18+k*5,0.16),3.2,0.06,Color("5bb9ba"))
   # Finish climbing before turning: overlapping inclined/level strips created an edge lip.
   var route = visitor_stage_route(2)
   for segment in range(1,route.size()-1):
    walkway(parent,route[segment-1],route[segment],3.0)
   disc(parent,route[-2]-Vector3(0,0.15,0),3,0.3,Color("b09260"),true)
   for landing in [route[2],route[3]]:
    disc(parent,landing-Vector3(0,0.15,0),2.0,0.3,Color("b09260"),true)
   text(parent,"RAINFOREST · CANOPY BRIDGE",local_point(i,0,-30,3),Color("ceffec"),28)
  3:
   disc(parent,local_point(i,20,14,0.15),11,0.08,Color("2e809c"))
   for k in 7:
    disc(parent,local_point(i,15+k%3*3,8+k*1.8,0.26),1.3,0.12,Color("edfaff"))
   # Cave uses a clear tunnel beneath three ice blocks, reachable from the promenade.
   for side in [-1,1]:
    box(parent,local_point(i,side*5,26,2),Vector3(2,4,7),Color("b1d5e8"),true)
   box(parent,local_point(i,0,26,4.3),Vector3(12,0.6,7),Color("d9f5ff"),true)

   text(parent,"POLAR COAST · ICE CAVE",local_point(i,0,25,8),Color("def7ff"),28)

func walkway(parent: Node3D,a: Vector3,b: Vector3,w: float,open_start := 0.0,open_end := 0.0) -> void:
 phase2_walkway(parent,a,b,w,open_start,open_end)

func habitats(i: int,parent: Node3D) -> void:
 var ids = []
 for si in SPECIES.size():
  if int(SPECIES[si].dome)==i:
   ids.append(si)
 for k in ids.size():
  var si = ids[k]
  if i>=4 and str(SPECIES[si].zone)=="fly":
   var sky = local_point(i,-29,-2,7) if si==3 else local_point(i,-20,5,13)
   if not can_fly(si):
    high_habitat(parent,Vector3(sky.x,0,sky.z),sky.y,2.0,Color("9a8664"),true)
   g.bio_hab[si] = {"type":"pen","c":sky,"r":6.0,"rmin":0.0,"sign":local_point(i,-10,5)}
   for n in int(SPECIES[si].n):
    upper_animal(si,n,parent,sky,6.0 if can_fly(si) else 0.3,"glide" if can_fly(si) else "perch")
   continue
  var side = -1 if k%2==0 else 1
  var row = k/2
  var p = local_point(i,side*23,-21+row*14)
  if i>=4:
   var layout = phase2_pen(si)
   p = local_point(i,layout.x,layout.y)
  var r = 3.7
  if i==3:
   var polar = {0:Vector3(17,4,-24),30:Vector3(27,4,-5),31:Vector3(19,7,17),32:Vector3(26,3,-16)}[si]
   p = local_point(i,polar.x,polar.z)
   r = polar.y

  for seg in 20:
   var a = p+Vector3(cos(seg*TAU/20),0,sin(seg*TAU/20))*r
   var b = p+Vector3(cos((seg+1)*TAU/20),0,sin((seg+1)*TAU/20))*r
   beam(parent,a+Vector3(0,1.0,0),b+Vector3(0,1.0,0),0.17,Color("9cae97"))
   collision_wall(parent,a,b,1.6,0.12)
   if seg%2==0:
    beam(parent,a,a+Vector3(0,1.2,0),0.12,Color("d6e5d2"))
  if SPECIES[si].zone=="swim":
   disc(parent,p+Vector3(0,0.15,0),r-0.3,0.08,Color("509daa"))
  var inward = (dome_c(i)-p).normalized()
  text(parent,SPECIES[si].name,p+inward*(r+0.3)+Vector3(0,1.8,0),Color("f6f4d7"),28,22)
  var sign = p+inward*(r+1.3)
  g.bio_hab[si] = {"type":"pen","c":p,"r":r-1.4,"rmin":0.0,"sign":sign}

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
 if i>=4:
  var si = [4,39,40][i-4]
  var home = g.bio_hab[si]
  for k in 3:
   var baby = spawn_animal(si,60+k,parent,home.c,float(home.r))
   baby.node.scale = Vector3.ONE*0.4
   baby.baby = true
   baby_nodes.append(baby)
 var rare_index = RARE_DOMES.find(i)
 if rare_index>=0:
  var si = RARE_SPECIES[rare_index]
  var home = g.bio_hab[si]
  var a = spawn_animal(si,50,parent,home.c,float(home.r))
  a.rare = rare_index
  a.node.name = RARES[rare_index].replace(" ","")
  a.node.visible = false
  if rare_index==2:
   a.node.scale = Vector3.ONE*0.45
  else:
   recolor(a.node,Color("f3ead5") if rare_index in [0,3] else Color("c5dfd8") if rare_index==4 else Color("edc45d"))
  rare_nodes.append(a)

func recolor(n: Node,col: Color) -> void:
 if n is MeshInstance3D and n.mesh!=null:
  for surface in n.mesh.get_surface_count():
   var mat = n.mesh.surface_get_material(surface)
   if mat!=null and (mat.resource_name.begins_with("World_lion") or mat.resource_name.begins_with("World_monkey") or mat.resource_name.begins_with("Fur_deer") or mat.resource_name.begins_with("World_bison") or mat.resource_name.begins_with("World_wombat")):
    n.set_surface_override_material(surface,material(col))
 for child in n.get_children():
  recolor(child,col)

func spawn_animal(si: int,k: int,parent: Node3D,p: Vector3,r: float) -> Dictionary:
 var s = SPECIES[si]
 var node = Node3D.new()
 parent.add_child(node)
 var a = {"node":node,"si":si,"kind":s.kind,"dome":s.dome,"c":p,"r":r,"phase":float(k)*1.7,"legs":[],"wings":[],"head":null,"k":k,"speed":0.8,"target":p,"feeding":false,"base_y":p.y}
 a["model_loaded"] = false
 a["model_path"] = "res://models/animals/animal_%s.glb" % s.kind
 if s.kind=="butterfly":
  g._bio_make_butterfly(a)
 else:
  a.model_loaded = g._bio_load_animal(a)
  if not a.model_loaded:
   push_error("Biosphere model failed: "+str(a.model_path))
   g._bio_make_quad(a,{"body":Vector3(0.5,0.6,1.0),"col":COLORS[int(s.dome)],"leg":0.5,"legr":0.09,"head":0.25,"neck":0.2,"necka":0.8,"ears":0.12,"tail":0.2,"snout":Color("32291f")})
 if s.kind=="elephant" and a.model_loaded:
  # The original GLB's hip pivots stop below the curved torso. Extend the
  # upper legs while keeping the feet at the same ground level.
  for leg in a.legs:
   leg.position.y *= 1.7
   leg.scale *= Vector3(1.55,1.7,1.55)
 if si>=33:
  refined_coat(node)
  a["flight_wings"] = []
  for wing_name in ["WingL","WingR"]:
   var wing = node.find_child(wing_name,true,false)
   if wing!=null:
    a.flight_wings.append(wing)
    a.wings.append(wing)
    wing.hide()
  a["folded_wings"] = node.find_child("FoldedWings",true,false)
 var ang = k*2.3
 node.position = p+Vector3(cos(ang),0.1,sin(ang))*r*0.65
 a.target = node.position
 animals.append(a)
 dome_animals[int(s.dome)].append(a)
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
 if i>=4:
  return phase2_quest_point(i,q,step)
 if i==2 and q==0:
  return local_point(i,[-9.5,-9.5,-4.0][step],[-24.0,0.0,22.0][step],[0.13,5.5,5.5][step])
 if i==3 and q==1:
  return local_point(i,0,[-14.0,0.0,14.0][step],0.22)
 if i==1 and q==0:
  return local_point(i,[-6.0,6.0,10.0][step],[-22.0,-7.0,-22.0][step])
 if i==0 and q==1:
  return local_point(i,-10.8,4.0+step*2.0)
 if i==3 and q==0:
  return local_point(i,9.0,-24.0+step*2.0)
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
 return {"slot":slot,"kind":int(rng.randi()%RARES.size()),"active":rng.randf()<0.42 and fposmod(n,300)<75}

func baby_dome(day: String) -> int:
 return posmod(day_number(day)*17+53,7)

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
 if i<0 or i>=7 or state.quests.has(str(i*3+q)):
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
  if i>=4:
   achieve("quest_%d"%id,QUESTS[i][q])
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
  if active>=4 and not phase2_interact():
   return true
  advance_quest(task)
  return true
 return true

func keeper(day := "") -> Dictionary:
 var date = today() if day=="" else day
 var rng = RandomNumberGenerator.new()
 rng.seed = day_number(date)*31+5300
 var i = int(rng.randi()%7)
 var kind = ["feed","clean","count","rescue"][int(rng.randi()%4)]
 var step = int(state.keeper_step) if state.keeper_work_day==date else 0
 return {"dome":i,"kind":kind,"p":local_point(i,7,-29+step*20),"step":step}

func keeper_here() -> bool:
 var k = keeper()
 return state.keeper_day!=today() and active==int(k.dome) and g.player.position.distance_to(k.p+Vector3(0,0.8,0))<3

func auto_keeper() -> void:
 if g.player!=null and not g.paused and not g.driving and g.place_open[1] and keeper_here():
  finish_keeper()

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
 var previous_dome = loaded_dome
 var start = Time.get_ticks_usec()
 tick_impl(delta)
 var elapsed = Time.get_ticks_usec()-start
 if previous_dome!=loaded_dome:
  profile_load_us += elapsed
 else:
  profile_usec += elapsed
  profile_calls += 1
  profile_worst = maxi(profile_worst,elapsed)

func tick_impl(delta: float) -> void:
 if g.player==null or not g.place_open[1]:
  return
 var current = dome_at(g.player.position) if not g.driving else -1
 if current!=active:
  activate_dome(current)
 if current<0 and loaded_dome>=0 and g.player.position.distance_to(dome_c(loaded_dome))>RADIUS+10.0:
  unload_detail()
 safety_net(delta)
 auto_keeper()
 if current>=0:
  apply_dome_quality()
 # Distance/frustum LOD preserves near motion without posing every far animal each frame.
 if active>=0 and not g.paused:
  var gathering = bool(feeding(active).active)
  for a in dome_animals[active]:
   if not a.node.visible:
    continue
   a["motion_time"] = float(a.get("motion_time",0.0))+delta
   var distance = g.camera.global_position.distance_to(a.node.position)
   var rate = 1.0/30.0 if distance<22.0 else (0.1 if distance<45.0 else 0.5)
   if not g.camera.is_position_in_frustum(a.node.position+Vector3(0,0.7,0)):
    rate = maxf(rate,0.25)
   if float(a.motion_time)>=rate:
    animate_animal(a,float(a.motion_time),gathering)
    a.motion_time = 0.0
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
  g._feed_add("RARE SIGHTING: "+RARES[int(rare.kind)]+" · "+NAMES[RARE_DOMES[int(rare.kind)]],"")
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
    achieve("rare_%d"%int(rare.kind),RARES[int(rare.kind)])
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
  # Movement is updated by the distance-aware animation clock above.
  var p = a.node.global_position+Vector3(0,0.7,0)
  if not a.has("rare") and me.position.distance_to(p)<17 and g.camera.is_position_in_frustum(p):
   spot(int(a.si))
 for m in markers:
  m.node.visible = active==int(m.dome) and task==int(m.dome)*3+int(m.q) and quest_step(task)==int(m.step)
  if m.node.visible:
   m.label.text = QUESTS[active][task%3]+" · %d/3" % (int(m.step)+1)
   if active>=4:
    m.label.text += "\n"+phase2_action(task,int(m.step))
 for project in keeper_projects:
  project.node.visible = quest_step(int(project.quest))>=int(project.step)
 var keeper_task = keeper()
 for station in shelters:
  station.node.visible = active==int(station.dome) and active==int(keeper_task.dome) and int(station.step)==int(keeper_task.step) and state.keeper_day!=today()
  if station.node.visible:
   station.label.text = "DAILY KEEPER · "+keeper_task.kind.to_upper()+" · %d/3\nWalk here · automatic check"%(int(keeper_task.step)+1)
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
  node.rotation.z = -0.12+sin(ph*0.5+int(a.k))*0.025
  for leg in a.legs:
   leg.hide()
  for k in a.wings.size():
   a.wings[k].rotation.z = sin(ph*(2.4 if int(a.si)>=33 else 4.0))*(0.16 if int(a.si)>=33 else 0.45)*(1 if k==0 else -1)
  return
 if a.get("upper_motion","")=="hang":
  node.position = centre+Vector3(sin(ph*0.4)*0.12,-0.15,cos(ph*0.3)*0.12)
  node.rotation.x = PI
  return
 if a.get("upper_motion","")=="perch":
  node.position = centre+Vector3(0,0.01,0)
  node.rotation.y = sin(ph*0.35+int(a.k))*0.12
  return
 show = show or float(a.get("manual_feed",0))>now()
 a.feeding = show
 if a.get("parade",false):
  a.target = a.get("parent_target",centre)
 elif show:
  var toward = (dome_c(int(a.dome))-centre).normalized()
  a.target = feeding_target(a,toward,radius)
 elif node.position.distance_to(a.target)<0.3:
  var t = ph*0.7+int(a.k)*2.2
  a.target = centre+Vector3(cos(t),0.1,sin(t))*radius*0.75
 var d: Vector3 = a.target-node.position
 d.y = 0
 var moving = d.length()>0.2
 if moving:
  node.position += d.normalized()*minf(delta*(1.6 if show else 0.65),d.length())
  node.rotation.y = lerp_angle(node.rotation.y,atan2(-d.x,-d.z),delta*3)
 if a.kind=="elephant" and not moving:
  var toward_path = dome_c(int(a.dome))-node.position
  node.rotation.y = lerp_angle(node.rotation.y,atan2(-toward_path.x,-toward_path.z),delta)
 var zone = "fly" if a.get("upper_motion","")=="glide" else ("swim" if SPECIES[int(a.si)].zone=="swim" else "ground")
 var base = float(a.get("base_y",0))
 node.position.y = base+(0.01 if a.get("upper",false) else (0.16 if zone=="swim" else 0.1))
 if zone=="fly":
  node.position.y = base+3.0+0.4*sin(ph*1.3)
 for k in a.legs.size():
  var gait_sign = (1 if k%2==0 else -1)
  if int(a.si)>=33 and a.legs.size()==4:
   gait_sign = [1,-1,-1,1][k]
  if a.kind=="kangaroo":
   gait_sign = 1
  a.legs[k].rotation.x = sin(ph*4.2)*(0.12 if a.kind=="elephant" else (0.24 if int(a.si)>=33 else 0.28))*gait_sign if moving else 0
 if a.kind=="kangaroo":
  node.position.y = base+0.1+(maxf(0,sin(ph*4.2))*0.10 if moving else 0)
  node.rotation.x = -0.045 if moving else 0
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
 if page>=4:
  ui_label(["Woodland, wildflower meadow and river garden · owl nests · meadow amphitheatre","Maple lake, canyon ledges and Arctic corner · eagle nests · high ranger overlook","Australian outback, eucalyptus and billabong · koala trees · forked beach pier"][page-4],Color("b4e5d6"),18)
 if page<4:
  ui_label(["LAYERS · grassland, kopje ledges and flamingo lagoon","LAYERS · bamboo forest, snow-leopard cliffs, red-panda trees and crane grove","LAYERS · forest floor, sloth branches, monkey canopy and macaw perches","LAYERS · frozen shore, raised penguin colony and albatross cliff nests"][page],Color("b4e5d6"),18)
 ui_button("FREE ENTRY ✓",g._bio_buy_pass)
 var mask = species_mask(page)
 var count = g._bits(int(g.bio_seen)&mask)
 var completed = 0
 if page<7:
  for q in 3:
   completed += 1 if state.quests.has(str(page*3+q)) else 0
 ui_label("VISIT %s   ·   WILDLIFE %d/%d   ·   QUESTS %d/3" % ["STAMPED" if int(state.visits)&(1<<page) else "NOT YET",count,g._bits(mask),completed])
 if page<7:
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
 ui_label("Full seven-page passport: World Explorer title + gold ring. All seven continent pages are open. Ocean World is reserved for Phase 3.")
func smoke() -> void:
 var keep = {"state":state.duplicate(true),"seen":g.bio_seen,"cash":g.cash,"xp":g.bonus_xp,"pass":g.bio_pass_day,"player":g.player.transform,"velocity":g.player.velocity,"board":g.board_on,"run":g.run_on,"driving":g.driving,"paused":g.paused,"active":active,"task":task,"day":test_day,"time":test_time,"hour":g.day_hour_override,"peers":g.online_peers.duplicate(),"shot":g.shot_on,"camera":g.camera.global_transform,"process":g.is_processing(),"physics":g.is_physics_processing(),"disabled":g.player.get_child(0).disabled,"place_level":g.place_test_level}
 g.set_process(false)
 g.set_physics_process(false)
 g.place_test_level = 40
 g._places_refresh()
 g.player.get_child(0).disabled = false
 g.driving = false
 g.paused = false
 g.online_peers = {}
 g.bio_pass_day = ""
 safety_enabled = false
 reset_state()
 assert(interiors.size()==7 and g.bio_gates.is_empty(),"Seven slots, free entry, no gates")
 var money = g.cash
 g._bio_buy_pass()
 assert(g._bio_pass_ok() and money==g.cash,"No ticket or payment")
 var legacy = ConfigFile.new()
 legacy.set_value("world_biosphere","state",{"pages":15,"quests":{"3":true},"photos":{"4":2},"rank_jobs":12})
 g.bio_seen = (1<<32)|(1<<4)
 load_state(legacy)
 assert(g.bio_seen==((1<<32)|(1<<4)) and state.pages==15 and state.photos.has("4") and state.quests.has("3"),"Old bits, passport pages, photos and quests preserved")
 reset_state()
 g.bio_seen = (1<<SPECIES.size())-1
 var start_dome = clampi(int(OS.get_environment("WB_START_DOME")),0,6)
 if start_dome>0:
  state.pages = (1<<start_dome)-1
  state.rank_jobs = start_dome*3
  for id in start_dome*3:
   state.quests[str(id)] = true
 # Isolate the bevel surface from intentional glass walls, then restore the walls.
 var seals = []
 for node in root.get_children():
  if node is StaticBody3D and node.name.begins_with("ContinuousSolidGuards"):
   seals.append(node)
 if OS.get_environment("WB_SKIP_PROVEN")!="1":
  for mode in ["walk","run","BOARD"]:
   g.board_on = mode=="BOARD"
   g.run_on = mode=="run"
   var speed = g._walk_speed()
   for wall in seals:
    wall.collision_layer = 0
   await g.get_tree().physics_frame
   for slot in range(-1,7):
    var centre = C if slot<0 else dome_c(slot)
    var radius = 20.0 if slot<0 else RADIUS
    for angle in 24:
     var direction = Vector3(cos(angle*TAU/24),0,sin(angle*TAU/24))
     walk_route("bevel %s %d angle %d"%[mode,slot,angle],[centre+direction*(radius+2.2)+Vector3(0,-0.05,0),centre+direction*(radius-2.2)+Vector3(0,0.09,0)],speed)
   for wall in seals:
    wall.collision_layer = 1
   await g.get_tree().physics_frame
   walk_route("hub ENTRY "+mode,[ENTRY+Vector3(0,-0.05,0),C+Vector3(0,-0.05,36),C+Vector3(0,0.09,12),C+Vector3(0,0.09,0)],speed)
   assert(campus_paths.size()==8,"Only ENTRY and seven original open spokes")
 for i in range(start_dome,7):
  print("WB_CHECK_DOME "+NAMES[i])
  g.player.position = dome_c(i)+Vector3(0,0.79,0)
  activate_dome(i)
  await g.get_tree().physics_frame
  await g.get_tree().physics_frame
  assert(loaded_dome==i,"Current detail loaded")
  for j in 7:
   assert((interiors[j].get_child_count()>0)==(j==i),"Only one interior is resident")
   assert(interiors[j].visible==(j==i),"Only current interior renders")
  assert(g.animal_scenes.size()<20,"Only current animal resources resident")
  for item in scenery_bounds:
   assert(clear_scenery_bounds(item.checked_bounds,i),"Scenery keeps 1.5 m clear of visitor surfaces")
  for f in fences:
   if int(f.dome)!=i:
    continue
   assert(Vector2(f.c.x-dome_c(i).x,f.c.z-dome_c(i).z).length()+float(f.r)+1.5<=RADIUS-1.5,"Pen clears perimeter bevel")
   for surface in walk_surfaces:
    assert(surface_distance(f.c,surface)>=float(f.r)+1.5,"All paths, ramps and decks clear pens")
  for a in animals:
   if a.kind!="butterfly":
    assert(a.model_loaded,"GLB loaded rather than placeholder: "+str(a.kind))
   if a.get("upper_motion","")=="glide":
    assert(can_fly(int(a.si)) and a.kind not in ["flamingo","penguin","crane","albatross","emu"],"No ground bird has a flight anchor")
    for leg in a.legs:
     assert(not leg.visible,"Flying legs are tucked")
   if a.kind=="elephant":
    var torso_bounds: AABB = a.body.transform*a.body.get_aabb()
    for leg in a.legs:
     var limb_bounds: AABB = leg.transform*leg.get_aabb()
     assert(limb_bounds.end.y>=torso_bounds.position.y+0.3 and limb_bounds.position.y<0.2,"Elephant legs reach torso and ground")
   if a.kind=="flamingo":
    assert(not a.get("upper",false) and float(a.base_y)<0.3,"Flamingos wade only in Coral Lagoon")
   if a.get("upper",false) and a.get("upper_motion","") not in ["glide","hang"]:
    animate_animal(a,0.2,false)
    var ray = PhysicsRayQueryParameters3D.create(a.node.position+Vector3(0,0.2,0),a.node.position-Vector3(0,0.5,0),1)
    ray.exclude = [g.player.get_rid(),g.car.get_rid()]
    assert(not g.get_world_3d().direct_space_state.intersect_ray(ray).is_empty(),"Standing upper animal has physical support")
   if a.kind=="elephant":
    assert(g.animal_scenes.get("elephant") is PackedScene and a.body is MeshInstance3D and a.legs.size()==4,"Elephant is the actual GLB with body and four legs")
  if i==0:
   var elephants = animals.filter(func(a):return a.kind=="elephant")
   assert(elephants.size()>=2,"Elephant group")
   assert(feeding_target(elephants[0],Vector3.FORWARD,float(elephants[0].r)).distance_to(feeding_target(elephants[1],Vector3.FORWARD,float(elephants[1].r)))>=1.3,"Elephants do not merge into one feeding blob")
  for mode in ["walk","run","BOARD"]:
   g.board_on = mode=="BOARD"
   g.run_on = mode=="run"
   var speed = g._walk_speed()
   var direction = (dome_c(i)-C).normalized()
   var across = Vector3(direction.z,0,-direction.x)
   walk_route("complete tunnel "+NAMES[i]+mode,[C+Vector3(0,0.09,0),dome_c(i)+Vector3(0,0.09,0)],speed)
   for offset in [-2.35,-1.2,0.0,1.2,2.35]:
    walk_route("door sides "+NAMES[i]+mode,[dome_c(i)-direction*(RADIUS+2.2)+across*offset+Vector3(0,-0.05,0),dome_c(i)-direction*(RADIUS-2.2)+across*offset+Vector3(0,0.09,0)],speed)
   walk_route("ground trail "+NAMES[i]+mode,ground_route(i),speed)
   walk_route("connected visitor stage "+NAMES[i]+mode,visitor_stage_route(i),speed)
   for surface in walk_surfaces:
    if surface.kind!="raised":
     continue
    if surface.has("radius"):
     var rim = []
     for k in 17:
      rim.append(surface.a+Vector3(cos(k*TAU/16),0,sin(k*TAU/16))*(float(surface.radius)-0.6))
     walk_route("deck edge "+NAMES[i]+mode,rim,speed)
    else:
     var side = Vector3(surface.b.z-surface.a.z,0,surface.a.x-surface.b.x).normalized()*(float(surface.width)*0.5-0.55)
     for sign in [-1,1]:
      var inset: Vector3 = (surface.b-surface.a).normalized()*minf(0.55,surface.a.distance_to(surface.b)*0.2)
      walk_route("raised edge "+NAMES[i]+mode,[surface.a+inset+side*sign,surface.b-inset+side*sign],speed)
   for boundary in raised_boundaries:
    var middle: Vector3 = (boundary.a+boundary.b)*0.5
    var edge_direction: Vector3 = boundary.b-boundary.a
    var inward = Vector3(-edge_direction.z,0,edge_direction.x).normalized()
    if inward.dot(boundary.centre-middle)<0:
     inward = -inward
    var start = middle+inward*0.65
    var ray = PhysicsRayQueryParameters3D.create(start+Vector3(0,1.0,0),start-Vector3(0,1.0,0),1)
    ray.exclude = [g.player.get_rid(),g.car.get_rid()]
    var support = g.get_world_3d().direct_space_state.intersect_ray(ray)
    assert(not support.is_empty(),"Raised-edge start has floor")
    g.player.position = Vector3(start.x,support.position.y+0.7,start.z)
    g.player.velocity = Vector3.ZERO
    var stopped = false
    for press in 20:
     drive_body(-inward,speed,1)
     for hit in g.player.get_slide_collision_count():
      var collision = g.player.get_slide_collision(hit)
      if collision.get_collider().name.begins_with("ContinuousSolidGuards") and collision.get_normal().dot(-inward)<-0.1:
       stopped = true
       break
     if stopped:
      break
    assert(stopped,"Solid raised edge %s %s start=%s middle=%s direction=%s ended=%s"%[NAMES[i],mode,start,middle,inward,g.player.position])
   for f in fences:
    if int(f.dome)!=i:
     continue
    for angle in 8:
     var dir = Vector3(cos(angle*TAU/8),0,sin(angle*TAU/8))
     g.player.position = f.c+dir*(float(f.r)+1.1)+Vector3(0,0.79,0)
     g.player.velocity = Vector3.ZERO
     drive_body(-dir,speed,60)
     assert(Vector2(g.player.position.x-f.c.x,g.player.position.z-f.c.z).length()>=float(f.r)+0.15,"Solid pen from every side: "+str(f.si)+mode)
   for angle in 48:
    var turn = angle*TAU/48.0
    if absf(wrapf(turn-PI,-PI,PI))<asin(3.4/RADIUS):
     continue # exact door opening is verified separately, both directions
    var dir = direction.rotated(Vector3.UP,turn)
    for entering in [false,true]:
     g.player.position = dome_c(i)+dir*(RADIUS+(2.0 if entering else -2.0))+Vector3(0,0.79,0)
     g.player.velocity = Vector3.ZERO
     drive_body(-dir if entering else dir,speed,60)
     var distance = Vector2(g.player.position.x-dome_c(i).x,g.player.position.z-dome_c(i).z).length()
     assert(distance>RADIUS+0.1 if entering else distance<RADIUS-0.1,"Sealed perimeter: only door entry/exit %s %s angle %.2f entering=%s"%[NAMES[i],mode,turn,entering])
   for height in [8.0,16.0,26.0]:
    var roof_point = dome_c(i)+Vector3(0,height,0)
    var roof_ray = PhysicsRayQueryParameters3D.create(roof_point+direction*50,roof_point,1)
    var roof_hit = g.get_world_3d().direct_space_state.intersect_ray(roof_ray)
    assert(not roof_hit.is_empty() and str(roof_hit.collider.name).begins_with("ClosedDomeShell"),"Upper dome shell is closed "+NAMES[i])
   # Explicitly inject the real body into every pen; rescue must work in each mode.
   safety_enabled = true
   for f in fences:
    if int(f.dome)!=i:
     continue
    rescue_cooldown = 0
    g.player.position = f.c+Vector3(0,0.79,0)
    safety_net(0.02)
    assert(not inside_pen(g.player.position,0.1),"Pen safety net "+NAMES[i]+mode)
    assert(not g._blocked_at(g.player.position+Vector3(0,0.15,0),0.3),"Rescue destination is open")
   rescue_cooldown = 0
   stuck_seconds = 0
   stuck_anchor = g.player.position
   g.stick = Vector2(1,0)
   for hold in 9:
    safety_net(0.2)
   assert(g.stick==Vector2.ZERO and rescue_cooldown>0,"Held-stick recovery "+mode)
   safety_enabled = false
  # Complete every real quest and passport page without repeat rewards.
  state.visits = int(state.visits)|(1<<i)
  for q in 3:
   var id = i*3+q
   start_quest(i,q)
   g.day_hour_override = 18.5
   test_time = 18000+i*35+20
   for animal in animals:
    animate_animal(animal,0.2,true)
    animal.node.position = animal.target
   for step in 3:
    g.player.position = quest_point(i,q,step)+Vector3(0,0.8,0)
    assert(not g._blocked_at(g.player.position,0.25),"Quest %d step %d at %s blocked by %s"%[id,step,g.player.position,g._blocker(g.player.position,0.25)])
    if id==9:
     for chick in baby_nodes:
      if int(chick.dome)==3:
       chick.node.position = chick.c
    assert(interact() and quest_step(id)==step+1,"Quest flow %d step %d"%[id,step])
   var paid = g.cash
   advance_quest(id)
   assert(g.cash==paid,"Quest pays once")
  claim_page(i)
  assert(int(state.pages)&(1<<i),"Continent page completes")
  var paid = g.cash
  claim_page(i)
  assert(g.cash==paid,"Page reward once")
  for si in SPECIES.size():
   if int(SPECIES[si].dome)!=i:
    continue
   var subject = animals.filter(func(a):return int(a.si)==si and not a.has("rare"))[0]
   var aim: Vector3 = subject.node.position+Vector3(0,0.65,0)
   g.camera.global_position = aim+Vector3(0,0.15,1.2)
   g.camera.look_at(aim)
   assert(photo_target()==si,"Photo detection "+str(SPECIES[si].kind))
   g.shot_on = true
   photo_capture()
   assert(state.photos.has(str(si)),"Album keeps each species")
  test_time = 36000+i*35+20
  g.player.position = dome_c(i)+Vector3(0,0.79,0)
  interval = 0
  tick(0.2)
  assert(state.shows.has("%d:%d"%[i,int(feeding(i).slot)]),"Feeding attendance")
  var feed_cash = g.cash
  interval = 0
  tick(0.2)
  assert(g.cash==feed_cash,"Feeding pays once")
 assert(state.pages==127 and state.world and rank_index()==3,"All pages, ranks and World Explorer preserved")
 # Rare sightings still earn their achievement exactly once after streaming.
 for rare_kind in RARES.size():
  activate_dome(int(RARE_DOMES[rare_kind]))
  await g.get_tree().physics_frame
  var event_time = -1.0
  for slot in range(1000,3000):
   var event = rare_event(slot*300+20)
   if event.active and int(event.kind)==rare_kind:
    event_time = slot*300+20
    break
  assert(event_time>=0,"Rare scheduled")
  test_time = event_time
  var subject = rare_nodes.filter(func(a):return int(a.rare)==rare_kind)[0]
  var toward = (dome_c(active)-subject.c).normalized()
  g.player.position = subject.c+toward*(float(subject.r)+2.8)+Vector3(0,0.79,0)
  g.camera.global_position = g.player.position+Vector3(0,2,0)
  g.camera.look_at(subject.node.position+Vector3(0,0.65,0))
  interval = 0
  tick(0.2)
  assert(state.rare.has(str(rare_event().slot)),"Rare spotted")
  var rare_cash = g.cash
  interval = 0
  tick(0.2)
  assert(g.cash==rare_cash,"Rare pays once")
 var peer = Node3D.new()
 g.add_child(peer)
 peer.position = g.player.position+Vector3(3,0,0)
 g.online_peers = {"check":{"node":peer,"driving":false,"seen":Time.get_ticks_msec()/1000.0}}
 assert(coop_near(g.player.position),"Nearby co-op preserved")
 g.online_peers.check.seen = -100
 assert(not coop_near(g.player.position),"Stale peer excluded")
 g.online_peers.clear()
 peer.free()
 # Daily task/streak and persistence still work after repeated unload/reload.
 for day in ["2026-11-20","2026-11-21","2026-11-22","2026-11-24"]:
  test_day = day
  var keeper_job = keeper()
  activate_dome(int(keeper_job.dome))
  await g.get_tree().physics_frame
  for step in 3:
   g.player.position = keeper().p+Vector3(0,0.8,0)
   auto_keeper()
   var paid_once = g.cash
   auto_keeper()
   assert(g.cash==paid_once,"Daily proximity does not pay twice")
  assert(state.keeper_day==day,"Daily task completes")
  assert(int(state.streak)==(1 if day=="2026-11-24" else day_number(day)-day_number("2026-11-20")+1),"Daily streak")
 var file = ConfigFile.new()
 save_state(file)
 var expected = state.duplicate(true)
 reset_state()
 load_state(file)
 assert(state==expected,"Passport and daily state round-trip")
 # Restore all user state; external runner restores the original file bytes too.
 state = keep.state
 g.bio_seen = keep.seen
 g.cash = keep.cash
 g.bonus_xp = keep.xp
 g.bio_pass_day = keep.pass
 g.player.transform = keep.player
 g.player.velocity = keep.velocity
 g.board_on = keep.board
 g.run_on = keep.run
 g.driving = keep.driving
 g.paused = keep.paused
 task = keep.task
 test_day = keep.day
 test_time = keep.time
 g.day_hour_override = keep.hour
 g.online_peers = keep.peers
 g.shot_on = keep.shot
 g.camera.global_transform = keep.camera
 g.player.get_child(0).disabled = keep.disabled
 g.place_test_level = keep.place_level
 g._places_refresh()
 safety_enabled = true
 stuck_seconds = 0
 pending_save = false
 activate_dome(int(keep.active))
 g.set_process(keep.process)
 g.set_physics_process(keep.physics)
 print("WORLD_BIOSPHERE_OK: 24-angle hub/seven-dome bevels; sealed doors and open spokes; real-body walk/run/BOARD paths/deck edges; every pen side and rescue; supported wildlife; scenery clearance; one resident interior; quests/photos/passport/daily/save")

func drive_body(direction: Vector3,speed: float,steps: int) -> void:
 var delta = maxf(g.get_physics_process_delta_time(),0.001)
 for step in steps:
  g.player.velocity = Vector3(direction.x*speed,g.player.velocity.y-24*delta,direction.z*speed)
  g.player.move_and_slide()

func screenshots() -> void:
 g.place_test_level = 40
 g._places_refresh()
 g.set_process(false)
 g.set_physics_process(false)
 g.paused = false
 g.driving = false
 g.cam_lock = true
 g.world_env_res.fog_enabled = false
 for child in g.get_children():
  if child is CanvasLayer or child is Control:
   child.hide()
 g.player.hide()
 for i in 7:
  g.player.position = dome_c(i)+Vector3(0,0.79,0)
  activate_dome(i)
  await g.get_tree().physics_frame
  for animal in animals:
   animate_animal(animal,0.2,false)
  g.camera.global_position = local_point(i,0,-30,2.4)
  g.camera.look_at(local_point(i,0,8,3.5))
  await g._save_shot(NAMES[i].to_lower().replace(" ","-"))
  if i==1:
   g.camera.global_position = local_point(i,0,-18,2.6)
   g.camera.look_at(local_point(i,0,-RADIUS+1.0,3.0))
   await g._save_shot("asia-door-inside")
   g.camera.global_position = local_point(i,-1,-RADIUS+20.0,2.2)
   g.camera.look_at(local_point(i,6.0,-RADIUS+10.0,3.6))
   await g._save_shot("asia-sign-inside")
   g.camera.global_position = local_point(i,-22,-20,2.6)
   g.camera.look_at(local_point(i,-RADIUS*0.8,-RADIUS*0.5,2.0))
   await g._save_shot("asia-wall-inside")
  if i in [1,3]:
   var route = visitor_stage_route(i)
   var at = maxi(0,route.size()/3)
   g.camera.global_position = route[at]+Vector3(0,2.3,0)
   g.camera.look_at(route[mini(at+2,route.size()-1)]+Vector3(0,1.0,0))
   await g._save_shot(NAMES[i].to_lower()+"-smooth-ramp")
  if i==0:
   var elephant = animals.filter(func(a):return a.kind=="elephant")[0]
   var point: Vector3 = elephant.node.position
   var face = (dome_c(i)-elephant.c).normalized()
   elephant.node.rotation.y = atan2(-face.x,-face.z)
   g.camera.global_position = point+face*6+Vector3(face.z,0,-face.x)*5+Vector3(0,2.5,0)
   g.camera.look_at(point+Vector3(0,1.6,0))
   await g._save_shot("elephant-glb")
 g.player.position = C
 activate_dome(-1)
 unload_detail()
 g.camera.global_position = C+Vector3(0,2.4,42)
 g.camera.look_at(C+Vector3(0,2.5,0))
 await g._save_shot("open-entry-directions")
 var door_dir = (dome_c(1)-C).normalized()
 g.camera.global_position = dome_c(1)-door_dir*(RADIUS+24.0)+Vector3(0,2.4,0)
 g.camera.look_at(dome_c(1)-door_dir*RADIUS+Vector3(0,3.5,0))
 await g._save_shot("asia-door-outside")
 var so = (dome_c(1)-C).normalized()
 var sr = Vector3(so.z,0,-so.x)
 var sp = C+so*(RING_R-4.0)+sr*7.0
 g.camera.global_position = sp-so*7.0+sr*3.0+Vector3(0,2.2,0)
 g.camera.look_at(sp+Vector3(0,3.6,0))
 await g._save_shot("asia-sign-outside")
 var loop_mid = C+Vector3(cos(-PI/2.0+TAU/14.0),0,sin(-PI/2.0+TAU/14.0))*RING_R
 g.camera.global_position = loop_mid+Vector3(0,2.6,0)+(C-loop_mid).normalized()*-10.0
 g.camera.look_at(dome_c(0)-(dome_c(0)-C).normalized()*RADIUS+Vector3(0,3.0,0))
 await g._save_shot("dome-loop")
 g.camera.far = 1200
 g.camera.global_position = C+Vector3(5,270,310)
 g.camera.look_at(C)
 await g._save_shot("open-campus")
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
    ps.append(c+Vector3(cos(a)*40*cos(t),-0.3+35*sin(t),sin(a)*40*cos(t)))
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
 for k in 200:
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
  var b = local_point(i,7,23,5.5)
  walkway(parent,a,b,3.0,3.0,0.0)
  tree_fort(parent)
  glass_edge(parent,local_point(i,-4,23,5.5),local_point(i,7,23,5.5),3.0,COLORS[i],3.0,0.0)
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
  phase2_walkway(parent,a,b,2.6,0,0)
  # Leave an unrailed landing opening on the near side of the ring.
  if (a.lerp(b,0.5)-join).length()>2.4:
   glass_edge(parent,a,b,2.6,COLORS[i])
  if k%4==0:
   beam(parent,Vector3(a.x,0.1,a.z),a-Vector3(0,0.13,0),0.28,Color("e3e9e2"))
   var ornament = a+across*0.75
   nature(parent,"nature_bush_flower" if i==1 else ("nature_bush_snow" if i==3 else "nature_bush_dry"),ornament,0.45,float(k))
 text(parent,"CLOUD WATERFALL TERRACE",centre+Vector3(0,height+2.3,0),Color("f0fff7"),28,50)

func route_clear(i: int,p: Vector3) -> bool:
 # Phase 2 domes (Europe, North America, Oceania) use phase2_route; keep decoration 3 m off it.
 if i<4:
  return true
 var pts = phase2_route(i)
 for k in range(1,pts.size()):
  var a: Vector3 = pts[k-1]
  var b: Vector3 = pts[k]
  var ab = b-a
  var t = clampf((p-a).dot(ab)/maxf(ab.length_squared(),0.001),0,1)
  if Vector2(p.x-(a+ab*t).x,p.z-(a+ab*t).z).length()<3.0:
   return false
 return true

func build_dome_loop() -> void:
 # v0.55.3: open, roofless ground path joining each dome's door area to its neighbours so visitors
 # can go dome to dome without returning to the hub. Visual surface only (the ground already collides);
 # the domes themselves stay sealed apart from their one door.
 for i in 7:
  var j = (i+1)%7
  var a0 = -PI/2.0+float(i)*TAU/7.0
  var steps = 12
  for k in steps:
   var t0 = a0+float(k)*TAU/7.0/float(steps)
   var t1 = a0+float(k+1)*TAU/7.0/float(steps)
   var p0 = C+Vector3(cos(t0),0,sin(t0))*RING_R
   var p1 = C+Vector3(cos(t1),0,sin(t1))*RING_R
   var d = (p1-p0)
   var yaw = atan2(d.x,d.z)
   box(root,(p0+p1)*0.5+Vector3(0,-0.04,0),Vector3(4.4,0.08,d.length()+0.7),Color("e7e9db"),false,Vector3(0,yaw,0))
   if k%4==2:
    var out = ((p0+p1)*0.5-C).normalized()
    for sg in [-1,1]:
     var q = (p0+p1)*0.5+out*(2.9*sg)
     shape(root,g._bcone(0.06,0.09,3.2),q+Vector3(0,1.6,0),Vector3.ONE,Color("c8d4da"))
     shape(root,g._bsph(0.26),q+Vector3(0,3.3,0),Vector3.ONE,Color("bff6ff"))
  var mid = a0+TAU/14.0
  var mp = C+Vector3(cos(mid),0,sin(mid))*RING_R
  var sign_node = text(root,"⇄ "+NAMES[i]+" · "+NAMES[j]+" ⇄",mp+Vector3(0,3.9,0),Color("244b3c"),46,45)
  sign_node.pixel_size = 0.012

func door_point(i: int) -> Vector3:
 return local_point(i,0,-RADIUS-2.0)

func dome_signpost(parent: Node3D,pos: Vector3,targets: Array) -> void:
 # v0.55.4: city-style signpost. Each blade points at a place and shows its name and distance.
 var old_flag = animal_structure
 animal_structure = true
 shape(parent,g._bcone(0.07,0.1,4.6),pos+Vector3(0,2.3,0),Vector3.ONE,Color("2b3640"))
 shape(parent,g._bsph(0.2),pos+Vector3(0,4.65,0),Vector3.ONE,Color("eef2f5"))
 for k in targets.size():
  var t = targets[k]
  var dv: Vector3 = (t[1] as Vector3)-pos
  dv.y = 0.0
  var dn = dv.normalized()
  var yaw = atan2(-dn.z,dn.x)
  var h = 4.1-float(k)*0.55
  var c = pos+dn*1.7+Vector3(0,h,0)
  box(parent,c,Vector3(3.4,0.45,0.08),Color("1d3346"),false,Vector3(0,yaw,0))
  box(parent,c-dn*1.65,Vector3(0.07,0.45,0.1),Color("5fd0ff"),false,Vector3(0,yaw,0))
  var dist = "%d m" % int(roundf(dv.length()/5.0)*5.0)
  var nrm = Vector3(sin(yaw),0,cos(yaw))
  for side in [1.0,-1.0]:
   var l = Label3D.new()
   l.text = ("%s  %s  ▶" % [String(t[0]).to_upper(),dist]) if side>0.0 else ("◀  %s  %s" % [String(t[0]).to_upper(),dist])
   l.font_size = 30
   l.pixel_size = 0.0068
   l.outline_size = 0
   l.modulate = t[2]
   l.position = c+nrm*side*0.05
   l.rotation.y = yaw if side>0.0 else yaw+PI
   l.visibility_range_end = 45.0
   parent.add_child(l)
 animal_structure = old_flag

func outside_signposts() -> void:
 for i in 7:
  var out = (dome_c(i)-C).normalized()
  var right = Vector3(out.z,0,-out.x)
  var pos = C+out*(RING_R-4.0)+right*7.0
  var nx = (i+1)%7
  var pv = (i+6)%7
  dome_signpost(root,pos,[
   ["Enter "+NAMES[i],door_point(i),Color("ffe08a")],
   [NAMES[nx],door_point(nx),Color("f4f8fb")],
   [NAMES[pv],door_point(pv),Color("f4f8fb")],
   ["Hub",C,Color("7dff9a")]])

func inside_signpost(i: int,parent: Node3D) -> void:
 var nx = (i+1)%7
 var pv = (i+6)%7
 dome_signpost(parent,local_point(i,6.0,-RADIUS+10.0),[
  ["Exit",door_point(i),Color("ffe08a")],
  [NAMES[nx],door_point(nx),Color("f4f8fb")],
  [NAMES[pv],door_point(pv),Color("f4f8fb")],
  ["Hub",C,Color("7dff9a")]])

func door_markers(i: int,parent: Node3D) -> void:
 # v0.55.3: a bright, tall EXIT arch with a label and a line of lights leading to it from inside the dome.
 var old_flag = animal_structure
 animal_structure = true
 var gold = Color("ffe08a")
 var door = local_point(i,0,-RADIUS+3.0)
 var left = local_point(i,-3.6,-RADIUS+3.0)
 var right = local_point(i,3.6,-RADIUS+3.0)
 for post in [left,right]:
  g._fc_part(parent,g._bcone(0.3,0.36,7.0),post+Vector3(0,3.5,0),g._fc_glow(gold))
 beam(parent,left+Vector3(0,7.0,0),right+Vector3(0,7.0,0),0.5,gold)
 text(parent,"⬇ EXIT ⬇",door+Vector3(0,9.4,0),Color("fff3b0"),96,110).pixel_size = 0.014
 text(parent,"to outside and the other domes",door+Vector3(0,8.0,0),Color.WHITE,44,60).pixel_size = 0.011
 for k in 9:
  var q = local_point(i,0,-RADIUS+6.0+float(k)*3.2,0.12)
  g._fc_part(parent,g._bsph(0.22),q,g._fc_glow(gold))
 animal_structure = old_flag

func colonnade(i: int,parent: Node3D) -> void:
 # v0.55.3: old Biosphere look: coloured columns joined by glass-rail arcs around the back of the dome.
 # Decoration only: no collision, sits at the rim away from routes, pens and the door side.
 var old_flag = animal_structure
 animal_structure = true
 var col = Color.from_hsv(COLORS[i].h,minf(1.0,COLORS[i].s*1.3+0.1),minf(1.0,COLORS[i].v+0.05))
 var prev = Vector3.ZERO
 var have = false
 for k in 19:
  var a = lerpf(0.12,PI-0.12,float(k)/18.0)
  var q = local_point(i,cos(a)*34.0,sin(a)*34.0,0.1)
  var ok = planting_clear(i,q) and route_clear(i,q)
  if ok:
   beam(parent,q,q+Vector3(0,4.2,0),0.5,col)
   shape(parent,g._bsph(0.42),q+Vector3(0,4.3,0),Vector3.ONE,col.lightened(0.35))
   if have:
    beam(parent,prev+Vector3(0,1.2,0),q+Vector3(0,1.2,0),0.1,col)
    beam(parent,prev+Vector3(0,3.9,0),q+Vector3(0,3.9,0),0.14,col)
   prev = q
   have = true
  else:
   have = false
 if i==4 or i==5:
  var wp = local_point(i,0,31,0.1)
  var wide = true
  for f in fences:
   if int(f.dome)==i and wp.distance_to(f.c)<float(f.r)+6.0:
    wide = false
  if wide and planting_clear(i,wp) and route_clear(i,wp):
   waterfall(i,parent,wp,5.0,14.0)
   soft_mist(i,parent,wp+Vector3(0,0.8,0),Vector3(3,0.4,2))
 animal_structure = old_flag

func garden_ring(i: int,parent: Node3D) -> void:
 # v0.55.3: old Biosphere look: a ring of leafy trees, flower beds and lanterns inside every dome.
 # Decoration only (no collision, no scenery registration); skips anything near routes/quests/pens.
 var rng = RandomNumberGenerator.new()
 rng.seed = 5531+i
 var old_flag = animal_structure
 animal_structure = true
 var trees = [["nature_acacia","nature_acacia"],["nature_cherry","nature_cherry2"],["nature_oak2","nature_oak"],["nature_pine_snow","nature_pine"],["nature_oak","nature_maple"],["nature_maple","nature_maple2"],["nature_acacia","nature_bush_dry"]][i]
 var tints = [[Color("ffb347"),Color("ffd23f"),Color("ff7a3d"),Color("fff0b0")],[Color("ff8fc2"),Color("ffc2dd"),Color("ffd23f"),Color("ffffff")],[Color("ff4f9a"),Color("ffd23f"),Color("9b5cff"),Color("ffffff")],[Color("e6f6ff"),Color("bfe9ff"),Color("ffffff"),Color("9be6ff")],[Color("ff6b6b"),Color("ffd23f"),Color("c254ff"),Color("ffffff")],[Color("ff8a1c"),Color("ffd23f"),Color("e63946"),Color("ffffff")],[Color("ff7a59"),Color("ffd23f"),Color("ff4f9a"),Color("fff0b0")]][i]
 var centre = local_point(i,0,16) if i==1 else dome_c(i)
 var toward = (dome_c(i)-C).normalized()
 var right = Vector3(toward.z,0,-toward.x)
 var ring = 17.0 if i==1 else 28.0
 var count = 28 if i==1 else 36
 for k in count:
  var a = float(k)*TAU/float(count)
  var q = centre+right*cos(a)*ring+toward*sin(a)*ring
  q.y = 0.1
  if Vector2(q.x-dome_c(i).x,q.z-dome_c(i).z).length()>RADIUS-5.0 or not planting_clear(i,q) or not route_clear(i,q):
   continue
  if k%2==0:
   nature(parent,trees[0] if k%4==0 else trees[1],q,0.95+rng.randf()*0.35,rng.randf()*TAU)
  else:
   var bed = centre+right*cos(a)*(ring-1.8)+toward*sin(a)*(ring-1.8)
   bed.y = 0.1
   if planting_clear(i,bed) and route_clear(i,bed):
    shape(parent,g._blow(0.5),bed+Vector3(0,0.25,0),Vector3(1.3,0.8,1.3),Color("3f9450") if i!=3 else Color("e8f3f8"))
    shape(parent,g._bsph(0.22),bed+Vector3(0.1,0.75,0.0),Vector3.ONE,tints[k%4])
    shape(parent,g._bcone(0.05,0.08,2.6),bed+right*0.9+Vector3(0,1.3,0),Vector3.ONE,Color("c8d4da"))
    shape(parent,g._bsph(0.24),bed+right*0.9+Vector3(0,2.7,0),Vector3.ONE,COLORS[i].lightened(0.5))
 animal_structure = old_flag

func glass_edge(parent: Node3D,a: Vector3,b: Vector3,width: float,col: Color,open_start := 0.0,open_end := 0.0) -> void:
 var axis = (b-a).normalized()
 a += axis*open_start
 b -= axis*open_end
 var sideways = Vector3(b.z-a.z,0,a.x-b.x).normalized()
 for side in [-1,1]:
  beam(parent,a+sideways*width*0.5*side+Vector3(0,1.25,0),b+sideways*width*0.5*side+Vector3(0,1.25,0),0.09,col)

func waterfall(i: int,parent: Node3D,p: Vector3,width: float,height: float) -> void:
 var old_group = scenery_group
 scenery_group = "Waterfall:%d" % i
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
 scenery_bounds.append({"dome":i,"node":node,"group":scenery_group})
 for k in 7:
  var q = p+Vector3((k-3)*1.3,0,-2.5)
  shape(parent,g._blow(1.0),q+Vector3(0,5+k%3*2.4,0),Vector3(2.5,7+k%3*2.4,2.5),Color("778d83"))
 disc(parent,p+Vector3(0,0.15,0),4.0,0.08,Color("5ea8b4"))
 scenery_group = old_group

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
  [Vector2(0,-36),Vector2(0,-23),Vector2(-7,-12),Vector2(0,-1),Vector2(9,9),Vector2(9,21),Vector2(0,31)],
  [Vector2(0,-36),Vector2(0,-12),Vector2(-10,4),Vector2(0,10),Vector2(10,4),Vector2(0,-12)]
 ]
 var result = []
 for p in routes[i]:
  result.append(local_point(i,p.x,p.y,0.09))
 return result

func ground_trails(i: int,parent: Node3D) -> void:
 var route = ground_route(i)
 for segment in range(1,route.size()):
  register_walk(parent,route[segment-1],route[segment],3.8,"ground")
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
  var u = clampf(float(z+25)/22.0,0,1)
  var top = lerpf(0.09,4.5,u*u*(3-2*u))
  beam(parent,local_point(i,9.5,z,0.09),local_point(i,9.5,z,top-0.15),0.25,Color("e7d7b6"))
 for side in [-1,1]:
  beam(parent,centre+Vector3(side*2.8,0,2.5),centre+Vector3(side*2.8,3.5,2.5),0.18,Color("c9b686"))
 var roof = g._bcone(0.05,4.8,1.0).duplicate()
 roof.radial_segments = 6
 shape(parent,roof,centre+Vector3(0,3.8,0),Vector3(1,1,0.8),Color("f2dcb0"))
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
 disc(parent,local_point(1,-12,16,5.85),2.0,0.3,Color("b6c7bd"),true)
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
 var centre = local_point(2,7,23,5.5)
 var outward = (dome_c(2)-C).normalized()
 var across = Vector3(outward.z,0,-outward.x)
 var rot = Basis(across,Vector3.UP,outward).get_euler()
 # A complete floor prevents falls through the old trunk opening.
 box(parent,centre-Vector3(0,0.15,0),Vector3(8,0.3,7),Color("a08354"),true,rot)
 tall_tree(parent,local_point(2,16,28,0.09),1.8,7.0,"nature_oak")
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
 if motion=="glide" and not can_fly(si):
  var home = g.bio_hab[si]
  if SPECIES[si].kind in ["flamingo","crane","penguin"]:
   return spawn_animal(si,k,parent,home.c,float(home.r))
  var height = 6.0
  c = home.c+Vector3(0,height,0)
  r = 0.25
  motion = "perch"
  var nest_key = str(si)
  if not parked_nests.has(nest_key):
   parked_nests[nest_key] = true
   high_habitat(parent,home.c,height,2.2,Color("9a8664"),true)
 var a = spawn_animal(si,k,parent,c,r)
 a["upper"] = true
 a["upper_motion"] = motion
 a["base_y"] = c.y
 if si>=33:
  for wing in a.get("flight_wings",[]):
   wing.visible = motion=="glide"
  if a.get("folded_wings")!=null:
   a.folded_wings.visible = motion!="glide"
 if motion=="glide":
  if a.node.get_child_count()>0:
   a.node.get_child(0).rotation.x = -0.35
  for wing in a.wings:
   wing.rotation.x = 0.35
  for leg in a.legs:
   leg.hide()
  # The outer glass dome is the flight enclosure; keep the whole circuit inside it.
  a.node.rotation.z = 0.1*sin(float(k))
  for name in ["WingL","WingR"]:
   var wing = a.node.find_child(name,true,false)
   if wing!=null and not a.wings.has(wing):
    a.wings.append(wing)
 return a

func high_habitat(parent: Node3D,c: Vector3,height: float,radius: float,col: Color,tree: bool) -> void:
 animal_structure = true
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

 animal_structure = false

func x_layer(p: Vector3,i: int) -> float:
 var forward = (dome_c(i)-C).normalized()
 return (p-dome_c(i)).dot(Vector3(forward.z,0,-forward.x))

func z_layer(p: Vector3,i: int) -> float:
 return (p-dome_c(i)).dot((dome_c(i)-C).normalized())

func tall_tree(parent: Node3D,p: Vector3,scale_value: float,raise: float,kind: String) -> void:
 var old_group = scenery_group
 scenery_group = "Tree:%d:%s" % [parent.get_instance_id(),str(p)]
 # Raise the leafy crown above visitor/animal platforms and extend its trunk
 # down to the floor, so the new upper paths do not disappear inside leaf cards.
 nature(parent,kind,p+Vector3(0,raise,0),scale_value,0.5)
 shape(parent,g._bcone(0.42,0.68,raise+0.5),p+Vector3(0,(raise+0.5)/2,0),Vector3.ONE,Color("795d40"))
 scenery_group = old_group

# ---- 0.55.0: three new continents, stable appended animal and quest IDs.
func phase2_pen(si: int) -> Vector2:
 var positions = {4:Vector2(-23,-21),5:Vector2(23,-21),6:Vector2(-23,-7),34:Vector2(23,21),35:Vector2(-17,24),36:Vector2(23,-7),37:Vector2(23,7),1:Vector2(-17,24),2:Vector2(23,21),12:Vector2(-23,-21),13:Vector2(23,-21),14:Vector2(-23,-7),15:Vector2(23,-7),39:Vector2(23,7),40:Vector2(-23,-21),41:Vector2(23,7),42:Vector2(23,-21),43:Vector2(-23,-7),44:Vector2(23,-7)}
 return positions.get(si,Vector2(-23,7))

func phase2_route(i: int) -> Array:
 var coords = [Vector3(-9.5,0.09,-25),Vector3(-9.5,1.6,-8),Vector3(-12,3.2,1),Vector3(-12,3.2,4),Vector3(-18,3.2,6)]
 if i==5:
  coords = [Vector3(-9.5,0.09,-25),Vector3(-9.5,3,-8),Vector3(-9.5,3,-5),Vector3(-18,3,0),Vector3(-18.5,3,2.25),Vector3(-20,6,9),Vector3(-21.12,6,14)]
 elif i==6:
  coords = [Vector3(0,0.09,12),Vector3(0,1.4,19),Vector3(0,1.4,22),Vector3(7,1.4,28)]
 var result = []
 for p in coords:
  result.append(local_point(i,p.x,p.z,p.y))
 return result

func phase2_quest_point(i: int,q: int,step: int) -> Vector3:
 if (i==5 and q==1) or (i==6 and q==2):
  return phase2_route(i)[[1,3,6][step] if i==5 else [0,2,3][step]]
 var xs = [-7.0,7.0,0.0]
 var zs = [-22.0,-1.0,21.0]
 if i==4:
  if q==0:
   return local_point(i,-10,[-24.0,5.0,20.0][step])
  if q==1:
   return local_point(i,[7.0,0.0,-18.0][step],[-24.0,-5.0,6.0][step],[0.09,0.09,3.2][step])
  return local_point(i,10,[-4.0,2.0,9.0][step])
 if i==5:
  if q==0:
   return local_point(i,[-7.0,7.0,-10.0][step],[-24.0,-12.0,-8.0][step])
  return local_point(i,[0.0,9.0,10.0][step],[0.0,12.0,21.0][step])
 if q==0:
  return local_point(i,-10,[-25.0,-22.0,-19.0][step])
 if q==1:
  return local_point(i,[-7.0,-10.0,0.0][step],[-24.0,-8.0,10.0][step])
 return local_point(i,xs[step],zs[step])

func phase2_interact() -> bool:
 var step = quest_step(task)
 if task==14:
  if not feeding(4).active:
   g._show_toast("Stork Supper: return during the Europe feeding show.")
   return false
  var arrivals = 0
  for a in animals:
   if int(a.si)==37 and bool(a.feeding) and a.node.position.distance_to(a.target)<0.6:
    arrivals += 1
  if arrivals<step+1:
   g._show_toast("Watch the storks gather, then count the next arrival.")
   return false
 if task==18:
  var joeys = baby_nodes.filter(func(a):return int(a.dome)==6)
  if joeys.is_empty() or joeys[step%joeys.size()].node.global_position.distance_to(g.player.position)>17:
   g._show_toast("Look towards the kangaroo family from this viewing marker.")
   return false
 if (task==15 and step==2) or (task==19 and step==1):
  for a in animals:
   if int(a.si)==(14 if task==15 else 43):
    a["manual_feed"] = now()+30
 g._show_toast(phase2_action(task,step)+" ✓")
 return true

func phase2_action(id: int,step: int) -> String:
 var actions = [
  ["Check the first pawprints","Follow the woodland tracks","Identify the wolf family"],
  ["Collect meadow seeds","Check the river planting bed","Plant the stage meadow"],
  ["Count the first stork","Count the next stork","Record the whole flock"],
  ["Collect a fallen branch","Collect willow poles","Help the beavers repair their dam"],
  ["Reach the lower canyon ledge","Check the eagle lookout","Reach the high ranger overlook"],
  ["Check the ice tracks","Follow the fox trail","Check the Arctic fox family"],
  ["Find the first joey","Find the second joey","Find the last joey"],
  ["Collect the keeper kit","Feed the platypuses","Check billabong water"],
  ["Reach the beach pier","Listen for cockatoos","Record the coastal flock"]]
 return actions[id-12][step]

func phase2_landscape(i: int,parent: Node3D) -> void:
 var rng = RandomNumberGenerator.new()
 rng.seed = 54400+i
 # Vegetation is batched per active interior; no distant continent vegetation draws.
 for k in 160:
  var p = local_point(i,rng.randf_range(-34,34),rng.randf_range(-32,32),0.1)
  if (p-dome_c(i)).length()>35 or not planting_clear(i,p):
   continue
  var name = "nature_bush_flower" if i==4 else "nature_fern" if i==5 else "nature_grass_dry"
  nature(parent,name,p,rng.randf_range(0.6,1.15),rng.randf()*TAU)
 for side in [-1,1]:
  for z in [-23,-11,0,11,23]:
   var p = local_point(i,side*28,z)
   if i==6:
    # Original eucalyptus silhouette: pale trunk and sparse, long leaf sprays.
    beam(parent,p,p+Vector3(0,11,0),0.45,Color("d7cab6"))
    for branch in 5:
     var tip = p+Vector3(cos(branch*2.4)*3,7+branch,sin(branch*2.4)*3)
     beam(parent,p+Vector3(0,5+branch,0),tip,0.17,Color("d7cab6"))
     ball(parent,tip,Vector3(3,0.6,1.2),Color("7a9981"))
   else:
    nature(parent,"nature_oak2" if i==4 else "nature_maple2",p,1.3,float(z))
    if i==4:
     nature(parent,"nature_oak",local_point(i,side*31,z+3),1.1,float(z)*0.6)
 var route = phase2_route(i)
 for k in range(1,route.size()):
  phase2_walkway(parent,route[k-1],route[k],3.2,0.0 if k==1 else 2.5,2.5)
  glass_edge(parent,route[k-1],route[k],3.2,COLORS[i],0.0 if k==1 else 2.5,2.5)
 for index in ([3] if i==4 else [2,3] if i==5 else [2]):
  disc(parent,route[index]-Vector3(0,0.15,0),2.0,0.3,Color("b6a27c"),true)
 var top: Vector3 = route[-1]
 var outward = (dome_c(i)-C).normalized()
 var deck_rotation = Vector3(0,atan2(outward.x,outward.z),0)
 if i==4:
  disc(parent,top-Vector3(0,0.15,0),3.2,0.3,Color("b6a27c"),true)
 else:
  # Canyon: wide angular lookout. Coast: a compact rectangular pier head.
  box(parent,top-Vector3(0,0.15,0),Vector3(8 if i==5 else 5,0.3,5 if i==5 else 4),Color("9caaa4") if i==5 else Color("c6ad7b"),true,deck_rotation)
 if i==4:
  # An open meadow amphitheatre faces a river, with terraced flower seating.
  for k in 12:
   var p = local_point(i,25-k*0.7,-27+k*4.3,0.14)
   disc(parent,p,2.5,0.08,Color("619ba7"))
   nature(parent,"nature_reeds",p+Vector3(2,0,0),0.9,float(k))
  # A visible river bend and flush stone crossing on the meadow circuit.
  for k in 7:
   disc(parent,local_point(i,-8+k*2.8,20+sin(k*0.7)*3,0.12),2.4,0.04,Color("619ba7"))
  box(parent,local_point(i,-4.5,22.2,0.055),Vector3(4.3,0.07,6),Color("c6c8b3"))
  for side in [-1,1]:
   beam(parent,local_point(i,-4.5+side*2,19.2,0.8),local_point(i,-4.5+side*2,25.2,0.8),0.12,Color("a9afa0"))
  for ring in 3:
   for k in 7:
    var a = PI*float(k)/6
    var p = top+Vector3(cos(a)*(4+ring),-3.05+ring*0.14,sin(a)*(4+ring))
    box(parent,p,Vector3(1.8,0.28,0.65),Color("b5b5a0"))
  for side in [-1,1]:
   for z in range(-16,20,4):
    nature(parent,"nature_bush_flower",local_point(i,side*8,z,0.1),0.8,float(z))
  text(parent,"EUROPE · WOODLAND & MEADOW\nRIVER GARDEN · MEADOW AMPHITHEATRE",local_point(i,0,29,8),Color("f0f6c7"),30)
 elif i==5:
  disc(parent,local_point(i,-1,16,0.15),7,0.08,Color("598fa5"))
  for k in 6:
   var rock = local_point(i,-26+k*0.5,3+k*3,2+k*0.6)
   shape(parent,g._blow(1.0),rock,Vector3(4,3+k*0.4,3),Color("89918e"))
  for si in [1,2]:
   var c: Vector3 = g.bio_hab[si].c
   disc(parent,c+Vector3(0,0.11,0),5.3,0.025,Color("e4f1f3"))
   for k in 3:
    ball(parent,c+Vector3(-3+k*3,1,3),Vector3(1.4,1.6,1.6),Color("d5e7ed"))
  var dam: Vector3 = g.bio_hab[14].c
  for k in 8:
   var log_root = Node3D.new()
   parent.add_child(log_root)
   beam(log_root,dam+Vector3(-3+k*0.8,0.5,-1.5),dam+Vector3(-2+k*0.8,0.5,1.5),0.22,Color("7e634a"))
   keeper_projects.append({"node":log_root,"quest":15,"step":1+k/3})
  text(parent,"NORTH AMERICA · MAPLE LAKE\nCANYON LEDGES · ARCTIC CORNER",local_point(i,0,29,8),Color("ffe2bc"),30)
 else:
  disc(parent,local_point(i,-18,-8,0.17),5.2,0.08,Color("638f91"))
  disc(parent,local_point(i,0,29,0.13),8.5,0.06,Color("dcd2a4"))
  disc(parent,local_point(i,0,32,0.16),6,0.05,Color("6bb5bc"))
  for k in 6:
   shape(parent,g._blow(1),local_point(i,23+k%2*3,-1+k*3,1+k%3),Vector3(2.7,1.8,2),Color("b66e47"))
  var branch = local_point(i,-5,28,1.4)
  phase2_walkway(parent,local_point(i,0,22,1.4),branch,2.8,2.5,2.5)
  box(parent,branch-Vector3(0,0.15,0),Vector3(4,0.3,4),Color("c6ad7b"),true,deck_rotation)
  text(parent,"OCEANIA · AUSTRALIAN OUTBACK TO OCEAN\nEUCALYPTUS · BILLABONG · COASTAL PIER",local_point(i,0,29,8),Color("ffedce"),30)
 # Small original quest props explain what each marker does before interacting.
 for q in 3:
  for step in 3:
   var p = phase2_quest_point(i,q,step)
   # The active quest marker already carries this instruction; avoid nine persistent labels.
   if i==4 and q==0 or i==5 and q==2:
    for toe in 3:
     ball(parent,p+Vector3(0.15*toe,0.12,0.2),Vector3(0.08,0.025,0.12),Color("725b46"))
   elif i==5 and q==0 and step<2:
    beam(parent,p+Vector3(-0.6,0.3,-0.5),p+Vector3(0.6,0.3,-0.5),0.22,Color("8a6b48"))
   elif i==4 and q==1 and step<2:
    box(parent,p+Vector3(0,0.28,-0.6),Vector3(0.6,0.4,0.5),Color("bba36c"))

func phase2_layers(i: int,parent: Node3D) -> void:
 var si = 33 if i==4 else 38 if i==5 else 41
 var home = local_point(i,-24,5) if i!=6 else g.bio_hab[41].c
 var height = 9.0 if i!=6 else 7.0
 high_habitat(parent,home,height,2.8,Color("9a8664"),i!=5)
 for k in 2:
  upper_animal(si,70+k,parent,home+Vector3(0,height,0),1.4,"perch")
 if i==6:
  tall_tree(parent,home,2.2,6,"nature_oak2")
 text(parent,["WOODLAND OWL NESTS","EAGLE CLIFF NESTS","KOALA TREE HABITAT"][i-4],home+Vector3(0,height+2,0),Color("ecf8dc"),24,45)

func phase2_walkway(parent: Node3D,a: Vector3,b: Vector3,width: float,open_start: float,open_end: float) -> void:
 var previous = walk_surfaces.size()
 register_walk(parent,a,b,width,"raised")
 if walk_surfaces.size()>previous:
  walk_surfaces[-1]["swept"] = true
  walk_surfaces[-1]["parent"] = parent

func sweep_join(surface: Dictionary,at_start: bool) -> Dictionary:
 var d: Vector3 = surface.b-surface.a
 var horizontal = Vector3(d.x,0,d.z)
 var normal = Vector3(d.z,0,-d.x).normalized()
 var point: Vector3 = surface.a if at_start else surface.b
 var joins = []
 for other in walk_surfaces:
  if other==surface or not other.get("swept",false) or other.parent!=surface.parent or absf(float(other.width)-float(surface.width))>0.01:
   continue
  if point.distance_to(other.a)<0.02:
   joins.append(other.b)
  elif point.distance_to(other.b)<0.02:
   joins.append(other.a)
 var slope = 0.0
 var offset = normal*float(surface.width)*0.5
 if joins.size()==1:
  var next: Vector3 = point-joins[0] if at_start else joins[0]-point
  var next_flat = Vector3(next.x,0,next.z)
  if next_flat.normalized().dot(horizontal.normalized())>0.0:
   var tangent = (horizontal.normalized()+next_flat.normalized()).normalized()
   var miter = Vector3(tangent.z,0,-tangent.x)
   offset = miter*float(surface.width)*0.5/maxf(miter.dot(normal),0.6)
   var current_slope = d.y/maxf(horizontal.length(),0.01)
   var next_slope = next.y/maxf(next_flat.length(),0.01)
   if current_slope*next_slope>0:
    slope = (current_slope+next_slope)*0.5
 return {"side":offset,"slope":slope}

func build_sweeps(parent: Node3D) -> void:
 for surface in walk_surfaces:
  if not surface.get("swept",false) or surface.parent!=parent:
   continue
  var a: Vector3 = surface.a
  var b: Vector3 = surface.b
  var length = Vector2(b.x-a.x,b.z-a.z).length()
  var first = sweep_join(surface,true)
  var last = sweep_join(surface,false)
  var count = maxi(2,ceili(length/0.3))
  var left = []
  var right = []
  for k in count+1:
   var t = float(k)/count
   var centre = a.lerp(b,t)
   centre.y = (2*t*t*t-3*t*t+1)*a.y+(t*t*t-2*t*t+t)*length*float(first.slope)+(-2*t*t*t+3*t*t)*b.y+(t*t*t-t*t)*length*float(last.slope)
   var side: Vector3 = first.side.lerp(last.side,t)
   left.append(centre-side)
   right.append(centre+side)
  var id = parent.get_instance_id()
  if not walk_meshes.has(id):
   walk_meshes[id] = {"parent":parent,"top":PackedVector3Array(),"visual":PackedVector3Array()}
  for k in count:
   var faces = PackedVector3Array([left[k],right[k],left[k+1],right[k],right[k+1],left[k+1]])
   walk_meshes[id].top.append_array(faces)
   walk_meshes[id].visual.append_array(faces)
   for edge in [[left[k],left[k+1]],[right[k+1],right[k]]]:
    var p: Vector3 = edge[0]
    var q: Vector3 = edge[1]
    walk_meshes[id].visual.append_array(PackedVector3Array([p,q,p-Vector3(0,0.22,0),p-Vector3(0,0.22,0),q,q-Vector3(0,0.22,0)]))
  right.reverse()
  surface.poly = left.duplicate()
  surface.poly.append_array(right)


func refined_coat(n: Node) -> void:
 # Imported colour attributes need explicit albedo use on Compatibility materials.
 if n is MeshInstance3D and n.mesh!=null:
  for surface in n.mesh.get_surface_count():
   var source = n.mesh.surface_get_material(surface)
   if source is StandardMaterial3D and source.resource_name.begins_with("World_"):
    var key = source.get_instance_id()
    if not refined_materials.has(key):
     var coat = source.duplicate() as StandardMaterial3D
     coat.vertex_color_use_as_albedo = true
     coat.vertex_color_is_srgb = false
     coat.roughness = 0.92
     coat.metallic_specular = 0.15
     refined_materials[key] = coat
    n.set_surface_override_material(surface,refined_materials[key])
 for child in n.get_children():
  refined_coat(child)

# Native mobile-like benchmark instrumentation; no player/save changes.
func profile_report() -> void:
 var info = {"dome":active,"tick_us_avg":float(profile_usec)/maxi(profile_calls,1),"tick_us_max":profile_worst,"stream_load_us":profile_load_us,"heap_peak":OS.get_static_memory_peak_usage(),"texture_bytes":Performance.get_monitor(Performance.RENDER_TEXTURE_MEM_USED),"buffer_bytes":Performance.get_monitor(Performance.RENDER_BUFFER_MEM_USED),"video_bytes":Performance.get_monitor(Performance.RENDER_VIDEO_MEM_USED),"animal_models":g.animal_scenes.size(),"interior_nodes":[],"nodes":0,"labels":0,"transparent_surfaces":0,"visible_transparent_surfaces":0,"alpha_scissor_surfaces":0,"mesh_resources":{},"mesh_triangles":0,"multimeshes":0,"multimesh_instances":0,"multimesh_buffer_bytes":0,"audio_resources":{},"audio_wav_bytes":0,"animal_glb_file_bytes":0}
 profile_node(root,info)
 profile_audio(g,info)
 for kind in g.animal_scenes:
  var file = FileAccess.open("res://models/animals/animal_%s.glb"%kind,FileAccess.READ)
  if file!=null:
   info.animal_glb_file_bytes += file.get_length()
 info.audio_resources = info.audio_resources.size()
 for detail in interiors:
  info.interior_nodes.append(0 if detail==null else profile_node_count(detail))
 info.mesh_resources = info.mesh_resources.size()
 print("WB_PROFILE "+JSON.stringify(info))

func profile_node_count(n: Node) -> int:
 var count = 1
 for child in n.get_children():
  count += profile_node_count(child)
 return count

func profile_node(n: Node,info: Dictionary) -> void:
 info.nodes += 1
 if n is MultiMeshInstance3D and n.multimesh!=null:
  info.multimeshes += 1
  info.multimesh_instances += n.multimesh.instance_count
  info.multimesh_buffer_bytes += n.multimesh.instance_count*48
 if n is Label3D:
  info.labels += 1
 var mesh: Mesh = n.mesh if n is MeshInstance3D else (n.multimesh.mesh if n is MultiMeshInstance3D and n.multimesh!=null else null)
 if mesh!=null:
  var id = mesh.get_instance_id()
  if not info.mesh_resources.has(id):
   info.mesh_resources[id] = true
   if mesh is ArrayMesh:
    for surface in mesh.get_surface_count():
     info.mesh_triangles += mesh.surface_get_array_index_len(surface)/3 if mesh.surface_get_array_index_len(surface)>0 else mesh.surface_get_array_len(surface)/3
  for surface in mesh.get_surface_count():
   var mat = n.material_override if n.material_override!=null else (n.get_surface_override_material(surface) if n is MeshInstance3D and n.get_surface_override_material(surface)!=null else mesh.surface_get_material(surface))
   if mat is BaseMaterial3D:
    if mat.transparency==BaseMaterial3D.TRANSPARENCY_ALPHA:
     info.transparent_surfaces += 1
     if n.is_visible_in_tree():
      info.visible_transparent_surfaces += 1
    if mat.transparency==BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR:
     info.alpha_scissor_surfaces += 1
 for child in n.get_children():
  profile_node(child,info)

# ---- 0.55.1: continuous floor transitions, protected paths and rescue.
func rim_bevel(parent: Node3D,c: Vector3,radius: float,col: Color,collision_enabled := true) -> void:
 var faces = PackedVector3Array()
 for k in 96:
  var a = float(k)*TAU/96.0
  var b = float(k+1)*TAU/96.0
  var inner_a = c+Vector3(cos(a)*(radius-1.5),0.09,sin(a)*(radius-1.5))
  var inner_b = c+Vector3(cos(b)*(radius-1.5),0.09,sin(b)*(radius-1.5))
  var outer_a = c+Vector3(cos(a)*(radius+1.5),-0.05,sin(a)*(radius+1.5))
  var outer_b = c+Vector3(cos(b)*(radius+1.5),-0.05,sin(b)*(radius+1.5))
  faces.append_array(PackedVector3Array([inner_a,outer_a,inner_b,inner_b,outer_a,outer_b]))
 var st = SurfaceTool.new()
 st.begin(Mesh.PRIMITIVE_TRIANGLES)
 for vertex in faces:
  st.add_vertex(vertex)
 st.generate_normals()
 var visual = MeshInstance3D.new()
 visual.mesh = st.commit()
 visual.material_override = material(col)
 visual.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
 parent.add_child(visual)
 if not collision_enabled:
  return
 var body = StaticBody3D.new()
 body.name = "ContinuousRimBevel"
 var collision = CollisionShape3D.new()
 var mesh = ConcavePolygonShape3D.new()
 mesh.backface_collision = true
 mesh.set_faces(faces)
 collision.shape = mesh
 body.add_child(collision)
 parent.add_child(body)

func collision_wall(parent: Node3D,a: Vector3,b: Vector3,height: float,thickness := 0.12) -> void:
 var id = parent.get_instance_id()
 if not guard_batches.has(id):
  guard_batches[id] = {"parent":parent,"faces":PackedVector3Array()}
 var top_a = a+Vector3(0,height,0)
 var top_b = b+Vector3(0,height,0)
 var faces: PackedVector3Array = guard_batches[id].faces
 faces.append_array(PackedVector3Array([a,b,top_a,top_a,b,top_b]))
 guard_batches[id].faces = faces

func flush_guard_batches(parent: Node3D) -> void:
 for key in guard_batches.keys():
  var entry = guard_batches[key]
  if entry.parent!=parent and not parent.is_ancestor_of(entry.parent):
   continue
  var body = StaticBody3D.new()
  body.name = "ContinuousSolidGuards"
  var collision = CollisionShape3D.new()
  var mesh = ConcavePolygonShape3D.new()
  mesh.backface_collision = true
  mesh.set_faces(entry.faces)
  collision.shape = mesh
  body.add_child(collision)
  entry.parent.add_child(body)
  guard_batches.erase(key)

func detail_index(parent: Node) -> int:
 for i in interiors.size():
  if parent==interiors[i] or interiors[i].is_ancestor_of(parent):
   return i
 return -1

func register_walk(parent: Node3D,a: Vector3,b: Vector3,width: float,kind: String) -> void:
 var i = detail_index(parent)
 if i<0:
  return
 var side = Vector3(b.z-a.z,0,a.x-b.x).normalized()*width*0.5
 walk_surfaces.append({"dome":i,"a":a,"b":b,"width":width,"kind":kind,"poly":[a-side,b-side,b+side,a+side]})

func register_deck(parent: Node3D,c: Vector3,radius: float) -> void:
 var i = detail_index(parent)
 if i<0:
  return
 var poly = []
 for k in 32:
  poly.append(c+Vector3(cos(k*TAU/32)*radius,0,sin(k*TAU/32)*radius))
 walk_surfaces.append({"dome":i,"a":c,"b":c,"width":radius*2,"kind":"raised","poly":poly,"radius":radius})

func project_segment(p: Vector3,a: Vector3,b: Vector3) -> Vector3:
 var d = Vector2(b.x-a.x,b.z-a.z)
 var t = clampf(Vector2(p.x-a.x,p.z-a.z).dot(d)/maxf(d.length_squared(),0.00001),0,1)
 return a.lerp(b,t)

func surface_distance(p: Vector3,surface: Dictionary) -> float:
 if surface.has("radius"):
  return maxf(0,Vector2(p.x-surface.a.x,p.z-surface.a.z).length()-float(surface.radius))
 var poly = PackedVector2Array()
 for v in surface.poly:
  poly.append(Vector2(v.x,v.z))
 if Geometry2D.is_point_in_polygon(Vector2(p.x,p.z),poly):
  return 0.0
 var distance = INF
 for k in surface.poly.size():
  var q = project_segment(p,surface.poly[k],surface.poly[(k+1)%surface.poly.size()])
  distance = minf(distance,Vector2(p.x-q.x,p.z-q.z).length())
 return distance

func finish_guards(i: int,parent: Node3D) -> void:
 for surface in walk_surfaces:
  if int(surface.dome)!=i or surface.kind!="raised":
   continue
  for k in surface.poly.size():
   var a: Vector3 = surface.poly[k]
   var b: Vector3 = surface.poly[(k+1)%surface.poly.size()]
   var along: Vector3 = surface.b-surface.a
   along.y = 0
   var edge_direction = b-a
   edge_direction.y = 0
   if not surface.has("radius") and absf(edge_direction.normalized().dot(along.normalized()))<0.25 and maxf(a.y,b.y)<0.45:
    continue # open ramp foot joins the continuous ground floor
   var outward = Vector3(b.z-a.z,0,a.x-b.x).normalized()
   if outward.dot((a+b)*0.5-(surface.a+surface.b)*0.5)<0:
    outward = -outward
   var count = maxi(1,ceili(a.distance_to(b)/0.30))
   var run_start = -1
   for sample in count+1:
    var enclosed = sample==count
    if not enclosed:
     var p = a.lerp(b,(float(sample)+0.5)/count)
     for neighbour in walk_surfaces:
      if neighbour==surface or int(neighbour.dome)!=i:
       continue
      var q = project_segment(p,neighbour.a,neighbour.b)
      if absf(p.y-q.y)<0.45 and surface_distance(p+outward*0.03,neighbour)<0.005:
       enclosed = true
       break
    if not enclosed and run_start<0:
     run_start = sample
    if enclosed and run_start>=0:
     var from = a.lerp(b,float(run_start)/count)
     var to = a.lerp(b,float(sample)/count)
     collision_wall(parent,from,to,1.4)
     raised_boundaries.append({"a":from,"b":to,"centre":(surface.a+surface.b)*0.5})
     for height in [0.18,0.65,1.25]:
      beam(parent,from+Vector3(0,height,0),to+Vector3(0,height,0),0.08,Color("d5dfd2"))
     run_start = -1

func inside_pen(p: Vector3,margin := 0.0) -> bool:
 for pen in g.bio_pens:
  var c: Vector3 = pen[1]
  if Vector2(p.x-c.x,p.z-c.z).length()<float(pen[2])+margin:
   return true
 return false

func open_path_point(from: Vector3) -> Vector3:
 var best = C+Vector3(0,0.09,0)
 var distance = INF
 for route in campus_paths:
  var candidate = path_floor(project_segment(from,route[0],route[1]))
  if not inside_pen(candidate,1.5) and not g._blocked_at(candidate+Vector3(0,0.85,0),0.4) and candidate.distance_squared_to(from)<distance:
   best = candidate
   distance = candidate.distance_squared_to(from)
 for surface in walk_surfaces:
  if surface.kind!="ground":
   continue
  var p = path_floor(project_segment(from,surface.a,surface.b))
  if inside_pen(p,1.5) or g._blocked_at(p+Vector3(0,0.85,0),0.4):
   continue
  if p.distance_squared_to(from)<distance:
   best = p
   distance = p.distance_squared_to(from)
 return best

func safety_net(delta: float) -> void:
 if not safety_enabled or g.driving or g.paused or not inside(g.player.position):
  stuck_seconds = 0
  stuck_anchor = g.player.position
  return
 rescue_cooldown = maxf(0,rescue_cooldown-delta)
 var trapped = inside_pen(g.player.position)
 if g.stick.length()>0.2:
  if Vector2(g.player.position.x-stuck_anchor.x,g.player.position.z-stuck_anchor.z).length()>0.25:
   stuck_anchor = g.player.position
   stuck_seconds = 0
  else:
   stuck_seconds += delta
 else:
  stuck_seconds = 0
  stuck_anchor = g.player.position
 if (trapped or stuck_seconds>1.5) and rescue_cooldown<=0:
  g.player.position = open_path_point(g.player.position)+Vector3(0,0.7,0)
  g.player.velocity = Vector3.ZERO
  stuck_anchor = g.player.position
  stuck_seconds = 0
  rescue_cooldown = 2.0
  reset_stick()
  g._show_toast("Back on the open path.")

func can_fly(si: int) -> bool:
 # These assets have genuine separate, spread flight wings. Others remain supported.
 return str(SPECIES[si].kind) in ["europeanowl","baldeagle","cockatoo"]

func record_scenery(parent: Node3D,key: String,index: int,mesh: Mesh,group: String) -> void:
 var i = detail_index(parent)
 if i<0:
  return
 var bounds: AABB = batches[key].xs[index]*mesh.get_aabb()
 if bounds.size.y<0.3 and group=="":
  return # water/ground decals are below walking feet
 scenery_bounds.append({"dome":i,"key":key,"index":index,"group":group})

func scenery_aabb(item: Dictionary) -> AABB:
 if item.has("checked_bounds") and not batches.has(item.get("key","")):
  return item.checked_bounds
 if item.has("node"):
  return item.node.transform*item.node.mesh.get_aabb()
 var batch = batches[item.key]
 return batch.xs[int(item.index)]*batch.mesh.get_aabb()

func clear_scenery_bounds(bounds: AABB,i: int) -> bool:
 var centre = bounds.get_center()
 var half = bounds.size*0.5
 if Vector2(centre.x-dome_c(i).x,centre.z-dome_c(i).z).length()+Vector2(half.x,half.z).length()>RADIUS-0.6:
  return false
 for q in 4:
  for step in 3:
   var marker = quest_point(i,q,step) if q<3 else local_point(i,7,-29+step*20)
   if bounds.position.y>marker.y+3.1 or bounds.end.y<marker.y-1.5:
    continue
   var dx = maxf(absf(marker.x-centre.x)-half.x,0)
   var dz = maxf(absf(marker.z-centre.z)-half.z,0)
   if Vector2(dx,dz).length()<1.5:
    return false
 if bounds.position.y<3.2 and bounds.end.y>0.5:
  for pen in fences:
   if int(pen.dome)!=i:
    continue
   var dx = maxf(absf(pen.c.x-centre.x)-half.x,0)
   var dz = maxf(absf(pen.c.z-centre.z)-half.z,0)
   if Vector2(dx,dz).length()<(2.8 if int(pen.si)==16 else 1.8):
    return false # keep the animals' central roaming area visibly unobstructed
 for surface in walk_surfaces:
  if int(surface.dome)!=i:
   continue
  if bounds.position.y>maxf(surface.a.y,surface.b.y)+3.1 or bounds.end.y<minf(surface.a.y,surface.b.y)-1.5:
   continue
  var pad = float(surface.width)*0.5+1.5
  var low = Vector2(bounds.position.x-pad,bounds.position.z-pad)
  var high = Vector2(bounds.end.x+pad,bounds.end.z+pad)
  var origin = Vector2(surface.a.x,surface.a.z)
  var delta = Vector2(surface.b.x-surface.a.x,surface.b.z-surface.a.z)
  var enter = 0.0
  var leave = 1.0
  for axis in 2:
   if absf(delta[axis])<0.0001:
    if origin[axis]<low[axis] or origin[axis]>high[axis]:
     leave = -1.0
     break
   else:
    var a = (low[axis]-origin[axis])/delta[axis]
    var b = (high[axis]-origin[axis])/delta[axis]
    enter = maxf(enter,minf(a,b))
    leave = minf(leave,maxf(a,b))
  if enter<=leave:
   return false
 return true

func resolve_scenery(i: int) -> void:
 var groups = {}
 for item in scenery_bounds:
  if int(item.dome)!=i:
   continue
  var key = str(item.group) if item.group!="" else str(item.get("key",""))+":"+str(item.get("index",0))
  if not groups.has(key):
   groups[key] = []
  groups[key].append(item)
 for key in groups:
  var items: Array = groups[key]
  var bounds = scenery_aabb(items[0])
  for item in items:
   bounds = bounds.merge(scenery_aabb(item))
  if clear_scenery_bounds(bounds,i):
   continue
  var centre = bounds.get_center()
  var destination = centre
  var factor = 1.0
  var solved = false
  for shrink in 7:
   factor = pow(0.74,shrink)
   var size = Vector3(bounds.size.x*factor,bounds.size.y,bounds.size.z*factor)
   for radius in [0.0,3.0,6.0,10.0,16.0,23.0,30.0,38.0,50.0]:
    for angle in 24:
     var candidate = centre+Vector3(cos(angle*TAU/24),0,sin(angle*TAU/24))*radius
     var attempt = AABB(candidate-size*0.5,size)
     if clear_scenery_bounds(attempt,i):
      destination = candidate
      solved = true
      break
    if solved:
     break
   if solved:
    break
  if not solved:
   var size = Vector3(bounds.size.x*factor,bounds.size.y,bounds.size.z*factor)
   for x in range(-32,33,4):
    for z in range(-32,33,4):
     var candidate = local_point(i,x,z,centre.y)
     if clear_scenery_bounds(AABB(candidate-size*0.5,size),i):
      destination = candidate
      solved = true
      break
    if solved:
     break
  assert(solved,"Scenery has a clear adjusted position: "+str(key))
  for item in items:
   var transform: Transform3D = item.node.transform if item.has("node") else batches[item.key].xs[int(item.index)]
   transform.origin = destination+Vector3((transform.origin.x-centre.x)*factor,transform.origin.y-centre.y,(transform.origin.z-centre.z)*factor)
   transform.basis = Basis.from_scale(Vector3(factor,1,factor))*transform.basis
   if item.has("node"):
    item.node.transform = transform
   else:
    batches[item.key].xs[int(item.index)] = transform
   item["checked_bounds"] = transform*(item.node.mesh.get_aabb() if item.has("node") else batches[item.key].mesh.get_aabb())

func register_habitats() -> void:
 g.bio_pens.clear()
 fences.clear()
 for i in 7:
  var ids = []
  for si in SPECIES.size():
   if int(SPECIES[si].dome)==i:
    ids.append(si)
  for k in ids.size():
   var si = int(ids[k])
   if i>=4 and SPECIES[si].zone=="fly":
    continue
   var p = local_point(i,-23 if k%2==0 else 23,-21+(k/2)*14)
   var radius = 3.7
   if i>=4:
    var layout = phase2_pen(si)
    p = local_point(i,layout.x,layout.y)
   if i==3:
    var polar = {0:Vector3(17,4,-24),30:Vector3(27,4,-5),31:Vector3(19,7,17),32:Vector3(26,3,-16)}[si]
    p = local_point(i,polar.x,polar.z)
    radius = polar.y
   fences.append({"dome":i,"c":p,"r":radius,"si":si})
   g.bio_pens.append([i,p,radius])
   g.bio_hab[si] = {"type":"pen","c":p,"r":radius-1.4,"rmin":0.0,"sign":p+(dome_c(i)-p).normalized()*(radius+1.3)}

func unload_detail() -> void:
 if loaded_dome<0:
  return
 var old = loaded_dome
 animals.clear()
 g.bio_animals.clear()
 markers.clear()
 rare_nodes.clear()
 baby_nodes.clear()
 lanterns.clear()
 shelters.clear()
 atmospheres.clear()
 keeper_projects.clear()
 walk_surfaces.clear()
 raised_boundaries.clear()
 scenery_bounds.clear()
 for list in dome_animals:
  list.clear()
 parked_nests.clear()
 walk_meshes.clear()
 refined_materials.clear()
 g.animal_scenes.clear()
 g.bio_model_mesh.clear()
 mobile_textures.clear()
 batches.clear()
 interiors[old].free()
 var empty = Node3D.new()
 empty.name = NAMES[old].replace(" ","")+"Interior"
 root.add_child(empty)
 interiors[old] = empty
 empty.hide()
 loaded_dome = -1

func load_dome(i: int) -> void:
 if i<0 or i==loaded_dome:
  return
 var started = Time.get_ticks_usec()
 unload_detail()
 var detail: Node3D = interiors[i]
 var c = dome_c(i)
 disc(detail,c+Vector3(0,0.03,0),RADIUS-1.5,0.12,GROUNDS[i])
 rim_bevel(detail,c,RADIUS,GROUNDS[i],false)
 shell(detail,c,RADIUS,30,COLORS[i],false)
 landscape(i,detail)
 habitats(i,detail)
 if i<4:
  rich_landscape(i,detail)
  habitat_layers(i,detail)
 if i>=4:
  phase2_landscape(i,detail)
  phase2_layers(i,detail)
 quest_markers(i,detail)
 garden_ring(i,detail)
 colonnade(i,detail)
 door_markers(i,detail)
 inside_signpost(i,detail)
 if i<7:
  for step in 3:
   var p = local_point(i,7,-29+step*20)
   var marker = Node3D.new()
   marker.position = p
   detail.add_child(marker)
   g._fc_part(marker,g._bcone(0.2,0.4,0.5),Vector3(0,0.35,0),g._fc_glow(Color("ffda6b")))
   var label = text(marker,"",Vector3(0,1.6,0),Color("ffe599"),26,18)
   shelters.append({"node":marker,"label":label,"dome":i,"step":step})
 assign_feeding_slots()
 flush_walk_meshes(detail)
 finish_guards(i,detail)
 flush_guard_batches(detail)
 resolve_scenery(i)
 detail.visible = true
 flush()
 loaded_dome = i
 last_load_us = Time.get_ticks_usec()-started

func activate_dome(i: int) -> void:
 active = i
 if i>=0:
  load_dome(i)
  if not camera_far_saved:
   normal_camera_far = g.camera.far
   camera_far_saved = true
  g.camera.far = 100.0
  apply_dome_quality()
 else:
  restore_dome_quality()
  g.camera.far = normal_camera_far
  if loaded_dome>=0 and g.player.position.distance_to(dome_c(loaded_dome))>RADIUS+10.0:
   unload_detail()
 for visual in exterior_visuals:
  if is_instance_valid(visual):
   visual.visible = i<0
 for k in interiors.size():
  interiors[k].visible = k==i

func capture_exterior(n: Node) -> void:
 if interiors.has(n):
  return
 if n is GeometryInstance3D:
  exterior_visuals.append(n)
 for child in n.get_children():
  capture_exterior(child)

func campus_surface(a: Vector3,b: Vector3,width: float,join_only := false) -> Dictionary:
 var side = Vector3(b.z-a.z,0,a.x-b.x).normalized()*width*0.5
 return {"a":a,"b":b,"width":width,"poly":[a-side,b-side,b+side,a+side],"join_only":join_only}

func build_open_paths() -> void:
 # Original open hub-and-spoke garden layout: no roof or circular connector.
 campus_paths.append([ENTRY+Vector3(0,-0.05,0),C+Vector3(0,0.09,0)])
 for i in 7:
  var outward = (dome_c(i)-C).normalized()
  var a = C+outward*18.0+Vector3(0,-0.05,0)
  var b = dome_c(i)-outward*(RADIUS-2.0)+Vector3(0,-0.05,0)
  campus_paths.append([a,b])
  var side = Vector3(outward.z,0,-outward.x)*2.8
  # v0.55.3: the spoke walls leave a 7 m gap where the open dome-to-dome loop crosses.
  var gap_a = C+outward*(RING_R-3.5)+Vector3(0,-0.05,0)
  var gap_b = C+outward*(RING_R+3.5)+Vector3(0,-0.05,0)
  for sign in [-1,1]:
   for piece in [[a,gap_a],[gap_b,b]]:
    collision_wall(root,piece[0]+side*sign,piece[1]+side*sign,1.2)
    beam(root,piece[0]+side*sign+Vector3(0,1.0,0),piece[1]+side*sign+Vector3(0,1.0,0),0.08,Color("a7ddc3"))
  # Text describes left/right while facing the hub from this dome's entrance.
  var left = (i+1)%7
  var right = (i+6)%7
  var sign_at = dome_c(i)-outward*(RADIUS+4.0)
  var direction_sign = text(root,"← "+NAMES[left]+"    HUB    "+NAMES[right]+" →",sign_at+Vector3(0,3.1,0),Color("244b3c"),46,40)
  direction_sign.pixel_size = 0.012
  text(root,"↑ "+NAMES[i],C+outward*16+Vector3(0,3.8,0),COLORS[i],40,35)
 var welcome_sign = text(root,"← OCEANIA · NORTH AMERICA · EUROPE\n↑ AFRICA\nASIA · SOUTH AMERICA · ANTARCTICA →",C+Vector3(0,3.4,25),Color("244b3c"),44,45)
 welcome_sign.pixel_size = 0.012


func build_garden_edges() -> void:
 # v0.55.3: the old Biosphere look outside the domes: flower hedges, lamp posts and leafy oaks
 # along every path. Decoration only: no collision, nothing on the walking surface (rails sit at 2.8 m).
 var rng = RandomNumberGenerator.new()
 rng.seed = 5530
 var flowers = [Color("ff7ab8"),Color("ffd23f"),Color("c254ff"),Color("ffffff"),Color("ff8a1c")]
 var old_flag = animal_structure
 animal_structure = true
 var lines = []
 lines.append([C+Vector3(0,0,38),C+Vector3(0,0,176),Vector3(1,0,0)])
 for i in 7:
  var out = (dome_c(i)-C).normalized()
  lines.append([C+out*24.0,C+out*(RING_R-6.0),Vector3(out.z,0,-out.x)])
 for line in lines:
  var a: Vector3 = line[0]
  var b: Vector3 = line[1]
  var side: Vector3 = line[2]
  var length = a.distance_to(b)
  var along = (b-a).normalized()
  var count = int(length/2.2)
  for k in count+1:
   var base = a+along*(float(k)*2.2)
   for sg in [-1,1]:
    var q = base+side*(4.3*sg)
    shape(root,g._blow(0.55),q+Vector3(0,0.3,0),Vector3(1,0.85,1),[Color("3f9450"),Color("2f7d45")][k%2])
    shape(root,g._bsph(0.2),q+Vector3(rng.randf_range(-0.3,0.3),0.8,rng.randf_range(-0.3,0.3)),Vector3.ONE,flowers[(k+(1 if sg>0 else 0))%5])
  var lamps = int(length/14.0)
  for k in lamps+1:
   var base = a+along*(float(k)*14.0+3.0)
   for sg in [-1,1]:
    var q = base+side*(5.4*sg)
    shape(root,g._bcone(0.06,0.09,3.6),q+Vector3(0,1.8,0),Vector3.ONE,Color("c8d4da"))
    shape(root,g._bsph(0.28),q+Vector3(0,3.7,0),Vector3.ONE,Color("bff6ff"))
  # A few leafy oaks set back from the path.
  var trees = int(length/16.0)
  for k in trees:
   var base = a+along*(float(k)*16.0+8.0)
   var sg = 1 if k%2==0 else -1
   nature(root,"nature_oak2",base+side*(9.0*sg),1.1+rng.randf()*0.5,rng.randf()*TAU)
 animal_structure = old_flag

func foliage_mesh(name: String) -> Mesh:
 if g.bio_model_mesh.has(name):
  return g.bio_model_mesh[name]
 var path = "res://models/%s.glb" % name
 var packed = load(path) as PackedScene
 if packed==null:
  return null
 var instance = packed.instantiate()
 var source = g._first_mesh(instance)
 var mesh: ArrayMesh = source.mesh.duplicate() if source!=null else null
 if mesh!=null:
  for surface in mesh.get_surface_count():
   var original = mesh.surface_get_material(surface)
   if original is BaseMaterial3D:
    var copy = original.duplicate() as BaseMaterial3D
    # Keep the tiny embedded texture; do not load the excluded external texture set.
    if copy.transparency!=BaseMaterial3D.TRANSPARENCY_DISABLED:
     copy.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
     copy.alpha_scissor_threshold = 0.45
    if copy.albedo_texture!=null:
     copy.albedo_texture = small_foliage_texture(copy.albedo_texture)
    copy.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS
    mesh.surface_set_material(surface,copy)
  mesh.set_meta("mobile_foliage",true)
 instance.free()
 g.bio_model_mesh[name] = mesh
 return mesh

func small_foliage_texture(source: Texture2D) -> Texture2D:
 if max(source.get_width(),source.get_height())<=256:
  return source
 var key = source.get_rid().get_id()
 if mobile_textures.has(key):
  return mobile_textures[key]
 var image = source.get_image()
 if image.is_compressed() and image.decompress()!=OK:
  return source
 var ratio = 256.0/maxi(image.get_width(),image.get_height())
 image.resize(maxi(1,roundi(image.get_width()*ratio)),maxi(1,roundi(image.get_height()*ratio)),Image.INTERPOLATE_LANCZOS)
 image.generate_mipmaps()
 var result = ImageTexture.create_from_image(image)
 mobile_textures[key] = result
 return result

func apply_dome_quality() -> void:
 if not (OS.has_feature("android") or "--web-lite" in OS.get_cmdline_user_args() or OS.has_feature("web")):
  return
 var viewport = g.get_viewport()
 if saved_quality.is_empty():
  saved_quality = {"scale":viewport.scaling_3d_scale,"shadows":g.sun_light.shadow_enabled if g.sun_light!=null else false}
 var pixels = DisplayServer.window_get_size()
 var limit = minf(float(saved_quality.scale),sqrt(1000000.0/maxf(float(pixels.x)*pixels.y,1.0)))
 if absf(viewport.scaling_3d_scale-maxf(0.45,limit))>0.001:
  viewport.scaling_3d_scale = maxf(0.45,limit)
 if g.sun_light!=null and g.sun_light.shadow_enabled:
  g.sun_light.shadow_enabled = false

func restore_dome_quality() -> void:
 if saved_quality.is_empty():
  return
 g.get_viewport().scaling_3d_scale = saved_quality.scale
 if g.sun_light!=null:
  g.sun_light.shadow_enabled = saved_quality.shadows
 saved_quality.clear()

func profile_audio(n: Node,info: Dictionary) -> void:
 if n is AudioStreamPlayer or n is AudioStreamPlayer3D:
  var stream: AudioStream = n.stream
  if stream!=null and not info.audio_resources.has(stream.get_instance_id()):
   info.audio_resources[stream.get_instance_id()] = true
   if stream is AudioStreamWAV:
    info.audio_wav_bytes += stream.data.size()
 for child in n.get_children():
  profile_audio(child,info)

func assign_feeding_slots() -> void:
 var counts = {}
 for a in animals:
  if a.get("upper",false):
   continue
  var key = int(a.si)
  a["feed_slot"] = int(counts.get(key,0))
  counts[key] = int(a.feed_slot)+1
 for a in animals:
  a["feed_count"] = int(counts.get(int(a.si),1))

func feeding_target(a: Dictionary,toward: Vector3,radius: float) -> Vector3:
 var total = int(a.get("feed_count",1))
 var columns = maxi(1,ceili(sqrt(float(total))))
 var rows = maxi(1,ceili(float(total)/columns))
 var slot = int(a.get("feed_slot",0))
 var desired = 1.6 if a.kind=="elephant" else (1.2 if a.kind in ["bison","rhino","polarbear"] else 0.7)
 var spacing = minf(desired,radius*1.25/maxi(columns-1,1))
 var across = Vector3(-toward.z,0,toward.x)
 var offset = across*(float(slot%columns)-float(columns-1)*0.5)*spacing+toward*(float(slot/columns)-float(rows-1)*0.5)*spacing
 offset += toward*radius*0.15
 if offset.length()>radius*0.85:
  offset = offset.normalized()*radius*0.85
 return a.c+offset+Vector3(0,0.1,0)

func visitor_stage_route(i: int) -> Array:
 if i==0:
  return [local_point(0,9.5,-25,0.09),local_point(0,9.5,-3,4.5),local_point(0,9.5,24,4.5),local_point(0,7,24,4.5)]
 if i==1:
  return asia_route()
 if i==2:
  return [local_point(2,-9.5,-25,0.09),local_point(2,-9.5,-5,5.5),local_point(2,-9.5,0,5.5),local_point(2,-4,5,5.5),local_point(2,-4,23,5.5),local_point(2,7,23,5.5)]
 if i==3:
  return antarctic_route()
 var route = phase2_route(i)
 if i==6:
  route.append(local_point(6,0,22,1.4))
  route.append(local_point(6,-5,28,1.4))
 return route

func path_floor(p: Vector3) -> Vector3:
 var ray = PhysicsRayQueryParameters3D.create(p+Vector3(0,0.4,0),p-Vector3(0,1.0,0),1)
 ray.exclude = [g.player.get_rid(),g.car.get_rid()]
 var hit = g.get_world_3d().direct_space_state.intersect_ray(ray)
 if not hit.is_empty():
  p.y = hit.position.y
 return p

func flush_walk_meshes(parent: Node3D) -> void:
 build_sweeps(parent)
 for key in walk_meshes.keys():
  var entry = walk_meshes[key]
  if entry.parent!=parent and not parent.is_ancestor_of(entry.parent):
   continue
  var st = SurfaceTool.new()
  st.begin(Mesh.PRIMITIVE_TRIANGLES)
  for vertex in entry.visual:
   st.add_vertex(vertex)
  st.generate_normals()
  var node = MeshInstance3D.new()
  node.name = "ContinuousVisitorWalk"
  node.mesh = st.commit()
  node.material_override = material(Color("b29462"))
  node.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
  entry.parent.add_child(node)
  var body = StaticBody3D.new()
  body.name = "ContinuousVisitorFloor"
  var collision = CollisionShape3D.new()
  var mesh = ConcavePolygonShape3D.new()
  mesh.backface_collision = true
  mesh.set_faces(entry.top)
  collision.shape = mesh
  body.add_child(collision)
  entry.parent.add_child(body)
  walk_meshes.erase(key)

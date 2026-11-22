# World Biosphere (v0.54.0) - scouting notes (2026-11-22, written against v0.53.1)

Status: NOT STARTED. Nothing in game/ was changed. Do not release until Koko says "Release".

## What exists now (game/main.gd, ~34.4k lines)
- Section "v0.37 - v0.39: THE BIOSPHERE" starts ~line 19516; `_build_biosphere()` ~line 20108; `_biosphere_tick` and `_smoke_biosphere` further on.
- `const BIO_C := Vector3(-500,0,-600)` is the hub centre; 56 references to BIO_C. Hard-coded copies of the old entrance (-500,0,-486) also exist at ~12923 (checkpoint/fast travel), ~29687 (Directions), ~33330 (quest/go target); MAP_LABELS (~11938) has ["BIOSPHERE",Vector2(-500,-600)]; level lock list "The Biosphere" level 7 sign Vector3(-500,0,-480) (~30980); TRAVEL_AREA array comment ("always open"); sky-train station entry near the "The Biosphere" at -512,-458 (~27120); GC_SCREEN text "Four domes"; nav area `_nav_area("Biosphere",...)` +-82 m around BIO_C; car ban in `_call_block_reason` (~16890) and the vehicle ban (~24130); `bio_inside` check.
- Layout today: hexagonal hub (apothem 12) with 4 hexagonal domes (apothem 27) at hub +-44 m on x and z (`BIO_OFF`), joined by glass tunnels `BIO_LINKS`. `BIO_DOMES[i]` holds per-dome colours/dims; each dome has its own layout (v0.39: ramps, terraces, bridge) built in the same function.
- Animals: `BIO_SPECIES` (16 entries, order = bit order of `bio_seen`; each has "dome" index 0-3). Achievements bio4 / bio16 and the collections list use `bio_seen` bits.
- Draw cost helpers: bio_batch / bio_models MultiMesh batching, `bio_cols` solid boxes, `bio_pens`, `bio_hab`.

## Plan for step 1 (0.54.0)
1. Pick a new site (north/west of the city, outside the Galleria at (-330,-600), Sky Garden (-402,-636), Skyline (-400,-262), Midtown (-60,-410), Airfield (62,-380)). Verify free land with --nav-check / bake-map, and check terrain/road colliders there. Suggested to test first: far west of x=-700 around z=-600, or north of z=-700.
2. Make the site a variable (e.g. replace the const BIO_C by the new centre and route ALL 56 references and the hard-coded -500/-486 copies listed above through it; grep for "-500" and "-486").
3. Hub + 7 domes in a star (angles 360/7 apart at radius ~110 m for ~77 m domes) and a reserved Ocean World pad (3x area) on the far side. Build a generic dome builder (`_wb_dome(i, theme)`) rather than editing the four old hand-built layouts; keep the old Biosphere code until the new one passes tests, then delete it.
4. Only the dome you are inside gets full detail: parent each dome's interior under its own Node3D and toggle `visible` from the tick (like the Galleria).
5. bio_seen migration: old bits keep meaning. Map old species to new domes (e.g. Giraffe/Zebra/Flamingo -> Africa, Penguin -> Antarctica, Macaw -> South America; others stay in the hub zoo or a legacy "Northern" dome) so old saves keep spotted animals; never reorder the first 16 entries of BIO_SPECIES, only append.
6. Domes for phase 1: Africa, Asia, South America, Antarctica; other 3 as empty shells. Animals/quests come in steps 2-4.
7. Test: `Godot --headless --path game -- --smoke-test` with a time guard (asserts inside awaited tests hang), `--bench --web-lite` before and after (within ~5%), `--city-shots` screenshots per dome, update START HERE, bump version only at release time.

## Rules to remember
- Back up ~/Library/Application Support/Godot/app_userdata/Harbor City/harbor_save.cfg before test runs.
- Leave untracked blender-src/make_player.py, game/models/player.glb(+.import), reports/, research_notes/ alone.
- A cloud chat cannot commit; Koko commits/pushes in Terminal.

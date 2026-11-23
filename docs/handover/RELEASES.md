# Release notes for handover (newest first; 0.55.x). Older releases: docs/handover/HISTORY.md and docs/releases/*.md

## 0.56.2 (code 112, 2026-11-23)
- _hub_christmas() in main.gd (end of _build_hub): CPUParticles3D snow, _xm_tree, presents, string-light rings, snowmen, MERRY CHRISTMAS sign; always on. New players (ch_idx 0, step 0, no deliveries) spawn at HUB_C+(-10,0.9,0) after _load_progress. Chapter 1 gained steps Dome gate (150,0,32) and Ridge Pass (69,0,5.5); saves without chapters/intro and step>0 get +2. Sun Dome call, SPAWN_SUN_DOME and --sundome-shots removed (sun_dome.gd left unused); hourly challenge has no terminal.

## 0.56.1 (code 111, 2026-11-23)
- Sun Dome (game/sun_dome.gd: lattice, glass, sun core, pylons, floor inlays, Challenge Core with seats; built after _build_commons, skip with HC_SKIP=sundome). Spawn moved to SPAWN_SUN_DOME (-93,0.9,-22). Hourly Challenge (game/hourly_challenge.gd: kinds by UTC hour %3, selftest(), save keys hr_done/hr_total, hooks in action handler and action button). Stream Mode no longer blocks online autostart. Shots: run-sundome-shots.command (--sundome-shots). Next: Christmas theme, hangout features (emotes, jukebox), Blender animals.

## 0.56.0 (code 110, 2026-11-23)
- Stream Mode: game/autoplay.gd (state machine boot/to_dome/dome_quests/dome_stroll/leave_dome/to_station/waiting/riding/city; steers via g.stick), hook in main.gd after `booted = true`, launched with `--autoplay --autoplay-hours=N`. Run notes: docs/stream/RUN-STREAM-MODE.md. Next: taxi/careers phase, 3 h soak, Blender animals.

## 0.55.13 (code 109, 2026-11-23)
- Extra animals (spawn k=100+, RESERVE_FILL groups k=120+ in empty slots), livelier free roam (rest 0.4-3.5 s, speed 1.0), lantern quest no longer needs dusk, smaller sign, monolith cap removed. Next idea: Blender animal model rework.

## 0.55.12 (code 108, 2026-11-23)
- AFRICA_Y 3.4 -> 2.4 (all reserve domes); path_clear() keeps zone trees/boulders/mounds off the bridges (dome 0 zone props unchanged); PATHS gates set to "" (gate code kept, unused).

## 0.55.11 (code 107, 2026-11-23)
- Open reserve layout in all 7 domes (game/world_biosphere.gd: RESERVE_DOMES, RESERVE_SLOTS, RESERVE_PLAN, THEMES, PATHS, reserve_build/reserve_zone/reserve_wow/reserve_detail, reserve(i)). Per-dome boardwalk design in PATHS (arms, width, pier end, gate). Dome-specific old layouts (rich_landscape, phase2_landscape, garden_ring, sky_gallery) skipped for reserve domes. Shots: HC_DOME=n with --africa-shots (run-reserve-shots.command).

## 0.55.10 (code 106, 2026-11-23)
- Africa fixes: foyer walkway width 5.0 starting at z -38.4 (was 7.2, left an open end edge beside the ramp foot); inside_signpost() no longer called in domes; lanterns moved to rail edge. Next job: Savanna-style open habitats for the other 6 domes.

## 0.55.9 (code 105, 2026-11-23)
- Africa dome (dome 0) rebuilt as open Savanna Reserve in game/world_biosphere.gd (africa_reserve, africa_wow, africa_detail, AFRICA_ZONES, AFRICA_ARM_W/E): no pens, `a["free"]` roaming, raised boardwalk (ramp, deck, pier, 2 arms), 30 m spotting. Other 6 domes NOT converted yet. Dev flag --africa-shots (run-africa-shots.command).

## 0.55.8 (code 104, 2026-11-23)
- Glowing car-only road barrier (game/road_barrier.gd), cars put back on the road, checkpoint cars on the road, job stops on the kerb, Central Park and Union Station checkpoints moved. Careers code split into game/careers.gd.

## 0.55.7 (code 103, 2026-11-22)
Trials and Chase removed from the PLAY menu; `HIDDEN_PLACES` (Ridge Trailhead, Bay Promenade, Marina Heights) hidden from fast travel, pads, minimap icons, Directions, job spots; chapter Sun, Sea and Speed shortened. Docs: CODE-MAP*.md, docs/handover/*. Road barrier NOT included (next job).

## 0.55.6 (code 102, 2026-11-22)
Koko's feedback after 0.55.5. Dome entrance sign boards (`NAME BIODOME`, ENTER, FREE ENTRY); hub wall solid except 8 doors via `shell(..., gaps)` + `hub_doors()`; 23 waypoint visitors (`build_visitors`, `tick_visitors`); quests auto-start on entering a dome, `quest_guide()` arrow + distance, marker beams, auto-run on arrival (`auto_quest`; smoke sets it false). Tests added to `smoke()`: hub wall solid, doors open, quest auto-start. Release https://github.com/kokolo2020/GTA2027/releases/tag/v0.55.6 , APK 53,195,258 bytes, SHA256 e57ac40470c3874aad15580d51024c17dfd7b5e6a9b23f82124ad2fd7fd34ade. Not phone-tested.

## 0.55.5 (code 101)
Hub door frames (main.gd, old hex hub), `sky_gallery()` spiral walkway + 8 m lookout in 6 domes (not Asia), ring rails (`collision_wall`) and car fence `BIO_CAR_FENCE_R=168`.

## 0.55.4 (code 95-100 line)
Gold ENTER/EXIT door markers, visible plinth + glass walls in `shell()`, open ring loop `RING_R=72`, city-style signposts.

## 0.55.3
Old Biosphere look: thick saturated ribs, flower hedges, lamp posts, oaks, `garden_ring`, `colonnade`.

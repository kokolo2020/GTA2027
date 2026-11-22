# Release notes for handover (newest first; 0.55.x). Older releases: docs/handover/HISTORY.md and docs/releases/*.md

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

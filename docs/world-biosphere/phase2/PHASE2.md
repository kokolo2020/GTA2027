# World Biosphere Phase 2 — 0.55.0 / code 96 (unreleased)

Live remains 0.54.4 / code 95. The released rim/ramp work is separate in commit `341369d`. No APK/Web exports, release tags, public page changes or deployments are part of this work. Version presets remain on the live version until release is authorized.

## Continents

- **Europe**: oak woodland, wildflower meadow and a winding river with a flush stone crossing. A low meadow amphitheatre has a gently rising, bent approach. Deer, rabbit, woodland owl, brown bear, wolf, hedgehog and stork; the existing mallards remain as a conservation extra. Woodland owl nests and a separate flight circuit occupy the upper layer.
- **North America**: maple woodland, lake, rocky canyon ledges and a snow-covered Arctic corner. A two-level canyon walk ends on a level ranger overlook. Moose, raccoon, beaver, goose, bald eagle, bison, polar bear and Arctic fox; existing snowy owls remain. Eagles and snowy owls use separate flight circuits; eagle cliff nests provide another viewing layer.
- **Oceania**: retains dome slot 6 and its existing name. Australian red outback, original eucalyptus silhouettes, billabong and beach. A low coastal boardwalk forks onto separate viewing piers. Kangaroo with a pouch joey, koala, emu, platypus, wombat and cockatoo; small joeys wander within the kangaroo enclosure. Elevated koala trees and cockatoo flight occupy the upper layer.

All ground animals remain in fenced enclosures. Upper animals have bounded ledges or flight circuits within the dome shell. Detailed geometry, vegetation, wildlife updates and mist remain limited to the current continent interior. Harbor Galleria and campus locations are unchanged.

## Quests and rewards

Three quests per new continent, with three actions each:

| Europe | North America | Oceania |
|---|---|---|
| Wolf Pack Tracker | Beaver Dam Builder | Joey Hide and Seek |
| Meadow Ranger | Eagle Rim Trail | Billabong Health Check |
| Stork Supper Watch | Arctic Patrol | Coastal Cockatoo Trail |

Markers describe each action. Stork counting requires animals to gather during Europe's scheduled feeding show. Beaver Dam Builder adds visible log sections as steps are completed; the completed dam persists via quest steps. The platypus task triggers feeding. Joey spotting requires proximity to the family. Climb and coast quests use the actual visitor stages.

Each new quest and continent page grants a once-only badge/reward, with the existing nearby-friend bonus. Feeding shows, Photo Safari albums, keeper tasks, streaks and baby stickers now cover all seven continents. New rare visitors are White Stag, Spirit Bison and Golden Wombat, each with a specific achievement. All seven passport pages can now be completed normally to earn the existing World Explorer title and gold ring.

## Compatibility and access

- Free entry is unchanged: no purchase required, no closed panels, all gate collision layers/masks zero. Level 7 access remains.
- The existing entrance ramps and floor heights are unchanged. New stage collision uses continuous double-sided top surfaces to avoid vertical slab-end lips at sloped/level joints.
- All first 33 species identities and their `bio_seen` positions stay unchanged. Thirteen original Blender animals are appended at indices 33–45. Deer retains bit 4 and moves to Europe's requested roster; snowy owl and mallard remain available. Already earned Asia pages, photos, quests, ranks and rewards are preserved.
- Dome order remains Africa, Asia, South America, Antarctica, Europe, North America, Oceania. New quest IDs 12–20 append to the old 0–11.
- New models come from `blender-src/make_animals.py`; `HARBOR_PHASE2_ANIMALS_ONLY=1` regenerates just these thirteen. Primitives remain the missing-model fallback.
- Untracked player assets/generator are untouched. Original city characters remain in use.

## Validation

See the final verification record below. The runner serializes Godot checks, uses time guards, stops on script errors and restores the desktop save byte for byte. Screenshots are actual native game renders under `shots/`, with ground views, stage views and close wildlife views.

### Verification record — 22 November 2026

- Guarded editor import and focused `--world-bio-check`: passed. Full `--smoke-test`: `HARBOR_SMOKE_OK`.
- Actual player capsule moves from ENTRY through the hub and each new dome door to its centre, forward and backward, walking/running/BOARD, with an empty legacy day-pass value. All gate collision layers/masks are zero and gate panels hidden. All seven ground trails and all seven distinct stage approaches pass the same full-body test.
- All 21 quest flows complete through the normal interaction function, including negative checks outside dusk/feeding times. New quest/page/show/rare rewards pay once. All seven pages complete through their real quests and unlock World Explorer once.
- Animal fences, upper ledge support and bounded flight circuits pass. Each of the 13 new GLBs is loaded; the actual centered-camera Photo Safari detection and album entry pass for every new species. Snowy owls and eagles occupy separate flight circuits.
- Every new rare event is scheduled and spotted through the real tick path, earns its specific achievement and avoids repeat payment. Keeper daily tasks and consecutive/missed-day streaks, nearby/stale co-op peers and save round-trip pass.
- All 33 prior `kind` identities match HEAD in the same order. Legacy spotted bits, earned page flags, quest keys and deer photo index survive loading. The external desktop save is restored byte for byte after every run.
- Final screenshots: seven ground views, seven stage/layer views, three close wildlife views, campus and passport (19 PNGs). Close views caught and prompted correction of curved-body/leg joins and kangaroo hind-leg placement before handoff.
- No phone validation. Native M1 Godot 4.7.2 Compatibility measurements with `--bench --web-lite` are listed below; these are not Android or browser FPS claims.

Benchmark baseline downtown at `HC_BENCH_AT=-17,-6,0` before changes: **55.8 FPS**, 2297 draws. Two development measurements after the complete landscapes: **53.6 FPS**, 2297 draws, a **3.94% decrease**, within the requested 5%. The detailed Asia dome measured **176.5 FPS** (previous Phase 1 measurement 158.1 FPS). FPS varies with scene and machine load; each new dome's final measurement is recorded below.

Commands used serially, with the runner's import/check deadlines and save restoration:

```sh
python3 scripts/verify-world-biosphere.py --smoke
python3 scripts/verify-world-biosphere.py --shots --phase2
python3 scripts/verify-world-biosphere.py --bench '-17,-6,0'
python3 scripts/verify-world-biosphere.py --bench '-770.0894,-721.7013,0'
python3 scripts/verify-world-biosphere.py --bench '-909.8966,-546.3885,0'
python3 scripts/verify-world-biosphere.py --bench '-972.1167,-624.4101,0'
python3 scripts/verify-world-biosphere.py --bench '-949.9106,-721.7013,0'
```

| Final scene | FPS | Draw calls |
|---|---:|---:|
| Europe | 158.7 | 345 |
| North America | 185.4 | 214 |
| Oceania | 199.4 | 164 |

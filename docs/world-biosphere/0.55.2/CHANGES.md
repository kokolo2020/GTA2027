# Open Biosphere paths and automatic Daily Keeper — 0.55.2

Release authorized by Koko: 0.55.2 / code 98. Version/toast/site metadata updated for the tested implementation; Android and Web release exports are handled by `export.py`.

## Changes

- Removed the enclosed ring concourse and all pathway roofs. Restored the original open hub with seven straight spokes. Low path-side guards remain; no new openings are cut into the domes.
- Matched ramp cross-sections at adjoining corners with mitered edges, shared height tangents and one continuous floor collision mesh per detail. Handrails follow the actual outer boundary: probing just outside the surface avoids trimming gaps near joins. Exact unit beam transforms prevent distorted rail pieces. Each continent retains its existing distinct route and stage.
- Raised visual path slabs 15 mm above their old coplanar position to remove grass/floor flicker; ground collision and continuous entrance bevels retain their smooth physical levels.
- Large entrance sign: left Oceania/North America/Europe; straight Africa; right Asia/South America/Antarctica. Every dome door also lists its neighboring left/right continents when facing the hub, and each hub spoke names its destination.
- Every dome retains its fully sealed lower perimeter, with the original single 5.6 m doorway. Added matching solid upper-shell collision, so elevated decks cannot provide another exit. Entry remains free, with no ticket or gate.
- Daily Keeper stages validate automatically when the player reaches the active yellow marker, on foot, running or BOARD. Removed its manual interaction prompt. Existing daily dates, saved steps, streak, once-per-day payout and rewards remain intact.
- Species IDs, passport/save state, pen safety recovery and one-resident-dome resource loading remain unchanged.

## Verification

One guarded import and complete city regression passed (`smoke-results.txt`). It includes real-body traversal, deck edges and guards, pens and recovery, every dome quest, legacy save masks, all passport pages, and automatic daily completion across consecutive/skipped dates with duplicate-payout checks. Desktop save restored byte for byte.

Close-up render review exposed small rail gaps; the focused follow-up passed after those were corrected (`rail-followup.txt`). After Koko emphasized door-only entry/exit, expanded closure checks passed for all seven domes: 48 perimeter angles, both inward and outward, in walk/run/BOARD modes; actual door traversal both ways; and upper-shell collision identified at 8, 16 and 26 m (`closure-results.txt`). Previously passed bevel sweeps were skipped only in these focused follow-ups.

Final visual review: `shots/open-entry-directions.png`, `shots/open-campus.png`, `shots/asia-smooth-ramp.png`, `shots/antarctica-smooth-ramp.png`, plus all seven continent renders. Updated the baked minimap to remove the old connector. No physical Fold5 available.

Final native M1 `--bench --web-lite` spot-checks of the two curved-ramp domes, compared with released 0.55.1. These are desktop comparisons, not Fold5 measurements.

| Dome | 0.55.1 FPS | Final FPS | Change |
|---|---:|---:|---:|
| Asia | 208.5 | 201.4 | -3.41% |
| Antarctica | 229.9 | 227.8 | -0.91% |

Both remain within the 5% FPS budget. Full resource snapshots and peak process memory are in `asia.json` and `antarctica.json`; native allocator/driver peaks vary between runs. No additional performance or memory gain is claimed for this visual follow-up.

Commands from the canonical repo, serially (each runner has a time guard and restores save bytes):

```sh
python3 docs/world-biosphere/0.55.2/verify.py
python3 docs/world-biosphere/0.55.2/preview.py
python3 docs/world-biosphere/0.55.2/profile.py asia --dome 1
python3 docs/world-biosphere/0.55.2/profile.py antarctica --dome 3
```

Implementation: `game/world_biosphere.gd`; regenerated `game/map/world_map.png`; docs/handover. The only additional `main.gd` change for release is its startup version toast. Unrelated user files left in place; branch stays main.

Release exports passed, desktop save restored byte for byte. APK package/version/signature/ZIP checks passed; SHA256 `196a7969792d1d8b674834814697eda5030aadd2e4fe26f7f93610071d66f1c1`, 53,158,394 bytes.

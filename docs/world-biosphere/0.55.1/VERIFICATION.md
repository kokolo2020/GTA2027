# World Biosphere 0.55.1 / code 97 verification

## Scope and physical collision checks

Final guarded import and complete city regression passed (`HARBOR_SMOKE_OK` and `WORLD_BIOSPHERE_OK`). The final run used no dome/geometry skip variables. See `smoke-results.txt`. The malformed-JSON log entry is deliberate invalid-network-packet coverage, not a failed assertion.

- Actual player CharacterBody3D/capsule, walk, run and BOARD. Normal game processing is paused for deterministic manual body steps, and safety recovery is disabled during geometric traversal checks, so rescue cannot conceal a blocked or unsafe surface.
- Hub and all seven disc bevels: 24 approach angles, inward and outward. Intentional walls are temporarily disabled only for isolated bevel coverage, then restored for tunnel and wall tests.
- ENTRY through hub to every dome centre, both door sides, entire enclosed loop, every ground route, connected visitor stage, raised deck edges and exposed solid guards.
- Every pen approached from eight sides in all three modes; pen injection and held-stick rescue verified. Public surfaces and scenery must retain their specified clearance. Every dome wall tested away from its tunnel opening.
- Actual model loads, no ground-bird flight anchors, tucked flight legs, support under elevated standing wildlife, elephant GLB and separated feeding targets.
- Every quest and seven passport pages completed; rewards/stamps/photos/feeding once, rares, achievements, co-op, keeper tasks and streaks, legacy species bits and save roundtrip checked.
- A rendered elephant follow-up exposed the original GLB's short hip pivots. The runtime now extends those limbs into the torso while keeping the feet grounded; a targeted follow-up checks actual transformed limb bounds against torso/ground bounds (`elephant-followup.txt`). The complete city suite was not repeated for that visual-only correction.
- Desktop player save restored byte for byte after each guarded process. Stable 46 species IDs; old passport state retained. Free entry, empty gate list, no ticket charge.

## Native performance and memory comparison

Same Apple M1 / Godot 4.7.2 Compatibility renderer, same fixed camera positions, `--bench --web-lite`; one process at a time. Eight-second measured gameplay interval after warm-up. `before.json` is the released 0.55.0 source with measurement-only instrumentation; `after.json` is the final implementation. Draws/triangles are the benchmark's sampled final frame; FPS is the interval average. RSS and physical footprint are process-lifetime peaks from `/usr/bin/time -l`, not Android PSS.

| Dome | FPS before → after | Change | Draw calls | Drawn triangles | Peak RSS MiB | Peak footprint MiB |
|---|---:|---:|---:|---:|---:|---:|
| Africa | 198.4 → 230.2 | +16.0% | 179 → 144 | 47,311 → 39,329 | 651.7 → 564.5 | 1498.1 → 1388.3 |
| Asia | 176.5 → 208.5 | +18.1% | 232 → 186 | 147,734 → 130,620 | 801.8 → 608.2 | 1500.5 → 1390.0 |
| South America | 161.0 → 203.3 | +26.3% | 284 → 203 | 107,176 → 55,572 | 675.3 → 660.2 | 1516.0 → 1395.5 |
| Antarctica | 162.5 → 229.9 | +41.5% | 328 → 114 | 87,584 → 23,324 | 708.3 → 667.8 | 1513.7 → 1378.8 |
| Europe | 168.8 → 193.7 | +14.8% | 344 → 274 | 71,378 → 46,124 | 807.6 → 720.3 | 1500.3 → 1393.4 |
| North America | 182.7 → 218.0 | +19.3% | 212 → 191 | 74,702 → 59,898 | 687.4 → 590.8 | 1498.4 → 1405.3 |
| Oceania | 202.7 → 232.3 | +14.6% | 164 → 133 | 49,284 → 42,732 | 645.7 → 623.7 | 1515.3 → 1398.7 |

All seven FPS comparisons improve; minimum gain 14.6%, exceeding the no-more-than-5%-loss requirement. Worst per-process RSS peak: 807.6 → 720.3 MiB. Worst physical footprint: 1516.0 → 1405.3 MiB.

| Dome | Texture MiB | Buffer MiB | Heap peak MiB | Cached animal models | Resident interior nodes (all seven) | Labels | Visible blended surfaces | Tick mean µs |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Africa | 104.3 → 105.0 | 45.2 → 36.2 | 527.9 → 506.4 | 45 → 7 | 4,614 → 408 | 200 → 51 | 152 → 0 | 14.7 → 87.2 |
| Asia | 104.3 → 104.6 | 45.2 → 35.8 | 529.9 → 510.7 | 45 → 5 | 4,614 → 340 | 200 → 50 | 152 → 0 | 13.3 → 69.2 |
| South America | 108.5 → 104.8 | 45.2 → 35.6 | 534.3 → 508.6 | 45 → 6 | 4,614 → 423 | 200 → 51 | 152 → 0 | 19.3 → 98.3 |
| Antarctica | 108.5 → 104.8 | 45.2 → 35.3 | 531.7 → 505.6 | 45 → 4 | 4,614 → 346 | 200 → 48 | 152 → 0 | 13.2 → 78.5 |
| Europe | 104.3 → 104.8 | 45.2 → 37.1 | 527.0 → 505.6 | 45 → 8 | 4,614 → 367 | 200 → 50 | 152 → 0 | 77.6 → 91.8 |
| North America | 104.3 → 104.7 | 45.2 → 37.5 | 527.5 → 505.6 | 45 → 9 | 4,614 → 387 | 200 → 50 | 152 → 0 | 62.4 → 85.8 |
| Oceania | 108.5 → 108.9 | 45.2 → 36.5 | 532.2 → 509.8 | 45 → 6 | 4,614 → 264 | 200 → 48 | 152 → 0 | 50.2 → 79.8 |

Detailed Africa inventory: unique Biosphere mesh resources 366 → 90; mesh triangles 268,701 → 49,533; cached animal GLB source bytes 6,622,656 → 957,528; MultiMesh transform bytes 538,320 → 453,360 (11,215 → 9,445 instances). GLB encoded bytes are not decoded RAM. Alpha-scissor material surfaces 10 → 1 because only one continent's foliage remains loaded. Source textures are capped at 256 pixels for dome foliage; total game texture allocation is essentially unchanged/slightly higher, so no texture-memory reduction is claimed.

Regular tick cost rises to 98.3 µs maximum mean across domes, still below 0.1 ms; the additional safety checks and active-culling work are included. First detail construction takes 104–527 ms in these native runs, outside the averaged steady-state tick. No GPU overdraw or Android PSS measurement was available.

Resource monitors are a final-frame snapshot, not per-category lifetime peaks. The process lifetime totals include city setup, driver allocation and shader work. No mobile GPU overdraw counter is available here; transparent-surface counts and draw calls are recorded as proxies. `before-resources.json` adds the detailed Africa resource inventory to the original seven-dome baseline.

Only one interior remains resident; switching frees the previous detail and its model/foliage/material caches. A camera far limit and exterior culling hide the other shells while inside. Opaque geometry and alpha-scissor foliage replace blended canopy/glass layers. New geometry uses shared/batched meshes, MultiMesh planting and coarse wildlife update tiers. Android now opts into the existing lite path, avoiding desktop normal maps, with about one million 3D pixels and no dome shadows. Native tests use lite on both versions, so that Android-specific correction is not an extra claimed benchmark gain.

## Artifacts and reproduction

`shots/` contains actual final game renders for each continent, an elephant close-up, and the enclosed ring campus. Original Blender animal GLBs remain in the build; the elephant GLB is 110,460 bytes / 3,732 triangles, with body and four named legs. Feeding slots now keep elephant instances separate instead of piling onto the same point.

Run serially from `/Users/koko/GTA2027` (never alongside another game instance):

```sh
python3 docs/world-biosphere/0.55.1/verify.py
python3 docs/world-biosphere/0.55.1/profile.py after
python3 docs/world-biosphere/0.55.1/artifacts.py
python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.55.1.md
```

The first three runners enforce process deadlines and restore local save bytes. The artifact runner captures screenshots, bakes/imports the map, then exports Android and Web. Publication requires a clean committed main, validates package/version/certificate and downloads the released APK to verify its SHA256.

## Hardware limits

No Fold5 was attached (`adb devices` empty). These results establish native comparative performance and physical collision regression, **not measured 60 FPS on Fold5**. Android process memory, thermal behavior and YouTube staying alive during a livestream still require Koko's phone test. Audio had no active stream in the benchmark; the recorded zero WAV bytes do not mean normal gameplay uses no audio memory. No audio assets or saved radio preference were removed.

Final Android/Web exports passed. APK package/version/signature and ZIP integrity verified by publisher check-only. APK SHA256: `825a5f59a9bebea425da2121f2de7e7aff3fc6761dca5223cc4f317a2f4d896e`; 53158394 bytes. Final screenshots of all seven domes, the elephant and the loop reviewed.

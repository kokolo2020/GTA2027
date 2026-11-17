# Harbor City — current handover

Version 0.8.0, code 8. Original single-player Android game, Godot 4.7.2 standard / Compatibility, Samsung Galaxy Z Fold5.

The canonical project has moved to **/Users/koko/GTA2027**, repository **https://github.com/kokolo2020/GTA2027**. Read PUBLISHING.md for the new self-contained GitHub release process. The old /Users/koko/harbor-city folder is retained for toolchain and historical recovery; develop here going forward.

v0.8.0 passed the Mac headless regression and APK verification and was published to the legacy private Site before migration. GitHub migration is complete; see the final migration record below.

## Latest gameplay

The North Update adds Industrial Quarter, Maple Suburbs, Harbor Airfield and Summit Pass, eight discoveries, two trials and a North Explorer mission. North Gate opens after three Bay discoveries. Original Blender buildings, props, planes, trees, cars, lighthouse and windmill are included. Existing upgrades, garage, radio, pedestrians, street events, deliveries and save data are retained.

Earlier Fold5 feedback: Koko finished all v0.3 objectives and most v0.5 objectives; do not reset their progress. v0.8.0 Fold5 appearance, performance and install-as-update still need verification.

APK SHA256: cc9635af96dd87776ae1d36ee3987c9c8930375e950ad27aff99fff8a8b38bae
Bytes: 29320811
Package: com.koko.harborcity, version 0.8.0 / code 8, ARM64, min SDK 24, target 36.
Certificate SHA256: 5168f1fa527ea9b9ea183d442285192de49dfe0d5b6cf0e0590421b84b5f547b

Mac smoke test passed all existing checks including North content and models. Two ObjectDB instances leak at headless exit as in prior builds; no assertions failed. Signed APK, ZIP integrity, exact legacy-site chunks and hash verified.

Full historical feature/setup notes are in docs/history/PRE-GITHUB-HANDOVER.md. Current source and GLBs are in game; Blender generators in blender-src; public download page in site. The export preset was made portable by clearing custom template paths; the existing templates/key remain local on the Mac.

Next: install v0.8.0 over the existing app, verify progress and North performance, then address observed issues. Never schedule recurring monitoring.

## Completed GitHub migration — 17 November 2026

- Public canonical source: https://github.com/kokolo2020/GTA2027
- Download page: https://kokolo2020.github.io/GTA2027/
- Verified APK release: https://github.com/kokolo2020/GTA2027/releases/tag/v0.8.0
- Source release tag v0.8.0 points at 98cda9dba5ba7149f769752d910efc36581e07d1.
- A fresh import and full smoke test passed from this new checkout.
- The new publisher was used successfully end to end: APK signature/version checks, source push/tag, GitHub release asset upload, publish, page metadata push, and remote APK download/hash verification.
- GitHub Pages is configured for the workflow in .github/workflows/pages.yml; its deployment succeeded.
- No keys, credentials, SDK/editor binaries, caches or APK blobs were committed. APK binaries are release assets.
- Existing toolchain/key stays local on Koko's Mac; assets and generators are portable. Tools under ~/harbor-city/tools and the Godot key under ~/Library remain available to build.
- Future Claude sessions need GitHub CLI write access (gh auth status) and native Android verification tools, not the Sites connector. PUBLISHING.md has the exact command. In a new cloud environment, folder access and GitHub login must still be established.
- Old ChatGPT Site remains a private 0.8.0 fallback. Its successful deployment was appgdep_6afbceed111081918bf572f46bd22f2d from source 72b14b406cf26b3539abd8d1830ecb8781dfecbe.
- Fold5 testing of v0.8.0 remains outstanding.

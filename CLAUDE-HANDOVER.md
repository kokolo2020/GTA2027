# Harbor City: handover (reference). Updated 2026-11-22, live 0.55.7

Read in this order: this file, `HANDOVER-NEXT-CHAT.md` (current state and next jobs), `CODE-MAP.md` (where code is), `docs/handover/DECISIONS.md` (Koko's decisions to preserve). Old notes: `docs/handover/HISTORY.md` (archive, out of date).

## The project
- Harbor City: original single-player + online city game, Godot 4.7.2 (Compatibility), Android APK + web build. Owner Koko (Bangkok, solo builder), plays on a Samsung Galaxy Z Fold5 and talks to Claude from his phone.
- Repo `/Users/koko/GTA2027` (GitHub kokolo2020/GTA2027). **Stay on main.** Package `com.koko.harborcity`; keep the original signing certificate (SHA256 5168f1fa527ea9b9ea183d442285192de49dfe0d5b6cf0e0590421b84b5f547b). Increase the version code for every APK.
- **Live: 0.55.7 / code 103** (tag v0.55.7). Next code: 104. Download page https://kokolo2020.github.io/GTA2027/ ; web https://kokolo2020.github.io/GTA2027/play/.
- Rules in `AGENTS.md` and `PUBLISHING.md`: no spending money, no new legal agreements, no store publishing, no credentials/tools/.godot caches/APKs in git (APKs are release assets).

## Koko's working rules
1. No ChatGPT. Claude does ALL the work and runs everything (tests, commands, screenshots); Koko only approves prompts from his phone.
2. Short, direct replies, numbered steps. **Release ONLY when Koko says "Release".**
3. Track usage % per release in `RELEASE-USAGE.md` (Koko fills it in; add a row per release).
4. Batch fixes, run the final tests once, inspect real renders. No recurring AI monitoring.
5. New conversation about every 10 updates; refresh HANDOVER-NEXT-CHAT.md before that.

## Finding code
- `game/main.gd` (34k lines): index in `CODE-MAP.md` and `CODE-MAP-FUNCTIONS.md`. Regenerate with `python3 scripts/make-code-map.py` (do this in every release). Read only the named line ranges, never the whole file.
- `game/world_biosphere.gd` (the live World Biosphere) is the model for new modules: a separate script that talks to main through `g`. Put new systems in new files.
- Dev flags: `--smoke-test`, `--world-bio-check`, `--world-bio-shots`, `--city-shots` (HC_CAM / HC_SHOTS), `--bench --web-lite` (HC_BENCH_AT, HC_SKIP), `--nav-check`, `--home-check`, `--bake-map`.

## Running things on the Mac (Claude's shell is a Linux VM and cannot run Mac Godot)
Files in the repo are reachable with `device_bash` under `$HOME/mnt/GTA2027` (request folder access for /Users/koko/GTA2027 first). For big edits: `device_stage_files` the file, patch the copy in the cloud shell with a Python script that asserts each replacement matches exactly once, then `device_commit_files` it back (pass `expectedMtimeMs` from the stage result).
To run Godot / scripts:
1. Write a launcher with `cat > name.command` then `chmod 755`. Never edit it afterwards with sed -i or python (adds an ACL and Finder refuses to open it): use a new file name.
2. Append the name to `.git/info/exclude` (the publisher needs a clean tree).
3. `computer_request_full_control`, grant Finder, `computer_open_application Finder`, click a file row, type the launcher's name to select it, press cmd+o. (Terminal is click-only.)
4. Read `reports/*.log` with `device_bash`; `/tmp` is Mac-only, so have the launcher copy logs into `reports/`. Wait with `sleep 170` inside `device_bash` (limit 180 s).
5. `computer_release_full_control` afterwards. End launchers with an osascript that closes their Terminal window.
Scripts: `docs/world-biosphere/0.55.2/{preview,verify,profile,export}.py` (`verify.py --focused` = biosphere checks only, about 1 min; `verify.py` = import + full smoke, about 3 min; `preview.py` = screenshots into `docs/world-biosphere/0.55.2/shots`), `scripts/publish-release.py`.
Tools: Godot `~/harbor-city/tools/Godot.app/Contents/MacOS/Godot`; SDK `~/harbor-city/tools/android-sdk`; JDK `~/harbor-city/tools/jdk17/jdk-17.0.21+9/Contents/Home`. Desktop save `~/Library/Application Support/Godot/app_userdata/Harbor City/harbor_save.cfg` (the scripts restore it byte for byte; never run two Godot processes at once).
Gotchas: deletes in the repo fail (Operation not permitted); a release launcher can run twice (the 0.55.7 launcher guards on the tag); the Pages workflow sometimes fails with "No artifacts named github-pages": rerun it. `reports/`, `research_notes/`, `release-*.sh`, `*.command` launchers and `blender-src/make_player.py` + `game/models/player.glb` are not for commit.

## Release steps (only on "Release")
1. `game/export_presets.cfg`: `version/code`, `version/name`. `game/main.gd`: the startup `_show_toast("Harbor City x.y.z: ...")` (about line 360). `site/index.html`: edition `NEO HARBOR / x.y.z`, `release.js?v=x.y.z`, the "New in" lead. Write `docs/releases/vX.Y.Z.md`. Add a row to `RELEASE-USAGE.md`. Add a "## x.y.z" note in `docs/handover/RELEASES.md`. Run `python3 scripts/make-code-map.py`.
2. Copy `release-0.55.7.command` to a new name, change the version and message (it guards on the tag, exports with `export.py`, commits with the Co-Authored-By and Claude-Session lines, runs `scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/vX.md`), exclude it from git, run it via Finder.
3. Check `reports/release-x.log` for "Published and verified" and `git log` / `git tag`. Confirm on the phone that the download page shows the new version (a WebFetch of the live page is cached).

## Known open items
- Fold5 has never been verified: phone FPS and memory (with a YouTube livestream) for 0.55.x.
- See `HANDOVER-NEXT-CHAT.md` for the job list.

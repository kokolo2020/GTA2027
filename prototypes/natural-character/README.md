# Natural character 01

> Rolled back in 0.53.2 at Koko's request after broken clothing/shoulder shapes were reported on a phone. The game now uses the original 0.52.1 characters; these studies and assets are retained as history and excluded from release exports.

An original character study for Harbor City, subsequently integrated as the 0.53.0 player
trial. Earlier studies below are retained for comparison; the latest expansion is
described at the end. Existing wardrobe assets and saved progress are preserved.

- `full-body.png` and `face.png`: studio renders, not in-game screenshots.
- `neo-harbor-walk.gif`: current looping walk study, rendered from the character's source rig.
- `walk.gif`: earlier casual-outfit prototype, retained for comparison.
- `running.gif` and `running.png`: running study with forward lean, bent elbows and a flight phase.
- `harbor-natural-running.glb` / `.blend`: the same character with idle, walk and run clips.
- `make_running.py`: loads the base prototype and creates the running study.
- `authored-run.gif`, `run-side.png`, `harbor-authored-run.glb` / `.blend`: revised run,
  retargeted from the Kenney CC0 Run already present in `game/models/kperson.glb`. Original
  character geometry is retained. The source motion is stylized animation, not motion capture.
- `retarget_running.py`: samples the existing animation, maps joint directions to the new
  proportions, restrains the arm swing and stride, corrects jacket weights, and adjusts sole clearance.
- Latest: `refined-run.gif`, `refined-run-side.png`, `harbor-refined-run.glb` / `.blend`.
  This running variant replaces open hands with relaxed fists, restores source pelvis/shoulder
  yaw, and stabilizes the gaze. The base character and earlier previews remain available.
- `harbor-natural-01.glb`: skinned character with a 16-joint skeleton and idle/walk clips.
- `harbor-natural-01.blend`: editable character and studio setup.
- `make_prototype.py`: procedural source; run with Blender 4.2 from any directory.

The study explores adult proportions, inset eyes, a connected face and neck, softer clothing,
relaxed hands, and continuous deformation at elbows and knees. Its movement is a preliminary
in-place animation, not finished locomotion. It does not include production facial animation,
wardrobe compatibility, runtime foot placement, sitting, or game integration. The separate
running study is a preliminary in-place clip; runtime blending and game-speed matching remain.

Current revision: futuristic Neo Harbor clothing (midnight teal technical jacket, standing
collar, cyan chevrons, graphite trousers and illuminated sneaker trim). Arms use a single
anatomical surface across the elbow, inward-facing palms, forward elbow flexion, and smooth
height-based skin weights. This corrects the previous clip's backward elbow bend.

Before adoption: review the style with Koko, improve deformation topology and shoe shapes,
adapt wardrobe attachment points, finish movement transitions, and measure it on web and Fold5.
The materials and studio lighting here differ from Harbor City's renderer and lighting.

## Released character trial (0.53.0)

Koko approved applying the character to the playable player once, with an easy revert.
`game/main.gd` enables `TRY_NATURAL_PLAYER`; `game/natural_player_trial.gd` loads the independent
`game/models/natural_player_trial.glb`. Other people retain their existing models. The saved
wardrobe is retained; this trial displays the fixed futuristic outfit, and the wardrobe UI
explains that limitation. The asset includes Idle, Walk, Run, Sit, Wave, Talk and Cheer.

Set `TRY_NATURAL_PLAYER := false`, or launch Godot with `--classic-player`, to restore the
classic player. This does not require editing or migrating any save. The original `main.gd`
is also backed up under the ignored `integration-backup/` folder.

`prepare_game_trial.py` creates the runtime asset. `verify_in_game.py` runs the import,
focused checks and smoke test with time guards; `--visual` captures real gameplay frames
under `in-game/` and checks the classic rollback. It refuses to run while another Godot
instance is open, and restores the desktop save in a `finally` block. Save backups are kept
outside the repository in `~/.cache/harbor-city-character-trial/`.

Import, focused checks, full smoke test, screenshots and rollback passed. Not tested on a
phone. Android and Web 0.53.0 exports now pass verification. Publishing was authorized afterward. Main remains the release branch. Settings > Character provides a saved New / Classic switch.

Published as 0.53.0 / code 88. Android checksum/signing and live Web package verified; the
public browser New / Classic switch was tested. See CLAUDE-HANDOVER.md for release evidence.

## City-wide expansion (0.53.1)

`blender-src/make_city_people.py` creates athletic male and fuller adult female variants,
including separate one-surface crowd assets (about 6k triangles) and full player models.
All seven animation clips are retained. Settings now cycles Male / Female / Classic, and
city NPCs and online avatars use the new variants. New outfits retain their designed colors
on the player; city outfits have varied palettes. Classic retains the saved wardrobe.

Run playback follows actual ground displacement and smooths cadence; walking is unchanged.
Standing crowds hold varied resting poses, while moving and working actors animate. The
single-surface shader is `game/natural_crowd.gdshader`. A local M1 food-court Web-lite benchmark
measured 50.7 FPS versus 45.9 for Classic; this does not establish phone performance.

Import, focused appearance/network/movement checks, full smoke, gameplay screenshots and
Classic rollback passed. `verify_in_game.py --bench` measures the new city; add `--classic-city`
for the baseline. Desktop saves are restored after every run. Android/Web exports and APK integrity/package/version/signing verification passed. Published
as 0.53.1 / code 89; public APK and Web package checksums verified. No phone test.

Updated livestream artwork: `docs/stream/harbor-city-live-new-characters-v3.jpg` (1280x720),
with its source PNG and exact image-generation prompt alongside it.

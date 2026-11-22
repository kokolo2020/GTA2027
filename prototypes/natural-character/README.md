# Natural character 01

An isolated, original character study for Harbor City. The production game, existing character
redesign files, wardrobe assets, saves, and version numbers are untouched.

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

## Local game trial (unreleased)

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

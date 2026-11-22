#!/usr/bin/env python3
"""Regenerates CODE-MAP.md: an index of game/main.gd and the other game/*.gd scripts.

Run from the repo root:  python3 scripts/make-code-map.py
It lists (1) the labelled sections of main.gd with line ranges, (2) function-name prefix families
(the real "modules": _career_*, _home_*, _bio_* ...) with their line spans, (3) smoke tests, and
(4) the same for every other script. Nothing here is hand-edited, so rerun it after every release.
"""
import re, sys, collections
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
GAME = ROOT / "game"
OUT = ROOT / "CODE-MAP.md"
OUT_FUNCS = ROOT / "CODE-MAP-FUNCTIONS.md"

PREFIX_DESC = {"future":"neon / futuristic look","online":"Supabase realtime multiplayer","shop":"Marina Heights shops","bus":"Airport Line and city buses","level":"player levels","chase":"police chase mode","quest":"quests","sky":"Harbor Loop sky train, sky look","crew":"crews","style":"hair, clothes, wardrobe","social":"friends, invites","soc":"social extras","c4":"Connect Four","rx":"Reaction Duel","quiz":"party quiz","ach":"achievements","radio":"radio and ambience","smoke":"smoke tests","shot":"screenshot modes","hub":"Harbor Dome hub","ttt":"tic-tac-toe","sg":"Sky Garden","rw":"Raceway","crate":"starter crate","quick":"quick quests","fc":"food court and shared 3D part helpers","pz":"daily puzzle","bio":"OLD Biosphere (hex hub; the live one is world_biosphere.gd)","ga":"Galleria mall","season":"season pass","lb":"leaderboard","ds":"digital signs","treasure":"treasure hunt","fm":"Find Me","ap":"Harbor Airport","nav":"walker nav grids","dir":"Directions panel","gc":"Grand Central","career":"careers and jobs (taxi, medic, police, fire)","cs":"career cut scenes","cj":"career job state","home":"homes","ch":"chapters","photo":"photo mode","stream":"streamer mode"}

SECTION = re.compile(r"^#\s*(?:-{4,}|={4,})\s*(.+?)\s*(?:-{4,}|={4,})?\s*$|^#\s*---- (.+?) ----\s*$")
FUNC = re.compile(r"^func\s+([A-Za-z0-9_]+)\s*\(")
SKIP_PREFIX = {"", "on", "get", "set", "add", "make", "draw", "update", "build", "show", "hide", "apply", "refresh", "toggle", "close", "open", "start", "end", "check", "tick", "spawn", "pick", "build_"}


def scan(path: Path):
    lines = path.read_text(encoding="utf-8").splitlines()
    funcs = []
    sections = []
    for i, line in enumerate(lines, 1):
        m = FUNC.match(line)
        if m:
            funcs.append((i, m.group(1)))
            continue
        if line.startswith("# ") and "---" in line or line.startswith("# ===") or line.startswith("# ---"):
            s = SECTION.match(line)
            if s:
                title = (s.group(1) or s.group(2) or "").strip(" -=")
                if title and len(title) > 3:
                    sections.append((i, title))
    return lines, funcs, sections


def prefix_of(name: str) -> str:
    n = name.lstrip("_")
    parts = n.split("_")
    return parts[0] if len(parts) > 1 else ""


def main():
    main_path = GAME / "main.gd"
    lines, funcs, sections = scan(main_path)
    total = len(lines)
    out = []
    out.append("# CODE MAP (generated: do not edit by hand)\n")
    out.append("Regenerate with `python3 scripts/make-code-map.py` after every release. It is also the quickest way to find code:")
    out.append("`sed -n 'START,ENDp' game/main.gd` on a line range below, or `grep -n 'func _career_' game/main.gd`.\n")
    out.append("## How the code is organised\n")
    out.append("- `game/main.gd` (%d lines, %d functions): one big script holding the whole city. GDScript has no partial classes, so it is indexed rather than split: sections and name prefixes below." % (total, len(funcs)))
    out.append("- `game/world_biosphere.gd`: the World Biosphere (self-contained module, talks to main through `g`). The model for new modules.")
    out.append("- `game/hub_jokes.gd`, `game/natural_player_trial.gd`: small helper scripts.")
    out.append("- `scripts/`: publisher and tools. `docs/world-biosphere/0.55.2/*.py`: preview, verify (smoke), profile, export.")
    out.append("- Rule for new work: put a new system in its own file (like world_biosphere.gd) instead of growing main.gd.\n")

    out.append("## Sections of main.gd (labelled in the source)\n")
    out.append("| Lines | Section | Funcs |")
    out.append("|---|---|---|")
    bounds = [s[0] for s in sections] + [total + 1]
    first = sections[0][0] if sections else total
    fcount = lambda a, b: sum(1 for ln, _ in funcs if a <= ln < b)
    out.append("| 1-%d | Core: constants, setup, input, driving, save/load, HUD (unlabelled) | %d |" % (first - 1, fcount(1, first)))
    for idx, (ln, title) in enumerate(sections):
        end = bounds[idx + 1] - 1
        out.append("| %d-%d | %s | %d |" % (ln, end, title.replace("|", "/"), fcount(ln, end + 1)))

    out.append("\n## Function families (name prefixes with 6+ functions)\n")
    out.append("The prefix usually names the system. Span = first to last function line (families can be interleaved with others).\n")
    fam = collections.defaultdict(list)
    for ln, name in funcs:
        p = prefix_of(name)
        if p and p not in SKIP_PREFIX:
            fam[p].append(ln)
    out.append("| Prefix | What | Funcs | Lines (first-last) |")
    out.append("|---|---|---|---|")
    for p, lns in sorted(fam.items(), key=lambda kv: kv[1][0]):
        if len(lns) >= 6:
            out.append("| `_%s_*` | %s | %d | %d-%d |" % (p, PREFIX_DESC.get(p, ""), len(lns), lns[0], lns[-1]))

    out.append("\n## Landmarks: entry points and builders (the core lives here, spread across sections)\n")
    core = ("_ready", "_process", "_physics_process", "_input", "_unhandled_input", "_save_progress", "_load_progress", "_toggle_menu", "_apply_car", "_apply_view", "_refresh_hud", "_show_toast", "_collider", "_blocked_at", "_blocker", "_place_lock_of", "_level")
    out.append("Entry points: " + ", ".join("`%s`:%d" % (n, ln) for ln, n in funcs if n in core))
    out.append("")
    out.append("World builders (`_build_*`): " + ", ".join("`%s`:%d" % (n, ln) for ln, n in funcs if n.startswith("_build_")))
    out.append("")
    out.append("\n## Smoke tests in main.gd\n")
    for ln, name in funcs:
        if "smoke" in name or name.startswith("_check_") and "test" in name:
            out.append("- `%s` line %d" % (name, ln))

    out.append("\n## Other scripts\n")
    for path in sorted(GAME.glob("*.gd")):
        if path.name == "main.gd":
            continue
        l2, f2, s2 = scan(path)
        out.append("### game/%s (%d lines, %d funcs)\n" % (path.name, len(l2), len(f2)))
        if s2:
            out.append("Sections: " + "; ".join("%d %s" % (a, b) for a, b in s2))
            out.append("")
        if len(f2) <= 400:
            out.append("Functions: " + ", ".join("`%s`:%d" % (n, ln) for ln, n in f2))
            out.append("")

    out.append("## Finding things fast\n")
    out.append("- Jobs/careers (taxi, paramedic, police, firefighter): `_career_*`, `_cs_*` cut scenes, `_cj_*`.")
    out.append("- Checkpoints and fast travel: `CHECKPOINTS`, `_build_checkpoints`, `_checkpoint_spawn`, `_travel_*`.")
    out.append("- Roads: `road_rects`, `_note_road`, `_on_road`; car layer fence `HUB_CAR_LAYER`, `_car_barrier`.")
    out.append("- Driving physics: `_physics_process`, `_eff_accel`, `_eff_max`, `car_speed`.")
    out.append("- Biosphere (current): `game/world_biosphere.gd` (build, shell, quests, visitors). Old Biosphere: `_bio_*` in main.gd.")
    out.append("")
    fo = ["# CODE MAP: functions per section (generated)\n", "Every function in game/main.gd under its section, with line numbers. See CODE-MAP.md for the overview.\n"]
    for idx, (ln, title) in enumerate(sections):
        end = bounds[idx + 1] - 1
        names = [(l, n) for l, n in funcs if ln <= l <= end]
        fo.append("## %d-%d  %s\n" % (ln, end, title))
        fo.append(", ".join("`%s`:%d" % (n, l) for l, n in names) if names else "(no functions)")
        fo.append("")
    pre = [(l, n) for l, n in funcs if l < first]
    fo.insert(2, "## 1-%d  Core (unlabelled)\n\n%s\n" % (first - 1, ", ".join("`%s`:%d" % (n, l) for l, n in pre)))
    OUT_FUNCS.write_text("\n".join(fo) + "\n", encoding="utf-8")
    OUT.write_text("\n".join(out) + "\n", encoding="utf-8")
    print("wrote", OUT, len(out), "lines")


if __name__ == "__main__":
    main()

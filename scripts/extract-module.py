#!/usr/bin/env python3
"""Move a block of functions out of game/main.gd into its own module script.

  python3 scripts/extract-module.py NAME START_MARKER END_MARKER [--apply]

NAME          module/file name, e.g. careers -> game/careers.gd, main member `careers`
START_MARKER  text that starts the first banner line of the block (line starts with it)
END_MARKER    text that starts the first banner line AFTER the block

The block's `func`s move to game/NAME.gd (class extends RefCounted, `game` = the main script).
Everything else in the block (vars, consts, banners) stays in main.gd. Every identifier in the moved
code that is a main.gd member (var, const, func, Node built-in) is rewritten to `game.NAME`, `self` to
`game`, `var x := e` to `var x = e` (Variant, as in world_biosphere.gd). For each moved function that
the rest of main.gd still uses a small stub is left in main.gd, so no caller changes.
Dry run (default) prints a report only. Nothing is written without --apply.
"""
import re, sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MAIN = ROOT / "game" / "main.gd"
HANDLE = "game"

KEYWORDS = set("""if elif else for while match break continue pass return func var const class extends class_name enum static signal
await in is as and or not true false null self void bool int float String Array Dictionary Vector2 Vector2i Vector3 Vector3i Color
Callable Signal Transform3D Basis Quaternion Rect2 AABB Plane NodePath RID Object Node Node3D Control super preload load assert
print print_rich printerr push_warning push_error str abs absf absi min max mini maxi minf maxf clamp clampf clampi lerp lerpf lerp_angle
move_toward sin cos tan atan atan2 asin acos sqrt pow exp log floor floori ceil ceili round roundi snappedf snapped randi randf randf_range
randi_range randomize range len typeof is_instance_valid deg_to_rad rad_to_deg fposmod posmod signf sign wrapf wrapi inverse_lerp remap
smoothstep ease cubic_interpolate bezier_interpolate angle_difference is_equal_approx is_zero_approx is_nan is_inf hash var_to_str
str_to_var ceilf floorf roundf signi minf is_finite sinh cosh tanh PI TAU INF NAN Time Engine OS Input DisplayServer RenderingServer
PhysicsServer3D ProjectSettings ResourceLoader FileAccess DirAccess Tween Timer ClassDB JSON Marshalls Crypto Geometry3D Geometry2D
Vector4 Projection fmod fposmod _ randfn lerp_angle_ rotate_toward""".split())

STR_OR_COMMENT = re.compile(r'"""[\s\S]*?"""|\'\'\'[\s\S]*?\'\'\'|"(?:\\.|[^"\\\n])*"|\'(?:\\.|[^\'\\\n])*\'|#[^\n]*')
IDENT = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")
FUNC_HEAD = re.compile(r"^(static\s+)?func\s+([A-Za-z0-9_]+)\s*\((.*?)\)\s*(->\s*[^:]+)?\s*:", re.S)


def mask(text):
    """Replace strings/comments by placeholders so identifier scans ignore them."""
    store = []
    def sub(m):
        store.append(m.group(0))
        return "\x00%d\x00" % (len(store) - 1)
    return STR_OR_COMMENT.sub(sub, text), store


def unmask(text, store):
    return re.sub(r"\x00(\d+)\x00", lambda m: store[int(m.group(1))], text)


def split_items(lines, a, b):
    """Top-level items inside lines[a:b]: list of (kind, start, end) end exclusive. kinds: func, other, text."""
    items = []
    i = a
    while i < b:
        line = lines[i]
        if line.strip() == "" or line.startswith("#"):
            items.append(("text", i, i + 1)); i += 1; continue
        j = i + 1
        while j < b:
            nxt = lines[j]
            if nxt.strip() == "":
                j += 1; continue
            if nxt.startswith(("\t", " ")) or nxt.startswith(("]", "}", ")")):
                j += 1; continue
            if nxt.startswith("#"):
                # a comment line directly inside a body at col 0 is rare; treat as end of item
                break
            break
        # trailing blank lines belong to text, not the item
        k = j
        while k > i + 1 and lines[k - 1].strip() == "":
            k -= 1
        kind = "func" if re.match(r"^(static\s+)?func\s", line) else "other"
        items.append((kind, i, k))
        for t in range(k, j):
            items.append(("text", t, t + 1))
        i = j
    return items


def main():
    args = [x for x in sys.argv[1:] if not x.startswith("--")]
    apply = "--apply" in sys.argv
    name, start_marker, end_marker = args[0], args[1], args[2]
    lines = MAIN.read_text(encoding="utf-8").split("\n")
    a = next(i for i, l in enumerate(lines) if l.startswith(start_marker))
    b = next(i for i, l in enumerate(lines) if i > a and l.startswith(end_marker))
    items = split_items(lines, a, b)
    funcs = [(s, e) for k, s, e in items if k == "func"]
    moved_names = set()
    for s, e in funcs:
        m = FUNC_HEAD.match("\n".join(lines[s:e]))
        assert m, "cannot parse func at line %d: %s" % (s + 1, lines[s])
        moved_names.add(m.group(2))

    # main members outside the moved funcs
    in_moved = set()
    for s, e in funcs:
        in_moved.update(range(s, e))
    members = set()
    for i, l in enumerate(lines):
        if i in in_moved:
            continue
        m = re.match(r"^(?:static\s+)?(?:func|var|const|signal|enum)\s+([A-Za-z_][A-Za-z0-9_]*)", l)
        if m:
            members.add(m.group(1))
        m = re.match(r"^@onready\s+var\s+([A-Za-z_][A-Za-z0-9_]*)", l)
        if m:
            members.add(m.group(1))
    # Node/Node3D/CanvasItem members used bare (not defined in main.gd source). Extend after a dry run.
    node_members = set("""add_child remove_child create_tween get_tree get_viewport get_world_3d get_node get_node_or_null queue_free
position global_position rotation global_transform transform visible show hide name get_parent set_process process_mode
get_window get_children is_inside_tree call_deferred get_instance_id add_to_group basis global_basis rotation_degrees scale
reparent move_child get_child set_physics_process is_processing""".split())
    # enum members / enum names count as members too
    for i, l in enumerate(lines):
        if re.match(r"^enum\s", l):
            for m in re.finditer(r"[A-Z_][A-Z0-9_]*", l):
                members.add(m.group(0))
    members |= node_members

    out_funcs = []
    unknown = {}
    flagged = []
    ext_text = "\n".join(l for i, l in enumerate(lines) if i not in in_moved)
    for s, e in funcs:
        text = "\n".join(lines[s:e])
        masked, store = mask(text)
        head = FUNC_HEAD.match(text)
        # locals: params, var, for, lambda params
        locs = set()
        for m in re.finditer(r"\bvar\s+([A-Za-z_][A-Za-z0-9_]*)", masked):
            locs.add(m.group(1))
        for m in re.finditer(r"\bfor\s+([A-Za-z_][A-Za-z0-9_]*)", masked):
            locs.add(m.group(1))
        for m in re.finditer(r"\bfunc\s*(?:[A-Za-z_][A-Za-z0-9_]*\s*)?\(([^)]*)\)", masked):
            for p in m.group(1).split(","):
                p = p.strip().split(":")[0].split("=")[0].strip()
                if p:
                    locs.add(p)
        if HANDLE in locs:
            flagged.append("local named %s in %s" % (HANDLE, head.group(2)))
        if "@" in masked.replace("\x00", ""):
            flagged.append("annotation in " + head.group(2))

        def repl(m):
            tok = m.group(0)
            st = m.start()
            if st > 0 and masked[st - 1] == ".":
                return tok
            if tok == "self":
                return HANDLE
            if tok in locs or tok in moved_names or tok in KEYWORDS:
                return tok
            if tok in members:
                return HANDLE + "." + tok
            if tok[0].islower() or tok[0] == "_":
                unknown.setdefault(tok, set()).add(head.group(2))
            return tok
        new = IDENT.sub(repl, masked)
        new = re.sub(r"\bvar\s+([A-Za-z_][A-Za-z0-9_]*)\s*:=", r"var \1 =", new)
        new = re.sub(r"(\bfor\s+[A-Za-z_][A-Za-z0-9_]*)\s*:\s*[A-Za-z_][A-Za-z0-9_]*\s+in\b", r"\1 in", new)
        out_funcs.append(unmask(new, store))
        if re.search(r"\bawait\b", masked):
            moved_names_await = True

    # string references to moved function names
    for n in moved_names:
        for l in lines:
            if re.search(r'"%s"' % re.escape(n), l):
                flagged.append('string reference to %s: %s' % (n, l.strip()[:90]))

    print("block lines %d-%d, %d functions to move, %d main members known" % (a + 1, b, len(funcs), len(members)))
    print("FLAGGED:", flagged if flagged else "none")
    print("UNKNOWN identifiers (not local, not main, not builtin):")
    for k in sorted(unknown):
        print("  ", k, "<-", ", ".join(sorted(unknown[k]))[:80])

    if not apply:
        return
    if unknown or flagged:
        sys.exit("refusing to apply: resolve UNKNOWN/FLAGGED first")

    # stubs
    stubs = {}
    for (s, e), body in zip(funcs, out_funcs):
        text = "\n".join(lines[s:e])
        m = FUNC_HEAD.match(text)
        fname = m.group(2)
        if not re.search(r"\b" + re.escape(fname) + r"\b", ext_text):
            continue
        params = [p.strip() for p in re.split(r",(?![^\[\(]*[\]\)])", m.group(3)) if p.strip()]
        pnames = [p.split(":")[0].split("=")[0].strip() for p in params]
        ret = (m.group(4) or "").strip()
        has_await = bool(re.search(r"\bawait\b", mask(text)[0]))
        call = "%s.%s(%s)" % (name, fname, ", ".join(pnames))
        sig = "func %s(%s)%s:" % (fname, m.group(3).strip(), (" " + ret) if ret else "")
        if ret == "-> void":
            stub = [sig, "\t" + ("await " if has_await else "") + call]
        else:
            stub = [sig, "\treturn " + ("await " if has_await else "") + call]
        stubs[s] = stub

    new_main = []
    i = 0
    first_stub_done = False
    moved_ranges = {s: e for s, e in funcs}
    while i < len(lines):
        if i in moved_ranges:
            if i in stubs:
                new_main.extend(stubs[i])
            i = moved_ranges[i]
            continue
        new_main.append(lines[i])
        i += 1
    # module file
    header = ["# Moved out of main.gd by scripts/extract-module.py (block: %s ... %s)." % (start_marker.strip("# -")[:60], end_marker.strip("# -")[:60]),
              "# `%s` is the main script: its variables, constants and functions are reached as %s.name." % (HANDLE, HANDLE),
              "extends RefCounted", "", "var %s" % HANDLE, "", "func _init(g_main) -> void:", "\t%s = g_main" % HANDLE, ""]
    mod = "\n".join(header) + "\n" + "\n\n".join(out_funcs) + "\n"
    (ROOT / "game" / (name + ".gd")).write_text(mod, encoding="utf-8")
    MAIN.write_text("\n".join(new_main), encoding="utf-8")
    print("applied: wrote game/%s.gd (%d funcs), %d stubs in main.gd" % (name, len(out_funcs), len(stubs)))


if __name__ == "__main__":
    main()

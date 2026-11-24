#!/bin/bash
# Claude launcher: export, commit and publish Chit Chat City 0.58.0. Logs to reports/release-0.58.0.log
cd /Users/koko/GTA2027 || exit 1
LOG=reports/release-0.58.0.log
if git tag | grep -qx v0.58.0; then echo "tag exists, not re-running $(date)" >> "$LOG"; exit 0; fi
echo "START $(date)" > "$LOG"
run() { echo "=== $* ===" >> "$LOG"; "$@" >> "$LOG" 2>&1; rc=$?; echo "exit $rc" >> "$LOG"; return $rc; }
run python3 docs/world-biosphere/0.55.2/export.py || { echo "FAILED export" >> "$LOG"; exit 1; }
run git add game docs site RELEASE-USAGE.md CODE-MAP.md CODE-MAP-FUNCTIONS.md blender-src/make_cafe.py blender-src/make_hedge.py release-0.58.0.command run-0.58.0-c.command run-look-shots.command run-autoplay-quick.command run-hedge-models.command run-cafe-shots.command run-cafe-models.command run-cafe-both.command close-terminals.command
run git commit -q -m "0.58.0: rain, station voice, natural look, chat typing on phones, Biosphere rails and hedges" -m "Co-Authored-By: Claude Fable 5.2 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01BK9nDDw9CWZXdgfjUf58e6" || { echo "FAILED commit" >> "$LOG"; exit 1; }
run git rev-parse HEAD
run python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.58.0.md || { echo "FAILED publish" >> "$LOG"; exit 1; }
echo "DONE $(date)" >> "$LOG"
osascript -e 'tell application "Terminal" to close (every window whose name contains "0.58.0")' >/dev/null 2>&1 &

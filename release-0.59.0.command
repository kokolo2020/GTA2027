#!/bin/bash
# Claude launcher: export, commit and publish Chit Chat City 0.59.0. Logs to reports/release-0.59.0.log
cd /Users/koko/GTA2027 || exit 1
LOG=reports/release-0.59.0.log
if git tag | grep -qx v0.59.0; then echo "tag exists, not re-running $(date)" >> "$LOG"; exit 0; fi
echo "START $(date)" > "$LOG"
run() { echo "=== $* ===" >> "$LOG"; "$@" >> "$LOG" 2>&1; rc=$?; echo "exit $rc" >> "$LOG"; return $rc; }
run python3 docs/world-biosphere/0.55.2/export.py || { echo "FAILED export" >> "$LOG"; exit 1; }
run git add game docs site RELEASE-USAGE.md CODE-MAP.md CODE-MAP-FUNCTIONS.md release-0.59.0.command
run git reset -q game/autoplay.gd game/promo.gd game/promo.gd.uid game/project.godot
run git commit -q -m "0.59.0: portal to Paris (real OpenStreetMap streets around the Eiffel Tower)" -m "Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01BK9nDGQ2HA7netcTxkVVRQ" || { echo "FAILED commit" >> "$LOG"; exit 1; }
run git rev-parse HEAD
run python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.59.0.md || { echo "FAILED publish" >> "$LOG"; exit 1; }
echo "DONE $(date)" >> "$LOG"
osascript -e 'tell application "Terminal" to close (every window whose name contains "0.59.0")' >/dev/null 2>&1 &

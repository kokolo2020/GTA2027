#!/bin/bash
# Claude launcher: export, commit and publish Harbor City 0.56.8. Logs to reports/release-0.56.8.log
cd /Users/koko/GTA2027 || exit 1
LOG=reports/release-0.56.8.log
if git tag | grep -qx v0.56.8; then echo "tag exists, not re-running $(date)" >> "$LOG"; exit 0; fi
echo "START $(date)" > "$LOG"
run() { echo "=== $* ===" >> "$LOG"; "$@" >> "$LOG" 2>&1; rc=$?; echo "exit $rc" >> "$LOG"; return $rc; }
run python3 docs/world-biosphere/0.55.2/export.py || { echo "FAILED export" >> "$LOG"; exit 1; }
run git add game docs site RELEASE-USAGE.md CLAUDE-HANDOVER.md HANDOVER-NEXT-CHAT.md CLAUDE.md AGENTS.md CODE-MAP.md CODE-MAP-FUNCTIONS.md scripts/make-code-map.py scripts/extract-module.py scripts/publish-release.py  release-0.56.8.command run-shop-shots.command run-car-shots.command
run git commit -q -m "0.56.8: rename to Chit Chat City and new logo" -m "Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01BK9nDDw9CWZXdgfjUf58e6" || { echo "FAILED commit" >> "$LOG"; exit 1; }
run git rev-parse HEAD
run python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.56.8.md || { echo "FAILED publish" >> "$LOG"; exit 1; }
echo "DONE $(date)" >> "$LOG"
osascript -e 'tell application "Terminal" to close (every window whose name contains "0.56.8")' >/dev/null 2>&1 &

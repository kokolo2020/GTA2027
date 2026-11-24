#!/bin/bash
# Claude launcher: export, commit and publish Harbor City 0.57.0. Logs to reports/release-0.57.0.log
cd /Users/koko/GTA2027 || exit 1
LOG=reports/release-0.57.0.log
if git tag | grep -qx v0.57.0; then echo "tag exists, not re-running $(date)" >> "$LOG"; exit 0; fi
echo "START $(date)" > "$LOG"
printf "livestream/\nprototypes/savanna-elephant/\n" >> .git/info/exclude
run() { echo "=== $* ===" >> "$LOG"; "$@" >> "$LOG" 2>&1; rc=$?; echo "exit $rc" >> "$LOG"; return $rc; }
run python3 docs/world-biosphere/0.55.2/export.py || { echo "FAILED export" >> "$LOG"; exit 1; }
run git add game docs site RELEASE-USAGE.md CLAUDE-HANDOVER.md HANDOVER-NEXT-CHAT.md CLAUDE.md AGENTS.md CODE-MAP.md CODE-MAP-FUNCTIONS.md scripts/make-code-map.py scripts/extract-module.py scripts/publish-release.py  release-0.57.0.command run-chat-shots.command publish-site-fix.command run-cafe-shots.command run-cafe-models.command run-cafe-both.command run-dome-shots.command blender-src/make_cafe.py
run git commit -q -m "0.57.0: Roastery café, lounge, café quests and dome polish" -m "Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01BK9nDDw9CWZXdgfjUf58e6" || { echo "FAILED commit" >> "$LOG"; exit 1; }
run git rev-parse HEAD
run python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.57.0.md || { echo "FAILED publish" >> "$LOG"; exit 1; }
echo "DONE $(date)" >> "$LOG"
osascript -e 'tell application "Terminal" to close (every window whose name contains "0.57.0")' >/dev/null 2>&1 &

#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
LOG=reports/finish-0.56.6.log
echo "START $(date)" > "$LOG"
git add finish-0.56.6.command >> "$LOG" 2>&1
git commit -q -m "0.56.6: release tooling" -m "Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01BK9nDDw9CWZXdgfjUf58e6" >> "$LOG" 2>&1
git status --short >> "$LOG" 2>&1
python3 scripts/publish-release.py builds/Harbor-City-Android-debug.apk --notes docs/releases/v0.56.6.md >> "$LOG" 2>&1
echo "exit $?" >> "$LOG"
echo "DONE $(date)" >> "$LOG"

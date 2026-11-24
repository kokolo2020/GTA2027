#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
LOG=reports/publish-site-fix.log
echo "START $(date)" > "$LOG"
git add site/index.html >> "$LOG" 2>&1
git commit -q -m "Site: Play in browser button first, correct ~60 MB load note" -m "Co-Authored-By: Claude Sonnet 5.5 <noreply@anthropic.com>" -m "Claude-Session: https://claude.ai/code/session_01BK9nDDw9CWZXdgfjUf58e6" >> "$LOG" 2>&1
git push origin main >> "$LOG" 2>&1; echo "push exit $?" >> "$LOG"
echo "DONE $(date)" >> "$LOG"

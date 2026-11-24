#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
LOG=reports/run-0.58.0-c.log
echo "START $(date)" > "$LOG"
python3 docs/world-biosphere/0.55.2/verify.py --focused >> "$LOG" 2>&1
echo "focused exit $?" >> "$LOG"
cp /tmp/wb0552-focused.log reports/focused-0.58.0.log 2>/dev/null
python3 docs/world-biosphere/0.55.2/verify.py >> "$LOG" 2>&1
echo "full exit $?" >> "$LOG"
cp /tmp/wb0552-import.log /tmp/wb0552-smoke.log reports/ 2>/dev/null
grep -n "SCRIPT ERROR\|Parse Error\|Assertion\|failed" /tmp/wb0552-focused.log /tmp/wb0552-smoke.log | tail -15 > reports/full-grep-0.58.0.txt
bash ./run-look-shots.command
echo "DONE $(date)" >> "$LOG"

osascript -e 'tell application "Terminal" to close (every window whose name contains "run-0.58.0-c")' >/dev/null 2>&1 &

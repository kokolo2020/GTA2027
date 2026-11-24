#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
/Applications/Blender.app/Contents/MacOS/Blender --background --factory-startup --python blender-src/make_hedge.py > reports/hedge-models.log 2>&1
echo DONE >> reports/hedge-models.log

osascript -e 'tell application "Terminal" to close (every window whose name contains "run-hedge-models")' >/dev/null 2>&1 &

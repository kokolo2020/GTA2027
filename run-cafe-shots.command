#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
rm -rf reports/cafe-shots; mkdir -p reports/cafe-shots
~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path game --import > reports/cafe-shots/import.txt 2>&1
HC_SHOTS=/Users/koko/GTA2027/reports/cafe-shots ~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --path game --resolution 1280x720 --quit-after 3000 -- --cafe-shots > reports/cafe-shots/log.txt 2>&1
echo ALLDONE >> reports/cafe-shots/log.txt

osascript -e 'tell application "Terminal" to close (every window whose name contains "run-cafe-shots")' >/dev/null 2>&1 &

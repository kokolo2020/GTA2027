#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
rm -rf reports/dome-shots; mkdir -p reports/dome-shots
~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path game --import > reports/dome-shots/import.txt 2>&1
HC_SHOTS=/Users/koko/GTA2027/reports/dome-shots ~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --path game --resolution 1280x720 --quit-after 3000 -- --dome-shots > reports/dome-shots/log.txt 2>&1
echo ALLDONE >> reports/dome-shots/log.txt

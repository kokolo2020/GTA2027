#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
rm -rf reports/car-shots; mkdir -p reports/car-shots
~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path game --import > reports/car-shots/import.txt 2>&1
HC_SHOTS=/Users/koko/GTA2027/reports/car-shots ~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --path game --resolution 1280x720 --quit-after 3000 -- --car-shots > reports/car-shots/log.txt 2>&1
echo ALLDONE >> reports/car-shots/log.txt

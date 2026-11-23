#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
rm -rf reports/shop-shots; mkdir -p reports/shop-shots
~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path game --import > reports/shop-shots/import.txt 2>&1
HC_SHOTS=/Users/koko/GTA2027/reports/shop-shots ~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --path game --resolution 1280x720 --quit-after 3000 -- --shop-shots > reports/shop-shots/log.txt 2>&1
echo ALLDONE >> reports/shop-shots/log.txt

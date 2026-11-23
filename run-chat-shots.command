#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
rm -rf reports/chat-shots; mkdir -p reports/chat-shots
~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --headless --path game --import > reports/chat-shots/import.txt 2>&1
HC_SHOTS=/Users/koko/GTA2027/reports/chat-shots ~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --path game --resolution 1280x720 --quit-after 3000 -- --chat-shots > reports/chat-shots/log.txt 2>&1
echo ALLDONE >> reports/chat-shots/log.txt

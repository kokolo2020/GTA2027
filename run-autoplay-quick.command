#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
rm -rf reports/auto-shots; mkdir -p reports/auto-shots
AUTOPLAY_FAST=1 HC_SHOTS=/Users/koko/GTA2027/reports/auto-shots ~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --path game --resolution 1280x720 --windowed --quit-after 24000 -- --autoplay --autoplay-hours=1 > reports/auto-shots/log.txt 2>&1
echo FINISHED >> reports/auto-shots/log.txt

osascript -e 'tell application "Terminal" to close (every window whose name contains "run-autoplay-quick")' >/dev/null 2>&1 &

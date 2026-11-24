#!/bin/bash
cd /Users/koko/GTA2027 || exit 1
G=~/harbor-city/tools/Godot.app/Contents/MacOS/Godot
rm -f reports/look-shots.done
$G --headless --path game --import > reports/look-import.txt 2>&1
shoot () { # $1 = dir name, $2 = frames, rest = game args
  d="$1"; f="$2"; shift; shift
  rm -rf "reports/$d"; mkdir -p "reports/$d"
  HC_SHOTS=/Users/koko/GTA2027/reports/$d $G --path game --resolution 1280x720 --quit-after $f -- "$@" > "reports/$d/log.txt" 2>&1
  echo ALLDONE >> "reports/$d/log.txt"
}
shoot city-shots 6000 --city-shots
shoot rain-shots 6000 --city-shots --rain
shoot cafe-shots 3000 --cafe-shots
shoot bio-shots 30000 --world-bio-shots
echo FINISHED > reports/look-shots.done

osascript -e 'tell application "Terminal" to close (every window whose name contains "run-look-shots")' >/dev/null 2>&1 &

# Harbor City Stream Mode (0.56.0) - how to run it (for ChatGPT / any helper)

Stream Mode makes the game play itself for 3 hours so it can be livestreamed from the MacBook.
Code: game/autoplay.gd (started from game/main.gd when the launch arg `--autoplay` is present).

## Run it (Mac)
1. Double-click `Play-Harbor-City-Auto.command` in /Users/koko/GTA2027 (runs 3 hours, 1920x1080 windowed).
   Equivalent command:
   `~/harbor-city/tools/Godot.app/Contents/MacOS/Godot --path game --resolution 1920x1080 --windowed -- --autoplay --autoplay-hours=3`
2. Plain game without autoplay: `Play-Harbor-City.command`.
3. In OBS add a "Window Capture" of the Godot window (1920x1080). Do not touch the keyboard or mouse in that window.
4. Stop it: close the Godot window or press Cmd+Q. It stops itself after the hours and shows "Stream mode finished".

If the .command files do not open: `chmod 755 *.command` in the repo folder.

## What it does (loop)
1. Skips the starter crate, goes into a biodome, does that dome's quests (about 4 min).
2. Strolls both boardwalk arms to look at the animals, then leaves the dome.
3. Walks to the World Biosphere sky train station, waits (up to about 2 min), rides 2-4 stops.
4. Gets off, wanders the city and plazas among the crowds (about 5 min per visit).
5. After 3 city visits it moves to the next dome (7 domes in rotation) and repeats.
Screenshots are saved every 15 s only when the HC_SHOTS env var is set (test mode).

## Not done yet
Taxi and other careers (planned as a later phase). Long-run (3 h) stability and Mac FPS are not yet measured.

## Rules for helpers
Do not edit game code without Koko saying so. Release only when Koko says "Release".

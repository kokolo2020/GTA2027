#!/bin/bash
cd "$(dirname "$0")"
bash ./run-cafe-models.command
bash ./run-cafe-shots.command

osascript -e 'tell application "Terminal" to close (every window whose name contains "run-cafe-both")' >/dev/null 2>&1 &

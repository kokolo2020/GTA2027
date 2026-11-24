#!/bin/bash
# Closes every Terminal window that has finished (leaves running ones alone), then its own.
osascript -e 'tell application "Terminal" to close (every window whose busy is false)' >/dev/null 2>&1
osascript -e 'tell application "Terminal" to close (every window whose name contains "close-terminals")' >/dev/null 2>&1 &

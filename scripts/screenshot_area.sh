#!/bin/bash
FILENAME="screenshot_$(date +%F_%T)"
grim -g "$(slurp)" ~/Pictures/Screenshots/$FILENAME.png

notify-send "Screenshot Captured" "Select Area to Crop"

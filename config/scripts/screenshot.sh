#!/bin/bash

FILENAME="screenshot_$(date +%F_%T)"
grim ~/Pictures/Screenshots/$FILENAME.png

dunstify -r 8 "Screenshot Captured" "Fullscreen"

#!/bin/bash

FILENAME="screenshot_$(date +%F_%T)"
grim ~/Pictures/Screenshots/$FILENAME.png

dunstify "Screenshot Captured" "Fullscreen"

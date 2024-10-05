#!/bin/bash

FILENAME="screenshot_$(date +%F_%T)"

AREA=$(slurp)

if [ -n "$AREA" ]; then
	grim -g "$AREA" ~/Pictures/Screenshots/$FILENAME.png

	dunstify "Screenshot Captured" "Screen Area"
fi

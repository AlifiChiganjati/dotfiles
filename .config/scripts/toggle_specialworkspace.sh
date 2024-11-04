#!/bin/bash

# Define your special workspace and the regular workspace
SPECIAL_WORKSPACE="special:magic"
OTHER_WORKSPACE="e~1"

# Get the current active workspace
current_workspace=$(hyprctl monitors | grep "active" | awk '{print $3}')

# Check if we are in the special workspace
if [ "$current_workspace" = "$SPECIAL_WORKSPACE" ]; then
	# Switch to the other workspace
	hyprctl dispatch workspace "$OTHER_WORKSPACE"
else
	# Switch to the special workspace
	hyprctl dispatch workspace "$SPECIAL_WORKSPACE"
fi

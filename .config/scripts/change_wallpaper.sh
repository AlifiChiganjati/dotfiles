#!/bin/bash

DIR=$HOME/Pictures/Wallpapers/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

swww query || swww-daemon

swww img ${DIR}/${RANDOMPICS} --transition-fps 30 --transition-type random --transition-duration 3

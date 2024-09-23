#!/bin/bash

DIR=$HOME/Pictures/Wallpapers/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

if [[ $(pidof swaybg) ]]; then
	pkill swaybg
fi

swww query || swww-daemon

#change-wallpaper using swww
swww img ${DIR}/${RANDOMPICS} --transition-fps 30 --transition-type random --transition-duration 3

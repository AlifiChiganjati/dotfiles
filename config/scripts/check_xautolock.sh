#!/bin/bash

apps=("firefox" "vlc" "libreoffice")
xautolock_status=false

while true; do
	running=false

	for app in "${apps[@]}"; do
		if pgrep -x "$app" >/dev/null; then
			running=true
			break
		fi
	done

	if $running; then
		if ! $xautolock_status; then
			xautolock -disable
			xautolock_status=true
		fi
	else
		if $xautolock_status; then
			xautolock -enable
			xautolock_status=false
		fi
	fi

	sleep 2
done

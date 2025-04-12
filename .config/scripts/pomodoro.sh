#!/bin/bash

while true; do
	# Periksa apakah file /tmp/pomodoro.json ada
	if [[ ! -f /tmp/pomodoro.json ]]; then
		dunstify -u normal -t 3000 "Pomodoro Selesai" "Pomodoro telah berakhir!"
		exit 0
	fi

	# Baca file hanya jika ada
	STATUS=$(jq -r '.Status' /tmp/pomodoro.json 2>/dev/null)
	TIME=$(jq -r '.Time' /tmp/pomodoro.json 2>/dev/null)
	CYCLE=$(jq -r '.Cycle' /tmp/pomodoro.json 2>/dev/null)

	# Jika nilai kosong (karena file tidak ada setelah dicek), hentikan skrip
	if [[ -z "$STATUS" || -z "$TIME" || -z "$CYCLE" ]]; then
		dunstify -u normal -t 3000 "Pomodoro Selesai" "Pomodoro telah berakhir!"
		exit 0
	fi

	# Jika status adalah "Finished", keluar dari loop
	if [[ "$STATUS" == "Done" ]]; then
		dunstify -u normal -t 3000 "Pomodoro Selesai" "Pomodoro telah berakhir!"
		exit 0
	fi

	# Kirim notifikasi pembaruan
	dunstify -u normal -t 3000 "Pomodoro Status" "Status: $STATUS\nTime Left: $TIME\nCycle: $CYCLE"

	# Tunggu 10 detik sebelum mengirimkan pembaruan berikutnya
	sleep 10
done

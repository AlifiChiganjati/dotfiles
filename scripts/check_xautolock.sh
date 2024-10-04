#!/bin/bash

# Daftar aplikasi yang ingin diperiksa
apps=("firefox" "vlc" "libreoffice") # Tambahkan aplikasi lain sesuai kebutuhan

# Variabel untuk menyimpan status xautolock
xautolock_status=false

while true; do
	running=false

	# Periksa setiap aplikasi dalam daftar
	for app in "${apps[@]}"; do
		if pgrep -x "$app" >/dev/null; then
			running=true
			break # Jika salah satu aplikasi berjalan, keluar dari loop
		fi
	done

	echo "Running status: $running"

	# Nonaktifkan atau aktifkan xautolock berdasarkan status aplikasi
	if $running; then
		if ! $xautolock_status; then
			echo "Disabling xautolock"
			xautolock -disable
			xautolock_status=true
		fi
	else
		if $xautolock_status; then
			echo "Enabling xautolock"
			xautolock -enable
			xautolock_status=false
		fi
	fi

	sleep 2 # Cek setiap 2 detik
done

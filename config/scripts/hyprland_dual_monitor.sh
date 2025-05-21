#!/bin/sh

# Fungsi untuk memindahkan workspace ke monitor tertentu
assign_workspaces() {
	local monitor=$1
	local start=$2
	local end=$3
	for ws in $(seq $start $end); do
		hyprctl keyword workspace "$ws,monitor:$monitor"
	done
}

# Fungsi utama untuk konfigurasi monitor
configure_monitors() {
	# Atur monitor HDMI-A-1 jika terdeteksi
	if hyprctl monitors | grep -q "HDMI-A-1"; then

		# Atur monitor eksternal HDMI-A-1 terlebih dahulu
		hyprctl keyword monitor "HDMI-A-1,preferred,auto,auto"

		# Tunggu agar konfigurasi selesai
		sleep 0.5

		# Atur monitor eDP-1 (laptop)
		# hyprctl keyword monitor "eDP-1,preferred,auto,auto"
		hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1"

		# Tunggu kembali agar konfigurasi selesai
		sleep 0.5

		# Pastikan workspace 1-5 berada di eDP-1
		assign_workspaces "eDP-1" 1 5

		# Pastikan workspace 6-10 berada di HDMI-A-1
		assign_workspaces "HDMI-A-1" 6 10

	else

		# Atur monitor eDP-1 sebagai satu-satunya monitor
		hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1"

		# Pastikan semua workspace ada di eDP-1
		assign_workspaces "eDP-1" 1 10

	fi
}

# Jalankan konfigurasi monitor
configure_monitors

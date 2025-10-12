#!/usr/bin/env bash

# Tunggu sedikit supaya sesi Hyprland benar-benar siap
sleep 1

# Matikan semua portal lama
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal-gtk
killall xdg-desktop-portal

# Jalankan ulang portal Hyprland
/usr/libexec/xdg-desktop-portal-hyprland &

# Tunggu agar Hyprland portal siap sebelum start portal GTK
sleep 2

# Jalankan portal GTK
/usr/libexec/xdg-desktop-portal-gtk &

# Tunggu sedikit sebelum menjalankan portal utama
sleep 2

# Jalankan portal utama
/usr/libexec/xdg-desktop-portal &

#!/bin/sh

# Fungsi: Ambil tema kursor dari index.theme
get_cursor_theme() {
  awk -F '=' '/Inherits/ {print $2}' ~/.icons/default/index.theme 2>/dev/null | tr -d '[:space:]'
}

# Fungsi: Ambil ukuran kursor dari settings.ini
get_cursor_size() {
  awk -F '=' '/gtk-cursor-theme-size/ {print $2}' ~/.config/gtk-3.0/settings.ini 2>/dev/null | tr -d '[:space:]'
}

# Fungsi: Update baris env di Hyprland conf
update_env_conf() {
  KEY=$1
  VALUE=$2
  FILE=$3

  if grep -q "^env = $KEY," "$FILE" 2>/dev/null; then
    sed -i "s|^env = $KEY,.*|env = $KEY,$VALUE|" "$FILE"
  else
    echo "env = $KEY,$VALUE" >>"$FILE"
  fi
}

# Fungsi utama untuk update cursor
update_cursor_settings() {
  CURSOR_THEME=$(get_cursor_theme)
  CURSOR_SIZE=$(get_cursor_size)

  [ -z "$CURSOR_THEME" ] && CURSOR_THEME="default"
  [ -z "$CURSOR_SIZE" ] && CURSOR_SIZE=24

  echo "Cursor Theme: $CURSOR_THEME"
  echo "Cursor Size : $CURSOR_SIZE"

  export XCURSOR_THEME="$CURSOR_THEME"
  export XCURSOR_SIZE="$CURSOR_SIZE"

  HYPRCONF="$HOME/.config/hypr/conf/env/env.conf"
  if [ -f "$HYPRCONF" ]; then
    update_env_conf "XCURSOR_THEME" "$CURSOR_THEME" "$HYPRCONF"
    update_env_conf "XCURSOR_SIZE" "$CURSOR_SIZE" "$HYPRCONF"
  fi
}

# Jalankan sekali saat awal
update_cursor_settings

# 🔁 Pantau perubahan dan jalankan ulang update
while inotifywait -e modify ~/.icons/default/index.theme ~/.config/gtk-3.0/settings.ini >/dev/null 2>&1; do
  update_cursor_settings
done

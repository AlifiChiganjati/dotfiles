#!/bin/sh

echo "Install all packages..."

# Tentukan perintah privilege escalation yang tersedia
if command -v doas >/dev/null 2>&1; then
    SUDO="doas"
elif command -v sudo >/dev/null 2>&1; then
    SUDO="sudo"
else
    # fallback pakai su -c
    SUDO="su -c"
fi

# List paket yang ingin diinstall
PACKAGES="xorg-minimal dunst libnotify eza cmatrix ranger bspwm sxhkd fastfetch htop kitty picom polybar rofi neovim xclip arandr slurp scrot starship xautolock betterlockscreen brightnessctl numlockx feh libreoffice xsetroot speech-dispatcher python3-Pillow grim xsel clipman xhost xauth wl-clipboard"

# Jalankan perintah install dengan privilege escalation yang sesuai
if [ "$SUDO" = "su -c" ]; then
    # su -c memerlukan satu argumen string sebagai perintah
    $SUDO "xbps-install -Sy $PACKAGES"
else
    $SUDO xbps-install -Sy $PACKAGES
fi

# Set konfigurasi symlink seperti sebelumnya
CONFIG="$HOME/.config"
DOTFILES="$HOME/dotfiles/config"

echo "🔍 Memeriksa dan membuat symlink konfigurasi..."

ITEMS="bashrc bspwm dunst fastfetch htop hypr kitty nvim picom polybar ranger rofi scripts starship.toml sxhkd"

for ITEM in $ITEMS; do
    TARGET="$CONFIG/$ITEM"
    SOURCE="$DOTFILES/$ITEM"

    if [ ! -e "$SOURCE" ]; then
        echo "❌ Sumber tidak ditemukan: $SOURCE"
        continue
    fi

    if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
        echo "⏩ Lewati, sudah ada: $TARGET"
    else
        ln -s "$SOURCE" "$TARGET"
        echo "✅ Symlink dibuat: $TARGET → $SOURCE"
    fi
done


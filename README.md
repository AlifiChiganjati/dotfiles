# This My Daily Driver

I've been using various configurations from GitHub and GitLab users.

# Get Arch Repo

Using the [Arch repo](https://wiki.artixlinux.org/Main/Repositories)

# Get Aur Helper

- Using [Paru](https://aur.archlinux.org/packages/paru-bin) or [Yay](https://aur.archlinux.org/packages/yay-bin)

# Clone My repository

Clone my repo:

```bash
 git clone https://github.com/AlifiChiganjati/setupArtixLinux

 cd setupArtixLinux
```

change /etc/issue with login/issue:

```bash
sudo mv /etc/issue /etc/issue.bak

sudo mv login/issue /etc/issue
```

move all configs:

```bash
mv .config/* ~/.config/
```

copy .bashrc:

```bash
cp .bashrc ~/.bashrc
```

add start on tty:

```bash
cp start ~/
```

# Install Packages

## Artix/Arch Linux

```bash
yay -S xorg xorg-xinit dunst libnotify eza cmatrix ranger bspwm sxhkd fastfetch htop kitty picom polybar rofi neovim xclip arandr slurp grim scrot starship xautolock betterlockscreen brightnessctl numlockx feh firefox-bin libreoffice hyprland wayland hyprlock hyprpaper hyprpicker hypridle wl-clipboard python-pillow swww xsel clipman polkit-gnome
```

## Void linux

```bash
sudo xbps-install -S xorg-minimal dunst libnotify eza cmatrix ranger bspwm sxhkd fastfetch htop kitty picom polybar rofi neovim xclip arandr slurp scrot starship xautolock betterlockscreen brightnessctl numlockx feh libreoffice xsetroot speech-dispatcher python3-Pillow grim xsel clipman xhost xauth wl-clipboard
```

# Inspirations

The configs have inspired me:

- https://github.com/th1nhhdk
- https://gitlab.com/stephan-raabe

and many more...

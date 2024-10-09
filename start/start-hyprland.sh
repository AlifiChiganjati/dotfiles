!#/bin/sh

if test -z "${XDG_RUNTIME_DIR}"; then
	export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
	if ! test -d "${XDG_RUNTIME_DIR}"; then
		mkdir "${XDG_RUNTIME_DIR}"
		chmod 0700 "${XDG_RUNTIME_DIR}"
	fi
fi

# export WLR_RENDERER_ALLOW_SOFTWARE=1
export QT_QPA_PLATFORM=wayland-egl
export ELM_DISPLAY=wl
export SDL_VIDEODRIVER=wayland
export MOZ_ENABLE_WAYLAND=1

dbus-run-session Hyprland

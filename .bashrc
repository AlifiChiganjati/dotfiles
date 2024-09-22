#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '
export EDITOR='nvim'
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
export DISPLAY=:0.0

# -----------------------------------------------------
#  EZA
# -----------------------------------------------------

alias ls="eza --all --binary --icons"
alias ll="eza --all --icons --binary --group --header --group-directories-first --long --git"
alias lt="eza --all --binary --icons --group --header --group-directories-first --tree --level"

# -----------------------------------------------------
# GIT
# -----------------------------------------------------

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gd="git diff --cached"
alias grh="git reset --hard HEAD"
alias gb="git branch -vv"
alias gf="git fetch --all"
alias gcredential="git config credential.helper store"
#alias gl="git log --all --decorate --oneline --graph"
alias gl="git log --graph --abbrev-commit --decorate --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n'' %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'"

gnew() {
	git checkout -b "$1"
	git push -u origin "$1"
}
# Usage: gnew branch_name

gquick() {
	git commit -am "$1"
	git push
}
# Usage: gquick "commit message"

grebase() {
	git fetch
	git rebase origin/main
}
# Usage: grebase

gsquash() {
	git reset --soft HEAD~"$1"
	git commit --amend
}
# Usage: gsquash 3 (to squash the last 3 commits)

gupdate-fork() {
	git fetch upstream
	git checkout main
	git merge upstream/main
	git push origin main
}
# Usage: gupdate-fork

grebasei() {
	git rebase -i HEAD~"$1"
}
# Usage: grebasei 3 (to interactively rebase the last 3 commits)

gresetremote() {
	git fetch origin
	git reset --hard origin/"$(git rev-parse --abbrev-ref HEAD)"
}
# Usage: gresetremote

# -----------------------------------------------------
# General
# -----------------------------------------------------

alias Dbeaver="GDK_BACKEND=x11 dbeaver"
alias Robo3t="GDK_BACKEND=x11 robo3t"

# -----------------------------------------------------
# AUTOSTART
# -----------------------------------------------------

eval "$(starship init bash)"

# -----------------------------------------------------
# LOGIN
# -----------------------------------------------------

if [[ $(tty) == *"pts"* ]]; then
	cmatrix
	fastfetch
else
	echo
	if [ -f /bin/hyprctl ]; then
		echo "Start Hyprland with command Hyprland"
	fi
	if [ -f /home/chigan/.xinitrc ]; then
		echo "Start BSPWM X11 with command startx"
	fi
fi

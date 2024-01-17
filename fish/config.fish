if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting ""
    set theme_nerd_fonts yes
    set -g fish_prompt_font "FiraCode Nerd Font Mono"
    set WAYLAND_DEBUG 1# bun
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH $BUN_INSTALL/bin $PATH
    alias graph="git log --all --decorate --oneline --graph"

    #Qtile
    alias Qtile='startx'
    alias QtileWayland='qtile start -b wayland'

    #Git 
    alias gs="git status"
    alias ga="git add"
    alias gc="git commit -m"
    alias gp="git push"
    alias gpl="git pull"
    alias gst="git stash"
    alias gsp="git stash; git pull"
    alias gcheck="git checkout"

    # SCRIPTS

    alias gr='python ~/dotfiles/scripts/growthrate.py'
    alias ChatGPT='python ~/mychatgpt/mychatgpt.py'
    alias chat='python ~/mychatgpt/mychatgpt.py'
    alias ascii='~/dotfiles/scripts/figlet.sh'

    #grub update
    alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

    starship init fish | source
    cat ~/.cache/wal/sequences
    cmatrix
    neofetch
end

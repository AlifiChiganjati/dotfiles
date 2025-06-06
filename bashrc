#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#
# -----------------------------------------------------

# DON'T CHANGE THIS FILE

# You can define your custom configuration by adding
# files in ~/.config/bashrc
# or by creating a folder ~/.config/zshrc/custom
# with copies of files from ~/.config/zshrc
# -----------------------------------------------------

for f in ~/.config/bashrc/*; do
  if [ ! -d $f ]; then
    c=$(echo $f | sed -e "s=.config/bashrc=.config/bashrc/custom=")
    [[ -f $c ]] && source $c || source $f
  fi
done


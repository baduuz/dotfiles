export TERMINAL=alacritty
export EDITOR=nvim
export BROWSER=brave

export PATH="$PATH:$HOME/.local/share/scripts"

if [[ "$(tty)" = "/dev/tty1" ]];then
    pgrep awesome || startx
fi

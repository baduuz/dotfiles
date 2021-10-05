export TERMINAL=kitty
export EDITOR=nvim
export BROWSER=firefox

export PATH="$PATH:$HOME/.local/share/scripts:$HOME/.local/bin"

if [[ "$(tty)" = "/dev/tty1" ]];then
    pgrep awesome || startx
fi

typeset -U PATH path

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export ZDOTDIR=$HOME/.config/zsh

export TERMINAL=kitty
export EDITOR=nvim
export BROWSER=firefox

export PATH="$PATH:$HOME/.local/share/scripts:$HOME/.local/bin"

if [[ "$(tty)" = "/dev/tty1" ]];then
    pgrep awesome || startx
fi

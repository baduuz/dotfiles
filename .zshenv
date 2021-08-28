typeset -U PATH path

export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

export ZDOTDIR=$HOME/.config/zsh

export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export TS3_CONFIG_DIR="$XDG_CONFIG_HOME/ts3client"
export CARGO_HOME="$XDG_DATA_HOME"/cargo

#zprofile
export TERMINAL=alacritty
export EDITOR=nvim
export BROWSER=brave

export PATH="$PATH:$HOME/.local/share/scripts:$HOME/.local/bin"
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

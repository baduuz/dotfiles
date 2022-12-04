export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

export LESSHISTFILE=-
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export QT_QPA_PLATFORMTHEME=qt5ct
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export ZDOTDIR=$HOME/.config/zsh
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export CARGO_HOME="$XDG_CACHE_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export KDEHOME="$XDG_CONFIG_HOME"/kde
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config
export XCURSOR_PATH=/usr/share/icons:${XDG_DATA_HOME}/icons
export ELINKS_CONFDIR="$XDG_CONFIG_HOME"/elinks


export TERMINAL=st
export EDITOR=nvim
export BROWSER=firefox

export PATH="$PATH:$HOME/.local/share/scripts:$HOME/.local/bin"

if [[ "$(tty)" = "/dev/tty1" ]];then
    pgrep awesome || startx
fi

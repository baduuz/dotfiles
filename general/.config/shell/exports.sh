#!/bin/sh

# Pretty man pages
export LESS_TERMCAP_mb='\e[01;32m'       # begin blinking
export LESS_TERMCAP_md='\e[01;31m'       # begin bold
export LESS_TERMCAP_me='\e[0m'           # end all mode like so, us, mb, md, mr
export LESS_TERMCAP_se='\e[0m'           # end standout-mode
export LESS_TERMCAP_so='\e[47;90m'       # start standout mode
export LESS_TERMCAP_ue='\e[0m'           # end underline
export LESS_TERMCAP_us='\e[4;93m'        # start underlining

# Default programs
export TERMINAL=alacritty
export EDITOR=nvim
export BROWSER=brave

# Path
export PATH="$PATH:$HOME/.local/scripts:$HOME/.local/bin"

autoload -U colors && colors

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)


HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$XDG_CACHE_HOME"/zsh/history

export LESS_TERMCAP_mb=$'\e[01;32m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;31m'       # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end all mode like so, us, mb, md, mr
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[47;90m'       # start standout mode
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[4;93m'        # start underlining

setopt vi

bindkey "${terminfo[kdch1]}" delete-char
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

case $TERM in st*)
	precmd () {print -Pn "\e]0;%~\a"}
esac

function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ll="ls -Ahl"
alias v=nvim
alias c=clear
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias ssh="TERM=xterm ssh"

PROMPT='%F{blue}%1~ %(?.%F{green}.%F{red})λ %f'
PROMPT2='%F{yellow}❯ %f'

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

autoload -U promptinit; promptinit

autoload -U colors && colors

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)


prompt spaceship
SPACESHIP_PROMPT_ORDER=(
    dir
    git
    char
    )
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL=λ
SPACESHIP_CHAR_SYMBOL_SECONDARY="❯ "
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_DIR_TRUNC=1

HISTSIZE=1000
SAVEHIST=1000
HISTFILE="$XDG_CACHE_HOME"/zsh/history

setopt vi
setopt autocd

alias rm="rm -i"
alias frm="rm -f"
alias mv="mv -i"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -Al"
alias v=nvim
alias dotfiles="git --git-dir=$HOME/dotfiles --work-tree=$HOME"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Don't do anything else if not interactive
[[ $- != *i* ]] && return

# Completions
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Bindings
bindkey -v # Vi mode
export KEYTIMEOUT=5 # don't take as long to switch to vi mode
bindkey -M menuselect 'h' vi-backward-char # use vim binds in completion menu
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
autoload edit-command-line; zle -N edit-command-line # edit current command in vim
bindkey '^e' edit-command-line
bindkey -M vicmd "^e" edit-command-line

# looks and prompt
preexec()  { printf '\e[1 q' } # block cursor
autoload -U colors && colors
autoload -Uz vcs_info # Git integration
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'

setopt PROMPT_SUBST
PROMPT='%F{blue}%~%F{yellow}${vcs_info_msg_0_}%(?.%F{green}.%F{red}) $ %f'
PROMPT2='%F{yellow}> %f'

[ -e "$XDG_CONFIG_HOME/shell/aliases" ] && source "$XDG_CONFIG_HOME/shell/aliases"
[ -e "$XDG_CONFIG_HOME/shell/exports" ] && source "$XDG_CONFIG_HOME/shell/exports"

if [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ];then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh  2>/dev/null
fi
command -v 'fzf' >/dev/null  && eval "$(fzf --zsh)"
eval $(opam env)

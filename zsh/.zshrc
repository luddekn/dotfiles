zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
autoload -U vcs_info

# Cmp opts
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33
zstyle ':completion:*' squeeze-slashes false

# VCS opts
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{#d8647e}⏹ '
zstyle ':vcs_info:*' stagedstr '%F{#7fa563}⏹ '
zstyle ':vcs_info:git:*' formats       '%b %u%c'
zstyle ':vcs_info:git:*' actionformats '%b|%a%u%c'

# Main opts
setopt append_history inc_append_history share_history extended_history
setopt auto_menu menu_complete
setopt autocd
setopt auto_param_slash
setopt no_case_glob no_case_match
setopt globdots
setopt extended_glob
setopt interactive_comments
setopt prompt_subst

# History opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$HOME/.zsh_history"
HISTTIMEFORMAT="%s"

# Binds
bindkey "^h" beginning-of-line
bindkey "^l" end-of-line
bindkey "^d" kill-line
bindkey "^b" backward-word
bindkey "^w" forward-word
bindkey "^D" backward-kill-word
# ctrl J & K for going up and down for previous commands
bindkey "^J" history-search-forward
bindkey "^K" history-search-backward

# ZSH Prompt 
# %K is background %F is foreground
precmd() {
    vcs_info
    NEWLINE=$'\n'
    # Prompt is different if we are in a git directory
    if [[ -n $vcs_info_msg_0_ ]]; then
        PROMPT='${NEWLINE}%B%K{#cdcdcd}%F{#141415} %~ %K{#252530}%F{#f3be7c} ${vcs_info_msg_0_}%f%k%b '
    else
        PROMPT='${NEWLINE}%B%K{#cdcdcd}%F{#141415} %~ %f%k%b '
    fi    
}

# Autosuggestions
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh_profile

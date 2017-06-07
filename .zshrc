precmd() {
  PROMPT=$'\n%# '
  RPROMPT="%~ ${KEYMAP}"
}

autoload -Uz compinit && compinit

# Configure completion
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_functions
setopt hist_reduce_blanks
setopt no_share_history

# Start with Vim keybindings (insert mode)
bindkey -v

export EDITOR='vi'
export KEYTIMEOUT=1 # In zsh, switch between normal and insert mode in 0.1s

alias grep='grep --color=auto'
alias ls='ls --classify --color=auto --human-readable'

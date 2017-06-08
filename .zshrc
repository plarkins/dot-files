precmd() {
  PROMPT=$'\n%# '
  RPROMPT="%~ ${KEYMAP}"
}

autoload -Uz compinit && compinit

# Configure completion
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# Completion options
setopt glob_complete
setopt list_packed

# Directory options
setopt auto_cd

# History options
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_no_functions
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt no_share_history

# I/O options
setopt correct
setopt correct_all
setopt interactive_comments
setopt print_exit_value

# Start with Vim keybindings (insert mode)
bindkey -v

export EDITOR='vi'
export KEYTIMEOUT=1 # In zsh, switch between normal and insert mode in 0.1s

alias grep='grep --color=auto'
alias ls='ls --classify --color=auto --human-readable'

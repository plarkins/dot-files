precmd() {
  vcs_info
}

vim_mode() {
  if [[ "${KEYMAP}" == "main" || "${KEYMAP}" == "viins" ]]; then
    echo "${bg[blue]}INSERT${reset_color}"
  elif [[ "${KEYMAP}" == "vicmd" ]]; then
    echo "${bg[yellow]}NORMAL${reset_color}"
  fi
}

#function zle-line-init zle-keymap-select {
#  zle .reset-prompt
#}

autoload -Uz colors && colors
autoload -Uz compinit && compinit
autoload -Uz tetriscurses && alias tetris=tetriscurses
autoload -Uz vcs_info
#autoload -Uz zstyle+
# run-help?

# Configure completion
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"

# Configure version control info
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git hg p4

# Configure ZLE
#zle -N zle-line-init
#zle -N zle-keymap-select

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

# Prompt options
setopt prompt_subst
setopt transient_rprompt
export PROMPT=$'\n%# '
export RPROMPT='%~ ${vcs_info_msg_0_} $(vim_mode)'

# Start with Vim keybindings (insert mode)
bindkey -v

export EDITOR='vi'
export KEYTIMEOUT=1 # In zsh, switch between normal and insert mode in 0.1s

alias grep='grep --color=auto'
alias ls='ls --classify --color=auto --human-readable'

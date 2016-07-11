autoload -Uz edit-command-line
bindkey -v
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^F' history-incremental-pattern-search-forward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^K' up-history
bindkey '^J' down-history

# use cursor as indicator of vi mode
zle-keymap-select () {
  if [ $KEYMAP = vicmd ]; then
    if [[ $TMUX = '' ]]; then
      echo -ne "\033]12;Red\007"
    else
      printf '\033Ptmux;\033\033]12;red\007\033\\'
    fi
  else
    if [[ $TMUX = '' ]]; then
      echo -ne "\033]12;Grey\007"
    else
      printf '\033Ptmux;\033\033]12;grey\007\033\\'
    fi
  fi
}
zle-line-init () {
  zle -K viins
  echo -ne "\033]12;Grey\007"
}
zle -N zle-keymap-select
zle -N zle-line-init

# 10 ms timeout instead of the default 400
export KEYTIMEOUT=1



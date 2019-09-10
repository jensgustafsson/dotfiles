set nocompatible

:set term=screen-256color


setopt AUTO_CD # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there

setopt ALWAYS_TO_END # When completing from the middle of a word, move the cursor to the end of the word
unsetopt MENU_COMPLETE # do not autoselect the first completion entry
setopt AUTO_MENU # show completion menu on successive tab press. needs unsetop menu_complete to work
setopt COMPLETE_IN_WORD # Allow completion from within a word/phrase
setopt LIST_PACKED # Print the matches in columns with different widths.
setopt LIST_TYPES # Show the type of each file with a trailing identifying mark.
setopt CORRECT # spelling correction for commands

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' hosts off
zstyle ':completion:*:git:*' tag-order 'common-commands'

export EDITOR=vim

# History settings
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
setopt EXTENDED_HISTORY # save timestamp of command and duration
setopt INC_APPEND_HISTORY # Add commands as they are typed, don't wait until shell exit
setopt HIST_EXPIRE_DUPS_FIRST # when trimming history, lose oldest duplicates first
setopt HIST_IGNORE_DUPS # Do not write events to history that are duplicates of previous events
setopt HIST_FIND_NO_DUPS # When searching history don't display results already cycled through twice
setopt HIST_VERIFY # don't execute, just expand history

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
## Set layout (Default is fullscreen)
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
## Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git --type f'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias rlz="source ~/.zshrc"
alias dc=docker-compose
alias d=docker

if [[ "$(uname)" =~ Linux ]]; then
    alias open=xdg-open
fi

if [[ -r ~/.zsh/functions.zsh ]]; then
    . ~/.zsh/functions.zsh
fi

if [[ -r ~/.zsh/tmux.zsh ]]; then
    . ~/.zsh/tmux.zsh
fi

if [[ -r ~/.zsh/nt_specific.zsh ]]; then
    . ~/.zsh/nt_specific.zsh
fi

if [[ -r ~/.zsh/help.zsh ]]; then
    . ~/.zsh/help.zsh
fi

if [[ -r ~/.work_commands.zsh ]]; then
    . ~/.work_commands.zsh
fi

if [[ -r ~/.work_secret_commands.zsh ]]; then
    . ~/.work_secret_commands.zsh
fi

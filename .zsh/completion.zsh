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


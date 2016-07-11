HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

setopt EXTENDED_HISTORY # save timestamp of command and duration
setopt INC_APPEND_HISTORY # Add commands as they are typed, don't wait until shell exit
setopt HIST_EXPIRE_DUPS_FIRST # when trimming history, lose oldest duplicates first
setopt HIST_IGNORE_DUPS # Do not write events to history that are duplicates of previous events
setopt HIST_FIND_NO_DUPS # When searching history don't display results already cycled through twice
setopt HIST_VERIFY # don't execute, just expand history

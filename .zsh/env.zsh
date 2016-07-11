export TERM=xterm-256color
export CLICOLOR=1

export LESS='--quit-if-one-screen --no-init --ignore-case --chop-long-lines --raw-control-chars'
export PAGER='less'

export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export EDITOR=vim

if [[ $(uname) =~ linux ]]; then
  export IS_LINUX=0
fi

if [[ $(uname) =~ darwin ]]; then
  export IS_MAC=0
fi

if [[ $(uname) =~ CYGWIN_NT ]]; then
  export IS_CYGWIN=0
fi

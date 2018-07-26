alias python=python3
alias pip=pip3
alias rlz="source ~/.zshrc"

alias grep='grep --color'
alias grep_py='grep --include="*.py" -irn'
alias grep_js='grep --include="*.js" -irn'
alias grep_row='grep -irn'
alias gr=grep_row
alias gp=grep_py
alias gjs=grep_js

alias ll='ls -l'

alias finddir='find . -type d -name'
alias findfile='find . -type f -name'

alias gbw='gulp build && gulp watch --no-specs'
alias gt='gulp test'
alias gtw='gulp test:ui:watch'
alias activate_gulp='source ./tools/vendor/nodejs/activate'

alias ipy='$VIRTUAL_ENV/bin/ipython'

alias dc=docker-compose
alias d=docker
alias dexec="docker exec -it"


if [[ "$(uname)" =~ Linux ]]; then
    alias open=xdg-open
fi

alias nvmlime='nvm use 6.2.0'

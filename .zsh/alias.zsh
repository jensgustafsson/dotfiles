alias rlz="source ~/.zshrc"
alias grep='grep --color'
alias grep_py='grep --include="*.py" -irn'
alias grep_js='grep --include="*.js" -irn'
alias grep_row='grep -irn'
alias gr=grep_row
alias gp=grep_py
alias gjs=grep_js
alias lsdir="ls --almost-all -d */ | sed 's:/*$::'"
alias ls='ls -hF --color=tty'
alias ll='ls -l --color=tty'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias rm_vim_swp='find ./ -type f -name "\.*sw[klmnop]" -delete'
alias hg='history | grep'
alias gitprune='git branch --merged | grep -v "\*" | grep -v master | xargs -n 1 git branch -d'
alias lisa='winpty.exe /cygdrive/c/src/limeworld/serveradmin/Server/Lundalogik.Lisa.Service.ConsoleHost/bin/Debug/LisaConsole.exe'
alias gbw='gulp build && gulp watch --no-specs'
alias gt='gulp test'
alias gtw='gulp test:ui:watch'
alias activate_gulp='source ./tools/vendor/nodejs/activate'

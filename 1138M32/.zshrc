autoload -Uz compinit

autoload -U colors && colors

export VAGRANT_DETECTED_OS="$(uname)"
export PATH=$PATH:$HOME/bin:/usr/bin/:/usr/lib/python3.4/site-packages

alias grep='grep --color'
alias ls='ls -hF --color=tty'
alias ll='ls -l --color=tty'
alias open='cygstart'
alias mynet='netstat -a -n -o'
alias sudo='cygstart --action=runas'
alias cmd='cygstart --action=runas start_cmd.bat'
alias ipy='console.exe ipython3'
alias killall='taskkill /F /T /IM'
alias wkill='taskkill /F /pid'
alias gcbw="gulp clean --color && gulp build --color && gulp watch --color"
alias rlz="source ~/.zshrc"
alias lsdir="ls --almost-all -d */ | sed 's:/*$::'"
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias grep_py='grep --include="*.py" -irn'
alias grep_js='grep --include="*.js" -irn'
alias grep_row='grep -irn'
alias gr=grep_row
alias gp=grep_py
alias gjs=grep_js
alias pip_rm_all='pip freeze | grep -v "^-e" | xargs pip uninstall -y'
alias rednose='console.exe nosetests --rednose --force-color'

export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8" 


source ~/.bash/git-completion.bash

#
# Check if we have an active python.
#
function is_python_active() {
    if [[ $(type -w deactivate) == "deactivate: function" ]]; then
        return 0
    fi

    return 1
}

function __reachable_python_activate_script() {
    local curr_dir=$1
    [ -z $1 ] && curr_dir=.

    local probe

    # unix style activation available?
    probe="$curr_dir/venv/bin/activate"
    if [ -f $probe ]; then
        echo $probe
        return 0
    fi

    # windows style activation available?
    probe="$curr_dir/venv/Scripts/activate"
    if [ -f $probe ]; then
        echo $probe
        return 0
    fi
}

function activate_python() {
    local new_dir=$1
    [ -z $1 ] && new_dir=.

    local activate_script=`__reachable_python_activate_script $new_dir`

    if [ -z $activate_script ]; then
        return 1
    fi

    if is_python_active; then
        deactivate
        unset deactivate
    fi

    export VIRTUAL_ENV_DISABLE_PROMPT='1'
    source ${activate_script}
}

#
# Function for recursively find a venv in parent dirs and activate it
#
function av() {
    local start_path=`pwd`  # Remember where we started so we can reset

    while [ "`pwd`" != "/" ];
    do
        local activate_script=`__reachable_python_activate_script`
        if [ -n "$activate_script" ]; then
            activate_python
            local found_venv=1
            break
        fi
        cd ..
    done

    if [ -z "$found_venv" ]; then
        echo "Could not find a python to activate!"
    fi

    cd $start_path  # Reset cwd to where we started.
}
# }}}

# {{{ Customized prompt
setopt PROMPT_SUBST

function venv_prompt_info() {
    if is_python_active; then
        echo "%{$fg_bold[yellow]%}🐍%{$reset_color%}"
    fi
}

# {{{ Git status functions
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}✗%{$fg[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# get the name of the branch we are on
function git_prompt_info() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
function parse_git_dirty() {
    local STATUS=''
    local FLAGS
    FLAGS=('--porcelain')

    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
        FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
        FLAGS+='--untracked-files=no'
    fi

    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)

    if [ -n $STATUS ]; then
        echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
    else
        echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
}
# }}}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local curr_time="%{$fg[green]%}%*"
local curr_dir="%{$reset_color%}%~"
local git_branch='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'
local venv_info='$(venv_prompt_info)'

export PROMPT="%{$fg[blue]%}╭── ${curr_time} ${curr_dir} ${git_branch} ${venv_info}
%{$fg[blue]%}╰─%{$reset_color%}$ "
export RPS1="${return_code}"


# }}}

reverse_find_dir() {
    dir=$1
    wd=$(pwd)
    while [ $PWD != '/' ]; do
        if [ -d $dir ]; then
            local found_dir=1
            break
        fi
        cd ..
    done

    if [ -n "$found_dir" ]; then
        cd $PWD
        return 0
    else
        cd $wd
        return 1
    fi
}

cdg() {
    prev_wd=$(pwd)
    reverse_find_dir ".git"
}

cdb() {
    if [ -n $prev_wd ]; then
        cd $prev_wd
        prev_wd=$(pwd)
        return 0
    else
        return 1
    fi
}

PRO_HOME_FOLDER='/home/jeg/development/lundalogik/pro/'

cdp() {
	PROJECT=$1
    PROJECT_DIR=$PRO_HOME_FOLDER$PROJECT
	cd $PROJECT_DIR
}

tmx_window_exist() {
    local PROJECT_NAME=$1
    local SESSION_NAME=$2
    tmux list-windows -t $SESSION_NAME | grep "^[[:digit:]]\+: $PROJECT_NAME" &> /dev/null
    if [ $? != 0 ]; then
        return 1   
    else
        return 0
    fi
}


tmxa() {
    local SESSION_NAME=$1
    local PROJECT_NAME=$2
    local PROJECT_PATH=$3
    local WINDOW_NAME=$PROJECT_NAME

    if [ -z $SESSION_NAME ]; then
        echo "ERROR: Rerun the command with the session-name as the first argument"
        return 1
    fi

    if [ -z $PROJECT_NAME ]; then
        echo "ERROR: Rerun the command with the project-name as the second argument"
        return 1
    fi

    if [ -z $PROJECT_PATH ]; then
        echo "ERROR: Rerun the command with the project-path as the third argument"
        return 1
    fi

    
    tmux has-session -t $SESSION_NAME &> /dev/null
    if [ $? != 0 ]; then
        echo "Session does not exist, creating..."
        if [ -z $PROJECT_NAME ]; then
            echo "ERROR: Rerun the command with the project name as the second argument"
            return 1
        fi
        tmux new-session -s $SESSION_NAME -d -n $WINDOW_NAME -c $PROJECT_PATH$PROJECT_NAME
        tmux send-keys -t $WINDOW_NAME "av && clear" C-m
    fi

    tmx_window_exist $WINDOW_NAME $SESSION_NAME
    if [ $? != 0 ]; then
        echo "Creating new window for $PROJECT_NAME project..."
        tmux new-window -n $WINDOW_NAME -c $PROJECT_PATH$PROJECT_NAME
        echo "Activating python venv if it exists in project folder"
        tmux send-keys -t $WINDOW_NAME "av && clear" C-m
    else
        tmux select-window -t $WINDOW_NAME
    fi

    tmux attach-session -t $SESSION_NAME &> /dev/null
    return 0
}

tmx_lime() {
    local SESSION_NAME="TMX"
    local PROJECT_NAME=$1
    local PROJECT_PATH=$PRO_HOME_FOLDER
    if [ -z $PROJECT_NAME ]; then
        PROJECT_NAME="tng"
    fi
    tmxa $SESSION_NAME $PROJECT_NAME $PROJECT_PATH
}

tmx() {
    local SESSION_NAME="TMX"
    local PROJECT_PATH="`pwd`"
    local PROJECT_NAME=$1
    echo $('basename $PROJECT_NAME')
    #tmxa $SESSION_NAME $PROJECT_NAME $PROJECT_PATH
}

# Put in a batfile to start cmd with a decent prompt
# start cmd @cmd runas /user:Administrator /k  "PROMPT $P$G"

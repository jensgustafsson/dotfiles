#
## Check if window `PROJECT_NAME` exists.
#

tmux_window_exist() {
    local PROJECT_NAME=$1
    tmux list-windows | grep "^[[:digit:]]\+: $PROJECT_NAME.\? " &> /dev/null
    if [ $? != 0 ]; then
        return 1
    else
        return 0
    fi
}
 

# 
## Create or/and attach to an existing session
##
## Create a new session and set working dir to the provided path
## or attach to an exisiting session
#

tms() {
    if [ -n "$1" ]; then
        local CURRENT_PATH="`pwd`"
        cd $1 &> /dev/null
        if [ $? != 0 ]; then
            echo 'specified working directory does not exist'
            return 1
        fi
        local PROJECT_PATH="`pwd`"
        local PROJECT_PATH="$PROJECT_PATH:A"
        local SESSION_NAME="$PROJECT_PATH:t"
        cd $CURRENT_PATH
    fi

    if [ -n "$TMUX" ]; then
        if [ -n "$SESSION_NAME" ]; then
            tmux switch-client -t $SESSION_NAME &> /dev/null
            if [ $? != 0 ]; then
                tmux new -s $SESSION_NAME -d -c $PROJECT_PATH && tmux switch-client -t $SESSION_NAME
            fi
        else
            return 1
        fi

    else
        if [ -n "$SESSION_NAME" ]; then
            tmux attach -t $SESSION_NAME || tmux new-session -s $SESSION_NAME -c $PROJECT_PATH
        else
            tmux attach
        fi
    fi
}


#
## Opens a new window inside the current tmux session.
##
## Sets working dir to the provided path
## Uses the name of the directory the path is pointing at as window name.
#

tmx() {
    local CURRENT_PATH="`pwd`"
    if [ -n $1 ]; then
        cd $1
        local PROJECT_PATH="`pwd`"
        cd $CURRENT_PATH
    fi
    local PROJECT_NAME="$PROJECT_PATH:t"

    tmux_window_exist $PROJECT_NAME &> /dev/null
    if [ $? != 0 ]; then
        tmux new-window -n $PROJECT_NAME -c $PROJECT_PATH
    else
        tmux select-window -t $PROJECT_NAME
    fi
    return 0
}


#
## Create new session or attach to existing session with name SESSION_NAME.
#

tmsa() {
    local SESSION_NAME=$1

    if [ -z "$SESSION_NAME" ]; then
        echo 'Usage: tmsa <SESSION_NAME>'
        return 1
    fi

    if [ -n "$TMUX" ]; then
        if [ -n "$SESSION_NAME" ]; then
            tmux switch-client -t $SESSION_NAME &> /dev/null
            if [ $? != 0 ]; then
                tmux new -s $SESSION_NAME -d && tmux switch-client -t $SESSION_NAME
            fi
        else
            return 1
        fi

    else
        if [ -n "$SESSION_NAME" ]; then
            tmux attach -t $SESSION_NAME || tmux new-session -s $SESSION_NAME
        else
            tmux attach
        fi
    fi
}

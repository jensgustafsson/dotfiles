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
        tmux new-session -s $SESSION_NAME -d -n $WINDOW_NAME -c $PROJECT_PATH
        tmux send-keys -t $WINDOW_NAME "av && clear" C-m
    fi

    tmx_window_exist $WINDOW_NAME $SESSION_NAME
    if [ $? != 0 ]; then
        echo "Creating new window for $PROJECT_NAME project..."
        tmux new-window -n $WINDOW_NAME -c $PROJECT_PATH
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
    local PROJECT_PATH="/home/jeg/development/lundalogik/pro/"
    if [ -z $PROJECT_NAME ]; then
        PROJECT_NAME="tng"
    fi
    tmxa $SESSION_NAME $PROJECT_NAME $PROJECT_PATH$PROJECT_NAME
}

tmx() {
    local CURRENT_PATH="`pwd`"
    if [ -n $1 ]; then
        cd $1
        local PROJECT_PATH="`pwd`"
        cd $CURRENT_PATH
    fi
    local SESSION_NAME="TMX"
    local PROJECT_NAME=$(`echo basename $PROJECT_PATH`)
    tmxa $SESSION_NAME $PROJECT_NAME $PROJECT_PATH
}

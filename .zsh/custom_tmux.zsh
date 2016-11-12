# Check if a window with a specifix name exists or not in the active session.
tmux_window_exist() {
    local PROJECT_NAME=$1
    tmux list-windows | grep "^[[:digit:]]\+: $PROJECT_NAME.\? " &> /dev/null
    if [ $? != 0 ]; then
        return 1
    else
        return 0
    fi
}
 
# Create a new session or attach to an exisiting session
# Path to where session shall be created is optional. If provided,
# use the basename as session name.
tms() {
    if [ -n "$1" ]; then
        local CURRENT_PATH="`pwd`"
        cd $1 &> /dev/null
        if [ $? != 0 ]; then
            echo 'The provided path does not exist!'
            return 1
        fi
        local PROJECT_PATH="`pwd`"
        local SESSION_NAME=$(`echo basename $PROJECT_PATH`)
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

# Open a new window inside a session.
# If a path is provided, open the window and change dir to the provided
# path. Use the basename as window-name.
tmx() {
    local CURRENT_PATH="`pwd`"
    if [ -n $1 ]; then
        cd $1
        local PROJECT_PATH="`pwd`"
        cd $CURRENT_PATH
    fi
    local PROJECT_NAME=$(`echo basename $PROJECT_PATH`)

    tmux_window_exist $PROJECT_NAME &> /dev/null
    if [ $? != 0 ]; then
        tmux new-window -n $PROJECT_NAME -c $PROJECT_PATH
    else
        tmux select-window -t $PROJECT_NAME
    fi
    return 0
}

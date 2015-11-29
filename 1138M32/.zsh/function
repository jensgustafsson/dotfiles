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

function reverse_find_dir() {
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

function cdg() {
    prev_wd=$(pwd)
    reverse_find_dir ".git"
}

function cdb() {
    if [ -n $prev_wd ]; then
        cd $prev_wd
        prev_wd=$(pwd)
        return 0
    else
        return 1
    fi
}

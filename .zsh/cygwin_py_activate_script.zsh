cygwin_deactivate(){

    unset -f pydoc >/dev/null 2>&1

    if ! [ -z "${_OLD_VIRTUAL_PATH+_}" ] ; then
        PATH="$_OLD_VIRTUAL_PATH"
        export PATH
        unset _OLD_VIRTUAL_PATH
    fi

    if ! [ -z "${_OLD_VIRTUAL_PYTHONHOME+_}" ] ; then
        PYTHONHOME="$_OLD_VIRTUAL_PYTHONHOME"
        export PYTHONHOME
        unset _OLD_VIRTUAL_PYTHONHOME
    fi

    if [ -n "${BASH-}" ] || [ -n "${ZSH_VERSION-}" ] ; then
        hash -r 2>/dev/null
    fi

    if ! [ -z "${_OLD_VIRTUAL_PS1+_}" ] ; then
        PS1="$_OLD_VIRTUAL_PS1"
        export PS1
        unset _OLD_VIRTUAL_PS1
    fi

    unset VIRTUAL_ENV
}

cygwin_activate() {
    local VENV_DIR="$1"

    VIRTUAL_ENV="`pwd`/$VENV_DIR"
    export VIRTUAL_ENV

    _OLD_VIRTUAL_PATH="$PATH"
    PATH="$VIRTUAL_ENV/Scripts:$PATH"
    export PATH

    if ! [ -z "${PYTHONHOME+_}" ] ; then
        _OLD_VIRTUAL_PYTHONHOME="$PYTHONHOME"
        unset PYTHONHOME
    fi

    _OLD_VIRTUAL_PS1="$PS1"
    if [ "x" != x ] ; then
        PS1="$PS1"
    else
        # PS1="(`basename \"$VIRTUAL_ENV\"`) $PS1"
        PS1="(venv) $PS1"
    fi
    export PS1

    # Make sure to unalias pydoc if it's already there
    alias pydoc 2>/dev/null >/dev/null && unalias pydoc

    pydoc () {
        python -m pydoc "$@"
    }

    if [ -n "${BASH-}" ] || [ -n "${ZSH_VERSION-}" ] ; then
        hash -r 2>/dev/null
    fi
}

function av36() {
    cygwin_activate $1
}

function deactivate36() {
    cygwin_deactivate
    if [[ $? == 0 ]]; then
        return 0
    fi
    return 1
}

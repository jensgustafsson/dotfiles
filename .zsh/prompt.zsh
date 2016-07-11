# Load color definitions
autoload colors && colors

# Reevaluate prompt after each command
setopt PROMPT_SUBST

# Git status functions
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
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)

    if [[ -n $STATUS ]]; then
        echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
    else
        echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi
}

# Append which python venv
function venv_prompt_info() {
    if is_python_active; then
        if [[ ! ( -d $VIRTUAL_ENV ) ]]; then
            echo "%{$fg[red]%}[venv is gone]%{$reset_color%}"
            return
        fi

        local venv_path=`basename "$VIRTUAL_ENV/.."(:A)`
        echo "%{$fg[yellow]%}[$venv_path]%{$reset_color%}"
    fi
}

local return_code="%(?..%{$fg[red]%}%? ✗%{$reset_color%})"
local curr_time="%{$fg[green]%}%*"
local curr_dir="%{$reset_color%}%~"
local git_branch='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'
local venv_info='$(venv_prompt_info)'

export PROMPT="%{$fg[blue]%}${curr_time} ${curr_dir} ${git_branch} ${venv_info}
%{$fg[blue]%}%{$reset_color%}$ "
export RPS1="${return_code}"

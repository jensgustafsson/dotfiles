for dir in ~/bin; do
    if [[ -z ${path[(r)$dir]} ]]; then
        path=($dir $path)
    fi
done

# if [[ -r ~/.zsh/prompt.zsh ]]; then
#     . ~/.zsh/prompt.zsh
# fi

if [[ -r ~/.zsh/functions.zsh ]]; then
    . ~/.zsh/functions.zsh
fi

if [[ -r ~/.zsh/alias.zsh ]]; then
    . ~/.zsh/alias.zsh
fi

if [[ -r ~/.zsh/nt_specific.zsh ]]; then
    . ~/.zsh/nt_specific.zsh

    if [[ "$(uname)" =~ CYGWIN_NT ]]; then
        if [[ -r ~/.zsh/cygwin_py_activate_script.zsh ]]; then
            . ~/.zsh/cygwin_py_activate_script.zsh
        fi
    fi
fi

if [[ -r ~/.zsh/todo.txt.zsh ]]; then
    . ~/.zsh/todo.txt.zsh
fi

if [[ -r ~/.zsh/history.zsh ]]; then
    . ~/.zsh/history.zsh
fi

if [[ -r ~/.zsh/completion.zsh ]]; then
    . ~/.zsh/completion.zsh
fi

if [[ -r ~/.zsh/misc.zsh ]]; then
    . ~/.zsh/misc.zsh
fi

if [[ -r ~/.zsh/env.zsh ]]; then
    . ~/.zsh/env.zsh
fi

if [[ -r ~/.zsh/tmux.zsh ]]; then
    . ~/.zsh/tmux.zsh
fi

if [[ -r ~/.zsh/emacs-mode.zsh ]]; then
    . ~/.zsh/emacs-mode.zsh
fi

if [[ -r ~/.zsh/help.zsh ]]; then
    . ~/.zsh/help.zsh
fi

if [[ -r ~/.zsh/base16.zsh ]]; then
    . ~/.zsh/base16.zsh
fi

if [[ -r ~/.work_commands.zsh ]]; then
    . ~/.work_commands.zsh
fi


export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ -f `which powerline-daemon` ]]; then
    source /usr/share/powerline/bindings/zsh/powerline.zsh
fi

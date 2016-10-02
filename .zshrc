for dir in ~/bin; do
    if [[ -z ${path[(r)$dir]} ]]; then
        path=($dir $path)
    fi
done

if [[ -r ~/.zsh/prompt.zsh ]]; then
    . ~/.zsh/prompt.zsh
fi

if [[ -r ~/.zsh/functions.zsh ]]; then
    . ~/.zsh/functions.zsh
fi

if [[ -r ~/.zsh/nt_alias.zsh ]]; then
    . ~/.zsh/nt_alias.zsh
fi

if [[ -r ~/.zsh/alias.zsh ]]; then
    . ~/.zsh/alias.zsh
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

if [[ -r ~/.zsh/custom_tmux.zsh ]]; then
    . ~/.zsh/custom_tmux.zsh
fi

if [[ -r ~/.zsh/emacs-mode.zsh ]]; then
    . ~/.zsh/emacs-mode.zsh
fi

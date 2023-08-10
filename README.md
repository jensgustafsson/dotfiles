# Dotfiles

## Vim

### Plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Link dotfiles

```
cd $HOME

# For each dotfile or dir
ln -s ~/src/dotfiles/.dotfile
```

## Packages to install:

* fzf
* zsh
* silversearcher-ag
* [Hack](https://github.com/chrissimpkins/Hack)
* tmux
* nvm
* kdiff3

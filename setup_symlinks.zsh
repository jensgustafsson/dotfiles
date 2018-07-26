#!/bin/bash
#
mkdir -p .config > /dev/null 2>&1

ln -s ~/src/dotfiles/.vim ~/ > /dev/null 2>&1
ln -s ~/src/dotfiles/.vimrc ~/ > /dev/null 2>&1

ln -s ~/src/dotfiles/.zshrc ~/ > /dev/null 2>&1
ln -s ~/src/dotfiles/.zsh ~/ > /dev/null 2>&1

ln -s ~/src/dotfiles/.tmux.lightline.conf ~/ > /dev/null 2>&1
ln -s ~/src/dotfiles/.tmux.conf ~/ > /dev/null 2>&1

[[ "$OSTYPE" =~ ^darwin ]] && ln -s ~/src/dotfiles/.tmux-osx.conf ~/ > /dev/null 2>&1

ln -s ~/src/dotfiles/.work_commands.zsh ~/ > /dev/null 2>&1

ln -s ~/src/dotfiles/.pdbrc ~/ > /dev/null 2>&1
ln -s ~/src/dotfiles/.ctags ~/ > /dev/null 2>&1
ln -s ~/src/dotfiles/.gitconfig ~/ > /dev/null 2>&1

ln -s ~/src/dotfiles/.config/base16-shell ~/.config > /dev/null 2>&1

from shutil import copyfile
import os
from os.path import (join, realpath, abspath, basename, exists,
                     expanduser, isdir, realpath, dirname)


dotfiles = [
    '.gitconfig',
    '.vimrc',
    '.minttyrc',
    '.tmux.conf',
    '.zshrc',
]

zshfiles = [
    'alias',
    'env',
    'custom_tmux',
    'function',
    'prompt'
]

paths = {
	'home': expanduser('~'),
	'dot_repo': realpath(dirname(__file__))
}


def copy(src, dest):
    if not exists(src):
        raise ValueError("{} does not exist".format(src))

    try:
        copyfile(src, dest)
        print("{} -> {}: copied".format(src, dest))
    except Exception as e:
        print("Error occured: {}".format(e))


if __name__ == '__main__':
    dir = join(paths['dot_repo'], os.environ.get('COMPUTERNAME'))
    zshdir = join(dir, '.zsh')
    if not exists(dir):
        os.makedirs(dir)
    if not exists(zshdir):
        os.makedirs(zshdir)
    for file in dotfiles:
        src = join(paths['home'], file)
        dest = join(dir, file)
        copy(src, dest)
    for file in zshfiles:
        src = join(paths['home'], '.zsh', file)
        dest = join(zshdir, file)
        copy(src, dest)

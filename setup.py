import os
from os.path import (join, realpath, abspath, basename, exists, islink,
                     expanduser, isdir, realpath, dirname)


dotfiles = [
    '.gitconfig',
    '.vimrc',
    '.minttyrc',
    '.tmux.conf',
    '.zshrc',
]


paths = {
	'home': expanduser('~'),
	'dot_repo': realpath(dirname(__file__))
}


def link(src, dest):
    if not exists(src):
        raise ValueError("{} does not exist".format(src))

    if islink(dest):
        os.unlink(dest)

    try:
        os.symlink(src, dest)
        print("{} -> {}: linked".format(src, dest))
    except Exception as e:
        print("Error occured: {}".format(e))


if __name__ == '__main__':
    dir = join(paths['dot_repo'], os.name)
    if not exists(dir):
        os.makedirs(dir)
    for file in dotfiles:
        src = join(paths['home'], file)
        dest = join(dir, file)
        link(src, dest)

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
    if not exists(dir):
        os.makedirs(dir)
    for file in dotfiles:
        src = join(paths['home'], file)
        dest = join(dir, file)
        copy(src, dest)

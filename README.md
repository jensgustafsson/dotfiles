# Dotfiles

## Cygwin

### Freeze installed packages

```
cygcheck -c -d | sed -e "1,2d" -e 's/ .*$//' > cygwin_packages
```

### Install pacakges from freezed file

```
./setup-x86_64 -P `awk 'NR==1{printf $1}{printf ",%s", $1}' cygwin_packages`
```

## Make zsh default shell

Edit `/etc/nsswitch.conf`:

```
db_shell: /usr/bin/zsh
```


## Link dotfiles

```
cd $HOME

# For each dotfile or dir
ln -s ~/src/dotfiles/.dotfile
```


## Choco

### Install on windows from cmd

```
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```

### Install and upgrade some packages

```
choco install ag, kdiff3, procmon, procexp, sysinternals, fiddler4
choco upgrade ag, kdiff3, procmon, procexp, sysinternals, fiddler4
```

## Install winpty
[Link to github repo](https://github.com/rprichard/winpty)


## Visual Code fixes: Symlink cygdrive in windows
```
mklink /j "C:\cygdrive" "C:\"
mklink /j "C:\cygdrive\c" "C:\"
```


## Rm bash completion

```
mv /etc/bash_completion.d -v /etc/bash_completion.d_bak
```


## Fonts

### Install font `hack`

[Link to github repo](https://github.com/chrissimpkins/Hack)


### Mactype

Fonts on windows looks like crap without this. Install!
(Install file on dropbox)


## Thanks

Inspiration for this dotfiles repo has been taken from:

* [Joakim Karlsson(https://github.com/joakimkarlsson/dotfiles)](https://github.com/joakimkarlsson/dotfiles)
* [Mikael Hernup(https://github.com/Hernrup)](https://github.com/Hernrup)
* [Glenn Jorde(https://github.com/tregusti)](https://github.com/tregusti)



## Cygwin

### Freeze installed packages

```
cygcheck -c -d | sed -e "1,2d" -e 's/ .*$//' > cygwin_packages
```

### Install pacakges from freezed file

```
./setup-x86_64 -P `awk 'NR==1{printf $1}{printf ",%s", $1}' cygwin_packages`
```

### Make zsh default shell

Edit `/etc/nsswitch.conf`:

```
db_shell: /usr/bin/zsh
```

## Mactype

Fonts on windows looks like crap without this. Install!
(Install file on dropbox)

Use `mactype.ini` as config file in Mactype.


## Choco

### Install on windows from cmd

```
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```

### Install and upgrade some packages

```
choco install ag, kdiff3, procmon, procexp, sysinternals, fiddler4, fzf
choco upgrade ag, kdiff3, procmon, procexp, sysinternals, fiddler4, fzf
```

## Install winpty
[Link to github repo](https://github.com/rprichard/winpty)




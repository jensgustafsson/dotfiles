if [[ "$(uname)" =~ CYGWIN_NT ]]; then
    alias open='cygstart'
    alias sudo='cygstart --action=runas'
    alias cmd='cygstart --action=runas ~/bin/start_cmd.bat'
    alias code='cygstart code'

    alias freeze_it='pip freeze | sed 's/^M$//' >'
    alias mkvenv='deactivate; rm -r venv; wpython3 -m virtualenv venv; av'

    alias killall='taskkill /F /T /IM'
    alias wkill='taskkill /F /pid'

    alias lf='winpty.exe limefu'
    alias wpython3='winpty.exe /cygdrive/c/Python34/python'
    alias wpy='winpty.exe /cygdrive/c/Python34/python'
    alias wman='winpty.exe python manage.py'
    alias lisa='winpty.exe /cygdrive/c/src/limeworld/serveradmin/Server/Lundalogik.Lisa.Service.ConsoleHost/bin/Debug/LisaConsole.exe'
    alias pytest="winpty.exe py.test.exe"

    function ipython_cygwin() {
        VIRTUAL_ENV=$(cygpath -w $VIRTUAL_ENV) EDITOR=$(cygpath -w /usr/bin/vim) winpty.exe ipython3
    }

    function manage.py() {
        VIRTUAL_ENV=$(cygpath -w $VIRTUAL_ENV) winpty.exe python manage.py $*
    }

    alias ipy=ipython_cygwin
    alias kdiff3="winpty /cygdrive/c/Program Files/KDiff3/kdiff3.exe"
fi

# locale
export LANG=ja_JP.UTF-8
export LANGUAGE="ja_JP:ja"

# editor
export EDITOR=/usr/bin/vim.basic


# If WSL
if [ -d "/mnt/c/Windows/System32" ] ; then
    # WindowsPath
    export PATH="$PATH:/mnt/c/Windows:/mnt/c/Windows/System32"
    # Google chorome
    export PATH="$PATH:/mnt/c/Program Files (x86)/Google/Chrome/Application"
    export BROWSER=chrome.exe
    # username
    # export WIN_USER=$(/mnt/c/Windows/system32/cmd.exe /C 'echo %USERNAME%' | sed -e 's/\r//g')
    # VSCode
    export PATH="$PATH:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Users/$USER/AppData/Local/Programs/Microsoft VS Code/bin"
fi

# linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew" ] ; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
if [ -d "$HOME/.linuxbrew" ] ; then
    eval $($HOME/.linubrew/bin/brew shellenv)
fi
export HOMEBREW_NO_INSTALL_CLEANUP=1

# nodebrew
if [ -d "$HOME/.nodebrew/current/bin" ] ; then
    export PATH="$HOME/.nodebrew/current/bin:$PATH"
fi
# poetry
if [ -d "$HOME/.poetry/bin" ] ; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi

# set pyenv
if [ -d "$HOME/.pyenv" ] ; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if type "pyenv" > /dev/null 2>&1; then
        eval "$(pyenv init --path)"
    fi
fi

# Pipenv
if type "pipenv" > /dev/null 2>&1; then
    export PIPENV_VENV_IN_PROJECT=true
    eval "$(_PIPENV_COMPLETE=bash_source pipenv)"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# openssl@1.1
export LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/openssl@1.1/lib"
export CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/home/linuxbrew/.linuxbrew/opt/openssl@1.1/lib/pkgconfig"


# ssh-agent for github devcontainer
# https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials
if [ -z "$SSH_AUTH_SOCK" ]; then
   # Check for a currently running instance of the agent
   RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
   if [ "$RUNNING_AGENT" = "0" ]; then
        # Launch a new instance of the agent
        ssh-agent -s &> $HOME/.ssh/ssh-agent
   fi
   eval `cat $HOME/.ssh/ssh-agent` > /dev/null
   ssh-add $HOME/.ssh/id_rsa 2> /dev/null
#    ssh-add $HOME/.ssh/id_ed25519 2> /dev/null
fi
# /usr/bin/keychain -q --nogui $HOME/.ssh/id_rsa
# source $HOME/.keychain/$(hostname)-sh

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

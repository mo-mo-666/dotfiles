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
    # VSCode
    export PATH="$PATH:/mnt/c/Program Files/Microsoft VS Code/bin:/mnt/c/Users/mo-mo-/AppData/Local/Programs/Microsoft VS Code/bin"
fi

# linuxbrew
if [ -d "/home/linuxbrew/.linuxbrew" ] ; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
if [ -d "$HOME/.linuxbrew" ] ; then
    eval $($HOME/.linubrew/bin/brew shellenv)
fi
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
    eval "$(pipenv --completion)"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi


# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

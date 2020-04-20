#!/bin/bash
# ---------------------
# Set up Homebrew or Linuxbrew.
# ---------------------

set -xeu
# . ./common.sh

set_brew()
{
    if [ "$OS_BASE" = "$OS_MAC" ] ; then
        if type "brew" > /dev/null 2>&1; then
            echo "'Homebrew' is already installed."
        else
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        fi
    elif [ "$OS_BASE" = "$OS_LINUX" ] || [ "$OS_BASE" = "$OS_WSL" ] ; then
        if type "brew" > /dev/null 2>&1; then
            echo "'Linuxbrew' is already installed."
        elif [ -d "$HOME/linuxbrew/.linuxbrew" ] ; then
            echo "'Linuxbrew' is already installed, but not set PATH."
            eval $($HOME/.linuxbrew/bin/brew shellenv)
        elif [ -d "/home/linuxbrew/.linuxbrew" ] |; then
            echo "'Linuxbrew' is already installed, but not set PATH."
            eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        else
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
            test -d $HOME/.linuxbrew && eval $($HOME/.linuxbrew/bin/brew shellenv)
            test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
        fi
    else
        echo "We do not support your OS."
        exit 1
    fi


    brew update
    brew upgrade

    installs=(
        'git'
        'readline'
        'curl'
        'zlib'
        'xz'
        'perl'
        'sqlite'
        'bzip2'
        'autoconf'
        'gbdm'
    )
    brew install ${installs[@]}
}

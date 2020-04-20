#!/bin/bash
# ----------------------
# apt for Linux or WSL.
# ----------------------

set -xeu
# . ./common.sh

set_apt()
{
    if [ "$OS_BASE" = "$OS_MAC" ] ; then
        echo "This is Mac."
        return
    fi

    sudo apt update
    sudo apt upgrade -y
    sudo apt dist-update -y
    sudo apt autoremove -y

    installs=(
        'bash-completion'
        'build-essential'
        'file'
        'make'
        'libssl-dev'
        'zlib1g-dev'
        'libbz2-dev'
        'libreadline-dev'
        'libsqlite3-dev'
        'wget'
        'curl'
        'llvm'
        'libncurses5-dev'
        'libncursesw5-dev'
        'xz-utils'
        'tk-dev'
        'libedit-dev'
        'libffi-dev'
        'liblzma-dev'
        'python-openssl'
        'git'
    )
    sudo apt install -y ${installs[@]}
}

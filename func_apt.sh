#!/bin/bash
# ----------------------
# apt for Linux or WSL.
# ----------------------

set_apt()
{
    if [ "$OS_BASE" = "$OS_MAC" ] ; then
        echo "This is Mac."
        return
    fi

    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get autoremove -y

    installs=(
        'bash'
        'bash-completion'
        'build-essential'
        'file'
        'make'
        'gcc'
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
        'python3-openssl'
        'git'
        'language-pack-ja'
        'vim'
        'ca-certificates'
        'fonts-liberation'
        'libappindicator3-1'
        'libatk-bridge2.0-0'
        'libatk1.0-0'
        'libc6'
        'libcairo2'
        'libcups2'
        'libdbus-1-3'
        'libexpat1'
        'libfontconfig1'
        'libgbm1'
        'libgcc1'
        'libglib2.0-0'
        'libgtk-3-0'
        'libnspr4'
        'libnss3'
        'libpango-1.0-0'
        'libpangocairo-1.0-0'
        'libstdc++6'
        'libx11-6'
        'libx11-xcb1'
        'libxcb1'
        'libxcomposite1'
        'libxcursor1'
        'libxdamage1'
        'libxext6'
        'libxfixes3'
        'libxi6'
        'libxrandr2'
        'libxrender1'
        'libxss1'
        'libxtst6'
        'lsb-release'
        'openssh-client'
        'socat'
        'xdg-utils'
        'keychain'
    )
    sudo apt-get install -y ${installs[@]}
    sudo update-locale LANG='ja_JP.UTF-8'
}

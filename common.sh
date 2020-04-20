#!/bin/bash
# ------------------
# Common variables.
# ------------------

set -eu
DIR_NAME="${HOME}/dotfiles"
DOT_DIR__="${DIR_NAME}/_dotfiles"
DOT_DIR="${DIR_NAME}/dotfiles"
BACKUP_DIR="${DIR_NAME}/backup"

# OS recognition
OS_MAC="Mac"
OS_WSL="WSL"
OS_LINUX="Linux"
OS_BASE="Undefined"

if [ "$(uname)" == 'Darwin' ]; then
    OS_BASE=$OS_MAC
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    if [[ "$(uname -r)" == *Microsoft* ]]; then
        OS_BASE=$OS_WSL
    else
        OS_BASE=$OS_LINUX
    fi
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

echo "This is ${OS_BASE}."

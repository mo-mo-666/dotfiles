#!/bin/bash
# ---------------------
#
# ---------------------

set -xeu
echo $PATH

### constant value
### --------------------------------------------
DIR_NAME="${HOME}/dotfiles"
DOT_DIR__="${DIR_NAME}/_dotfiles"
DOT_DIR="${DIR_NAME}/dotfiles"
BACKUP_DIR="${DIR_NAME}/backup"

INSTALL_MODE=${1}
install_mac="mac"
install_apt="linux_normal"
install_linuxbrew="linuxbrew"

### OS recognition
OS_MAC="Mac"
OS_WSL="WSL"
OS_LINUX="Linux"
OS_BASE="Undefined"
### ---------------------------------------------


### OS recognition
### --------------------------------------------
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

if [ "$OS_BASE" = "$OS_MAC" ] && [ "$INSTALL_MODE" = "$install_mac" ] ; then
    echo "This is ${OS_BASE}. Install_mode: ${install_mac}"
elif [ "$OS_BASE" = "$OS_LINUX" -o "$OS_BASE" = "$OS_WSL" ] && [ "$INSTALL_MODE" = "$install_apt" ] ; then
    echo "This is ${OS_BASE}. Install mode: ${install_apt}"
elif [ "$OS_BASE" = "$OS_LINUX" -o "$OS_BASE" = "$OS_WSL" ] && [ "$INSTALL_MODE" = "$install_linuxbrew" ] ; then
    echo "This is ${OS_BASE}. Install mode: ${install_linuxbrew}"
else
    echo "This is ${OS_BASE}, but your argument is wrong. See README.md."
    exit 1
fi

### --------------------------------------------

### Read functions.
### ---------------------------------------------
cd ${DIR_NAME}

. ./deploy.sh force

. ./func_apt.sh
. ./func_brew.sh
. ./func_fish.sh
. ./func_python.sh
. ./func_fonts.sh

### ----------------------------------------------

### This must be exexute first.
### --------------------------------------------

cd ${HOME}
### apt
if [ "$INSTALL_MODE" = "$install_apt" ] || [ "$INSTALL_MODE" = "$install_linuxbrew" ] ; then
    set_apt
fi

### brew
if [ "$INSTALL_MODE" = "$install_mac" ] || [ "$INSTALL_MODE" = "$install_linuxbrew" ] ; then
    set_brew
fi
### -------------------------------------------


### Python
set_pyenv
set_pipenv
set_poetry

### fish
set_fish

### fonts
set_fonts

### restart shell
### -------------------------------------
exec $SHELL

#!/bin/bash
# ---------------------
#
# ---------------------

set -xeu

DIR_NAME="${HOME}/dotfiles"
cd ${DIR_NAME}

# . ./common.sh
. ./deploy.sh force

. ./func_apt.sh
. ./func_brew.sh
. ./func_fish.sh
. ./func_python.sh

### This must be exexute first.
### ------------------------------
cd ${HOME}
sudo chsh $USER -s $(which bash)
. ${HOME}/.bash_profile

### apt
set_apt

# brew
set_brew

### ------------------------------
### fish
set_fish


### Python
set_pyenv
set_pipenv
set_poetry


### ------------------------------
### restart shell
exec $SHELL

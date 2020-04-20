#!/bin/bash
# ---------------------
#
# ---------------------

set -xeu
. ./common.sh
. ./deploy.sh
exec $SHELL

. ./func_apt.sh
. ./func_brew.sh
. ./func_fish.sh
. ./func_python.sh

### This must be exexute first.
### ------------------------------
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

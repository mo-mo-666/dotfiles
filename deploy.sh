#!/bin/bash
# -----------------------
# Link dotfiles under ~.
# execute './deploy.sh' for normal node and './deploy.sh force' for force mode.
# -----------------------

# Stop all if some error or undefined variable ocurred.
set -eu
. ./common.sh

MODE=${1}
MODE=${MODE:="normal"}
force_mode="force"

link_file()
{
    if [ -f "$2" ] && [ ! -L "$2" ] ; then
        if [ "$MODE" = "$force_mode" ] ; then
            mkdir -p $(dirname $2)
            mv -fv $2 $3
            ln -snfv $1 $2
        fi
    else
        ln -snfv $1 $2
    fi
}


cd $DOT_DIR
for f in `find -type f`
do
    g=${f:2}
    [ "$g" = "README.md" ] && continue

    link_file "$DOT_DIR/$g" "$HOME/$g" "$BACKUP_DIR/$g"
done

cd $DOT_DIR__
for f in `find -type f`
do
    g=${f:2}
    if [ ! -e "$DOT_DIR/$g" ] ; then
        link_file "$DOT_DIR__/$g" "$HOME/$g" "$BACKUP_DIR/$g"
    fi
done

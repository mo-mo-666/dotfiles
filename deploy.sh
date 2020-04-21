#!/bin/bash
# -----------------------
# Link dotfiles under ~.
# execute './deploy.sh' for normal node and './deploy.sh force' for force mode.
# -----------------------


# Stop all if some error ocurred or undefined variable catched.
set -eu
. ./common.sh

set +u
MODE=${1}
MODE=${MODE:="normal"}
force_mode="force"
set -u

link_file()
{
    if [ -f "$2" ] && [ ! -L "$2" ] ; then
        if [ "$MODE" = "$force_mode" ] ; then
            mkdir -p $(dirname $3)
            mv -fv $2 $3
            mkdir -p $(dirname $2)
            ln -snfv $1 $2
        fi
    else
        mkdir -p $(dirname $2)
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


cd $DIR_NAME

#!/bin/bash
# -----------------------
# Link dotfiles under ~.
# -----------------------


DOT_DIRECTORY="${HOME}/dotfiles/dotfiles"
MODE=${1}
MODE=${MODE:="normal"}
force_mode="force"


# OS recognition
if [ "$(uname)" == 'Darwin' ]; then
    BASE_OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    if [[ "$(uname -r)" == *Microsoft* ]]; then
        BASE_OS='WSL'
    else
        BASE_OS='Linux'
    fi
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi
echo "This is ${BASE_OS}."

cd $DOT_DIRECTORY
for f in .??*
do
    if [ "$MODE" = "$force_mode" -o ! -e "${HOME}/${f}" ] ; then
        [ "$f" = ".git" ] && continue
        [ "$f" = ".gitignore" ] && continue
        [ "$f" = ".config" ] && continue

        ln -snfv "$DOT_DIRECTORY/$f" "$HOME/$f"
    fi
done
if [ "$MODE" = "$force_mode" -o ! -e "${HOME}/.config/fish/config.fish" ] ; then
    ln -snfv "$DOT_DIRECTORY/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
fi

cd "$DOT_DIRECTORY/.config/git"
for f in *
do
    if [ "$MODE" = "$force_mode" -o ! -e "${HOME}/.config/git/${f}" ] ; then
    ln -snfv "$DOT_DIRECTORY/.config/git/$f" "$HOME/.config/git/$f"
    fi
done

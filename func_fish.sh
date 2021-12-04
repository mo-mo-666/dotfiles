#!bin/bash
# ---------------------
# Set up fish.
# ---------------------

set_fish()
{
    if type "fish" > /dev/null 2>&1; then
        echo "'fish' is already installed."
    else
        if [ "$INSTALL_MODE" = "$install_apt" ] ; then
            sudo apt-add-repository 'ppa:fish-shell/release-3'
            sudo apt-get update
            sudo apt-get install -y 'fish'
        else
            brew install 'fish'
        fi
    fi

    if type "fisher" > /dev/null 2>&1; then
        echo "'fisher' is already installed."
    else
        curl "https://git.io/fisher" --create-dirs -sLo "${HOME}/.config/fish/functions/fisher.fish"
    fi
    local fisher_installes=(
        'edc/bass'
        'jethrokuan/z'
        'jorgebucaran/fish-bax'
        'oh-my-fish/theme-bobthefish'
        'sentriz/fish-pipenv'
        'daenney/pyenv'
    )
    fish -C "fisher install ${fisher_installes[@]}"
}

#!bin/bash
# ---------------------
# Set up fish.
# ---------------------

set_fish()
{
    if type "fish" > /dev/null 2>&1; then
        echo "'fish' is already installed."
    else
        if type "brew" > /dev/null 2>&1; then
            brew install 'fish'
        else
            sudo apt-add-repository 'ppa:fish-shell/release-3'
            sudo apt update
            sudo apt install -y 'fish'
        fi
    fi

    if type "fisher" > /dev/null 2>&1; then
        echo "'fisher' is already installed."
    else
        curl "https://git.io/fisher" --create-dirs -sLo "~/.config/fish/functions/fisher.fish"
    fi
    local fisher_installes=(
        'edc/bass'
        'jethrokuan/z'
        'jorgebucaran/fish-bax'
        'oh-my-fish/theme-bobthefish'
        'sentriz/fish-pipenv'
        'daenney/pyenv'
    )
    for ins in ${fisher_installes[@]}
    do
        fish -c "fisher add ${ins}"
    done
}

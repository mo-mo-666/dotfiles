#!/bin/bash
# -----------------
# Set up Python.
# -----------------

set_pyenv()
{
    if type "pyenv" > /dev/null 2>&1; then
        echo "'pyenv' is already installed."
    else
        if type "brew" > /dev/null 2>&1; then
            brew install 'pyenv'
        else
            git clone "https://github.com/pyenv/pyenv.git" "${HOME}/.pyenv"
        fi
    fi
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    pyenv install -sv '3.7.7'
    pyenv global '3.7.7'
    pip install --upgrade 'pip'
    local pip_installs=(
        'autopep8'
        'black'
        'pylint'
    )
    pip install --user --upgrade ${pip_installs[@]}
}

set_pipenv()
{
    if type "pipenv" > /dev/null 2>&1; then
        echo "'pipenv' is already installed."
    else
        if type "brew" > /dev/null 2>&1; then
            brew install 'pipenv'
        else
            sudo apt install -y 'pipenv'
        fi
    fi
}

set_poetry()
{
    if type "poetry" > /dev/null 2>&1; then
        echo "'poetry is already installed."
    else
        curl -sSL "https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py" | python
    fi

}

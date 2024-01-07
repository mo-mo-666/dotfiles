#!/bin/bash
# ---------------
# TeX install
# ---------------

set -xeu

cd $HOME

# download
wget "http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz"
tar xvf install-tl-unx.tar.gz

cd install-tl*/

# install
sudo ./install-tl -no-gui -repository "http://mirror.ctan.org/systems/texlive/tlnet/"

sudo /usr/local/texlive/????/bin/*/tlmgr path add

# for chktex, latexindent
if type "apt-get" > /dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y 'perl'
    sudo apt-get install -y 'cpanminus'
    cpanm 'Log::Log4perl' 'Log::Dispatch::File' 'YAML::Tiny' 'File::HomeDir' 'Unicode::GCString'
fi

if type "brew" > /dev/null 2>&1; then
    brew install 'perl'
    brew install 'cpanm'
    cpanm 'Log::Log4perl' 'Log::Dispatch::File' 'YAML::Tiny' 'File::HomeDir' 'Unicode::GCString'
fi

cd $HOME

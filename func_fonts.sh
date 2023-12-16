#!bin/bash
# ---------------------
# Install fonts
# ---------------------

set_fonts()
{
    if [ "$OS_BASE" = "$OS_MAC" ] ; then
        echo "This is Mac."
        return
    fi

    sudo apt-get install -y fonts-ipaexfont
    fc-cache -fv
}

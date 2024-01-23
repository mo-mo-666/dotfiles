#!/bin/bash
# -----------------
# Create ssh key
# -----------------

if [ ! -f "$HOME/.ssh/id_rsa.pub" ] \
   && [ ! -f "$HOME/.ssh/id_dsa.pub" ]  \
   && [ ! -f "$HOME/.ssh/id_ecdsa.pub" ] \
   && [ ! -f "$HOME/.ssh/id_ed25519.pub" ] ; then
    ssh-keygen -t rsa -b 4096 -C "mo-mo-666.pu_ki@outlook.com"
fi

cat "$HOME/.ssh/id_rsa.pub"

touch "$HOME/.ssh/ssh-agent

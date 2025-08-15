#!/bin/bash
# -----------------
# Create ssh key
# -----------------

if [ ! -f "$HOME/.ssh/id_rsa.pub" ] \
   && [ ! -f "$HOME/.ssh/id_dsa.pub" ]  \
   && [ ! -f "$HOME/.ssh/id_ecdsa.pub" ] \
   && [ ! -f "$HOME/.ssh/id_ed25519.pub" ] ; then
    ssh-keygen -t ed25519 -C "mo-mo-666.pu_ki@outlook.com"
fi

cat "$HOME/.ssh/id_ed25519.pub"

touch "$HOME/.ssh/ssh-agent"

#change permission
find ~/.ssh -type d -print | xargs chmod 700 ; find ~/.ssh -type f -print | xargs chmod 600
eval "$(ssh-agent -s)"

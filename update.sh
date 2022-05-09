# -*- coding: utf-8 -*-
#!/bin/bash

# Create plugin directory
mkdir -p $HOME/.urxvt/ext
echo -e "[\e[32m✔\e[0m] Created plugin directory at \e[1m\e[36m$HOME/.urxv/ext\e[0m"

RXVT_INSTALLED=0

# Check if rxvt-unicode is installed if not install it
if [[ $(which rxvt-unicode) == "/usr/bin/rxvt-unicode" ]]; then
    RXVT_INSTALLED=1
fi

if [[ $RXVT_INSTALLED -eq 0 ]]; then
    echo -e "[\e[5m\e[32m+\e[0m] Installing package rxvt-unicode..."
    sudo apt install rxvt-unicode
elif [[ $RXVT_INSTALLED -eq 1 ]]; then
    echo -e "[\e[32m✔\e[0m] rxvt-unicode installed at \e[1m\e[36m$(which rxvt-unicode)\e[0m"
fi


cp $PWD/plugins/vtwheel $HOME/.urxvt/ext
cp $PWD/dotfiles/.vimrc $HOME
echo -e "[\e[32m✔\e[0m] Copied plugins from \e[1m\e[36m$HOME/config\e[0m"


# Copy .Xresources to $HOME & update
cp $PWD/dotfiles/.Xresources $HOME
xrdb $HOME/.Xresources
echo -e "[\e[32m✔\e[0m] Updated .Xresources"

echo -e "\n[\e[32m✔\e[0m] Install Completed at \n    $(date)"

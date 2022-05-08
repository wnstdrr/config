# -*- coding: utf-8 -*-
#!/bin/bash

$PLUGIN_PATH="$HOME/.urxvt/ext/"
$RXVT_INSTALLED=0

# Check if rxvt-unicode is installed if not install it
if [[ $(which rxvt-unicode) == "/usr/bin/rxvt-unicode" ]]; then
    $RXVT_INSTALLED=1
fi

if [[ $RXVT_INSTALLED -eq 0 ]]; then
    sudo apt install rxvt-unicode
elif [[ $RXVT_INSTALLED -eq 1 ]]; then
    echo "rxvt-unicode installed at $(which rxvt-unicode)"
fi


if [[ ! -e $PLUGIN_PATH ]]; then
    # Create plugin directory
    mkdir $PLUGIN_PATH
fi
cp plugins/vtmouse $PLUGIN_PATH
cp dot/.vimrc $HOME

# Copy .Xresources to $HOME & update
cp dot/.Xresources $HOME
xrdb $HOME/.Xresources

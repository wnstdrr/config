# -*- coding: utf-8 -*-
#!/bin/bash
clear

RXVT_INSTALLED=0
VIM_INSTALLED=0

# Check if rxvt-unicode is installed if not install it
if [[ $(which rxvt-unicode) == "/usr/bin/rxvt-unicode" ]]; then
    RXVT_INSTALLED=1
fi

# Check if vim is installed if not install it
if [[ $(which vim) == "/usr/bin/vim" ]]; then
    VIM_INSTALLED=1
fi

if [[ $RXVT_INSTALLED -eq 0 ]]; then
    echo -e "[\e[5m\e[32m+\e[0m] Installing package rxvt-unicode..."
    sudo apt -y install rxvt-unicode > /dev/null 2>&1
elif [[ $RXVT_INSTALLED -eq 1 ]]; then
    echo -e "[\e[32m✔\e[0m] rxvt-unicode already installed at \e[1m\e[36m$(which rxvt-unicode)\e[0m, skipping..."
fi

if [[ $VIM_INSTALLED -eq 0 ]]; then
    echo -e "[\e[5m\e[32m+\e[0m] Installing package vim...\n"
    sudo apt -y install vim > /dev/null 2>&1
elif [[ $VIM_INSTALLED -eq 1 ]]; then
    echo -e "[\e[32m✔\e[0m] vim already installed at \e[1m\e[36m$(which vim)\e[0m, skipping...\n"
fi

echo -e "[\e[5m\e[32m+\e[0m] Satisfying nodejs dependencies for coc.nvim & plugins"
curl -sL "https://deb.nodesource.com/setup_12.x" | sudo -E bash > /dev/null 2>&1

echo -e "   - [\e[5m\e[32m+\e[0m] Installing package nodejs..."
sudo apt -y install nodejs > /dev/null 2>&1

echo -e "   - [\e[5m\e[32m+\e[0m] Installing package gcc, g++, make...\n"
sudo apt install install gcc g++ make -y > /dev/null 2>&1

cp $PWD/plugins/vtwheel $HOME/.urxvt/ext
cp $PWD/dotfiles/.vimrc $HOME

mkdir -p $HOME/.urxvt/ext

# Copy .Xresources to $HOME & update
cp $PWD/dotfiles/.Xresources $HOME
xrdb $HOME/.Xresources

if [[ VIM_INSTALLED -eq 1 ]]; then
    echo " "
else 
    echo -e "[\e[32m✔\e[0m] vim installed at \e[1m\e[36m$(which vim)\e[0m\n"
fi

echo -e "[\e[32m✔\e[0m] nodejs installed at \e[1m\e[36m$(which node)\e[0m"
echo -e "[\e[32m✔\e[0m] gcc, g++, make installed at \e[1m\e[36m$(which gcc)\e[0m, \e[1m\e[36m$(which g++)\e[0m, \e[1m\e[36m$(which make)\e[0m\n"

echo -e "[\e[5m\e[32m+\e[0m] Configuring dotfiles..."
echo -e "   [\e[32m✔\e[0m] Copied plugins from \e[1m\e[36m$PWD/config/plugins\e[0m"
echo -e "   [\e[32m✔\e[0m] Copied .vimrc from \e[1m\e[36m$PWD/config/dotfiles\e[0m"
echo -e "   [\e[32m✔\e[0m] Created plugin directory at \e[1m\e[36m$HOME/.urxv/ext\e[0m"
echo -e "   [\e[32m✔\e[0m] Updated .Xresources"

echo -e "\n[\e[32m✔\e[0m] Install Completed at \n    $(date)"

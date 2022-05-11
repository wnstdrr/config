#!/bin/bash

function git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]d' -e 's/* \(.*\)/ (\1)/'
}

# neofetch, IMPORTANT
alias neofetch="/usr/bin/neofetch --gpu_type dedicated --battery_display bar --disable cpu icons resolution packages shell theme term uptime --ascii ~/.neoascii --colors 1 6 14 1 14 7 | lolcat -S 8000000"
export neofetch

# bash endline
printf '\033[5 q\r'

# Colourful PS1 for bash
export PS1="$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\[$(tput setaf 5)\]$(tput setaf 1)\$(git_branch)$(tput setaf 5) $ \[$(tput sgr0)\]"

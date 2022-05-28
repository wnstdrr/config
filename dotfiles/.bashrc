#!/bin/bash

# Setup prompt title
EXEC_COMMAND=''
#while true; do EXEC_COMMAND=$(echo $$); done

PROMPT_COMMAND='echo -ne "\033]0;$(uname -s -n -r) | $(echo $$)\007"'

# Autocomplete
source /etc/profile.d/bash_completion.sh
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Defined functions
function git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# bash endline
printf '\033[5 q\r'

# auto completion settings
#bind 'set show-all-if-ambiguous on'
#bind 'TAB:menu-complete'

# Default stuff from other distro's
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# List of aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias neofetch="clear && /usr/bin/neofetch --gpu_type dedicated --battery_display bar --disable cpu icons resolution packages shell theme term uptime --ascii ~/.neoascii --colors 1 6 14 1 14 7 | lolcat -S 8000000"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Colourful PS1 for bash
export PS1="$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\[$(tput setaf 5)\]$(tput setaf 1)\$(git_branch)$(tput setaf 5) $ \[$(tput sgr0)\]"

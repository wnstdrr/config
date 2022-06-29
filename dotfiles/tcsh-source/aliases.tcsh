alias ls ls --color=always
alias ll ls -alF
alias l ls -CF

alias grep grep --color=auto
alias egrep grep

alias cd 'chdir \!*;set prompt="${BOLD}${RED}[${YELLOW}%n${GREEN}@${BLUE}%m ${MAGENTA}%c${RED}] `$gitbranch`${MAGENTA}`echo $d`${RESET} "'
alias co 'eval "git checkout \!*;cd .;"'

alias precmd 'set rprompt="`$colour %bold %red [ %blue``date '+%X'``$colour %red ]` `$colour [ %yellow``$state $?` `$colour %green @ %magenta` `$colour ' ' %c ' ' %red ] %reset` "'

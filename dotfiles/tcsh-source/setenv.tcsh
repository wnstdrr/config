setenv gitbranch "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'"

# very basic and crude implementation of plugins for tcsh with actual C programs
setenv colour "$cwd/.config/tcsh-source/source/exec/colours"
setenv state "$cwd/.config/tcsh-source/source/exec/tcsh-state"

@ false = ( 0 != 0 ) ;
@ true = ( $false != 1 ) ;

setenv termid "`ps -p $$ -o ppid=`"
setenv egroups "`groups | sed -r 's/[ ]+/:/g'`"
setenv ignoreeof 3
setenv rmstar
setenv term rxvt-unicode-256color
setenv history 64

set cdpath = (~)

# Word completion
setenv autolist
setenv autoexpand
setenv autocorrect
setenv correct cmd
setenv listjobs long

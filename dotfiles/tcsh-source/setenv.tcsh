#!/bin/tcsh
setenv gitbranch "sh -c 'git branch --no-color 2> /dev/null' | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'"
setenv termid "`ps -p $$ -o ppid=`"
setenv egroups "`groups | sed -r 's/[ ]+/:/g'`"
setenv ignoreeof 3
setenv rmstar
setenv term rxvt-unicode-256color
setenv history 64
setenv autolist
setenv autoexpand
setenv autocorrect
setenv correct cmd
setenv listjobs long
set cdpath = (~)

#!/bin/sh

source git-prompt.sh

if [ -z "$SOURCE_PS1" ]; then
	#get source PS1, if not imported yet, without last '$' mark
	SOURCE_PS1=`echo $PS1 | sed 's/^\(.*\)\\\\$$/\1/'`
fi

#set GIT prompts in PS1
export PS1="$SOURCE_PS1\$(print_git_prompt)$"

#!/bin/sh

source colors.sh
source functions.sh

########################## MAIN SECTION ###############################################################

if [ -z "$SOURCE_PS1" ]; then
	#get source PS1, if not imported yet, without last '$' mark
	SOURCE_PS1=`echo $PS1 | sed 's/^\(.*\)\\\\$$/\1/'`
fi

#prepare GIT prompts
BRANCH=`to_ps1_var 'get_current_branch' $Green`
ADDED=`to_ps1_var 'count_changes ✚ A' $Yellow`
MODIFIED=`to_ps1_var 'count_changes ● M' $Blue`
DELETED=`to_ps1_var 'count_changes ✖ D' $Red`
UNTRACKED=`to_ps1_var 'count_changes ? ?' $BRed`
STASHED=`to_ps1_var 'count_stashed ⚑' $Cyan`

#set GIT prompts in PS1
export PS1="$SOURCE_PS1($BRANCH,$ADDED:$MODIFIED:$DELETED:$UNTRACKED,$STASHED)$"



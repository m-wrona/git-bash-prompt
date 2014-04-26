#!/bin/sh

source colors.sh


########################## FUNCTIONS SECTION ###############################################################

#Get name of current branch from GIT repository placed in current directory. 
#args: none
#return: name of the branch or empty string if current directory is not a GIT repository
function get_current_branch {
  #get current branch and remove not needed chars
  local BRANCH=$(git branch --list 2>/dev/null | grep '*' | sed 's/* //')
  echo ${BRANCH}
}

#Convert function invocation into PS1 variable with proper color 
#args:
#$1: function name
#$2: color of variable (optional, if not given default will be taken) 
#return: string representation of PS1 variable
function to_ps1_var {
  local function_name=$1
  local COLOR=$Black
  if [ -n "$2" ]; then
	COLOR=$2
  fi
  echo "\[$COLOR\]\$($function_name)\[$Color_Off\]"
}

########################## MAIN SECTION ###############################################################

if [ -z "$SOURCE_PS1" ]; then
	#get source PS1, if not imported yet, without last '$' mark
	SOURCE_PS1=`echo $PS1 | sed 's/^\(.*\)\\\\$$/\1/'`
fi

#prepare GIT prompts
BRANCH=`to_ps1_var 'get_current_branch' $Green`

#set GIT prompts in PS1
export PS1="$SOURCE_PS1($BRANCH)$"



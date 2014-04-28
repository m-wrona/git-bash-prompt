#!/bin/sh

source colours.sh
source git-utils.sh


#Print status about current GIT repository
#args: none
#return: pretty string with status for GIT repository, empty string otherwise
function print_git_prompt {
  local GIT_BRANCH=`get_current_branch`
  if [ -z "$GIT_BRANCH" ]; then
	#not a GIT repository
	echo ""
  	return
  fi
  GIT_REPO_STATUS=""
  #commits ahead or behind
  append '↑' `compare_to_origin 'ahead'`
  append '↓' `compare_to_origin 'behind'`
  #files added
  append '✚' `count_changes A`
  #files modified or renamed
  append '●' `count_changes "M\|R"`
  #files deleted
  append '✖' `count_changes D`
  #files untracked
  append '?' `count_changes ?`
  #changes stashed
  append '⚑' `count_stashed`
  #print summary status
  if [ -z "$GIT_REPO_STATUS" ]; then
	#repository is clean
	echo "($GIT_BRANCH ✔)"
  else 
	echo "($GIT_BRANCH,$GIT_REPO_STATUS)"
  fi
}

#Append key and value to GIT_REPO_STATUS if value is not empty 
#args:
#$1: value
#$2: value
#return: none
function append {
  local KEY=$1
  local VALUE=$2
  if [ -z "$VALUE" ] || [ $VALUE = "0" ]; then
 	return
  fi
  if [ -n "$GIT_REPO_STATUS" ]; then
	GIT_REPO_STATUS="$GIT_REPO_STATUS,"
  fi
  GIT_REPO_STATUS="$GIT_REPO_STATUS$KEY $VALUE"
}



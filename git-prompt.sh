#!/bin/sh

source colors.sh
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
  local ADDED=`count_changes A`
  local MODIFIED=`count_changes "M\|R"`
  local DELETED=`count_changes D`
  local UNTRACKED=`count_changes ?`
  local STASHED=`count_stashed`
  local IS_CHANGED=`echo "$ADDED$MODIFIED$DELETED$UNTRACKED$STASHED" | grep -E ".*[1..9]+.*"`
  if [ -z "$IS_CHANGED" ]; then
	#no changes found in repository
	echo "($GIT_BRANCH✔)" 
  else
	#print current branch and found changes
  	echo "($GIT_BRANCH,✚$ADDED:●$MODIFIED:✖$DELETED:?$UNTRACKED,⚑$STASHED)"
  fi
}


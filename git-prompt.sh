#!/bin/sh

source colors.sh
source functions.sh

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
  local MODIFIED=`count_changes M`
  local DELETED=`count_changes D`
  local UNTRACKED=`count_changes ?`
  local STASHED=`count_stashed`
  echo "($GIT_BRANCH,✚$ADDED:●$MODIFIED:✖$DELETED:?$UNTRACKED,⚑$STASHED)"
}


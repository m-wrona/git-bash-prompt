

########################## GIT RELATED FUNCTIONS ###############################################################

#Check number of stashed changes
#args: none
#return: pretty string with counted stashed changes
function count_stashed {	
  local COUNT=`git stash list 2>/dev/null | wc -l`
  echo $COUNT
}

#Check number of changes made in current repository using 'git status --porcelain' command. 
#args: 
#$1: type of changes to be count defined by 'git status --porcelain' (A,M,D,? etc.)
#return: pretty string with counted changes
function count_changes {	
  local CHANGE_TYPE=$1
  local COUNT=`git status --porcelain 2>/dev/null | grep $CHANGE_TYPE | wc -l`
  echo $COUNT
}

#Get name of current branch from GIT repository placed in current directory. 
#args: none
#return: name of the branch or empty string if current directory is not a GIT repository
function get_current_branch {
  #get current branch and remove not needed chars
  local BRANCH=`git branch --list 2>/dev/null | grep '*' | sed 's/* //'`
  echo $BRANCH
}



########################## GIT RELATED FUNCTIONS ###############################################################

#Check number of stashed changes
#args: none
#return: pretty string with counted stashed changes
function count_stashed {	
  local COUNT=`git stash list 2>/dev/null | wc -l`
  echo $COUNT
}

#Check whether current branch has ahead or behind commits comparing to origin branch
#args: 
#$1: type of comparison (ahead or behind)
#return: number of commits ahead/behind, or empty string for no pending commits
function compare_to_origin {	
  local AHEAD_OR_BEHIND=$1
  local COUNT=`git status -sb 2>/dev/null |  head -1 | grep -oE "$AHEAD_OR_BEHIND [0-9]+" | sed 's/'$AHEAD_OR_BEHIND' //'`
  echo $COUNT
}

#Check number of changes made in current repository using 'git status --porcelain' command. 
#args: 
#$1: type of changes to be count defined by 'git status --porcelain' (A,M,D,? etc.)
#return: pretty string with counted changes
function count_changes {	
  local CHANGE_TYPE=$1
  local COUNT=`git status --porcelain 2>/dev/null | sed 's/ //' | cut -c 1 | grep $CHANGE_TYPE | wc -l`
  echo $COUNT
}

#Get name of current branch from GIT repository placed in current directory. 
#args: none
#return: name of the branch or empty string if current directory is not a GIT repository
function get_current_branch {
  #get current branch and remove not words, sample: # On branch master
  local BRANCH=`git status -b 2>/dev/null | head -1 | cut -d ' ' -f 4`
  echo $BRANCH
}


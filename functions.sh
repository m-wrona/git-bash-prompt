

########################## GIT RELATED FUNCTIONS ###############################################################

#Check number of stashed changes
#args: 
#$1: sympol to be printed for stashed changes
#return: pretty string with counted stashed changes
function count_stashed {	
  local SYMBOL=$1
  local COUNT=`git stash list 2>/dev/null | wc -l`
  echo "$SYMBOL$COUNT"
}

#Check number of changes made in current repository using 'git status --porcelain' command. 
#args: 
#$1: sympol to be printed for given type of changes
#$2: type of changes to be count defined by 'git status --porcelain' (A,M,D,? etc.)
#return: pretty string with counted changes
function count_changes {	
  local SYMBOL=$1
  local CHANGE_TYPE=$2
  local COUNT=`git status --porcelain 2>/dev/null | grep $CHANGE_TYPE | wc -l`
  echo "$SYMBOL$COUNT"
}

#Get name of current branch from GIT repository placed in current directory. 
#args: none
#return: name of the branch or empty string if current directory is not a GIT repository
function get_current_branch {
  #get current branch and remove not needed chars
  local BRANCH=`git branch --list 2>/dev/null | grep '*' | sed 's/* //'`
  echo $BRANCH
}

########################## BASH RELATED FUNCTIONS ###############################################################

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

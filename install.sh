#!/bin/sh


SOURCE_DIR=`pwd`
GIT_PROMPT_DIR=".git-prompt"

#copy scipts to GIT prompt directory
cd ~/
echo "Installing GIT prompt in ~/$GIT_PROMPT_DIR"
rm -rf $GIT_PROMPT_DIR 2>/dev/null 
mkdir $GIT_PROMPT_DIR
cp $SOURCE_DIR/git-utils.sh $GIT_PROMPT_DIR
cp $SOURCE_DIR/git-prompt.sh $GIT_PROMPT_DIR

#attach scripts to .bashrc
echo "Attaching sources of GIT prompt to ~/.bashrc"
echo "source ~/$GIT_PROMPT_DIR/git-utils.sh" >> ~/.bashrc
echo "source ~/$GIT_PROMPT_DIR/git-prompt.sh" >> ~/.bashrc

#source GIT prompt to current session
echo "Attaching GIT prompt to current shell session"
cd $SOURCE_DIR
source git-utils.sh
source git-prompt.sh


#!/bin/bash
MY_PATH=$(dirname $0)
MY_PATH=$(cd $MY_PATH && pwd)
cp $MY_PATH/git/.gitconfig $MY_PATH/vi/.vimrc ~
echo "alias acp='bash $MY_PATH/git/addcommitpush.sh'" >> ~/.bash_aliases
echo "alias asu='bash $MY_PATH/git/auto-setup-git.sh'" >> ~/.bash_aliases
. ~/.bash_aliases
. ~/.bashrc

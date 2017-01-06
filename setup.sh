#!/bin/bash
MY_PATH=$(dirname $0)
MY_PATH=$(cd $MY_PATH && pwd)
cp $MY_PATH/git/.gitconfig $MY_PATH/vi/.vimrc ~
echo "alias acp='$MY_PATH/git/addcommitpush.sh'" >> ~/.bashrc
echo "alias asu='$MY_PATH/git/auto-setup-git.sh'" >> ~/.bashrc
source ~/.bashrc

#!/bin/bash
# Set up alias:
#   vim ~/.bashrc
#   Add this line: alias asu='bash ~/path/to/git/auto-setup-git.sh'
#   Save and quit
#   Run this command: source ~/.bashrc

current_dir=$(basename "$PWD")
git_ext='.git'
username=$(git config user.name)
url=https://github.com/$username/$current_dir$git_ext
# Assume the name of the current directory is the name of the github repo you want to pull from
git init
git remote add github $url
git pull github master

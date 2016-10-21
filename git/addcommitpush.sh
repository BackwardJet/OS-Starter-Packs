#!/bin/bash                                                                                             
# Set up alias:                                                                                         
#   vim ~/.bashrc                                                                                       
#   Add this line: alias doit='bash ~/addcommitpush.sh'                                                 
#   Save and quit                                                                                       
#   Run this command: source ~/.bashrc                                                                  
if [[ $1 == "" ]]; then
    echo "No commit message provided"
    exit 1
else
    git add .
    git commit -m "$1"
    remote_info=$(git remote -v)
    remote_name=$(echo $remote_info | awk '{print $1;}')
    current_branch_name=$(git rev-parse --abbrev-ref HEAD)
    # git rev-parse --abbrev-ref HEAD echos the name of the current branch                              
    git push $remote_name $current_branch_name
fi

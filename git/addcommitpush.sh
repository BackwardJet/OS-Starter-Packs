#!/bin/bash
# Set up alias:
#   vim ~/.bashrc
#   Add this line: alias acp='bash ~/path/to/git/addcommitpush.sh'
#   Save and quit
#   Run this command: source ~/.bashrc

add_all()
{
    git add --all *
    git add -A
    git add -u *
}

commit()
{
    git commit -m "$1"
}

push_first() {
     remote_info=$(git remote -v)
     remote_name=$(echo $remote_info | awk '{print $1;}')
     current_branch_name=$(git rev-parse --abbrev-ref HEAD)
     # git rev-parse --abbrev-ref HEAD echos the name of the current branch                          
    git push $remote_name $current_branch_name
}

pushall() {
    remote_info=$(git remote)
    current_branch_name=$(git rev-parse --abbrev-ref HEAD)
    for remote in $remote_info
    do 
        git push $remote $current_branch_name
    done    
}

if [[ $1 == "" ]]; then
    echo "No commit message provided"
    exit 1
else
    if [[ $1 == "-a" ]]; then
        echo ""
        if [[ $2 == "" ]]; then
            echo "No commit message provided"
            exit 1
        else
            add_all
            commit $2
            pushall
        fi
    else
        add_all
        commit "$1"
        push_first
    fi
fi

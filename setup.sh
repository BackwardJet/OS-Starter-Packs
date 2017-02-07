#!/bin/bash
MY_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
NO="n"
YES="y"
check_gitconfig() {
    cat $MY_PATH/git/.gitconfig
    echo -e "Does this look like your git information? (y/n) \c"
    while true
    do
        read yesno
        if [ "$yesno" = "$NO" ]; then
            echo -e "Would you like to update this information? (y/n) \c"
            read yesno1
            if [ "$yesno1" = "$YES" ]; then
                echo -e "user.email? \c"
                read email
                echo -e "user.name? \c"
                read name
                echo -e "[user]\n\temail = $email\n\tname = $name" > $MY_PATH/git/.gitconfig
            fi
            break
        elif [ "$yesno" = "$YES" ]; then
            break
        else 
            echo -e "Please input y or n \c"
        fi 
    done
}
if [[ $1 == "" ]]; then
    check_gitconfig
elif [[ $1 == '-q' ]]; then
    echo "Running quick setup."
else
    echo "Those flags are not recognized. Proceeding with default setup."
    check_gitconfig
fi
cp $MY_PATH/git/.gitconfig $MY_PATH/vi/.vimrc ~
echo "alias acp='bash $MY_PATH/git/addcommitpush.sh'" >> ~/.bash_aliases
echo "alias asu='bash $MY_PATH/git/auto-setup-git.sh'" >> ~/.bash_aliases
source_files() {
    source ~/.bashrc
    source ~/.bash_aliases
    echo "Your system now has your git information and a simple vim config"
    echo "Two shortcuts have been added to bash (acp and asu) to addcommitpush and auto-setup" 
}
source_files

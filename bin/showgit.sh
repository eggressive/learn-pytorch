#!/bin/bash

# Check if the function already exists in ~/.bashrc
grep -q "function parse_git_branch()" ~/.bashrc
if [ $? -eq 0 ]; then
    echo "The function parse_git_branch() already exists in ~/.bashrc."
else
    # Append the function and PS1 changes to ~/.bashrc
    echo "Appending to ~/.bashrc..."

    cat <<EOL >> ~/.bashrc

function parse_git_branch() {
  git branch --show-current 2> /dev/null
}

PS1='[\033[01;32m]\u@\h[\033[00m]:[\033[01;34m]\w[\033[01;33m]\$(parse_git_branch)\[\033[00m\]\$ '

EOL

    echo "Appended successfully."
fi

# Note: You might want to source ~/.bashrc after running this script to see changes immediately.
# You can do this by running: source ~/.bashrc

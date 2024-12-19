#!/bin/bash

DIRECTORY="$HOME/dotfiles"

# Is the user setting these dotfiles for a laptop or desktop environment?
echo "Installing for laptop? (y/n)"
read -r choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    exclude_dirs=("i3" "scripts" "alacritty")
else
    exclude_dirs=("i3laptop" "scripts" "alacrittylaptop")
fi

# For each file in the ~/dotfiles directory, use stow on all sub-directories excluding the directories
# depending on the user choice on line 7
for dir in *; do
    if [[ -d "$dir" ]]; then
        if [[ " ${exclude_dirs[*]} " == *" $dir "* ]]; then
            continue
        fi

        echo "stow $dir"
        stow "$dir"
    fi
done

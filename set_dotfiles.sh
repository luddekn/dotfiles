#!/bin/bash
exclude_dirs=("xorg" "scripts" "systemd")

# For each file in the ~/dotfiles directory, use stow on all sub-directories excluding the directories
for dir in *; do
    if [[ -d "$dir" ]]; then
        if [[ " ${exclude_dirs[*]} " == *" $dir "* ]]; then
            continue
        fi

        echo "stow $dir"
        stow "$dir"
    fi
done

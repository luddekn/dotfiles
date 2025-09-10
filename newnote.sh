#!/bin/bash

dir="$1"
file="$2"
newfile="$(pwd)/$dir/$file"

# Check if arguments have been provided
if [[ -z "$dir" || -z "$file" ]]; then
    printf "One or more arguments missing\n\nCOMMAND USAGE\n\tnew DIRECTORY FILENAME\n\n"
    exit 1
fi

# Check if the directory already exists
if [[ -d "$dir" ]]; then
    # Check if a file with that name already exists
    if [[ -f "$newfile" ]]; then
        echo "File already exists, exiting..."
        exit 0
    else
        touch "$newfile"
        echo "'$file' created in '$dir'"
        echo "# ${file%.*}" >"$newfile"
        echo "Date: $(date -I)" >>"$newfile"
        echo "Tags: " >>"$newfile"
        echo "" >>"$newfile"
        echo "---" >>"$newfile"
        nvim "$newfile"
        exit 0
    fi
else
    mkdir "$dir"
    touch "$newfile"
    echo "'$file' created in '$dir'"
    echo "# ${file%.*}" >"$newfile"
    echo "Date: $(date -I)" >>"$newfile"
    echo "Tags: " >>"$newfile"
    echo "" >>"$newfile"
    echo "---" >>"$newfile"
    nvim "$newfile"
    exit 0
fi

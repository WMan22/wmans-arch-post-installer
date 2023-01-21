#!/bin/bash

# Check if a string argument is provided
if [ "$#" -ne 1 ]; then
    echo "Please provide a string as an argument."
    exit 1
fi

## Store the string in a variable. Change this directory to whatever your personal steamapps folders are for your games.
## If adding a new directoryname=, add it to dir=$

string=$1
dir1='/mnt/a7ce968d-3523-44d6-b8e1-b6b13c63ce4a/steamapps/common'
booba='/mnt/samsung/SteamLibrary/steamapps/common'

# Search for the directory with case-insensitivity
dir=$(find $dir1 $booba -type d -iname "*$string*" -print -quit)

# Check if the directory was found
if [ -z "$dir" ]; then
    echo "Directory containing $string was not found."
    exit 1
else
    # Create the success.txt file in the located directory
    touch "$dir/dxvk.conf"
    echo "dxgi.syncInterval = 0" > "$dir/dxvk.conf"
    echo "dxvk.conf created in $dir with the line dxgi.syncInterval = 0"
fi

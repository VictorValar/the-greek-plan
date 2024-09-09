#!/bin/bash

# Define the source and destination directories
sourceDir="/home/valar/dev/the-greek-plan/src"
destDir="/mnt/c/Users/victor.santos2/Documents/Paradox Interactive/Victoria 3/mod/The Greek Plan - Eastern Roman Empire Restored"
# Check if the source directory exists
if [ ! -d "$sourceDir" ]; then
    echo "Source directory does not exist: $sourceDir"
    exit 1
fi

# Check if the destination directory exists
if [ ! -d "$destDir" ]; then
    echo "Destination directory does not exist: $destDir"
    exit 1
fi

# Copy files from source to destination, overwriting existing files
if cp -r "$sourceDir"/* "$destDir"; then
    echo "Files copied successfully"
else
    echo "An error occurred while copying files"
    exit 1
fi

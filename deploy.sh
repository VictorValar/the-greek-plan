#!/bin/bash

# Define the source and destination directories
sourceDir=${SOURCE_DIR}
destDir=${DEST_DIR}

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

# Remove old files in the destination directory
rm -rf "$destDir"/*

# Copy files from source to destination, including hidden files
if cp -rpv "$sourceDir"/. "$destDir"; then
    echo "Files copied successfully"
else
    echo "An error occurred while copying files"
    exit 1
fi

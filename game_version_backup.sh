#!/bin/bash

# Define the root directory of the game files
game_root="/mnt/e/SteamLibrary/steamapps/common/Victoria 3/game"

# Define the base directory where versions will be saved
versions_base="/mnt/e/dev/modding/vic3versions"

# Prompt the user for the game version
read -p "Enter the game version (e.g., 1-7-6): " game_version

# Define the destination directory using the versions_base and the game version
dest_dir="$versions_base/$game_version"

# Check if the game_root exists
if [ ! -d "$game_root" ]; then
    echo "Error: Game root directory does not exist: $game_root"
    exit 1
fi

# Create the destination directory for the specified version
if [ -d "$dest_dir" ]; then
    echo "Error: The version folder already exists: $dest_dir"
    exit 1
else
    mkdir -p "$dest_dir"
    echo "Created directory: $dest_dir"
fi

# Use rsync with --progress to display a progress bar
if rsync -a --info=progress2 "$game_root/" "$dest_dir"; then
    echo "Game data for version $game_version copied successfully to $dest_dir"
else
    echo "Error: Failed to copy files."
    exit 1
fi

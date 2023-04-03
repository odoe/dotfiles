#!/usr/bin/env bash

stow */

# Fonts
DIRECTORY="$HOME/.local/share/fonts"
FILE_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Meslo.zip"
FILE_NAME="Meslo LG L Bold Nerd Font Complete.ttf"

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
  echo "Font directory does not exist, creating it now..."
  mkdir -p "$DIRECTORY"
fi

# Check if the file exists
if [ ! -f "$DIRECTORY/$FILE_NAME" ]; then
  echo "Font does not exist, downloading now..."
  curl -o "$HOME/Downloads $FILE_URL"
else
  echo "Font already exists."
fi

# Extract the files into the target directory
if [ -f "$HOME/Downloads/Meslo.zip" ]; then
  echo "Extracting files into target directory..."
  unzip -qj "$HOME/Downloads/Meslo.zip" -d "$DIRECTORY"
fi

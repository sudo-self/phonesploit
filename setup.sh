#!/bin/bash

REPO_URL="https://github.com/sudo-self/phonesploit.git"
REPO_DIR="phonesploit"
SCRIPT_NAME="phonesploit.py"
ICON_FILE="icon.icns"
DMG_NAME="phonesploit.dmg"

echo "Cloning the repository..."
git clone "$REPO_URL"

cd "$REPO_DIR" || { echo "Directory $REPO_DIR does not exist. Exiting."; exit 1; }

echo "Running the Python script..."
python3 "$SCRIPT_NAME"

echo "Packaging the script into an executable..."
pyinstaller --onefile --icon="$ICON_FILE" "$SCRIPT_NAME"

echo "Creating the .dmg file..."
cd dist || { echo "Directory dist does not exist. Exiting."; exit 1; }
create-dmg "$DMG_NAME" "$ICON_FILE" "$DMG_NAME"

echo "Setup completed successfully."

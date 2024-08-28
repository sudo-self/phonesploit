#!/bin/bash


REPO_URL="https://github.com/sudo-self/phonesploit.git"
REPO_DIR="phonesploit"
SCRIPT_NAME="phonesploit.py"
ICON_FILE="icon.icns"
DMG_NAME="phonesploit.dmg"
REPO_OWNER="sudo-self"
REPO_NAME="phonesploit"

star_repository() {
    echo "Starring the repository..."
    curl -H "Authorization: token $GITHUB_TOKEN" \
         -X PUT "https://api.github.com/user/starred/$REPO_OWNER/$REPO_NAME"
}


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

read -p "Would you like to star the repository on GitHub? (y/n): " star_response
if [[ "$star_response" == [Yy] ]]; then
    if [ -z "$GITHUB_TOKEN" ]; then
        echo "GitHub token is not set. Please set the GITHUB_TOKEN environment variable."
        exit 1
    fi
    star_repository
fi

echo "Setup completed successfully."

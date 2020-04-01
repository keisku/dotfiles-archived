#!/bin/sh

VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat extensions | while read line
do
 code --install-extension $line
done

code --list-extensions > extensions

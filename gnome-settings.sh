#!/bin/bash

#Make gnome-terminal keep the CWD when making new tab
source /etc/profile.d/vte.sh

#Disable blinking cursor
gsettings set org.gnome.desktop.interface cursor-blink false

# Set hot keys for switching to a workspace using Super+#
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 "['<Super>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-2 "['<Super>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-3 "['<Super>3']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-4 "['<Super><Shift>1']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-5 "['<Super><Shift>2']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-6 "['<Super><Shift>3']"

gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>D']"
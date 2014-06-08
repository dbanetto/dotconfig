#!/bin/bash

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

gsettings set org.gnome.settings-daemon.peripherals.mouse middle-button-enabled true

gsettings set org.gnome.desktop.app-folders folder-children "[ 'qt' , 'other' , 'office' , 'java', 'steam' ]"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/qt/ name "Qt"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/qt/ apps "['assistant-qt4.desktop', 'designer-qt4.desktop', 'linguist-qt4.desktop', 'qdbusviewer-qt4.desktop', 'qtconfig-qt4.desktop']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/other/ name "Other"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/other/ apps "['uxterm.desktop', 'xterm.desktop', 'gsharp.desktop', 'flash-player-properties.desktop' , 'gnome-search-panel.desktop' ]"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/office/ name "Libre Office"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/office/ apps "['libreoffice-base.desktop','libreoffice-calc.desktop','libreoffice-draw.desktop','libreoffice-impress.desktop','libreoffice-math.desktop','libreoffice-startcenter.desktop','libreoffice-writer.desktop','libreoffice-xsltfilter.desktop']"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/java/ name "Java"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/java/ apps "['java-monitoring-and-management-console.desktop' , 'java-mission-control.desktop','java-monitoring-and-management-console.desktop','java-policy-settings.desktop','java-visualvm.desktop','sun_java.desktop','sun-java.desktop','sun-javaws.desktop' ]"

gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/steam/ name "Steam"
gsettings set org.gnome.desktop.app-folders.folder:/org/gnome/desktop/app-folders/folders/steam/ apps "$(bash util/steamgames.sh)"
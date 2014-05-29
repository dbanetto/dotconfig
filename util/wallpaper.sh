#!/bin/bash
WPPATH=$HOME/Pictures/wallpapers_1920x1080/

while true
do
	WP=`ls -1 $WPPATH | sort -R | tail -1`
	WP=$WPPATH$WP

	#Set Wallpaper
	gsettings set org.gnome.desktop.background picture-uri "file://$WP"
	gsettings set org.gnome.desktop.screensaver picture-uri "file://$WP"

	#Send user a note about this
	notify-send 'Wallpaper' 'Wallpaper has changed' --icon=dialog-information --expire-time=1000 --app-name=wallpaper

	WP=""
	#Sleep off that hard work
	sleep 3h
done

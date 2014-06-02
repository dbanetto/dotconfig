#!/bin/bash
WPPATH=$HOME/Pictures/wallpapers/

while true
do
	WP=`ls -1 $WPPATH | sort -R | tail -1`
	WP=$WPPATH$WP

	#Set Wallpaper
	gsettings set org.gnome.desktop.background picture-uri "file://$WP"
	gsettings set org.gnome.desktop.screensaver picture-uri "file://$WP"

	WP=""
	#Sleep off that hard work
	sleep 1h
done

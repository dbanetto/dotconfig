#!/bin/bash

#Parameters
# $1 file to install
# $2 path to install to
# $3 file name to install to
function install {
	if [ -f $2/$3 ]
	then
		echo "Backing up $2/$3 to backup/$3"
		mkdir -p backup
		cp $2/$3 backup/$3
		rm $2/$3
	fi
	echo "Linking $1 to $2/$3"
	ln $1 $2/$3
}

# $1 crontab time syntax
# $2 command
function installcron {
	crontab -l > /tmp/crontab_
	if  grep "$2" /tmp/crontab_  ; then
		echo "Cron Job for this script already exits"
	else
		echo "$1 $2" >> /tmp/crontab_
		crontab < /tmp/crontab_
	fi
	rm /tmp/crontab_
}




#wallpaper script
installcron '0 0-23/2  * * *' "bash $PWD/util/wallpaper.sh"

#Vim
install vim/vimrc ~ .vimrc
ln -s $PWD/vim ~/.vim
#Sublime Text
install sublime ~/.config/sublime-text-3/Packages/User Preferences.sublime-settings

#Zsh (requires oh-my-zsh)
install zshrc ~ .zshrc
#git
install gitconfig ~ .gitconfig

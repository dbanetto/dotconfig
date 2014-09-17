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
	ln -s $PWD/$1 $2/$3
}

#Vim
install vim/vimrc ~ .vimrc
ln -s $PWD/vim ~/.vim

#Code::Blocks
install codeblocks.conf ~/.codeblocks default.conf
#Code::Block Hote keys
install codeblocks-hotkeys.ini ~/.codeblocks cbKeyBinder10.ini

#Sublime Text
install sublime ~/.config/sublime-text-3/Packages/User Preferences.sublime-settings

#Elegance Colours
install elegance-colors.ini ~/.config/elegance-colors elegance-colors.ini

#Zsh (requires oh-my-zsh)
install zshrc ~ .zshrc

#git
install gitconfig ~ .gitconfig

# Terminator
install terminator ~/.config/terminator config

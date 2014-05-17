#!/bin/bash

#Parameters
# $1 file to install
# $2 path to install to
# $3 file name to install to
function dotfile {
	if [ -f $2/$3 ] 
	then
		mkdir backup
		cp $2/$3 backup/$1
		rm $2/$3
	fi
	ln $1 $2/$3
}

dotfile zshrc ~ .zshrc
dotfile gitconfig ~ .gitconfig
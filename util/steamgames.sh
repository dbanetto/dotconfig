#!/bin/bash

path=~/.local/share/applications/*.desktop

out="[ 'steam.desktop' "

for file in $path
do
	if grep -q "Exec=steam " "$file" ; then
		out="$out, '$(basename "$file")'"
	fi
done
echo "$out ]"

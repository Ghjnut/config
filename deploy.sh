#!/bin/bash

files=( ".vimrc" ".tmux.conf" ".gitconfig" ".bashrc" ".bash_profile" ".profile" )

create_backup_file() {
	declare basepath="$1" filename="$2"

	if [ -e $basepath/$filename ]
	then
			cp $basepath/$filename $basepath/test/$filename.bak
	fi
}

make_symlink() {
	declare basepath="$1" filename="$2"
	ln -s "$(pwd)/$filename" "$basepath/"
}

for i in "${files[@]}"
do
	# Check if symlink
	create_backup_file $HOME $i
	rm $HOME/$i
	make_symlink $HOME $i
done

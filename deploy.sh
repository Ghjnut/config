#!/usr/bin/env bash
set -eux
set -o pipefail

file_exists() {
	local file="$1"
	return [[ -e $file ]]
}

file_is_symlink() {
	local file="$1"
	return [[ -h $file ]]
}

# May be symlink
file_is_regular() {
	local file="$1"
	return [[ -f $file ]]
}


create_backup() {
	local file="$1"
	cp "$file" "$file.bak"
}

make_symlink() {
	local file="$1" link_dir="$2"
	ln -s "$file" "$link_dir/"
}

main() {
	files=( ".vimrc" ".tmux.conf" ".gitconfig" ".bashrc" ".bash_profile" ".alias" ".path" ".functions" ".aliases")

	for file in "${files[@]}"; do
		if file_exists $file; then
			if [[ file_is_symlink $file ]] ; then
				rm $file
			elif [[ file_is_regular $file ]]
				create_backup "$file"
			fi
		fi
		make_symlink $file
	
		# Check if symlink
		#create_backup_file $HOME $i
		#rm $HOME/$i
		#make_symlink $HOME $i
	done
}

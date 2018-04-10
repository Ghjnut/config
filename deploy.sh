#!/usr/bin/env bash
set -eux
set -o pipefail

file_exists() {
	local file="$1"
	[[ -e "$file" ]]
}

file_is_symlink() {
	local file="$1"
	[[ -h "$file" ]]
}

# May be symlink
file_is_regular() {
	local file="$1"
	[[ -f $file ]]
}


create_backup() {
	local file="$1"
	mv "$file" "$file.bak"
}

make_symlink() {
	local source_path="$1" destination_path="$2"
	ln -s "$source_path" "$destination_path"
}

main() {
	files=( ".vimrc" ".tmux.conf" ".gitconfig" ".aliases" ".bashrc" ".bash_profile" ".bash_prompt" ".exports" ".functions" ".functions-chef" ".functions-docker" ".path")
	destination_dir=~
	source_dir=$(pwd)

	for filename in "${files[@]}"; do
		destination_path="$destination_dir"/"$filename"
		source_path="$source_dir"/"$filename"
		if file_exists $destination_path; then
			if file_is_symlink $destination_path; then
				rm $destination_path
			elif file_is_regular $destination_path; then
				create_backup "$destination_path"
			fi
		fi
		make_symlink $source_path $destination_path
	
		# Check if symlink
		#create_backup_file $HOME $i
		#rm $HOME/$i
		#make_symlink $HOME $i
	done
}

main

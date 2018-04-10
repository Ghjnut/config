#!/usr/bin/env bash
#set -x
#set -e
#set -u -o pipefail

# base profile that always gets loaded on new session
#echo "Loading .bash_profile"

# brew bash autocompletion
if hash brew 2>&-; then
	source "`brew --prefix grc`/etc/grc.bashrc"
	#if [ -f $(brew --prefix)/etc/bash_completion ]; then
	#	. $(brew --prefix)/etc/bash_completion
	#fi
fi

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{aliases,bash_prompt,exports,extra,functions,functions-chef,functions-docker,path}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# autocomplete ssh from known_hosts
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# VI command-line navigation
set -o vi

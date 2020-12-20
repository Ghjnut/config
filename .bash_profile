#!/usr/bin/env bash
#set -x
#set -e
#set -u -o pipefail

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.bash/{aliases,bash_prompt,path,exports,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

for file in ~/.bash/functions/{random,docker,chef,go}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

set -o vi

# FZF
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ghjnut/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/ghjnut/.fzf/shell/key-bindings.bash"

### DEFAULT .bashrc
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# SHOULD GO SOMEWHERE ELSE
# The next line updates PATH for the Google Cloud SDK.
#source '/home/ghjnut/projects/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
#source '/home/ghjnut/projects/google-cloud-sdk/completion.bash.inc'

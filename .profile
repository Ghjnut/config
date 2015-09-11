# Specifics for user (runs every term load)
#echo "Loading .profile"

# command-line editor
#set -o vi




#dockerinit "default"

# brew bash autocompletion
if hash brew 2>&-; then
	source "`brew --prefix grc`/etc/grc.bashrc"
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
fi

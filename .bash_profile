[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

# Chef initialization (** RESETS RUBY/GEM PATH)
if hash chef 2>&-; then
	eval "$(chef shell-init bash)"
fi

# Docker-machine
if hash docker-machine 2>&-; then
	eval "$(docker-machine env default)"
fi

# Golang, probably revisit this 
if hash go 2>&-; then
  export GOPATH=~/gopath
fi

if hash brew 2>&-; then
	source "`brew --prefix grc`/etc/grc.bashrc"
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
fi

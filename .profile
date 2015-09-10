# Specifics for user (runs every term load)
#echo "Loading .profile"

# command-line editor
set -o vi

# prompt
export PS1='\u@\h:\w [$?]\$ '

alias vim='nvim'
#alias irssi='TERM=screen-256color irssi'

# autocomplete ssh from known_hosts
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh

# chef initialization (** RESETS RUBY/GEM PATH)
if hash chef 2>&-; then
	eval "$(chef shell-init bash)"
fi

# docker-machine
if hash docker-machine 2>&-; then
	eval "$(docker-machine env default)"
fi

# golang, probably revisit this 
if hash go 2>&-; then
  export GOPATH=~/gopath
fi

# bash autocompletion
if hash brew 2>&-; then
	source "`brew --prefix grc`/etc/grc.bashrc"
	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
fi

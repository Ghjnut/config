[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

eval "$(chef shell-init bash)"
eval "$(docker-machine env default)"
export GOPATH=~/gopath
source "`brew --prefix grc`/etc/grc.bashrc"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

set -o vi

alias vim='nvim'

export PS1='\u@\h:\w [$?]\$ '

# Will autocomplete any hosts found in known_hosts.
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
#export TERM=xterm-256color
#export TERM=screen-256color
#alias irssi='TERM=screen-256color irssi'

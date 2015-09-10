# base profile that always gets loaded on new session
#echo "Loading .bash_profile"

#export TERM=xterm-256color
#export TERM=screen-256color

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Always load .bashrc
#if [ -f ~/.bashrc ]; then . ~/.bashrc; fi 

#!/bin/bash

sudo apt-get install autotools-dev automake pkg-config libevent-dev libncurses-dev

if [ ! -d "$HOME/src" ]; then
  mkdir "$HOME/src"
fi

if [ ! -d "$HOME/bin" ]; then
  mkdir "$HOME/bin"
fi

git clone git://git.code.sf.net/p/tmux/tmux-code "$HOME/src/tmux"
cd "$HOME/src/tmux"
sh autogen.sh
./configure && make

ln -s "$HOME/src/tmux/tmux" "$HOME/bin/"

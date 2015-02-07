#!/bin/bash

if [ -e ~/.vimrc ]
then
    mv ~/.vimrc ~/.vimrc.bak
fi

if [ -e ~/.tmux.conf ]
then
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi

if [ -e ~/.gitconfig ]
then
    mv ~/.gitconfig ~/.gitconfig.bak
fi

if [ -e ~/.bashrc ]
then
    mv ~/.bashrc ~/.bashrc.bak
fi

PWD=$(pwd)

ln -s "$PWD/.vimrc" ~/
ln -s "$PWD/.tmux.conf" ~/
ln -s "$PWD/.gitconfig" ~/
ln -s "$PWD/.bashrc" ~/

# Gnome-terminal solarized
# git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
# gnome-terminal-colors-solarized/install.sh

# Powerline
# pip install --user git+git://github.com/powerline/powerline

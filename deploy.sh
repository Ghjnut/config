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

#PWD=$(pwd)

ln -s "$(pwd)/.vimrc" "$HOME/"
ln -s "$(pwd)/.tmux.conf" "$HOME/"
ln -s "$(pwd)/.gitconfig" "$HOME/"
ln -s "$(pwd)/.bashrc" "$HOME/"

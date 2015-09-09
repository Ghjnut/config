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

if [ -e ~/.bash_profile ]
then
    mv ~/.bash_profile ~/.bash_profile.bak
fi
#PWD=$(pwd)

ln -s "$(pwd)/.vimrc" "$HOME/"
ln -s "$(pwd)/.tmux.conf" "$HOME/"
ln -s "$(pwd)/.gitconfig" "$HOME/"
ln -s "$(pwd)/.bashrc" "$HOME/"
ln -s "$(pwd)/.bash_profile" "$HOME/"

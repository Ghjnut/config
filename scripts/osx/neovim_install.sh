#!/bin/bash

brew tap neovim/homebrew-neovim
brew install --HEAD neovim

ln -s "$HOME/.vim" "$HOME/.nvim"
ln -s "$HOME/.vimrc" "$HOME/.nvimrc"

echo "alias vim='nvim'" >> "$HOME/.bashrc"

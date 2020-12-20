#!/usr/bin/env bash
[[ "$TRACE" ]] && set -x
set -eu -o pipefail

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim

ln -s "$HOME/.vim" "$HOME/.nvim"
ln -s "$HOME/.vimrc" "$HOME/.nvimrc"

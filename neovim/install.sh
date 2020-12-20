#!/usr/bin/env bash
[[ "$TRACE" ]] && set -x
set -eu -o pipefail

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
# python deps
sudo apt-get install python-dev python-pip python3-dev python3-pip python-neovim python3-neovim neovim

# vim-plug

ln -s "$HOME/.vim" "$HOME/.nvim"

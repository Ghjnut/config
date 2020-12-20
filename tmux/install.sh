#!/usr/bin/env bash
[[ "$TRACE" ]] && set -x
set -eu -o pipefail

git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

tmux source-file ~/.tmux.conf

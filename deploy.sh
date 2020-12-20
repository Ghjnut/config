#!/usr/bin/env bash
[[ "$TRACE" ]] && set -x
set -eu -o pipefail

main() {
  declare -A paths

  #  ".alias" ".path" ".functions" ".aliases"
  #files=(".tmux.conf" ".gitconfig" ".bashrc" ".bash_profile")

  # TODO add fzf
  paths["irssi/.irssi"]="${HOME}/.irssi"
  paths["tmux/.tmux.conf"]="${HOME}/.tmux.conf"
  paths["git/.gitconfig"]="${HOME}/.gitconfig"
  paths["bash"]="${HOME}/.bash"
  paths[".bash_profile"]="${HOME}/.bash_profile"
  paths[".bashrc"]="${HOME}/.bashrc"
  paths[".bash_logout"]="${HOME}/.bash_logout"

  mkdir -p "${HOME}/.config/nvim"
  paths["neovim/init.vim"]="${HOME}/.config/nvim/init.vim"

  for source in "${!paths[@]}"; do
    process_file "${source}" "${paths[$source]}"
  done

  apt_install

  # TODO download /home/ghjnut/src/github.com/Anthony25/gnome-terminal-colors-solarized
  # TODO /home/ghjnut/src/github.com/Anthony25/gnome-terminal-colors-solarized/install.sh
}

process_file() {
  local src="${1}"
  local dest="${2}"

  if [ -e "${src}" ]; then
    echo "Exists ${src}"
    # TODO make this correctly handle dead symlinks
    if [ -e "${dest}" ]; then
      echo " Exists ${dest}"
      if [ -h "${dest}" ]; then
        echo "  Burn symlink ${dest}"
        rm "${dest}"
      elif [ -f "${dest}" ]; then
        echo "  Backin up ${dest}"
        create_backup "${dest}"
      fi
    fi
    echo " Linking ${dest}"
    ln -s "$(pwd)/${source}" "${dest}"
  else
    echo "Doesn't exist ${src}"
  fi
}

apt_install() {
  sudo apt install tmux tree
}

create_backup() {
  local file="$1"
  cp "${file}" "${file}.bak"
}

main

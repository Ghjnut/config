git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#cat << EOF
## List of plugins
## Supports github_username/repo or full git repo URLs
#set -g @tpm_plugins ' \\
#tmux-plugins/tpm \\
#tmux-plugins/tmux-sensible \\
#'
## Other examples:
## github_username/plugin_name
## git@github.com/user/plugin
## git@bitbucket.com/user/plugin
#
## Initializes TMUX plugin manager.
## Keep this line at the very bottom of tmux.conf.
#run-shell '~/.tmux/plugins/tpm/tpm'
#EOF

tmux source-file ~/.tmux.conf
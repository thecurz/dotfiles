#!/bin/zsh

chsh -s $(which zsh)
chmod +x ~/dotfiles/install.zsh
# C-B + I
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#!/bin/zsh

chsh -s $(which zsh)
chmod +x ~/dotfiles/install.zsh
# C-B + I
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

brew install zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

git clone https://github.com/dracula/powerlevel10k.git
cd powerlevel10k
cp ./files/.p10k.zsh ~/.p10k.zsh
cd ..
rm -rf powerlevel10k

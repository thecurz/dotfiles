#!/bin/zsh

ln -s -f ~/dotfiles/.gitconfig ~/.gitconfig
ln -s -f ~/dotfiles/.zshrc ~/.zshrc
ln -s -f ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s -f ~/dotfiles/.oh-my-zsh ~/.oh-my-zsh

chsh -s $(which zsh)
chmod +x ~/dotfiles/install.zsh

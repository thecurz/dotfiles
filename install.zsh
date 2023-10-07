#!/bin/zsh

ln -s -f ~/dotfiles/.gitconfig ~/.gitconfig
ln -s -f ~/dotfiles/.zshrc ~/.zshrc
ln -s -f ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s -f ~/dotfiles/.oh-my-zsh ~/.oh-my-zsh
ln -s -f ~/dotfiles/.p10k.zsh ~/.p10k.zsh

cp -r -f ~/dotfiles/powerlevel10k/ ~/

chsh -s $(which zsh)
chmod +x ~/dotfiles/install.zsh

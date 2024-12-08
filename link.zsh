# i3
#ln -s -f ~/dotfiles/.config/i3 ~/.config/
#ln -s -f ~/dotfiles/.config/picom ~/config/

# nvim
ln -s -f ~/dotfiles/.config/nvim ~/.config/
# hypr
rm ~/.config/hypr/hyprland.conf && ln -s -f ~/dotfiles/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -s -f ~/dotfiles/.config/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf
# git
ln -s -f ~/dotfiles/.gitconfig ~/.gitconfig
# tmux
ln -s -f ~/dotfiles/.tmux.conf ~/.tmux.conf
# zsh
ln -s -f ~/dotfiles/.zshrc ~/.zshrc
ln -s -f ~/dotfiles/.oh-my-zsh ~/.oh-my-zsh
ln -s -f ~/dotfiles/powerlevel10k/ ~/
ln -s -f ~/dotfiles/.clang-format ~/.clang-format

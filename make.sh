
sudo pacman -S rofi
sudo pacman -S polybar

yay -S picom-jonaburg-git

rm -r ~/.config/kitty
ln -s ~/.dotfiles/kitty/ ~/.config/

rm -r ~/.config/.i3
ln -s ~/.dotfiles/.i3 ~/

rm ~/.Xresources
ln -s ~/.dotfiles/.Xresources/ ~/

rm -r ~/.vim_runtime
ln -s ~/.dotfiles/.vim_runtime/ ~/

rm -r ~/.urxvt
ln -s ~/.dotfiles/.urxvt/ ~/

rm -r ~/.config/cava
ln -s ~/.dotfiles/.config/cava ~/.config/

rm -r ~/.config/polybar
ln -s ~/.dotfiles/.config/polybar ~/.config/

rm ~/.config/picom.conf
ln -s ~/.dotfiles/.config/picom.conf ~/.config/

rm ~/.zshrc
ln -s ~/.dotfiles/.zshrc ~/

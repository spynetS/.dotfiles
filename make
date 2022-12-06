#!/bin/bash

read -p "install all programs? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -S rofi
    sudo pacman -S polybar
    sudo pacman -S kitty
    sudo pacman -S firefox
    sudo pacman -S ranger
    sudo pacman -S otf-font-awesome
    git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
    
    yay -S picom-animations-git
    yay -S nitrogen
    yay -S pipewire
    yay -S pywal-git
    yay -S arandr
    yay -S cava
    yay -S pipewire-pulse
    yay -S neofetch
    yay -S npm
    sudo pacman -S pavucontrol
    yay -S calcer

    rm -rf ~/.vim_runtime
    git clone git@github.com:spynetS/vimrc.git ~/.vim_runtime
    ~/.vim_runtime/install_awesome_vimrc.sh

fi

read -p "move all config files? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ln -s ~/.dotfiles/.config/rofi ~/.config/rofi

    rm -r ~/.config/kitty
    ln -s ~/.dotfiles/kitty/ ~/.config/

    rm -r ~/.config/i3
    ln -s ~/.dotfiles/.i3 ~/.config/i3

    rm ~/.Xresources
    ln -s ~/.dotfiles/.Xresources/ ~/

    rm -r ~/.config/cava
    ln -s ~/.dotfiles/.config/cava ~/.config/

    rm -r ~/.config/polybar
    ln -s ~/.dotfiles/.config/polybar ~/.config/

    rm ~/.config/picom.conf
    ln -s ~/.dotfiles/.config/picom.conf ~/.config/

    rm ~/.zshrc
    ln -s ~/.dotfiles/.zshrc ~/

    ln -s ~/.dotfiles/.zsh ~/.zsh
    
    rm ~/.profile
    ln -s ~/.dotfiles/.profile ~/

    rm ~/.config/qtile/config.py
    mkdir ~/.config/qtile
    ln -s ~/.dotfiles/.config/qtile/config.py ~/.config/qtile/

    ln ./colors.txt ~/.config/qtile/colors.txt

    mkdir ~/.config/awesome
    rm ~/.config/awesome/rc.lua
    ln  ~/.dotfiles/.config/awesome/rc.lua ~/.config/awesome/rc.lua
fi


read -p "set zsh as default shell? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    chsh -s $(which zsh)
fi

#i3-msg reload
echo the dot files install is done


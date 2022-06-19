#!/bin/bash

read -p "install all programs? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -S rofi
    sudo pacman -S polybar
    sudo pacman -S yay
    sudo pacman -S kitty
    sudo pacman -S ranger
    sudo pacman -S otf-font-awesome

    yay -S neofetch

    sudo pacman -S pavucontrol

    yay -S calcer

fi

read -p "move all config files? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -r ~/.config/kitty
    ln -s ~/.dotfiles/kitty/ ~/.config/

    rm -r ~/.config/i3
    ln -s ~/.dotfiles/.i3 ~/.config/i3

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

    rm ~/.profile
    ln -s ~/.dotfiles/.profile ~/

     rm ~/.config/rofi/config.rasi
    mkdir ~/.config/rofi
    ln -s ~/.dotfiles/.config/rofi/config.rasi ~/.config/rofi/
   
    rm ~/.config/qtile/config.py
    mkdir ~/.config/qtile
    ln -s ~/.dotfiles/.config/qtile/config.py ~/.config/qtile/

    ln ./colors.txt ~/.config/qtile/colors.txt
    
fi


read -p "set zsh as default shell? [y/n]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    chsh -s $(which zsh)
fi

i3-msg reload
echo the dot files install is done


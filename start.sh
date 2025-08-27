#!/bin/bash

#start up to date
sudo pacman Syu

#install Yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

#install Ghostty
yay -Sy --noconfirm ghostty-git

#install Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Cousine.zip
mkdir /usr/local/share/fonts/c
bsdtar xvf Cousine.zip -C /usr/local/share/fonts/c
rm Cousine.zip

#install neovim
yay -Sy --noconfirm neovim

#install stow
yay -Sy --noconfirm stow

#dotfiles installation
cd
git clone https://github.com/barbeless/dotfiles.git
stow --target ~/.config .



#import packages list
PACKAGE_FILE="packages.txt"

#download all packages
packages=$(<"$PACKAGE_FILE")
yay -Sy --noconfirm $packages


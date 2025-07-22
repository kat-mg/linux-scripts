#!/usr/bin/env bash

path=/usr/bin/
essential_packages=('hyprland' 'rofi' 'kitty' 'hyprshot' 'hyprlock' 'swww' 'waybar' 'swaync')

check_if_available() {
    if command -v $1; then
        echo "$1 is already installed"
    else
	echo "Installing $1"
	sudo pacman -Syu && sudo pacman -S -y $1
    fi
}

for package in ${essential_packages[@]}
do
    check_if_available $package
done

echo "Finished! Yipee!"

#!/bin/bash

# TARDIS (Taz's Automatic Ricing & Desktop Installation Script)
# I'm sooooo good at acronyms as you can tell
# Contact: taz@notnapoleon.net (EMAIL) or @notnapoleon:envs.net (MATRIX)

# FUNCTIONS

aur_install() {
	pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ~ && rm -rf yay
}

add_repos() {
	echo "[multilib]" >> /etc/pacman.conf 
	echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
}

pacman_packages() {
	pacman -S i3 polybar librewolf thunar nitrogen neofetch htop gthumb alacritty zsh mpv gnu-free-fonts vim leafpad noto-fonts noto-fonts-cjk gvfs-smb gnome-screenshot curl wget sddm pavucontrol pop-gtk-theme arc-icon-theme cups thunderbird 
}

aur_packages() {
	yay -S hollywood peazip-gtk2-bin cava
}

systemd_services() {
	systemctl enable sddm.service
	systemctl enable cups.service
}

dotfiles_configure() {
	cp -r ~/tardis/dotfiles/* ~/.config
}

# The actual script (very barebones as you can tell)

aur_install && add_repos && aur_packages
pacman_packages && systemd_services
dotfiles_configure

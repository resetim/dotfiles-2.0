#!/usr/bin/env bash

#Arch and Artix POS INSTALL

PROGRAMS_INSTALL=(
	tilix
	xdg-user-dirs
	xorg
	xorg-xinit
	xorg-xsetroot
	lxappearance
	pcmanfm
	lsd
	zsh
	zsh 
	zsh-autosuggestions 
	zsh-syntax-highlighting
	firefox
	git
	wget
	dmenu
	alsa-utils
	neofetch
	htop
	feh
	unzip
)

#UPDATE and SYNC

sudo pacman -Syu

#SCRIPT
for name_of_program in ${PROGRAMS_INSTALL[@]}; do
	if ! pacman -Qs | grep -q $name_of_program; then
		pacman -S "$name_of_program"
	else
		echo "[Already install]" - $name_of_program
	fi
done

#AUR
git clone https://aur.archlinux.org/yay.git 
cd yay
makepkg -si
cd ~/

#Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#POS INSTALL
sudo pacman -Syu
sudo pacman -Scc

#DOTFILES
git clone https://github.com/resetim/dotfiles.git
cd dotfiles
cp -p .zshrc ~/
cp -p .vimrc ~/
mv dwmblocks-distrotube $HOME

#HACK FONT, ICONS AND THEMES
sudo mv Hack /usr/share/fonts
sudo mv Icons /usr/share/icons
sudo mv themes /usr/share/themes
fc-cache -v -f
fc-list | grep "Hack"

#DWM
cd dwm
sudo make install

#DWMBLOCKS
cd ~/dwmblocks-distrotube
cd scripts ; chmod a+x clock kernel memory pacupdate upt volume
cd ..
sudo make install
cd

#SOURCE -UPDATE
source ~/.zshrc
source ~/.xinitrc

#Tilix Dracula
mkdir -p ~/.config/tilix/schemes
wget https://github.com/dracula/tilix/archive/master.zip
unzip master
mv ~/tilix-master/Dracula.json ~/.config/tilix/schemes

#GOGH THEMES
mkdir -p "$HOME/src"
cd "$HOME/src"
git clone https://github.com/Mayccoll/Gogh.git gogh
cd gogh/themes
./_base.sh
cd











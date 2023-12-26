#!/bin/bash

# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux
# ssh-keygen -t ed25519 -C "elyviere@gmail.com"
# Enter a file in which to save the key: ~/.ssh/id_ed25519
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
# cat ~/.ssh/id_ed25519.pub 
# Copy contents of this to github: https://github.com/settings/ssh/new

# mkdir ~/.config
# git clone git@github.com:Elyviere/configfiles.git ~/.config/configfiles
# chmod u+x ~/.config/configfiles/setup.sh
# sh ~/.config/configfiles/setup.sh

mkdir ~/.config/nvim
ln -s ~/.config/configfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/.config/configfiles/.bashrc ~/.bashrc
ln -s ~/.config/configfiles/.zshrc ~/.zshrc
ln -s ~/.config/configfiles/.astylerc ~/.astylerc
sudo apt update
sudo apt install neovim
sudo apt install python3-neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

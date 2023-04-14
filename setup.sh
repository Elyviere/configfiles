#!/bin/bash

# mkdir ~/.config
# git clone https://github.com/Elyviere/configfiles.git ~/.config/
# chmod u+x ~/.config/setup.sh
# sh ~/.config/setup.sh

mkdir ~/.config/nvim
ln -s ~/.config/configfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/.config/configfiles/.bashrc ~/.bashrc
ln -s ~/.config/configfiles/.zshrc ~/.zshrc
ln -s ~/.config/configfiles/.astylerc ~/.astylerc

# sudo apt update
# sudo apt install neovim
# sudo apt install python3-neovim
# mkdir ~/.config
# cd ~/.config
# git clone https://github.com/Elyviere/configfiles.git
# mkdir nvim
# ln -s /configfiles/init.vim nvim/
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

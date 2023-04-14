#!/bin/bash

#mkdir ~/.config
#git clone https://github.com/Elyviere/configfiles.git ~/.config/
#chmod u+x ~/.config/setup.sh
#sh ~/.config/setup.sh

mkdir ~/.config/nvim
ln -s ~/.config/configfiles/init.vim ~/.config/nvim/init.vim
ln -s ~/.config/configfiles/.bashrc ~/.bashrc
ln -s ~/.config/configfiles/.zshrc ~/.zshrc
ln -s ~/.config/configfiles/.astylerc ~/.astylerc

#!/bin/bash

# Set up an ssh key to github
#
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux
# ssh-keygen -t ed25519 -C "elyviere@gmail.com"
# Enter a file in which to save the key: ~/.ssh/id_ed25519
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/id_ed25519
# cat ~/.ssh/id_ed25519.pub
# Copy contents of this to github: https://github.com/settings/ssh/new

# Clone the config repo
#
# mkdir ~/.config
# git clone git@github.com:Elyviere/configfiles.git ~/.config/configfiles
# chmod u+x ~/.config/configfiles/setup.sh
# sh ~/.config/configfiles/setup.sh

ln -s ~/.config/configfiles/nvim/ ~/.config/
ln -s ~/.config/configfiles/.bashrc ~/.bashrc
ln -s ~/.config/configfiles/.zshrc ~/.zshrc
ln -s ~/.config/configfiles/.astylerc ~/.astylerc
sudo apt update
# sudo apt install python3-neovim # Might no longer be needed, remove if everything below works

# Install dependencies available through apt
sudo apt install gcc g++ fd-find ninja-build gettext cmake unzip curl build-essential

# Install Linuxbrew for ripgrep and lazygit
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(
	echo
	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"'
) >>/home/elyviere/.bashrc
brew install ripgrep lazygit

# Build & Install latest stable neovim
git clone https://github.com/neovim/neovim ~/neovim
cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
git checkout stable
sudo make install
cd -

# Open neovim and make sure everything works
git config --global core.editor "nvim"
nvim
# Do :checkhealth once everything is installed

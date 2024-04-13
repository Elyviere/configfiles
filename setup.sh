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
# git clone git@github.com:Elyviere/configfiles.git ~/configfiles
# chmod u+x ~/configfiles/setup.sh
# sh ~/configfiles/setup.sh
#
setup_symbolic_link() {
	FILENAME=$1
	[ ! -L ~/$FILENAME ] && mv ~/$FILENAME ~/$FILENAME.old
	ln -sf ~/configfiles/$FILENAME ~/$FILENAME
}

[ ! -L ~/.config ] && mv ~/.config ~/.config.old
ln -sfn ~/configfiles/.config ~/.config
setup_symbolic_link .bashrc
setup_symbolic_link .zshrc
setup_symbolic_link .astylerc

sudo apt update

# Install dependencies available through apt
sudo apt install zsh gcc g++ fd-find ninja-build gettext cmake unzip curl build-essential npm exa

#Set zsh as default shell
chsh -s $(which zsh)

# Install Linuxbrew for ripgrep and lazygit
which brew
if [[ $? != 0 ]]; then
	echo 'Linuxbrew not installed, installing now'
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
	echo 'Linuxbrew already installed, skipping installation'
fi
brew install ripgrep lazygit fzf

if [ ! -d ~/.oh-my-zsh ]; then
	echo 'OhMyZShell not installed, installing now'
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
else
	echo 'OhMyZShell already installed, skipping installation'
fi

which starship
if [[ $? != 0 ]]; then
	echo 'Starship not installed, installing now'
	curl -sS https://starship.rs/install.sh | sh
else
	echo 'Starship already installed, skipping installation'
fi

which zoxide
if [[ $? != 0 ]]; then
	echo 'Zoxide not installed, installing now'
	curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
else
	echo 'Zoxide already installed, skipping installation'
fi

if [ ! -d ~/.config/tmux/plugins/tpm ]; then
	echo 'Tmux tpm not present, cloning now'
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source ~/.config/tmux/tmux.conf
else
	echo 'Tmux tpm already present on system, skipping cloning'
fi

# Build & Install latest stable neovim
which nvim
if [[ $? != 0 ]]; then
	git clone https://github.com/neovim/neovim ~/neovim
	cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
	git checkout stable
	sudo make install
	cd -
	git config --global core.editor "nvim"
else
	echo 'Neovim already installed, skipping installation'
fi

echo 'To complete setup, start tmux and install plugins with "C-b I", then open nvim and run ":checkhealth"'

exec $SHELL

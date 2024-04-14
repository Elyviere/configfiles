#!/bin/bash

# Get https://github.com/Elyviere/ssh-keys/blob/main/id_ed25519
# Place it in ~/.ssh/ and run the below command
# ssh-add ~/.ssh/id_ed25519
#
# Clone the config repo
# git clone git@github.com:Elyviere/configfiles.git ~/configfiles
# chmod u+x ~/configfiles/setup.sh
# sh ~/configfiles/setup.sh

dotfiles_dir="$HOME/configfiles"

setup_symbolic_link() {
	FILENAME=$1
	[ -f ~/$FILENAME ] && [ ! -L ~/$FILENAME ] && mv ~/$FILENAME ~/$FILENAME.old
	ln -sf $dotfiles_dir/$FILENAME ~/$FILENAME
}

install_dependencies() {
	sudo apt update -q
	sudo apt install -qy zsh gcc g++ fd-find ninja-build gettext cmake unzip curl build-essential npm exa
}

install_linuxbrew() {
	if ! which brew &>/dev/null; then
		echo 'Linuxbrew not installed, installing now'
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	else
		echo 'Linuxbrew already installed, skipping installation'
	fi
}

install_ohmyzsh() {
	if [ ! -d $HOME/.oh-my-zsh ]; then
		echo 'OhMyZShell not installed, installing now'
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended
		export ZSH_CUSTOM=$dotfiles_dir/.oh-my-zsh/custom
	else
		echo 'OhMyZShell already installed, skipping installation'
	fi
}

install_zsh-syntax-highlighting() {
	if [ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]; then
		echo 'zsh-syntax-highlighting not found, cloning now'
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	else
		echo 'zsh-syntax-highlighting already installed, skipping installation'
	fi

}
install_zsh-autosuggestions() {
	if [ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]; then
		echo 'zsh-autosuggestions not found, cloning now'
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	else
		echo 'zsh-autosuggestions already installed, skipping installation'
	fi
}

install_powerlevel10k() {
	if [ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]; then
		echo 'powerlevel10k not found, cloning now'
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	else
		echo 'powerlevel10k already installed, skipping installation'
	fi
}

install_zoxide() {
	if ! which zoxide &>/dev/null; then
		echo 'Zoxide not installed, installing now'
		curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
	else
		echo 'Zoxide already installed, skipping installation'
	fi
}

install_tpm() {
	if [ ! -d $HOME/.config/tmux/plugins/tpm ]; then
		echo 'Tmux tpm not present, cloning now'
		git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
		tmux source ~/.config/tmux/tmux.conf
	else
		echo 'Tmux tpm already present on system, skipping cloning'
	fi
}

install_nvim() {
	if ! which nvim &>/dev/null; then
		git clone https://github.com/neovim/neovim ~/neovim
		cd ~/neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
		git checkout stable
		sudo make install
		cd -
		git config --global core.editor "nvim"
	else
		echo 'Neovim already installed, skipping installation'
	fi
}

[ ! -L ~/.config ] && mv ~/.config ~/.config.old
ln -sfn $dotfiles_dir/.config ~/.config
setup_symbolic_link .bashrc
setup_symbolic_link .zshrc
setup_symbolic_link .zshenv
setup_symbolic_link .astylerc
setup_symbolic_link .p10k.zsh

install_dependencies

#Set zsh as default shell
chsh -s $(which zsh)

install_linuxbrew
brew --quiet install ripgrep lazygit fzf
install_ohmyzsh
install_zsh-syntax-highlighting
install_zsh-autosuggestions
install_powerlevel10k
install_zoxide
install_tpm
install_nvim

echo 'To complete setup, start tmux and install plugins with "C-b I", then open nvim and run ":checkhealth"'

exec $SHELL

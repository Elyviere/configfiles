
# Config file shortcuts (pre-existing as comments)
# zshrc
# tmuxconf
alias zshenv='$EDITOR ~/.zshenv'
alias ohmyzsh='$EDITOR ~/.oh-my-zsh'
alias zshcustomconf='$EDITOR $ZSH_CUSTOM'
alias nvimconf='$EDITOR ~/.config/nvim/lua/.'
alias aliases='$EDITOR $ZSH_CUSTOM/aliases.zsh'

# Easy access tmux sessions
alias sofle="tmux new-session -AD -s sofle" # Attaches to existing session if one exists
alias dotfiles="tmux new-session -AD -s dotfiles"


# Use exa over ls
alias l='exa -lah'
alias la='exa -lAh'
alias ll='exa -lh'
alias ls='exa'
alias lsa='exa -lah'

# Use z over ls
alias cd='z'

# Config file shortcuts (pre-existing as comments)
# zshrc
# tmuxconf
alias ohmyzsh='$EDITOR ~/.oh-my-zsh'
alias zshcustomconf='$EDITOR $ZSH_CUSTOM'
alias nvimconf='$EDITOR ~/.config/nvim/lua/.'

# Easy access tmux sessions
alias sofle="tmux new-session -AD -s sofle" # Attaches to existing session if one exists
alias dotfiles="tmux new-session -AD -s dotfiles"

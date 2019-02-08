# path to zsh installation 
export ZSH=/Users/devsdmf/.oh-my-zsh

# setting up zsh theme
ZSH_THEME="devsdmf"

# tmux configuration 
export ZSH_TMUX_AUTOSTART=true

# setting up zsh plugins
plugins=(
  git,
  tmux
)

# starting up zsh
source $ZSH/oh-my-zsh.sh

# running profile
if [[ -s $HOME/.profile ]]; then
  source $HOME/.profile
fi


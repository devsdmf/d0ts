# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# running profile
if [[ -s $HOME/.profile ]]; then
  source $HOME/.profile
fi

# path to zsh installation 
export ZSH=$HOME/.oh-my-zsh
export ZSH_DISABLE_COMPFIX=true

# setting up zsh theme
ZSH_THEME="devsdmf"

# tmux configuration 
export ZSH_TMUX_AUTOSTART=true

# setting up zsh plugins
plugins=(git tmux)

# starting up zsh
source $ZSH/oh-my-zsh.sh

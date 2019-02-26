
# loading aliases file 
if [[ -s $HOME/.aliases ]]; then
  source $HOME/.aliases
fi

# setting up default ssh key
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

# setting up editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# setting up homebrew configuration
if [[ -s $HOME/.homebrew ]]; then
  source $HOME/.homebrew
fi

# setting up tiendanube configuration
if [[ -s $HOME/.tiendanube ]]; then
  source $HOME/.tiendanube
fi



# loading aliases file 
if [[ -s $HOME/.aliases ]]; then
  source $HOME/.aliases
fi

# setting up default ssh key
export SSH_KEY_PATH="$HOME/.ssh/id_rsa"

# adding ssh key to ssh-agent
ssh-add -K $SSH_KEY_PATH 

# setting up editor
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# setting up d0tfiles bootstrap
if [[ -s $HOME/.d0t ]]; then
    source $HOME/.d0t
fi

# running chef-dk init script
eval "$(chef shell-init zsh)"


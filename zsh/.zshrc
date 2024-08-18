#------------------
# References
#------------------
# 1. https://robertcooper.me/post/elegant-development-experience-with-zsh-and-hyper-terminal
# 2. https://gist.github.com/robertcoopercode/d761345c35d59c4d831bb8af0c9982d1
# 3. https://dev.to/netguru/howto-my-terminal-shell-setup-hyper-js-zsh-starship-2j2k
# 4. https://scriptingosx.com/2019/06/moving-to-zsh/

#------------------
# Shell Variables
#------------------

# Specify VS Code as default editor for the React Native Simulator
export REACT_EDITOR=code
# Set VS Code Insiders as default code editor
export EDITOR=code
# NVM directory variable
export NVM_DIR="$HOME/.nvm"
# GPG
export GPG_TTY=$(tty)

#------------------
# PATH Manipulations
#------------------
# load PATH from ~/.shell/path.bash
source ~/.shell/path.bash


#------------------
# Zsh hooks
#------------------

# Enable the addition of zsh hook functions
autoload -U add-zsh-hook

# Load NVM and NVM bash completion
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Automatically switch and load node versions when a directory has a `.nvmrc` file
load-nvmrc() {
  local node_version="$(nvm version)" # Current node version
  local nvmrc_path="$(nvm_find_nvmrc)" # Path to the .nvmrc file

  # Check if there exists a .nvmrc file
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    # Check if the node version in .nvmrc is installed on the computer
    if [ "$nvmrc_node_version" = "N/A" ]; then
      # Install the node version in .nvmrc on the computer and switch to that node version
      nvm install
    # Check if the current node version matches the version in .nvmrc
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      # Switch node versions
      nvm use
    fi
  # If there isn't an .nvmrc make sure to set the current node version to the default node version
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
# Run load-nvmrc on initial shell load
load-nvmrc

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Executes load-nvmrc when the present working directory (pwd) changes
# add-zsh-hook chpwd load-nvmrc


#---------------------
# General Aliases
#---------------------
# load aliases from ~/.shell/aliases.bash
source ~/.shell/aliases.bash

alias change="code ~/.zshrc" # Open .zshrc to be edited in VS Code
alias update="source ~/.zshrc" # Re-run source command on .zshrc to update current terminal session with new settings


#---------------------
# Prompt
#---------------------
# choose between 1. starship, 2. spaceship

# 1. starship
# install via homebrew
# brew install starship
# Set Starship ZSH as a prompt
eval "$(starship init zsh)"

#---------------------
# Plugins
#---------------------
# 1. Create dir to store plugins
#     mkdir ~/.zsh
# 2. Install plugins by cloning the repo (it will allow later to easily keep it up-to-date by pulling the master):

# Clone repo 'fast-syntax-highlighting' to `~/.zsh/` directory
# cd ~/.zsh && git clone git@github.com:zdharma/fast-syntax-highlighting.git
# Enable 'fast-syntax-highlighting' plugin in ZSH
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Allow the use of the z plugin to easily navigate directories
# get Z script from here https://github.com/rupa/z/blob/master/z.sh
. /usr/local/etc/profile.d/z.sh

#------------------
# Miscellaneous
#------------------
# turn on the more powerful completion system
autoload -Uz compinit && compinit
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# node
# export NODE_OPTIONS=--max_old_space_size=5120

PATH=~/.console-ninja/.bin:$PATH
#------------------
# Shell Variables
#------------------

# Specify VS Code as default editor for the React Native Simulator
export REACT_EDITOR=code-insiders
# Set VS Code Insiders as default code editor
export EDITOR=code-insiders
# Android SDK
export ANDROID_HOME=~/Library/Android/sdk
# NVM directory variable
export NVM_DIR="$HOME/.nvm"
# GPG
export GPG_TTY=$(tty)

#------------------
# PATH Manipulations
#------------------

# Add mySQL executable to Path
export PATH=$PATH:/usr/local/mysql/bin
# Add Laravel Valet to PATH
export PATH=${PATH}:$HOME/.composer/vendor/bin
# Add Android SDK to path
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
# Add ruby to PATH
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.5.0/bin:$PATH"
# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"


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

# Set the tab title to the current working directory before each prompt
function tabTitle () {
  window_title="\033]0;${PWD##*/}\007"
  echo -ne "$window_title"
}

# Executes load-nvmrc when the present working directory (pwd) changes
# add-zsh-hook chpwd load-nvmrc
# Executes tabTitle before each prompt
add-zsh-hook precmd tabTitle


#---------------------
# General Aliases
#---------------------
alias change="code ~/.zshrc" # Open .zshrc to be edited in VS Code
alias update="source ~/.zshrc" # Re-run source command on .zshrc to update current terminal session with new settings
alias ls='ls -G' # Enable colorized output for `ls` command.
alias ll="ls -al" # List all files in current directory in long list format
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias o="open ." # Open the current directory in Finderalias dotfiles='/usr/bin/git --git-dir=/Users/yuhanasy/.dotfiles/ --work-tree=/Users/yuhanasy'
alias c='clear' # Clear terminal
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs" # cd into iCloud drive folder in terminal

# Dotfiles alias
# ex: dotfiles status, dotfiles add file, dotfiles commit -m 'add file'
alias dot='/usr/bin/git --git-dir=/Users/yuhanasy/.dotfiles/ --work-tree=/Users/yuhanasy'

# Git Aliases
alias ga="git add ."
alias gcm="git commit -m"
alias gcsm="git commit -S -m"
alias gcam='git commit -a -m'
alias gcsam="git commit -S -a -m"
alias gca="git commit --amend --no-edit"
alias gcae="git commit --amend"
alias gcaa="git add --all && git commit --amend --no-edit"
alias gcaae="git add --all && git commit --amend"
alias gap="git add -p"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gnope="git checkout ."
alias gwait="git reset HEAD"
alias gundo="git reset --soft HEAD^"
alias greset="git clean -f && git reset --hard HEAD" # Removes all changes, even untracked files
alias gl="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glb='git log --oneline --decorate --graph --all'
alias gs="git status"
alias gst='git status -s'
alias gpl="git pull --rebase"
alias gps="git push"
alias gpsf="git push --force-with-lease"
alias grb="git rebase"
alias grbi='git rebase -i'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
# Remove local branches that have already been merged in the remote repository
alias gcmb="git branch --merged | grep -Ev '(^\*|master)' | xargs git branch -d"
# Sets the upstream branch to be the same branch as the locally named branch
alias gset='git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`'
# Do an interactive rebase back N number of commits (e.g. grn 3)
grn() { git rebase -i HEAD~"$1"; }
# Do an interactive rebase to a supplied commit hash (e.g. grbc 80e1625)
grbic() { git rebase -i "$1"; }

#---------------------
# Prompt
#---------------------
# choose between 1. starship, 2. spaceship

# 1. starship
# install via homebrew
# brew install starship
# Set Starship ZSH as a prompt
# eval "$(starship init zsh)"

# 2. starship
# install via homebrew
# brew install scpaceship
# Set Spaceship ZSH as a prompt
autoload -U promptinit
promptinit
prompt spaceship

# spacehip options, see https://spaceship-prompt.sh/options/
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  package       # Package version
  git           # Git section (git_branch + git_status)
  # hg            # Mercurial section (hg_branch  + hg_status)
  gradle        # Gradle section
  maven         # Maven section
  node          # Node.js section
  ruby          # Ruby section
  # elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  # php           # PHP section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  # julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  gcloud        # Google Cloud Platform section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  pyenv         # Pyenv section
  # dotnet        # .NET section
  # ember         # Ember.js section
  kubectl       # Kubectl context section
  # terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

#---------------------
# Plugins
#---------------------
# 1. Create dir to store plugins
#     mkdir ~/.zsh
# 2. Install plugins by cloning the repo (it will allow later to easily keep it up-to-date by pulling the master):

# Clone repo 'fast-syntax-highlighting' to `~/.zsh/` directory
# cd ~/.zsh && git clone git@github.com:zdharma/fast-syntax-highlighting.git
# Enable 'fast-syntax-highlighting' plugin in ZSH
source /Users/yuhanasy/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

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

# cd into a directory by name
shopt -s autocd

# Aliases
# load aliases from ~/.zsh/aliases.zsh
source /Users/yuhanasy/.shell/aliases.bash

alias change="code ~/.bashrc" # Open .bashrc to be edited in VS Code
alias update="source ~/.bashrc" # Re-run source command on .bashrc to update current terminal session with new settings

# Git branch in prompt.
function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# change command prompt
export PS1="\u \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/vega/.sdkman"
[[ -s "/Users/vega/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/vega/.sdkman/bin/sdkman-init.sh"

#------------------
# PATH Manipulations
#------------------
# load PATH from ~/.shell/path.bash
source /Users/yuhanasy/.shell/path.bash

#---------------------
# Prompt
#---------------------
# install via homebrew
# brew install starship
# Set Starship ZSH as a prompt
eval "$(starship init bash)"


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
alias dotfiles='/usr/bin/git --git-dir=/Users/yuhanasy/.dotfiles/ --work-tree=/Users/yuhanasy'

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


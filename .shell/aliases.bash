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

# databases
alias start_postgres="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias stop_postgres="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias pgup="start_postgres"
alias pgdown="stop_postgres"

alias start_mysql="mysql.server start"
alias stop_mysql="mysql.server stop"
alias mysqlup="start_mysql"
alias mysqldown="stop_mysql"

## npm aliases
alias ni="npm install";
alias nrs="npm run start -s --";
alias nrb="npm run build -s --";
alias nrd="npm run dev -s --";
alias nrt="npm run test -s --";
alias nrtw="npm run test:watch -s --";
alias nrv="npm run validate -s --";
alias rmn="rm -rf node_modules";
alias flush-npm="rm -rf node_modules package-lock.json && npm i && say NPM is done";
alias nicache="npm install --prefer-offline";
alias nioff="npm install --offline";

## yarn aliases
alias yar="yarn run";
alias yas="yarn run start";
alias yab="yarn run build";
alias yat="yarn run test";
alias yav="yarn run validate";
alias yoff="yarn add --offline";
alias ypm="echo \"Installing deps without lockfile and ignoring engines\" && yarn install --no-lockfile --ignore-engines"
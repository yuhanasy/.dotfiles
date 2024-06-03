abbr ls 'ls -G' # Enable colorized output for `ls` command.
abbr ll "ls -al" # List all files in current directory in long list format
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .... 'cd ../../..'
abbr o "open ." # Open the current directory in Finderalias dotfiles='/usr/bin/git --git-dir=/Users/yuhanasy/.dotfiles/ --work-tree=/Users/yuhanasy'
abbr c clear # Clear terminal
abbr icloud "cd ~/Library/Mobile\ Documents/com~apple~CloudDocs" # cd into iCloud drive folder in terminal
abbr cat bat

abbr t tmux
abbr n nvim

# Dotfiles alias
# ex: dotfiles status, dotfiles add file, dotfiles commit -m 'add file'
abbr dot '/usr/bin/git --git-dir=/Users/yuhanasy/.dotfiles/ --work-tree=/Users/yuhanasy'

# Git Aliases
abbr ga "git add ."
abbr gbm "git branch -m"
abbr gcm "git commit -m"
abbr gcsm "git commit -S -m"
abbr gcam 'git commit -a -m'
abbr gcsam "git commit -S -a -m"
abbr gca "git commit --amend --no-edit"
abbr gcae "git commit --amend"
abbr gcaa "git add --all && git commit --amend --no-edit"
abbr gcaae "git add --all && git commit --amend"
abbr gap "git add -p"
abbr gco "git checkout"
abbr gcob "git checkout -b"
abbr gnope "git checkout ."
abbr gwait "git reset HEAD"
abbr gundo "git reset --soft HEAD^"
abbr greset "git clean -f && git reset --hard HEAD" # Removes all changes, even untracked files
abbr gl "git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr glo 'git log --oneline'
abbr glb 'git log --oneline --decorate --graph --all'
abbr gs "git status"
abbr gst 'git status -s'
abbr gpl "git pull --rebase"
abbr gps "git push"
abbr gpsf "git push --force-with-lease"
abbr grb "git rebase"
abbr grbi 'git rebase -i'
abbr grba 'git rebase --abort'
abbr grbc 'git rebase --continue'
abbr gb 'git branch'
abbr gba 'git branch -a'
abbr gbdm 'git branch --merged | grep -i -v -E "master|dev"| xargs git branch -d'
abbr gmm 'git merge master'
abbr grp 'git remote prune origin'

# Remove local branches that have already been merged in the remote repository
abbr gcmb "git branch --merged | grep -Ev '(^\*|master)' | xargs git branch -d"
# Sets the upstream branch to be the same branch as the locally named branch
abbr gset 'git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`'
# Do an interactive rebase back N number of commits (e.g. grn 3)
# grn() { git rebase -i HEAD~"$1"; }
# Do an interactive rebase to a supplied commit hash (e.g. grbc 80e1625)
# grbic() { git rebase -i "$1"; }


# databases
abbr start_postgres "pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
abbr stop_postgres "pg_ctl -D /usr/local/var/postgres stop -s -m fast"
abbr pgup start_postgres
abbr pgdown stop_postgres

abbr start_mysql "mysql.server start"
abbr stop_mysql "mysql.server stop"
abbr mysqlup start_mysql
abbr mysqldown stop_mysql

## npm aliases
abbr ni "npm install"
abbr nrs "npm run start -s --"
abbr nrb "npm run build -s --"
abbr nrd "npm run dev -s --"
abbr nrt "npm run test -s --"
abbr nrtw "npm run test:watch -s --"
abbr nrv "npm run validate -s --"
abbr rmn "rm -rf node_modules"
abbr flush-npm "rm -rf node_modules package-lock.json && npm i && say NPM is done"
abbr nicache "npm install --prefer-offline"
abbr nioff "npm install --offline"

## yarn aliases
abbr yar "yarn run"
abbr yas "yarn run start"
abbr yab "yarn run build"
abbr yat "yarn run test"
abbr yav "yarn run validate"
abbr yoff "yarn add --offline"
abbr ypm "echo \"Installing deps without lockfile and ignoring engines\" && yarn install --no-lockfile --ignore-engines"

## applications
abbr chrome:dev "/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --auto-open-devtools-for-tabs"

# Misc
## increase node heap memory
abbr up_node_mem "export NODE_OPTIONS=--max_old_space_size=8192"
abbr vite_anal "npx vite-bundle-visualizer"
abbr is_esm "npx is-esm"

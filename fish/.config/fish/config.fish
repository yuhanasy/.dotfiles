if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Detect and use node version from .nvmrc
function __check_nvm --on-variable PWD --description "Do nvm stuff"
    if test -f package.json
        if test -f .nvmrc; and test -r .nvmrc
            echo ".nvmrc detected"
            nvm use
        else
            echo "Use nvm default version"
            nvm use default
        end
    end
end
__check_nvm

# Brew
eval (/opt/homebrew/bin/brew shellenv)

# Add executeable to PATH
fish_add_path ~/.config/bin

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings # pres ESC to enter normal vi mode, and i to insert mode
set -Ux EDITOR nvim # default editor

# abrreviations
source $HOME/.config/fish/conf.d/abbr.fish

# Set up key bindings
## fzf - fuzzy finder
fzf --fish | source

## Starship - prompt
starship init fish | source

# #Zoxide - better cd
zoxide init fish | source
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

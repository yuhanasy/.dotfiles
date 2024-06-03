if status is-interactive
    # Commands to run in interactive sessions can go here
end

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

eval (/opt/homebrew/bin/brew shellenv)

fish_add_path ~/.config/bin

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings # pres ESC to enter normal vi mode, and i to insert mode
set -Ux EDITOR nvim

# abrreviations
source $HOME/.config/fish/conf.d/abbr.fish

starship init fish | source

# .dotfiles

---

Collection of my personal dotfiles

## Installation

Clone this repository
`git clone https://github.com/yuhanasy/.dotfiles.git ~/.dotfiles`

### Use GNU Stow

Install stow
`brew install stow`

#### .dotfiles -> home
Use stow to symlink dotfiles to home directory

```
cd ~/.dotfiles
stow fish
stow nvim
```

#### home -> .dotfiles
To add existing config files in home directory to .dotfiles, follow these steps:
Let's say you have existing `.gitconfig` file in home dir, then:

- `cd .dotfiles`
- `mkdir git`
- `touch git/.gitconfig`

Make sure what stow will do before actually adopting the file:

- `stow --adopt -nv git`

Then just remove the `-n` option:

- `stow --adopt -v git`

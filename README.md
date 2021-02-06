# dotfiles

My dotfiles

## Configs for

- zsh (requires spaceship prompt)
- X display server
- alacritty
- calcurse
- dunst
- newsboat
- neovim
- sxhkd
- spotify-tui

## Installation

```
mkdir $HOME/dotfiles
git init --bare $HOME/dotfiles
git --git-dir=$HOME/dotfiles --work-tree=$HOME remote add origin https://github.com/MrBaduuz/dotfiles.git
git --git-dir=$HOME/dotfiles --work-tree=$HOME pull origin master
# For zsh as default shell
chsh -s /bin/zsh
# Logout and Login again
```

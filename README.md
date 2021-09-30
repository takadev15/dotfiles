# Arch setup

## How to Download

```bash  
alias dotfiles="/usr/bin/git --git-dir $HOME/.dotfiles/ --work-tree=$HOME"  
git clone --bare https://www.github.com/Takachii15/dotfiles.git $HOME/.dotfiles
dotfiles checkout  
dotfiles config --local status.showUntrackedFiles no
```

## My Setup

* **Distro** : Arch (endevouros)
* **WM** : i3wm with i3gaps
* **status bar** : Polybar
* **Theme** : tokyo-night
* **Shell** : zsh with starship prompt
* **File Manager** : nnn
* **Terminal** : kitty/alacritty + tmux 
* **Editor** : neovim nightly 

## Screenshot

* ricing
![Screenshot](./assets/ricing.png)

## TODO List

- [ ] Neovim
  - [x] Switch to lua
- [ ] set neomutt

## ATTENTION ##

**if you want to copy my dotfiles please consider the software i use and plugis so the config can run smoothly**

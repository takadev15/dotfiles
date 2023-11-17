# Arch setup

## How to Download

```sh  
alias dotfiles="/usr/bin/git --git-dir $HOME/.dotfiles/ --work-tree=$HOME"  
git clone --bare https://www.github.com/Takachii15/dotfiles.git $HOME/.dotfiles
dotfiles checkout  
dotfiles config --local status.showUntrackedFiles no
```

## My Setup

* **Distro** : Arch Linux
* **WM** : Sway
* **status bar** : Waybar
* **Theme** : Catpuccin
* **Shell** : zsh with starship prompt
* **File Manager** : xplr, ranger
* **Terminal** : kitty + tmux
* **Editor** : neovim nightly

## Screenshot

* ricing
![Screenshot](./assets/ricing.png)

## TODO List

* [ ] Sway
  * [x] Switch greeter to tui greeter from sddm
  * [ ] Fix swayidle
* [ ] Xplr
  * [ ] Xplr image, pdf, code preview

## ATTENTION

**if you want to copy my dotfiles please consider the software i use and plugis so the config can run smoothly**

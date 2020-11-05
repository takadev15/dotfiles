# Under construction

Thanks to [this](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html) i finally fix my dots.

## Restoring
```  
alias -s dotfiles="/usr/bin/git --git-dir $HOME/.dotfiles/ --work-tree=$HOME"  
git clone --bare https://www.github.com/GeminorumB/dotfiles.git $HOME/.dotfiles  
dotfiles checkout  
dotfiles config --local status.showUntrackedFiles no
```
## My Setup
* **Distro** : Pop OS
* **DE** : Gnome 3.38 + pop_shell tiling
* **Theme** : [dracula](https://draculatheme.com/)
* **Shell** : zsh 
* **Terminal** : alacritty + tmux 
* **Editor** : neovim 



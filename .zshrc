
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit


zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source /usr/share/zsh/plugins/zsh-autosuggestions-git/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NNN
export NNN_BMS='p:/mnt/dir/project/;c:~/.config/'
export LC_COLLATE="C"

# JenV path
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Set npm Globlal in home dir
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# pfetch
export PF_ASCII="arch linux"

# Custom Script path
export PATH="$HOME/script:$PATH"
export PATH="$HOME/.config/vifm/scripts:$PATH"

# Set Nvim as default text editor
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

# Set spicetify path
export SPICETIFY_INSTALL="/home/taka15/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

#Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Dotfiles recovery
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# fnm
export PATH=/home/taka15/.fnm:$PATH
eval "`fnm env`"

# LazyDOck
alias lzd='lazydocker'

# fd 
alias fd='fdfind'

# Python venv 
alias activate="source env/bin/activate"

# project's directory
alias pdir="cd ~/dir/data/project"

# zource zshrc
alias reload="source .zshrc"

# Flutter SDK
export PATH="/home/taka15/dev/flutter/flutter/bin/:$PATH"

# Android SDK
export ANDROID_SDK_ROOT="/home/taka15/dev/sdk/cmdline-tools"
export ANDROID_HOME="/home/taka15/dev/"
export PATH="$ANDROID_HOME/tools:$PATH" 
export PATH="$ANDROID_HOME/emulator:$PATH"
export PATH="$ANDROID_HOME/platform-tools/:$PATH"
export PATH="$ANDROID_HOME/tools/bin/:$PATH"

# yarn command
export PATH="/home/taka15/.yarn/bin:$PATH"
export PATH="~/.npm-global/bin:$PATH"

# DOOM emacs
export PATH="~/.emacs.d/bin:$PATH"

# fix screen
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

eval "$(starship init zsh)"

# fnm
export PATH="/home/taka15/.fnm:$PATH"
eval "`fnm env`"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

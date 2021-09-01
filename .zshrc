# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
# Use vim keybinding
bindkey -v

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use modern completion system
autoload -Uz compinit
compinit

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


## zinit plugin config
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


## syntax highliting and auto-suggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# NNN
export NNN_BMS='p:/mnt/dir/project/;c:~/.config/'
export LC_COLLATE="C"

# Cscope
export CSCOPE_EDITOR=`which nvim`


# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# pfetch
export PF_ASCII="arch linux"

# Custom Script path
export PATH="$HOME/script:$PATH"
export PATH="$HOME/.config/vifm/scripts:$PATH"

# Set Nvim as default text editor
export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"

# Set spicetify path
export SPICETIFY_INSTALL="/home/taka15/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

#Pyenv
export PYENV_ROOT="$HOME/build/.pyenv"
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

# exa
alias ls="exa -l --icons"
alias la="exa -l --all --icons"
alias lt="exa --tree --icons --level=3"

# Python venv 
alias activate="source env/bin/activate"


# change directory
alias pdir="z ~/dir/data/project"
alias osdir="z ~/dir/data/project/os"
# alias mobdir="z ~/dir/data/project/mobile/testapp"
alias mdir="z ~/dir/data/Documents/materi"
alias note="z ~/dir/data/note/"
alias zz="z .."
# Try zoxide 
eval "$(zoxide init zsh)"


# source zshrc
alias reload="source ~/.zshrc \ zsh"

# clear
alias cls="clear"

# for brightness
alias brght="sudo chmod 577 /sys/class/backlight/amdgpu_bl0/brightness"

# Flutter SDK
export PATH=$PATH:$HOME/.sdk_dir/flutter/bin
export CHROME_EXECUTABLE=/usr/bin/brave

# Android SDK
export ANDROID_HOME=$HOME/.sdk_dir/android
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/build-tools/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# yarn command
export PATH="/home/taka15/.yarn/bin:$PATH"
export PATH="~/.npm-global/bin:$PATH"

# fix screen
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Golang
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# fnm
export PATH="/home/taka15/.fnm:$PATH"
eval "$(fnm env)"

export PATH="/home/taka15/.config/vifm/scripts/:$PATH"

# starship
eval "$(starship init zsh)"


# Nix 
if [ -e /home/taka15/.nix-profile/etc/profile.d/nix.sh ]; then . /home/taka15/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# JenV path
export JENV_ROOT="${JENV_ROOT:=${HOME}/.jenv}"
if ! type jenv > /dev/null && [ -f "${JENV_ROOT}/bin/jenv" ]; then
  export PATH="${JENV_ROOT}/bin:${PATH}"
  export JAVA_OPTS=""
fi

if type jenv > /dev/null; then
  export PATH="${JENV_ROOT}/bin:${JENV_ROOT}/shims:${PATH}"
  function jenv() {
    unset -f jenv
    eval "$(jenv init -)"
    jenv $@
  }
fi

# export PATH="$HOME/.jenv/bin:$PATH"
# eval "$(jenv init -)"

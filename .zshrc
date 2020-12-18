
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

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# Flutter SDK
export PATH="/home/taka15/dev/flutter/bin:$PATH"

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
export PATH=/home/taka15/.fnm:$PATH
eval "`fnm env`"

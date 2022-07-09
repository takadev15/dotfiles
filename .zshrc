HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt beep notify
# Use vim keybinding
bindkey -v

setopt histignorealldups sharehistory

# Use modern completion system
autoload -Uz compinit
compinit

## Generate zcompdump once a day
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

### Zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Zinit Plugin
zinit light-mode for \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/zinit-annex-readurl \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions 


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


# Custom Script path
export PATH="$HOME/.script:$PATH"
export PATH="$HOME/.config/vifm/scripts:$PATH"
export PATH="$HOME/dir/data/workstation/fita/scripts:$PATH"

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

# Set Nvim as default text editor
export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"

# Set spicetify path
export SPICETIFY_INSTALL="/home/taka15/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

# Pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"

# Golang
export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH=/home/taka15/.fnm:$PATH
eval "`fnm env`"

# Flutter SDK
export PATH=$PATH:$HOME/.sdk_dir/flutter/bin
export CHROME_EXECUTABLE=/usr/bin/brave

# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
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

# fnm
export YARN_GLOBAL_FOLDER="$FNM_MULTISHELL_PATH/yarn-global"
export YARN_PREFIX="$FNM_MULTISHELL_PATH"
export PATH="/home/taka15/.fnm:$PATH"
eval "$(fnm env)"

export PATH="/home/taka15/.config/vifm/scripts/:$PATH"

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

# aliasrc
source $HOME/.config/aliasrc

# GOenv
source $HOME/.config/gosecret

# Try zoxide 
eval "$(zoxide init zsh)"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -e "/usr/lib/kitty/shell-integration/kitty.zsh"; then source "/usr/lib/kitty/shell-integration/kitty.zsh"; fi
# END_KITTY_SHELL_INTEGRATION

# starship
eval "$(starship init zsh)"

# Protoc
export PATH="$HOME/build/protobuf/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/taka15/build/google-cloud-sdk/path.zsh.inc' ]; then . '/home/taka15/build/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/taka15/build/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/taka15/build/google-cloud-sdk/completion.zsh.inc'; fi

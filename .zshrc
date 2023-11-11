HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt beep notify
setopt autocd
bindkey -v

# compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit

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
zinit wait lucid light-mode for \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-completions \
  tj/git-extras \
  ael-code/zsh-colored-man-pages 


## zinit plugin config
zstyle ':completion:*' matcher-list 'r:|?=** m:{a-z\-}={A-Z\_}'
zstyle ':completion:*' menu select
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' verbose no
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666,bold,italic"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE="git *"


# Custom Script path
export PATH="$HOME/.script:$PATH"
export PATH="$HOME/.config/vifm/scripts:$PATH"
export PATH="$HOME/dir/data/workstation/fita/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# NNN
export NNN_BMS='p:/mnt/dir/project/;c:~/.config/'
export LC_COLLATE="C"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# pfetch
export PF_ASCII="arch linux"

# Set Nvim as default text editor
export EDITOR=nvim
export VISUAL=nvim

# Pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Golang
export GOPATH=$HOME/Repo/go
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Repo/ra-multiplex/target/release:$PATH"
export PATH="$HOME/.config/nvim/scripts:$PATH"

# Fzf
export FZF_DEFAULT_OPTS="--ansi --height 40% --layout=reverse --border=none"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
export PATH="/home/takadevs/.yarn/bin:$PATH"
export PATH="~/.npm-global/bin:$PATH"

# fnm
export YARN_GLOBAL_FOLDER="$FNM_MULTISHELL_PATH/yarn-global"
export YARN_PREFIX="$FNM_MULTISHELL_PATH"
export PATH="/home/takadevs/.local/share/fnm:$PATH"
eval "$(fnm env)"

# temp
export UV_USE_IO_URING=0

#SDL2
export SDL_VIDEODRIVER=wayland

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

# env
source $HOME/.config/javasecret

# zoxide 
eval "$(zoxide init zsh)"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -e "/usr/lib/kitty/shell-integration/kitty.zsh"; then source "/usr/lib/kitty/shell-integration/kitty.zsh"; fi
# END_KITTY_SHELL_INTEGRATION

# starship
eval "$(starship init zsh)"

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GLFW_IM_MODULE=ibus

# Protoc
export PATH="$HOME/Repo/protobuf/bin:$PATH"

BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

echo -e "
${BCyan}01010100 01100001 01101011 01100001 01100100 01100101 01110110
${BGreen}01010011 01101111 01100110 01110100 01110111 01100001 01110010 01100101
${BRed}01000101 01101110 01100111 01101001 01101110 01100101 01100101 01110010
"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/takadevs/Repo/google-cloud-sdk/path.zsh.inc' ]; then . '/home/takadevs/Repo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/takadevs/Repo/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/takadevs/Repo/google-cloud-sdk/completion.zsh.inc'; fi

# bun completions
[ -s "/home/takadevs/.bun/_bun" ] && source "/home/takadevs/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

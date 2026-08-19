# Setup fzf
# ---------
if [[ ! "$PATH" == */home/takadev/repo/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/takadev/repo/.fzf/bin"
fi

source <(fzf --zsh)

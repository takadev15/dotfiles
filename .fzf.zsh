# Setup fzf
# ---------
if [[ ! "$PATH" == */home/takadev/Repo/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/takadevs/Repo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/takadevs/Repo/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/takadevs/Repo/.fzf/shell/key-bindings.zsh"

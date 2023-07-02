# Setup fzf
# ---------
if [[ ! "$PATH" == */home/takadev/Repo/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/takadev/Repo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/takadev/Repo/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/takadev/Repo/.fzf/shell/key-bindings.zsh"

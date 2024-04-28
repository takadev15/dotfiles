# Setup fzf
# ---------
if [[ ! "$PATH" == */home/takadev/Repo/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/takadev/repo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/takadev/repo/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/takadev/repo/.fzf/shell/key-bindings.zsh"

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/taka15/build/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/taka15/build/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/taka15/build/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/taka15/build/.fzf/shell/key-bindings.zsh"

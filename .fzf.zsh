# Setup fzf
# ---------
if [[ ! "$PATH" == */home/taka15/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/taka15/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/taka15/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/taka15/.fzf/shell/key-bindings.zsh"

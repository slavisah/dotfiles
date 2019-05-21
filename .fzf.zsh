# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/shrkac/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/shrkac/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/shrkac/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/shrkac/.fzf/shell/key-bindings.zsh"


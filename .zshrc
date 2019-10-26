# local dotfiles repository
dotfiles=~/dotfiles

# Path to oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# Zsh and Oh-My-Zsh vars
# DEFAULT_USER=shrkac
DEFAULT_USER=$USER

# Oh My Zsh plugins
plugins=(
  git
  # aws #boot slow down
  docker
  jsontools
  vscode
  web-search
  # oc #boot slow down
  sublime
  mvn
  history
)

source $dotfiles/sandboxd
source $ZSH/oh-my-zsh.sh
source $dotfiles/slavisah.zsh-theme

# Load dotfiles
for file in $dotfiles/.{fzf.zsh,export,alias,inputrc,functions,history}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

source ~/powerlevel9k/powerlevel9k.zsh-theme

zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# miniconda3
. /usr/local/miniconda3/etc/profile.d/conda.sh
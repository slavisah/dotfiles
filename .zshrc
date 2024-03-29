# local dotfiles repository
dotfiles=~/dotfiles

# Path to oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# Zsh and Oh-My-Zsh vars
# DEFAULT_USER=shrkac
DEFAULT_USER=$USER
ZSH_DISABLE_COMPFIX=true

# Oh My Zsh plugins
plugins=(
  git
  aws #boot slow down
  docker
  jsontools
  vscode
  web-search
  # oc #boot slow down
  sublime
  mvn
  history
  zsh-autosuggestions
)

if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
  source $dotfiles/slavisah.zsh-theme
  source ~/powerlevel10k/powerlevel10k.zsh-theme
else
  ZSH_THEME="robbyrussell"
fi

source $dotfiles/sandboxd
source $ZSH/oh-my-zsh.sh

# Load dotfiles
for file in $dotfiles/.{fzf.zsh,export,alias,inputrc,functions,history}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done


zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# the fuck - correcting a previous console command
eval $(thefuck --alias)

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

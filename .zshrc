# local dotfiles repository
dotfiles=~/dotfiles

# Path to oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# Zsh and Oh-My-Zsh vars
DEFAULT_USER=shrkac
ZSH_THEME=powerlevel10k/powerlevel10k

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs status newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time root_indicator background_jobs history)
POWERLEVEL9K_MODE='nerdfont-complete'

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

source $ZSH/oh-my-zsh.sh

# Load dotfiles
for file in $dotfiles/.{fzf.zsh,export,alias,bmw-alias,inputrc,functions,history}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
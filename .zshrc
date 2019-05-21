# local dotfiles repository
dotfiles=~/dotfiles

# Path to oh-my-zsh installation
export ZSH=~/.oh-my-zsh

# Zsh and Oh-My-Zsh vars
DEFAULT_USER=shrkac
# ZSH_THEME=powerlevel9k/powerlevel9k

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

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time root_indicator background_jobs history)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'

# Load dotfiles
for file in $dotfiles/.{fzf.zsh,export,alias,bmw-alias,inputrc,functions,history}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done

source ~/powerlevel9k/powerlevel9k.zsh-theme

zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
autoload -Uz compinit
compinit
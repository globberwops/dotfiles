[[ ! -d "$HOME/.antigen" ]] && git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen"
source "$HOME/.antigen/antigen.zsh"

antigen use oh-my-zsh

if [[ "$REMOTE_CONTAINERS" != "true" ]]; then
  zstyle :omz:plugins:ssh-agent identities id_github
  antigen bundle ssh-agent
fi

antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle git-flow
antigen bundle pip
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle history-substring-search

antigen theme spaceship-prompt/spaceship-prompt

antigen apply

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

path+=("$HOME/.local/bin")

[[ -f "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

export VISUAL="code --wait"
export EDITOR="$VISUAL"

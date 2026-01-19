  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  # Fast-loading items can go here
  if [[ -f "/opt/homebrew/bin/brew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  # Set ZINIT_HOME
  ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

  # Load zinit (without immediately loading plugins)
  if [[ ! -f "$ZINIT_HOME/zinit.zsh" ]]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
  fi
  source "${ZINIT_HOME}/zinit.zsh"

  # Load Powerlevel10k with defer to prevent slowdown
  zinit ice depth=1 atload"source ~/.p10k.zsh"; zinit light romkatv/powerlevel10k

  # Defer slower plugins
  zinit wait lucid for \
    atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
    blockf \
      zsh-users/zsh-completions

  # Lightweight plugins (load immediately)
  zinit light Aloxaf/fzf-tab

  # Snippets (load immediately)
  zinit snippet OMZL::git.zsh
  zinit snippet OMZP::git
  zinit snippet OMZP::sudo

  # Keybindings (fast)
  bindkey -e
  bindkey '^p' history-search-backward
  bindkey '^n' history-search-forward
  bindkey '^[w' kill-region
  bindkey '^[[1;5C' forward-word
  bindkey '^[[1;5D' backward-word
  bindkey '^H' backward-kill-word

# Copy file content to clipboard
cpc() {
  if [[ -t 0 ]]; then
    [[ -f "$1" ]] || { echo "Usage: cpc <file>"; return 1; }
    xclip -selection clipboard -i < "$1" >/dev/null 2>&1 &
  else
    xclip -selection clipboard -i >/dev/null 2>&1 &
  fi
}

# Open file or directory in VS Code
co() {
  if [[ -z "$1" ]]; then
    code . >/dev/null 2>&1 &
  else
    code "$1" >/dev/null 2>&1 &
  fi
}


  # History settings
  HISTSIZE=5000
  HISTFILE=~/.zsh_history
  SAVEHIST=$HISTSIZE
  setopt appendhistory sharehistory histignorespace histignoredups histfindnodups

  # Completion styling
  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
  zstyle ':completion:*' menu no
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

  # Aliases
  alias ls='ls --color'
  alias vim='nvim'
  alias c='clear'
  alias py='python3'
  alias inv='nvim $(fzf -m  --preview="batcat --color=always {}")'
  alias ll="ls -l"
  alias weather="curl wttr.in"
  alias nv="nvim"

  # Defer slow integrations until after prompt is shown
  function load-slow-integrations() {
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    eval "$(zoxide init zsh)"
    # Load remaining snippets (if needed)
    # zinit snippet OMZP::archlinux
    zinit snippet OMZP::aws
    zinit snippet OMZP::kubectl
    zinit snippet OMZP::kubectx
    zinit snippet OMZP::command-not-found
  }
  # Load them 1 second after prompt is shown
  (( ${+zshdefer} )) && zsh-defer load-slow-integrations || load-slow-integrations &


yt() {
  query=$(printf '%s ' "$@" | sed 's/ /+/g')
  xdg-open "https://www.youtube.com/results?search_query=$query" >/dev/null 2>&1
}

alias obs="flatpak run com.obsproject.Studio & disown"  

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet 

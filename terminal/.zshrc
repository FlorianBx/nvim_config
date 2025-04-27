export EDITOR="nvim"
export VISUAL="nvim"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Tmux launch at start
if [ -z "$TMUX" ]; then
  tmux new-session
fi

export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

eval $(thefuck --alias)

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases

# Navigation aliases
alias ..='cd ..'
alias ...='cd ../..'

# Ls
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first --long"
alias la="eza --icons --group-directories-first --long --all"


# Git aliases
alias gs='git status -s'
alias ga='git add .'
alias gA='git commit --amend'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias suo="--set-upstream origin"

# Zsh / Nvim config
alias rl="source ~/.zshrc && clear"
alias nc="nvim ~/.config/nvim/"
alias config="nvim ~/.zshrc"
alias c="clear"
alias y='yazi'

# Dom
alias bt="shortcuts run 'Turn the Desktop Light'"

# Simple static server for HTML/CSS
alias serv='browser-sync start --server --files "*.html, css/*.css"'

# pnpm/Node commands
alias p="pnpm"
alias pu="pnpm add -g pnpm"
alias prd="pnpm run dev"
alias prt="pnpm run test"

# Custom python and shell scripts
alias gr="python3 ~/bin/gitlab-replica/generate_contributions.py"
alias delnm="~/bin/recurse-clear-nodemodules.sh"
alias sn="~/bin/neovim-shortcuts.py"
alias sd="~/bin/download_organizer.py"
alias ffm="~/bin/toMp4.py"
alias scannet="sudo ~/bin/scan_network.sh"
alias ng-struct="~/bin/ng-struct.sh"

# Difftastic git commands
alias gdl="git -c diff.external=difft log -p --ext-diff"
alias gds="git -c diff.external=difft show --ext-diff"
alias gft="git -c diff.external=difft diff"

alias nn='nvim .'
alias vim='nvim'

alias ff='fzf'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

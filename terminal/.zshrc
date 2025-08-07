export EDITOR="nvim"
export VISUAL="nvim"

bindkey -v
export KEYTIMEOUT=1

eval "$(zoxide init zsh)"

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
# bindkey -e
# bindkey '^p' history-search-backward
# bindkey '^n' history-search-forward
# bindkey '^[w' kill-region

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

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='
  --height=100%
  --layout=reverse
  --preview="bat --style=numbers --color=always --line-range=:500 {}"
  --preview-window=right:60%
'


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
alias cdf='cd "$(find . -type d | fzf)"'

# cat
alias bat='bat --theme=flbx'

# Ls
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first --long"
alias la="eza --icons --group-directories-first --long --all"

# Television
alias ff='tv files'


# Git aliases
alias gs='git status -s'
alias ga='git add .'
alias gA='git commit --amend'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias suo="--set-upstream origin"
alias gs="git stash"
alias gsp="git stash pop"

# Zsh / Nvim config
alias rl="source ~/.zshrc && clear"
alias nc="nvim ~/.config/nvim/"
alias config="nvim ~/.zshrc"
alias todoc="nvim ~/.taskrc"
alias c="clear"
alias y='yazi'

# Taskwarrior
alias ta='task add'
alias tl='task list'
alias tla='task all'
alias tld='task +PENDING due:today list'
alias td='task done'
alias tn='task next'
alias tp='task purge'
alias tc='task completed'
alias th='printf "task add \"Example task\" +tag due:tomorrow | YYYY-MM-DD\n"'

alias ds-clean='find . -name .DS_Store -delete'

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

alias youtube-dl='yt-dlp'

# Angular
alias ngn="ng new --skip-tests --style"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/florian/.lmstudio/bin"
# End of LM Studio CLI section


bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Load Angular CLI autocompletion.
source <(ng completion script)

# pnpm
export PNPM_HOME="/Users/florian/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

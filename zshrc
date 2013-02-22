# Make sure UTF-8 works (especially on Lion)
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Disable title updating if in tmux
(($+TMUX || $+SSH_CLIENT)) && DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="false"

# oh-my-zsh plugins
plugins=(bundler gem git git-flow gnu-utils npm rbenv server history-substring-search)

# Mac-specific oh-my-zsh plugins
[[ `uname` == "Darwin" ]] && plugins+=(brew lioncwd osx)

# Theme
export ZSH_THEME="jsahlen"

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# mkdir, cd into it
mkcd () {
  mkdir -p "$*"
  cd "$*"
}

# Set EDITOR to vim
export EDITOR=vim

# Load local zshrc file
if [[ -s ~/.zshrc.local ]] ; then source ~/.zshrc.local ; fi

# Set ls colors
export LSCOLORS="exfxcxdxbxegedabagacad"

# Enable `sudo` with aliases
alias sudo='sudo '

# Always use colors with `tree`
hash tree &>/dev/null && alias tree='tree -C'

# Alias to go to download dir
alias cdd="cd /Volumes/Media/Downloads"

# Alias for todotxt
alias t="todotxt"

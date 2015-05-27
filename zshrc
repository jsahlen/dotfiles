# Make sure UTF-8 works (especially on Lion)
export LC_ALL=en_US.UTF-8

# oh-my-zsh configuration paths
export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

# Theme
export ZSH_THEME="jsahlen"

# Disable title updating if in tmux
(($+TMUX || $+SSH_CLIENT)) && DISABLE_AUTO_TITLE="true"

# oh-my-zsh plugins
plugins=(colored-man dotenv gem gitfast gnu-utils heroku nodenv npm pd rake rbenv bundler server tmux tmuxinator history-substring-search vagrant z)
# Mac-specific oh-my-zsh plugins
[[ `uname` == "Darwin" ]] && plugins+=(brew brew-cask lioncwd osx)

# Load oh-my-zsh
if [[ -d $ZSH ]] ; then
  source $ZSH/oh-my-zsh.sh
else
  echo "oh-my-zsh is not installed"
fi

# mkdir, cd into it
mkcd () {
  mkdir -p "$*"
  cd "$*"
}

# Set EDITOR to vim
export EDITOR=vim

# Load local zshrc file
[[ -s $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# Set ls colors
export LSCOLORS="exfxcxdxbxegedabagacad"

# Enable `sudo` with aliases and disable corrections
alias sudo='nocorrect sudo'

# Always use colors with `tree`
hash tree &>/dev/null && alias tree='tree -C'

# Reset $TERM when ssh'ing
alias ssh='TERM=xterm-256color ssh'

# Alias for todotxt
alias t="todotxt"

# Load local aliases file
[[ -s ~/.zshaliases.local ]] && source ~/.zshaliases.local

# Skip global Zsh config
setopt no_global_rcs

# Load local completions
fpath=(~/.zsh/completion $fpath)

# Autoload
autoload -Uz add-zsh-hook
autoload -Uz colors && colors
autoload -Uz compinit && compinit -u

# Language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Editor
export EDITOR="vim"

# Path
NEW_PATH=""
NEW_PATH="$NEW_PATH:./bin" # local directory
NEW_PATH="$NEW_PATH:$HOME/.bin" # user bin directory
if [[ $OSTYPE == *darwin* ]]; then # homebrew
  NEW_PATH="$NEW_PATH:/usr/local/bin"
  NEW_PATH="$NEW_PATH:/usr/local/sbin"
  NEW_PATH="$NEW_PATH:/usr/local/share/python"
  NEW_PATH="$NEW_PATH:/usr/local/share/npm/bin"
fi
export PATH="$NEW_PATH:$PATH"

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
if [[ $UID == 0 ]]; then # no history for root
  unset HISTFILE
  export SAVEHIST=0
fi

# ls command colors
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"

# homebrew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -z "$SSH_CLIENT" ] && [ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
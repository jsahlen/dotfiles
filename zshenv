# Skip global Zsh config
setopt no_global_rcs

# Terminfo path
export TERMINFO="$HOME/.terminfo"

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
NEW_PATH="$NEW_PATH:./node_modules/.bin" # local npm bin directory
NEW_PATH="$NEW_PATH:$HOME/.zplug/bin" # zplug bin directory
NEW_PATH="$NEW_PATH:$HOME/.bin" # user bin directory
if [[ $OSTYPE == *darwin* ]]; then # homebrew
  NEW_PATH="$NEW_PATH:/usr/local/bin"
  NEW_PATH="$NEW_PATH:/usr/local/sbin"
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

# fzf directory
FOUND_FZF_DIR=0
FZF_DIR=""
fzfdirs=("$HOME/.local/fzf" "$HOME/.fzf" "/usr/local/opt/fzf" "/opt/fzf")
for fzfdir in "${fzfdirs[@]}"; do
  if [ -d $fzfdir -a -z $FZF_DIR ]; then
    FZF_DIR="$fzfdir"
  fi
done
unset fzfdirs fzfdir
export FZF_DIR

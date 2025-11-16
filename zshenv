# Skip global Zsh config
setopt no_global_rcs

# Terminfo path
export TERMINFO="$HOME/.terminfo"

# Language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# Editor
export EDITOR="vim"

# Path
if [ -z $ZSH_PATH_SET ]; then
  PATH=$(getconf PATH)

  if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]; then
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
  fi

  PATH="$PATH:$HOME/.zplug/bin" # zplug bin directory
  PATH="$PATH:$HOME/.local/bin" # user bin directory
  export PATH
fi

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
if [[ $UID == 0 ]]; then # no history for root
  unset HISTFILE
  export SAVEHIST=0
fi

# Set ZSH_CACHE_DIR for compatibility with oh-my-zsh plugins
[[ -n "$ZSH_CACHE_DIR" ]] || ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)$ZSH_CACHE_DIR/completions]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# ls command colors
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30"

# Homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# asdf-vm
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed

# load local zshenv
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"

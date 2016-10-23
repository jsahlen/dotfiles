# Awesome platform-independent ls formatting
# From https://github.com/joshdick/dotfiles/blob/master/zsh.symlink/aliases.zsh
GLS_ARGS="--classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable"
alias ls="ls $GLS_ARGS"
ls &> /dev/null
if [ $? -eq 1 ]; then # The environment ls isn't GNU ls; we're not on Linux
  # On OS X, use gls if it has been installed via Homebrew
  if hash gls &> /dev/null; then
    alias ls="gls $GLS_ARGS"
  else
    alias ls='ls -G' # If not, fall back to BSD ls
  fi
fi

# Enable some commands with aliases and disable corrections
alias cp="nocorrect cp"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"
alias sudo="nocorrect sudo"

# Directory shortcuts
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Always use colors with `tree`
hash tree &>/dev/null && alias tree="tree -C"

# Alias Neovim as `vim`
hash nvim &>/dev/null && alias vim="nvim"

# Reset $TERM when ssh'ing
alias ssh="TERM=xterm-256color ssh"

# Git
if hash git &>/dev/null; then
  alias gst="git status"
fi

# Neovim Terminal Helpers
if [ -n "${NVIM_LISTEN_ADDRESS+x}" ]; then
  alias h='nvr -o'
  alias v='nvr -O'
  alias t='nvr --remote-tab'
fi

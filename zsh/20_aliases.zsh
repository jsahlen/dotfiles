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
alias git="nocorrect git"
alias npm="nocorrect npm"

# Directory shortcuts
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Always use colors with `tree`
hash tree &>/dev/null && alias tree="tree -C"

# Reset $TERM when ssh'ing
alias ssh="TERM=xterm-256color ssh"

# Git
if hash git &>/dev/null; then
  alias gst="git status"
fi

# Tmux/Vim Helpers
if [ -n "${TMUX}" ]; then
  alias e=tmux-vim-edit
  alias t=tmux-vim-tabedit
  alias h=tmux-vim-split
  alias v=tmux-vim-vsplit
fi

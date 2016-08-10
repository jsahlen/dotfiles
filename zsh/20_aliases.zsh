# Use colors for `ls`
alias ls="ls -G"

# Enable some commands with aliases and disable corrections
alias cp="nocorrect cp"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"
alias sudo="nocorrect sudo"

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

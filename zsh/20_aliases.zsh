# Awesome platform-independent ls formatting
# https://github.com/joshdick/dotfiles/blob/main/.zsh/aliases.zsh
GLS_ARGS="--classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable --group-directories-first"
GLS_ARGS=(${=GLS_ARGS})
alias ls="ls $GLS_ARGS"
\ls ${GLS_ARGS[@]} &> /dev/null
if [ $? -eq 1 ]; then # The environment ls isn't GNU ls; we're not on Linux
  # On OS X, use gls if it has been installed via Homebrew
  if hash gls &> /dev/null; then
    alias ls="gls $GLS_ARGS"
  else
    unalias ls
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
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Always use colors with `tree`
hash tree &>/dev/null && alias tree="tree -C"

# Reset $TERM when ssh'ing
alias ssh="TERM=xterm-256color ssh"

# Git
if hash git &>/dev/null; then
  alias gst="git status"
fi

# Ruby
alias be="bundle exec"

# Tmux/Vim Helpers
if [ -n "${TMUX}" ]; then
  alias e=tmux-vim-edit
  alias t=tmux-vim-tabedit
  alias h=tmux-vim-split
  alias v=tmux-vim-vsplit
fi

# Neovim
if hash nvim &>/dev/null; then
  alias vim="nvim"
fi

# Bat
if hash bat &>/dev/null; then
  alias bathelp="bat --plain --language=help"
  help() {
    "$@" --help 2>&1 | bat --plain --language=help
  }
fi

# eza > ls
if hash eza &>/dev/null; then
  alias ls="eza -a --color=always --group-directories-first --icons=always"  # preferred listing
  alias ll="eza -al --color=always --group-directories-first --icons=always" # long format
  alias lt="eza -aT --color=always --group-directories-first --icons=always --ignore-glob='.git'" # tree listing
  alias l.="eza -a | grep -e '^\.'"                                          # show only dotfiles
  alias tree=lt
fi

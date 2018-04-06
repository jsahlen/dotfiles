# emacs mode by default
bindkey -e

# History substring search
zmodload zsh/terminfo
bindkey '\e[A' history-substring-search-up
bindkey '\e[B' history-substring-search-down

# Decide prompt color based on host name:
PROMPTCOLOR=$fg_bold[cyan] # Default
case `hostname -s` in
  skoodge)     PROMPTCOLOR=$fg_bold[red]     ;; # MacBook Air at home
  minimoose)   PROMPTCOLOR=$fg_bold[blue]    ;; # Mac Mini at home
  irken-scout) PROMPTCOLOR=$fg_bold[magenta] ;; # VPS
esac

PROMPT='%{$PROMPTCOLOR%}%p%~ ➜ %{$reset_color%}'

RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[grey]%}∓ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

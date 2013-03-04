# Decide prompt color based on host name:
PROMPTCOLOR=$fg_bold[cyan] # Default
case `hostname -s` in
  skoodge)     PROMPTCOLOR=$fg_bold[red]     ;; # MacBook Air at home
  minimoose)   PROMPTCOLOR=$fg_bold[blue]    ;; # Mac Mini at home
  irken-scout) PROMPTCOLOR=$fg_bold[magenta] ;; # VPS
esac

PROMPT='%{$PROMPTCOLOR%}%p%~ ➜ %{$reset_color%}'

RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{\e[38;5;8m%}∓ "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{\e[38;5;9m%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

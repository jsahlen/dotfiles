setopt prompt_subst

__git_prompt_dirty() {
  local d=""
  local c=""

  git diff --no-ext-diff --quiet 2>/dev/null || d=" ${ZSH_THEME_GIT_PROMPT_DIRTY="*"}"
  git diff --no-ext-diff --cached --quiet 2>/dev/null || c="${ZSH_THEME_GIT_PROMPT_STAGED="+"}"

  if [[ -z "$d$c" ]]; then
    d="${ZSH_THEME_GIT_PROMPT_CLEAN=""}"
  elif [[ -z "$d" ]]; then
    d=" "
  fi

  echo "$d$c"
}

__git_prompt() {
  local dirty="$(__git_prompt_dirty)"
  __git_ps1 "${ZSH_THEME_GIT_PROMPT_PREFIX//\%/%%}%s${dirty//\%/%%}${ZSH_THEME_GIT_PROMPT_SUFFIX//\%/%%}"
}

__prompt_char() {
  [[ $UID == 0 ]] && echo "#" || echo "➜"
}

# Decide prompt color based on host name:
PROMPT_COLOR=$fg_bold[cyan] # default
case `hostname -s | tr '[:upper:]' '[:lower:]'` in
  skoodge)     PROMPT_COLOR=$fg_bold[red]     ;;
  tallest)     PROMPT_COLOR=$fg_bold[red]     ;;
  minimoose)   PROMPT_COLOR=$fg_bold[magenta] ;;
  mortos)      PROMPT_COLOR=$fg_bold[green]   ;;
  lemongrab)   PROMPT_COLOR=$fg_bold[yellow]  ;;
esac

# Git prompt config
ZSH_THEME_GIT_PROMPT_PREFIX="%{\e[38;5;8m%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{\e[38;5;9m%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[yellow]%}±%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

# Update the prompt
PROMPT='%{$PROMPT_COLOR%}%p%~ $(__prompt_char) %{$reset_color%}'
RPROMPT='$(__git_prompt)'

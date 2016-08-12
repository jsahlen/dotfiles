function title() {
  emulate -L zsh

  local TAB_TITLE="${1}"
  local WINDOW_TITLE="${2=$1}"

  if [[ "$TERM" =~ "xterm*" ]]; then
    print -Pn "\e]0;$TAB_TITLE\a"
  fi

  if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$WINDOW_TITLE:q\a" # set window name
    print -Pn "\e]1;$TAB_TITLE:q\a" # set tab name
  else
    # Try to use terminfo to set the title
    # If the feature is available set title
    if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
      echoti tsl
      print -Pn "$TAB_TITLE"
      echoti fsl
    fi
  fi
}

# called just before the prompt is printed
function _zsh_title__precmd() {
  title "%20<...<%~" "%n@%m: %~"
}

# called just before a command is executed
function _zsh_title__preexec() {
  emulate -L zsh
  setopt extended_glob

  # cmd name only, or if this is sudo or ssh, the next cmd
  local CMD=${2[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
  local LINE="${2:gs/%/%%}"

  title "$CMD" "%n@%m: $LINE"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd _zsh_title__precmd
add-zsh-hook preexec _zsh_title__preexec

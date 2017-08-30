# FZF options
export FZF_DEFAULT_OPTS='
  --no-bold
  --color=16
  --color=fg+:7,hl:3,hl+:3
  --color=bg+:#343D46
'

export FZF_DEFAULT_COMMAND='ag -l --nocolor -g ""'

if [ -n "${TMUX}" ]; then
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT='40%'
fi

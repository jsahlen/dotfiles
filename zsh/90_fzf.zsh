# FZF options
export FZF_DEFAULT_OPTS='
  --no-bold
  --color=16
  --color=fg+:7,hl:3,hl+:3
  --color=bg+:#343D46
'

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export BAT_THEME="Oceanic Next"
export FZF_PREVIEW_COMMAND="bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}"
export FZF_COMPLETION_OPTS="--preview '(${FZF_PREVIEW_COMMAND}) 2> /dev/null | head -200'"
export FZF_CTRL_T_OPTS="$FZF_COMPLETION_OPTS"
export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --follow --glob "!.git/*" --glob "!node_modules/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if [ -n "${TMUX}" ]; then
  export FZF_TMUX=1
  export FZF_TMUX_HEIGHT='40%'
fi

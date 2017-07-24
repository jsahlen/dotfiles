# Load zplug
if [[ -f $HOME/.zplug/init.zsh ]]; then
  export ZPLUG_LOADFILE="$HOME/.zsh/zplug.zsh"
  source $HOME/.zplug/init.zsh

  zplug load
fi

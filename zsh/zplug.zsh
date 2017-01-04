zplug "zplug/zplug"

zplug "~/.zsh/vendor", \
  from:local, \
  use:"*.sh", \
  use:"*.zsh", \
  defer:0

zplug "~/.zsh", \
  from:local, \
  use:"<->_*.zsh", \
  defer:1

zplug "plugins/rbenv", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh

zplug "jsahlen/nodenv.plugin.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:2

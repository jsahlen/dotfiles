zplug "zplug/zplug"

zplug "~/.zsh/vendor", \
  from:local, \
  use:"*.sh", \
  use:"*.zsh", \
  nice:1

zplug "~/.zsh", \
  from:local, \
  use:"<->_*.zsh", \
  nice:2

zplug "plugins/rbenv", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh

zplug "jsahlen/nodenv.plugin.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", nice:19

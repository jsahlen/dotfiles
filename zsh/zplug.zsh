zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "~/.zsh/vendor", \
  from:local, \
  use:"*.sh", \
  use:"*.zsh", \
  defer:0

zplug "~/.zsh", \
  from:local, \
  use:"<->_*.zsh", \
  defer:1

zplug "jsahlen/nodenv.plugin.zsh"
zplug "jsahlen/rbenv.plugin.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "dokku/dokku", as:command, use:"contrib/dokku_client.sh", rename-to:dokku

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

if [ -d "$FZF_DIR" ]; then
  zplug "$FZF_DIR", \
    from:local, \
    use:"shell/*.zsh", \
    defer:2
fi

zplug "docker/compose", use:"contrib/completion/zsh"
zplug "jsahlen/nodenv.plugin.zsh"
zplug "jsahlen/rbenv.plugin.zsh"
zplug "jsahlen/tmux-vim-integration.plugin.zsh"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "dokku/dokku", as:command, use:"contrib/dokku_client.sh", rename-to:dokku
zplug "direnv/direnv", as:command, from:gh-r, rename-to:direnv

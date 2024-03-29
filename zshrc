# Load znap
if [[ -f $HOME/.znap/zsh-snap/znap.zsh ]]; then
  source $HOME/.znap/zsh-snap/znap.zsh

  if (( ${+commands[starship]} )); then
    znap eval starship 'starship init zsh --print-full-init'
    (( ${+SSH_TTY} )) || znap prompt
  fi

  znap source zsh-users/zsh-completions
  znap source zsh-users/zsh-history-substring-search

  znap source jsahlen/tmux-vim-integration.plugin.zsh

  # local files
  () {
    local -a files=($HOME/.zsh/<->_*.zsh)
    znap eval locals "cat $files"
  }

  # oh-my-zsh plugins
  () {
    local -a plugins=(
      asdf git
      ${commands[ansible]+ansible}
      ${commands[brew]+brew}
      ${commands[code]+vscode}
      ${commands[fzf]+fzf}
      ${commands[sudo]:+sudo}
      ${commands[systemd]:+systemd}
    )
    znap source ohmyzsh/ohmyzsh plugins/$^plugins
  }

  if (( ${+commands[asdf]} )); then
    direnv_path="$(asdf which direnv 2> /dev/null)"
    [[ -n "${direnv_path}" ]] && znap eval asdf-direnv "$direnv_path hook zsh"
  fi
fi

# Load .zshrc.local if present
if [[ -f $HOME/.zshrc.local ]]; then
  source $HOME/.zshrc.local
fi

# Set a variable to prevent $PATH from getting blown away
export ZSH_PATH_SET=1

# Set EDITOR to Neovim-remote if inside Neovim terminal
if [ -n "$NVIM_TERMINAL" ]; then
  export EDITOR="nvr --remote-tab-wait"
fi

# Set EDITOR to code if inside vscode terminal
if [ -n "$VSCODE_GIT_IPC_HANDLE" ]; then
  export EDITOR="code --wait"
fi

# Use bat as a colorizing pager for man
if hash bat &>/dev/null; then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

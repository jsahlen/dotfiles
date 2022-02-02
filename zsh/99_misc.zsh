# Set EDITOR to Neovim-remote if inside Neovim terminal
if [ -n "$NVIM_TERMINAL" ]; then
  export EDITOR="nvr --remote-tab-wait"
fi

# Set EDITOR to code if inside vscode terminal
if [ -n "$VSCODE_GIT_IPC_HANDLE" ]; then
  export EDITOR="code --wait"
fi

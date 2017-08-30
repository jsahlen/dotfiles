# Set EDITOR to Neovim-remote if inside Neovim terminal
if [ -n "$NVIM_TERMINAL" ]; then
  export EDITOR="nvr --remote-tab-wait"
fi

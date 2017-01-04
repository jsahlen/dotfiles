# Set EDITOR to Neovim if available
hash nvim &>/dev/null && export EDITOR=nvim

# Set EDITOR to Neovim-remote if inside Neovim terminal
if [ -n "$NVIM_TERMINAL" ]; then
  export EDITOR="nvr --remote-tab-wait"
fi

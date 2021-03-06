# mkdir, cd into it
mkcd () {
  mkdir -p "$*"
  cd "$*"
}

# Quickly open a tmux "project" with 3 windows: server, editor, and shell
if hash tmux &>/dev/null; then
  tmuxproject () {
    local session="${1:-$(basename $(pwd))}"

    if tmux has-session -t "${session}" &>/dev/null; then
      tmux attach -t "${session}" \; display-message "Attached to existing session"
    else
      tmux new -s "${session}" \; rename-window server \; new-window -n editor \; new-window -n shell \; select-window -t 1
    fi
  }
fi

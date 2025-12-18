OP_SSH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

if [ -e "${OP_SSH_SOCK}" ]; then
  export SSH_AUTH_SOCK="${OP_SSH_SOCK}"
fi

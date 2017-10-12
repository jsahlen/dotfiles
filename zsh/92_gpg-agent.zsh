# If gpgconf is available, launch gpg-agent automatically and use as ssh-agent
hash gpgconf &>/dev/null
if [ -z "$SSH_TTY" ] && [ $? = 0 ]; then
  gpgconf --launch gpg-agent > /dev/null 2>&1
  export SSH_AUTH_SOCK=${GNUPGHOME:-$HOME/.gnupg}/S.gpg-agent.ssh
fi

#!/bin/zsh
# https://github.com/antonio/zsh-config/blob/master/dotenv.zsh

dotenv-enter-dir () {
  if [[ -a $PWD/.env ]]; then
    source $PWD/.env
  fi
}

function chpwd() {
  dotenv-enter-dir
}

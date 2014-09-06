# $PATH

ORIGINAL_PATH=$PATH
PATH=""
# local directory
PATH="$PATH:./bin"
# personal bin directory
PATH="$PATH:$HOME/.bin"

export PATH="$PATH:$ORIGINAL_PATH"

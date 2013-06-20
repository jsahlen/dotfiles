# pro is a command to help you manage your git repositories.
# --> gem install pro

# This function does a pro search and cd's into the found directory.

pd() {
  local projDir=$(pro search $1)
  cd ${projDir}
}

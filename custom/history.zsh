
function _ignore_commands() {
  ## uncomment if HISTORY_IGNORE
  ## should use EXTENDED_GLOB syntax
  # setopt extendedglob
  for i in $ignore_commands
  do
    if [[ $1 ==  *$i* ]]; then
      return 1;
    fi
  done
}

add-zsh-hook zshaddhistory _ignore_commands

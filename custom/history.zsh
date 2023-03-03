alias lsrm='srm -lvr'

HISTSIZE=1000000

function _ignore_lsrm() {
  ## uncomment if HISTORY_IGNORE
  ## should use EXTENDED_GLOB syntax
  # setopt extendedglob
  if [[ $1 ==  lsrm* ]]; then
    return 1;
  fi
}

add-zsh-hook zshaddhistory _ignore_lsrm

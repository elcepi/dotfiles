
function _ignore_commands() {
  for i in $ignore_commands; do
    for word in "${(s: :)@}"; do
      if [[ "${word}" != "-"* ]]; then
        if realpath --quiet --canonicalize-missing "$word" | grep --quiet "${i}" ; then
          return 1
        fi
      fi
    done
  done
}

if typeset -f add-zsh-hook > /dev/null; then
  add-zsh-hook zshaddhistory _ignore_commands
fi


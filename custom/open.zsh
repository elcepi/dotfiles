
o () {
  command=/usr/bin/xdg-open;
  if [ -x $command ]; then
    for i in $@; do
      $command $i
    done
  fi
}


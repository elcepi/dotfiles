
o () {
  case $XDG_CURRENT_DESKTOP in
    GMOME)
      command=/usr/bin/xdg-open ;;
    KDE)
      command=/usr/bin/open ;;
    *)
      command=/dev/null ;;
  esac

  if [ -x $command ]; then
    for i in $@; do
      $command $i
    done
  else
    echo "$basename: no open command find"
  fi
}


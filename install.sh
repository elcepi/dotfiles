#!/bin/bash


# First we install oh-my-zsh
if [ ! -d "${HOME}""/.oh-my-zsh"  ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" "--unattended"
fi

# Vim plugin ideas are borrow from here
# http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
WORK=${HOME}"/.dotfiles/"
if [ ! -d ${WORK} ]; then
  git clone --recursive http://github.com/jose-espinosa/dotfiles.git ${WORK}
  cd ${WORK}
  git pull origin master
  git submodule foreach git pull origin master
fi

## declare an array variable
declare -a FILES=("abcde.conf" "ackrc" "gitconfig" "zshrc.local" "vim" "vimrc" "gvimrc" "rvmrc" "mongorc.js" "selected_editor")

# loop through above array (quotes are important if your elements may contain spaces)
for f in "${FILES[@]}"
do
  if [ -e "${WORK}""${f}""."`hostname` ]; then
    ln -s "${WORK}${f}".`hostname` "${HOME}/"".""${f}"
  else
    ln -s "${WORK}${f}" "${HOME}/"".""${f}"
  fi
done

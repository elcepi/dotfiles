#!/bin/bash

function link_config_file()
{  if [ -e "${1}""."`hostname` ]; then
    ln -s "${1}".`hostname` "${2}"
  elif [ -e "${1}" ]; then
    ln -s "${1}" "${2}"
  fi
}

# First we install oh-my-zsh
if [ ! -d "${HOME}""/.oh-my-zsh"  ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" "--unattended"
fi

# Vim plugin ideas are borrow from here
# http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
WORK=${HOME}"/.dotfiles/"
if [ ! -d ${WORK} ]; then
  git clone --recursive git@github.com:jose-espinosa/dotfiles.git ${WORK}
  cd ${WORK}
  git pull origin master
  git submodule foreach git pull origin master
fi

## declare an array variable
declare -a FILES=("abcde.conf" "ackrc" "gitconfig" "zshrc.local.pre" "zshrc.local.post" "vim" "vimrc" "gvimrc" "rvmrc" "mongorc.js" "selected_editor" "msmtprc")

# loop through above array (quotes are important if your elements may contain spaces)
for f in "${FILES[@]}"
do
  link_config_file "${WORK}${f}" "${HOME}/"".""${f}"
done

#Install file not in ${HOME}
mkdir -p .shh
link_config_file "${WORK}""ssh_config" "${HOME}/"".""ssh/config"

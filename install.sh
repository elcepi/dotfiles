#!/bin/sh -x

#SHELL := /bin/bash

# Vim plugin ideas are borrow from here
# http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

# First we install oh-my-zshell if not available
if [ ! -d $https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh{HOME}/.oh-my-zsh ]; then
  curl -L  | sh
  cd ${HOME}/.oh-my-zsh
  git remote rm origin
  git remote add origin https://github.com/elcepi/oh-my-zsh
  git remote add upstream https://github.com/robbyrussell/oh-my-zsh
  git fetch origin
  git branch --track master origin/master
  git pull origin master
fi

if [ ! -d ${HOME}/.dotfiles ]; then
  cd ${HOME}
  git clone --recursive http://github.com/jose-espinosa/dotfiles.git ${HOME}/.dotfiles
  cd ${HOME}/.dotfiles
  git pull origin master
  git submodule foreach git pull origin master
fi

if [ ! -f ${HOME}/.gitconfig ]; then
  ln -s ${HOME}/.dotfiles/gitconfig ${HOME}/.gitconfig
fi

if [ ! -f ${HOME}/.ackrc ]; then
  ln -s ${HOME}/.dotfiles/ackrc ${HOME}/.ackrc
fi

# The zshrc config is machine dependent, we use the host name to get the rigth one
if [ -f ${HOME}/.dotfiles/zshrc.local.`hostname` ] && [ ! -f ${HOME}/.zshrc.local ]; then
  ln -s ${HOME}/.dotfiles/zshrc.local.`hostname` ${HOME}/.zshrc.local
fi

if [ ! -d ${HOME}/.vim ]; then
  ln -s ${HOME}/.dotfiles/vim ${HOME}/.vim
fi

if [ ! -f ${HOME}/.vimrc ]; then
  ln -s ${HOME}/.dotfiles/vimrc ${HOME}/.vimrc
fi

if [ ! -f ${HOME}/.gvimrc ]; then
  ln -s ${HOME}/.dotfiles/gvimrc ${HOME}/.gvimrc
fi

if [ ! -f ${HOME}/.rvmrc ]; then
  ln -s ${HOME}/.dotfiles/rvmrc ${HOME}/.rvmrc
fi

if [ ! -f ${HOME}/.mongorc.js ]; then
  ln -s ${HOME}/.dotfiles/mongorc.js ${HOME}/.mongorc.js
fi


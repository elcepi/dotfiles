#!/bin/sh

git clone git@github.com:jose-espinosa/dotfiles.git ${HOME}/.dotfiles

ln -s .dotfiles/gitconfig ${HOME}/.gitconfig

if [ -f .dotfiles/zshrc.local.`hostname` ]; then
  ln -s .dotfiles/zshrc.local.`hostname` ${HOME}/.zshrc.local
fi



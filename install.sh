#!/bin/sh -x

# First we install oh-my-zshell if not available
if [ ! -d ${HOME}/.oh-my-zsh ]; then
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  cd ${HOME}/.oh-my-zsh
  git remote rm origin
  git remote add origin git@github.com:jose-espinosa/oh-my-zsh.git
  git remote add upstream git://github.com/robbyrussell/oh-my-zsh.git
  git fetch origin
  git branch --set-upstream-to=origin/master master
fi
git pull origin master

if [ ! -d ${HOME}/.dotfiles ]; then
  git clone git@github.com:jose-espinosa/dotfiles.git ${HOME}/.dotfiles
else
  git pull origin master
fi

if [ ! -f ${HOME}/.gitconfig ]; then
  ln -s .dotfiles/gitconfig ${HOME}/.gitconfig
fi

# The zshrc config is machine dependent, we use the host name to get the rigth one
if [ -f .dotfiles/zshrc.local.`hostname` ] && [ ! -f ${HOME}/.zshrc.local ]; then
  ln -s .dotfiles/zshrc.local.`hostname` ${HOME}/.zshrc.local
fi



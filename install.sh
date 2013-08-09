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
  git pull origin master
fi

git clone git@github.com:jose-espinosa/dotfiles.git ${HOME}/.dotfiles

ln -s .dotfiles/gitconfig ${HOME}/.gitconfig

# The zshrc config is machine dependent, we use the host name to get the rigth one
if [ -f .dotfiles/zshrc.local.`hostname` ]; then
  ln -s .dotfiles/zshrc.local.`hostname` ${HOME}/.zshrc.local
fi



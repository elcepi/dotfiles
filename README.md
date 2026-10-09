dotfiles
========

My Central Repository for my dot files

To install use

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/elcepi/dotfiles/master/install.sh)"
```

Change
```
source $ZSH/oh-my-zsh.sh
```
to
```
source $HOME/.zshrc.local.pre

source $ZSH/oh-my-zsh.sh

source $HOME/.zshrc.local.post
```

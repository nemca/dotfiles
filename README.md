# dotfiles

#### Install Homebrew
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Install all brew dependencies
```bash
brew bundle
```

#### Copy dotfiles to the appropriate places
```bash
make
```

#### Make zsh the new default
```bash
chsh -s /bin/zsh
```

#### Setup VIM
```bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

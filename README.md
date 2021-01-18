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
if ! fgrep -q /usr/local/bin/zsh /etc/shells; then
  echo /usr/local/bin/zsh | sudo tee -a /etc/shells
fi
chsh -s /usr/local/bin/zsh
```

#### Setup VIM
```bash
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

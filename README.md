# dotfiles

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

## Homebrew

#### Install Homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

#### Install utils
```bash
brew install git
brew install coreutils
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install grep --with-default-names
brew install tmux
brew install wget
brew install less
brew install fish
brew install unzip
brew install vim --override-system-vi
brew install macvim --override-system-vim --custom-system-icons
```

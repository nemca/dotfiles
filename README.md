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
brew install tmux
brew install wget
brew install fish
brew install vim --with-override-system-vi
brew install macvim --with-override-system-vim --custom-system-icons
brew unlink vim
brew link --overwrite macvim
```

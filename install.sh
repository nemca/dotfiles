#! /usr/bin/env bash

eval env | egrep HOME 1>/dev/null 2>&1

# vim
cp -r vim $HOME/.vim
cp vimrc $HOME/.vimrc
cp bashrc $HOME/.bashrc
cp gitconfig $HOME/.gitconfig
cp tmux.conf $HOME/.tmux.conf
cp muttrc $HOME/.muttrc
cp -r mcabber $HOME/.mcabber

# fish shell
curl -sL http://get.oh-my.fish | fish
omf install eclm
omf theme eclm

cp fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish
cp config.fish $HOME/.config/fish/config.fish
cp ls.fish $HOME/.config/fish/functions/ls.fish

#! /usr/bin/env bash

eval env | egrep HOME 1>/dev/null 2>&1

# vim
cp -r vim $HOME/.vim
cp vimrc $HOME/.vimrc

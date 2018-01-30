#!/bin/bash

# Clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Vim config 
mv .vimrc ~/.vimrc
vim +PluginInstall +qall # Install all Vundle plugins

# Add bash config 
echo "TERM=xterm-256color" >> .bashrc

# Add screen config 
echo "altscreen on" >> .screenrc
echo "term screen-256color" >> .screenrc
echo "shell -$SHELL" >> .screenrc

# Clean up
rm -rf ../dotfiles

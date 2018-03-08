# !/bin/bash

# @author Matthew chan
# @date March 7, 2018
# @description  Set up script to install vim with all of my preferred plugins and configs
# @dependencies Vim 8.0, Python (either 2.7 or 3), Jedi (a Python autocomplete package):w

# Clone Vundle, our vim package manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Create symbolic link in the home dir to our .vimrc file
# NOTE: Moving the .vimrc file in the repo will break the symlink
ln -s $(pwd)/.vimrc ~/.vimrc

# Install Vundle plugins
vim +PluginInstall +qall 

##########################
# Optional configuration #
##########################

# Enable 256 color terminal
# echo "TERM=xterm-256color" >> .bashrc

# Enable alternate screen (removes terminal output from vi after closing vi)
# echo "altscreen on" >> .screenrc
# Enable 256 color terminal
# echo "term screen-256color" >> .screenrc
# Loads bash configs into screen (i.e. aliases and path)
# echo "shell -$SHELL" >> .screenrc

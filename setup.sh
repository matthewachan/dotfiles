# !/bin/bash

# @author Matthew chan
# @date March 7, 2018
# @description  Set up script to install vim with all of my preferred plugins and configs
# @dependencies Vim 8.0, Python (either 2.7 or 3), Jedi (a Python autocomplete package)

# Clone Vundle, our vim package manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Create symbolic link in the home dir to our configuration files
# NOTE: Moving the .vimrc file in the repo will break the symlink
ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.screenrc ~/.screenrc


# Install Vundle plugins
vim +PluginInstall +qall 

# Rename .vimrc file if it exists
if [ -f "~/.vimrc" ]; then
  mv ~/.vimrc ~/.vimrc_$(date +%Y%s%m%3N)
fi

# Create colorscheme dir (if it doesn't already exist)
if [ ! -d "~/.vim/colors" ]; then
  mkdir ~/.vim/colors
fi

# Move colorscheme files into colorscheme dir
mv ~/.vim/bundle/vim-colorschemes/colors/* ~/.vim/colors

##########################
# Optional configuration #
##########################

# Enable 256 color terminal
# echo "TERM=xterm-256color" >> .bashrc

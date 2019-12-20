# !/bin/bash
# @author Matthew chan
# @date March 7, 2018
# @description  Set up script to install vim with all of my preferred plugins and configs
# @dependencies Vim 8.0, Python (either 2.7 or 3), Jedi (a Python autocomplete package)

# Rename old dotfiles files if they exist
if [ -e ~/.vimrc ]; then
  mv ~/.vimrc ~/.vimrc_$(date +%Y%m%d%H%M%S%3N)
fi
if [ -e ~/.screenrc ]; then
  mv ~/.screenrc ~/.screenrc_$(date +%Y%m%d%H%M%S%3N)
fi
if [ -e ~/.zshrc ]; then
  mv ~/.zshrc ~/.zshrc_$(date +%Y%m%d%H%M%S%3N)
fi
if [ -e ~/.tmux.conf ]; then
  mv ~/.tmux.conf ~/.tmux.conf_$(date +%Y%m%d%H%M%S%3N)
fi


# Create symbolic link in the home dir to our configuration files
# NOTE: Moving the files in the repo will break the symlink
ln -F -s $(pwd)/.vimrc ~/.vimrc
ln -F -s $(pwd)/.screenrc ~/.screenrc
ln -F -s $(pwd)/.zshrc ~/.zshrc
ln -F -s $(pwd)/.tmux.conf ~/.tmux.conf

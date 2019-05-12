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

# Clone Vundle, our vim package manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Create symbolic link in the home dir to our configuration files
# NOTE: Moving the files in the repo will break the symlink
ln -F -s $(pwd)/.vimrc ~/.vimrc
ln -F -s $(pwd)/.screenrc ~/.screenrc
ln -F -s $(pwd)/.zshrc ~/.zshrc
ln -F -s $(pwd)/.tmux.conf ~/.tmux.conf

# Install Vundle plugins
vim +PluginInstall +qall 

# Create colorscheme dir (if it doesn't already exist)
if [ ! -d "~/.vim/colors" ]; then
  mkdir ~/.vim/colors
fi

# Move colorscheme files into colorscheme dir
mv ~/.vim/bundle/vim-colorschemes/colors/* ~/.vim/colors

# Set up for YouCompleteMe
sudo apt install -y clang cmake python-dev python3-dev
mkdir ~/ycm_build && cd ~/ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release
mkdir ~/regex_build && cd ~/regex_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/cregex
cmake --build . --target _regex --config Release

# Set up for zsh
sudo apt install -y zsh wget git
chsh -s $(which zsh)

sudo apt-get install -y fonts-powerline

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

echo "Installation complete. Log out and log in again to use zsh"

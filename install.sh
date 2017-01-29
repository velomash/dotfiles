#! /bin/bash

#
# Attempting an installation script for these preferences
#
#

echo "Installing command line preferences..."

echo "linking bash_rc and vimrc"
rm ~/.bash_profile
ln ./bash_profile ~/.bash_profile
rm ~/.vimrc
ln ./vimrc ~/.vimrc

echo "installing vim plugins"
echo "get vundle first"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "then install plugins"
vim +PluginInstall +qall



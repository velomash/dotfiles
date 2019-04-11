#! /bin/bash

#
# Attempting an installation script for these preferences
#
#

echo "Installing command line preferences..."

echo "linking bash_rc and vimrc to your home directory"
ln -sf $PWD/bash_profile ~/.bash_profile
ln -sf $PWD/vimrc ~/.vimrc

echo "installing vim plugins"
vim +PlugInstall

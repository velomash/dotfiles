#! /bin/bash

#
# Attempting an installation script for these preferences
#
#

echo "Installing command line preferences..."

echo "linking bash_rc, vimrc, and tern-config"
ln -sf $PWD/bash_profile ~/.bash_profile
ln -sf $PWD/vimrc ~/.vimrc
ln -sf $PWD/tern-config ~/.tern-config

echo "installing vim plugins"
vim +PlugInstall



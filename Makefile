# -------------------------------------
# Command Line Preferences
# Install Commands
# -------------------------------------

.PHONY: vim
vim:
	echo "Installing vim..."
	brew update
	brew install vim --with-override-system-vi
	echo "linking bash_rc and vimrc to your home directory"
	ln -sf $PWD/bash_profile ~/.bash_profile
	ln -sf $PWD/vimrc ~/.vimrc
	echo "installing vim plugins"
	vim +PlugInstall

.PHONY: mutt
mutt:
	echo "Installing mutt and its dependencies..."
	brew update
	brew install gpgme
	brew install notmuch
	brew install isync
	brew install msmtp
	brew install neomutt

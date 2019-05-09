#!/bin/bash

# Install xcode command-line tools
xcode-select --install

# Make sure we’re using the latest Homebrew
brew update
brew upgrade

# GNU core utilities (those that come with OS X are outdated)
brew install coreutils
brew install moreutils
brew install findutils
brew install gnu-sed --with-default-names

# upgrade bash
brew install bash
brew install bash-completion
brew install homebrew/completions/brew-cask-completion

# Install wget with IRI support
brew install wget --with-iri

# Install more recent versions of some OS X tools
brew install vim --with-override-system-vi
brew install ripgrep

# Install other useful binaries
brew install ffmpeg --with-libvpx
brew install fzf
brew install git
brew install gnupg
brew install imagemagick --with-webp
brew install node # This installs `npm` too using the recommended installation method
brew install rename
brew install svgo
brew install the_silver_searcher
brew install terminal-notifier
brew install awscli

# Remove outdated versions from the cellar
brew cleanup

npm install -g prettier
npm install -g ngrok
npm install -g typescript
npm install -g javascript-typescript-langserver

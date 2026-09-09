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
brew install gh                 # GitHub CLI (used by nvim :Gist)
brew install tree-sitter-cli    # parser compiler for nvim-treesitter (main branch)
brew install gnupg
brew install imagemagick --with-webp
brew install node # This installs `npm` too using the recommended installation method
brew install rename
brew install svgo
brew install the_silver_searcher
brew install terminal-notifier
brew install awscli
brew install asdf                # version manager (Go rewrite; shims wired up in .zshrc)

# Remove outdated versions from the cellar
brew cleanup

npm install -g prettier
npm install -g ngrok
# TypeScript 7+ is the Go-native rewrite; `tsc --lsp --stdio` is the language
# server, so no separate langserver package is needed.
npm install -g typescript

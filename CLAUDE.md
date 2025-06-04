# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal macOS dotfiles repository using a symlink-based approach. Configuration files are stored here and linked to their appropriate locations using scripts.

## Setup and Installation

### Initial Setup
```bash
# Install programs via Homebrew
./install-programs.sh

# Create symbolic links for all configurations  
./setup-symlinks.sh

# Install email client (optional)
./install-mutt.sh
```

### Symlink Management
The `setup-symlinks.sh` script handles three types of linking:
- Hidden dotfiles (`.zshrc`, etc.) → `$HOME/`
- Zsh custom configs → `$HOME/.oh-my-zsh/custom/`
- Neovim config directory → `$HOME/.config/nvim/`

Safe to run multiple times; prompts before overwriting existing files.

## Configuration Architecture

### Shell Environment (Zsh + Oh My Zsh)
- **Main config**: `.zshrc` with custom prompt and extensive aliases
- **Modular structure** in `zsh-custom/`:
  - `aliases_general.zsh`: General productivity and Git shortcuts
  - `aliases_goat.zsh`: Work-specific project shortcuts
  - `env_vars.zsh`: Environment variables with macOS Keychain integration
  - `path.zsh`: Custom PATH configurations

### Editor (Neovim)
Modern Lua-based configuration with:
- **Plugin manager**: Packer.nvim (auto-installs on first run)
- **LSP**: TypeScript (tsserver), Go (gopls)
- **Completion**: nvim-cmp with buffer, path, and LSP sources
- **AI integration**: CodeCompanion with Anthropic API
- **Key tools**: FZF, NERDTree, fugitive, vim-test

### Security
API keys stored in macOS Keychain, accessed via `get_pw()` function in `env_vars.zsh`.

## Development Commands

### Neovim Plugin Management
```bash
# From within Neovim
:PackerInstall  # Install plugins
:PackerUpdate   # Update plugins
:PackerSync     # Clean and update
```

### Testing (via vim-test)
```bash
# JavaScript/TypeScript projects use Jest with --watch flag
# Tests run in vertical split terminal within Neovim
```

### Git Workflow
Extensive Git aliases available:
- `s` = git status
- `a` = git add -Av  
- `c` = git commit -v
- `co` = git checkout
- `cob` = git checkout -b
- `cof` = git checkout $(git branch | fzf)  # Interactive branch selection

### FZF Integration
- `Find` command: Search file contents with ripgrep
- `FindCurrentWord`: Search for word under cursor
- Default command configured for file discovery with ripgrep

## Work Environment Integration

This setup is configured for GOAT company development:
- Private Go modules: `GOPRIVATE="github.com/goatapp/*"`
- Work-specific aliases in `aliases_goat.zsh`
- Environment variables for staging/production systems
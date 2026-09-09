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
The `setup-symlinks.sh` script handles these types of linking:
- Hidden dotfiles (`.zshrc`, etc.) → `$HOME/`
- Zsh custom configs → `$HOME/.oh-my-zsh/custom/`
- Neovim config directory → `$HOME/.config/nvim/`

Claude Code configuration is intentionally *not* managed by this repo — it is maintained per-machine to avoid committing secrets (e.g. MCP tokens) into version control.

Safe to run multiple times; prompts before overwriting existing files.

## Configuration Architecture

### Shell Environment (Zsh + Oh My Zsh)
- **Main config**: `.zshrc` with custom prompt and extensive aliases
- **Modular structure** in `zsh-custom/`:
  - `aliases_general.zsh`: General productivity and Git shortcuts
  - `aliases_goat.zsh`: Work-specific project shortcuts
  - `env_vars.zsh`: Environment variables with macOS Keychain integration
  - `path.zsh`: Custom PATH configurations

### Version Management (asdf)
- Installed via Homebrew (`brew install asdf` in `install-programs.sh`) — the 0.16+ Go rewrite, so no script is sourced.
- `.zshrc` prepends `${ASDF_DATA_DIR:-$HOME/.asdf}/shims` to `PATH` after Homebrew's `shellenv`, so asdf-managed tools take precedence over Homebrew-installed ones.
- Zsh completions load automatically from Homebrew's `site-functions` (the existing `compinit` block).
- Per-project tool versions go in a `.tool-versions` file; install plugins with `asdf plugin add <tool>`.

### Editor (Neovim)
Modern Lua-based configuration with:
- **Plugin manager**: lazy.nvim (auto-installs on first run; `nvim/lazy-lock.json` pins versions)
- **LSP**: TypeScript (ts_ls), Go (gopls), Ruby (ruby_lsp) via `vim.lsp.config` / `vim.lsp.enable`
- **Completion**: nvim-cmp with buffer, path, and LSP sources
- **Syntax**: nvim-treesitter (`main` branch — needs the `tree-sitter` CLI, installed via `tree-sitter-cli` in `install-programs.sh`; parsers compile locally)
- **Key tools**: FZF, NERDTree, fugitive, nvim-autopairs
- **`:Gist`**: creates a GitHub gist via the `gh` CLI. `:Gist` = whole file, `:'<,'>Gist` = selection only, `:Gist!` = public. URL is copied to the `+` register.

**Installing Vim plugins**: Add a spec (`'author/plugin-name'` or `{ 'author/plugin-name', ... }`) to the table passed to `require('lazy').setup({ ... })` in `nvim/lua/plugins.lua`, then run `:Lazy sync` in Neovim.

### Security
API keys stored in macOS Keychain, accessed via `get_pw()` function in `env_vars.zsh`.

## Development Commands

### Neovim Plugin Management
```bash
# From within Neovim
:Lazy           # Open the lazy.nvim UI
:Lazy install   # Install missing plugins
:Lazy update    # Update plugins
:Lazy sync      # Install + update + clean, then write lazy-lock.json
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
- `<Leader>s` (`:Files`): fuzzy-find by filename
- `<Leader>f` (`:LiveGrep`): fuzzy-find by file *contents*. Re-runs ripgrep on
  every keystroke (via fzf.vim's `fzf#vim#grep2`, the engine behind its `:RG`),
  so the whole tree stays searchable as the query changes. The query is seeded
  from the visual selection, else the word under the cursor, else left empty for
  a freeform search. Seeds are regex-escaped so they match literally; anything
  typed afterwards is a smart-case regex. Logic lives in `nvim/lua/grep.lua`.
- `Find` / `FindCurrentWord`: the older one-shot variants — ripgrep runs once and
  fzf only fuzzy-filters that fixed result set.
- Default command configured for file discovery with ripgrep

These commands call fzf.vim's autoload functions directly, so they load the
plugin via `require('lazy').load` first; fzf.vim is lazy-loaded by command name
and their definitions in `plugins.lua` replace lazy.nvim's stubs.

## Work Environment Integration

This setup is configured for GOAT company development:
- Private Go modules: `GOPRIVATE="github.com/goatapp/*"`
- Work-specific aliases in `aliases_goat.zsh`
- Environment variables for staging/production systems
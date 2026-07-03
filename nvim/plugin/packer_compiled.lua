-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/adam.trimble@goat.com/.cache/nvim/packer_hererocks/2.1.1782726002/share/lua/5.1/?.lua;/Users/adam.trimble@goat.com/.cache/nvim/packer_hererocks/2.1.1782726002/share/lua/5.1/?/init.lua;/Users/adam.trimble@goat.com/.cache/nvim/packer_hererocks/2.1.1782726002/lib/luarocks/rocks-5.1/?.lua;/Users/adam.trimble@goat.com/.cache/nvim/packer_hererocks/2.1.1782726002/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/adam.trimble@goat.com/.cache/nvim/packer_hererocks/2.1.1782726002/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  fzf = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    commands = { "Files", "Buffers", "Rg", "Find", "FindCurrentWord", "GFiles" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  neotest = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  nerdtree = {
    commands = { "NERDTreeToggle", "NERDTreeFind", "NERDTreeFocus", "NERDTreeClose", "NERDTreeRefreshRoot" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/nerdtree",
    url = "https://github.com/scrooloose/nerdtree"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/monsonjeremy/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-fugitive"] = {
    after = { "vim-rhubarb" },
    commands = { "Git", "G", "Gdiffsplit", "Gblame", "Gread", "Gwrite" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gist"] = {
    commands = { "Gist" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-gist",
    url = "https://github.com/mattn/vim-gist"
  },
  ["vim-go"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-prettier"] = {
    commands = { "Prettier", "PrettierAsync" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-prettier",
    url = "https://github.com/prettier/vim-prettier"
  },
  ["vim-prisma"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-prisma",
    url = "https://github.com/prisma/vim-prisma"
  },
  ["vim-rails"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-rhubarb"] = {
    load_after = {
      ["vim-fugitive"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-test"] = {
    commands = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-test",
    url = "https://github.com/janko/vim-test"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["webapi-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'TestNearest', function(cmdargs)
          require('packer.load')({'vim-test'}, { cmd = 'TestNearest', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-test'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TestNearest ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TestFile', function(cmdargs)
          require('packer.load')({'vim-test'}, { cmd = 'TestFile', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-test'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TestFile ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TestSuite', function(cmdargs)
          require('packer.load')({'vim-test'}, { cmd = 'TestSuite', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-test'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TestSuite ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TestLast', function(cmdargs)
          require('packer.load')({'vim-test'}, { cmd = 'TestLast', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-test'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TestLast ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TestVisit', function(cmdargs)
          require('packer.load')({'vim-test'}, { cmd = 'TestVisit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-test'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TestVisit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Dispatch', function(cmdargs)
          require('packer.load')({'vim-dispatch'}, { cmd = 'Dispatch', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dispatch'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Dispatch ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Git', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Git', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Git ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'G', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'G', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('G ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gdiffsplit', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gdiffsplit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gdiffsplit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gblame', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gblame', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gblame ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gread', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gread', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gread ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gwrite', function(cmdargs)
          require('packer.load')({'vim-fugitive'}, { cmd = 'Gwrite', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-fugitive'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gwrite ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Start', function(cmdargs)
          require('packer.load')({'vim-dispatch'}, { cmd = 'Start', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dispatch'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Start ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Gist', function(cmdargs)
          require('packer.load')({'vim-gist'}, { cmd = 'Gist', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-gist'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Gist ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NERDTreeToggle', function(cmdargs)
          require('packer.load')({'nerdtree'}, { cmd = 'NERDTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nerdtree'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NERDTreeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NERDTreeFind', function(cmdargs)
          require('packer.load')({'nerdtree'}, { cmd = 'NERDTreeFind', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nerdtree'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NERDTreeFind ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NERDTreeFocus', function(cmdargs)
          require('packer.load')({'nerdtree'}, { cmd = 'NERDTreeFocus', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nerdtree'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NERDTreeFocus ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NERDTreeClose', function(cmdargs)
          require('packer.load')({'nerdtree'}, { cmd = 'NERDTreeClose', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nerdtree'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NERDTreeClose ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NERDTreeRefreshRoot', function(cmdargs)
          require('packer.load')({'nerdtree'}, { cmd = 'NERDTreeRefreshRoot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nerdtree'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NERDTreeRefreshRoot ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Prettier', function(cmdargs)
          require('packer.load')({'vim-prettier'}, { cmd = 'Prettier', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-prettier'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Prettier ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'PrettierAsync', function(cmdargs)
          require('packer.load')({'vim-prettier'}, { cmd = 'PrettierAsync', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-prettier'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('PrettierAsync ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Focus', function(cmdargs)
          require('packer.load')({'vim-dispatch'}, { cmd = 'Focus', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dispatch'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Focus ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Files', function(cmdargs)
          require('packer.load')({'fzf.vim'}, { cmd = 'Files', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fzf.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Files ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Buffers', function(cmdargs)
          require('packer.load')({'fzf.vim'}, { cmd = 'Buffers', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fzf.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Buffers ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Rg', function(cmdargs)
          require('packer.load')({'fzf.vim'}, { cmd = 'Rg', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fzf.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Rg ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Find', function(cmdargs)
          require('packer.load')({'fzf.vim'}, { cmd = 'Find', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fzf.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Find ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'FindCurrentWord', function(cmdargs)
          require('packer.load')({'fzf.vim'}, { cmd = 'FindCurrentWord', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fzf.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('FindCurrentWord ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'GFiles', function(cmdargs)
          require('packer.load')({'fzf.vim'}, { cmd = 'GFiles', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'fzf.vim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('GFiles ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Make', function(cmdargs)
          require('packer.load')({'vim-dispatch'}, { cmd = 'Make', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-dispatch'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Make ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType prisma ++once lua require("packer.load")({'vim-prisma'}, { ft = "prisma" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-rails'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType eruby ++once lua require("packer.load")({'vim-rails'}, { ft = "eruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'vim-go'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType gowork ++once lua require("packer.load")({'vim-go'}, { ft = "gowork" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'vim-go'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
time([[Sourcing ftdetect script at: /Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-prisma/ftdetect/prisma.vim]], true)
vim.cmd [[source /Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-prisma/ftdetect/prisma.vim]]
time([[Sourcing ftdetect script at: /Users/adam.trimble@goat.com/.local/share/nvim/site/pack/packer/opt/vim-prisma/ftdetect/prisma.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

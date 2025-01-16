-- Load Packer plugin manager
require('plugins.packer')

-- Set up LSP configurations
require('plugins.lsp-zero')
require('plugins.lsp_setup')
require('plugins.completion')
require('plugins.language_servers')
require('plugins.lua_ls')

-- Set up Telescope
require('plugins.telescope')

-- Set up Treesitter
require('plugins.treesitter')

-- Set up nvim-tree
require('plugins.nvim-tree')

-- Set up nvim-surround
require('plugins.nvim-surround')

-- General Settings
require('general')

-- Packer Install
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd([[packadd packer.nvim]])
  end
end

ensure_packer()

-- Packer Config
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Plugin manager
  use 'nvim-treesitter/nvim-treesitter' -- Treesitter syntax highlighting
  use 'tpope/vim-fugitive' -- Fugitive for Git
  use 'sainnhe/sonokai' -- Sonokai color scheme
  use 'rose-pine/neovim' -- Rose-pine color scheme
  use 'folke/tokyonight.nvim' -- Tokyonight color scheme
  use { 'nvim-tree/nvim-tree.lua', -- NVIM-Tree, a file explorer
requires = { { 'nvim-tree/nvim-web-devicons' } }
}
  use {
          'VonHeikemen/lsp-zero.nvim', -- LSP Zero
          -- LSP Support
          { 'neovim/nvim-lspconfig' },
          { 'williamboman/mason.nvim' },
          { 'williamboman/mason-lspconfig.nvim' },
          -- Autocompletion
          { 'hrsh7th/nvim-cmp' },
          { 'hrsh7th/cmp-nvim-lsp' },
          { 'hrsh7th/cmp-buffer' },
          { 'hrsh7th/cmp-path' },
          { 'hrsh7th/cmp-nvim-lua' },
          { 'saadparwaiz1/cmp_luasnip' },
          -- Snippets
          { 'L3MON4D3/LuaSnip' },
          { 'rafamadriz/friendly-snippets' },
          -- Language Servers
          -- Pyright for Python (npm install -g pyright)
          -- LuaLS for Lua (scoop install lua-language-server)
          -- { 'golang/tools/tree/master/gopls' } -- Gopls for Golang
  }
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.8', -- Telescope for FZF
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} } }
  use 'kylechui/nvim-surround' -- NVIM-Surround
end)

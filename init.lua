-- Install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load Lazy and plugins
require("lazy").setup({
  { -- Treesitter
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
      })
    end,
  },

  { -- Fugitive
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
  },

  { -- Colorscheme
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd[[colorscheme tokyonight]]
    end,
  },

  { -- Autocompletion
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'nvim_lsp_signature_help' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>'] = cmp.mapping.confirm({ select = false }),
          ['<C-Space>'] = cmp.mapping.complete(),
        }),
      })
    end,
  },

  { -- Telescope
    "nvim-telescope/telescope.nvim",
    lazy = false,
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = { vertical = { width = 0.5 } },
        },
      })
    end,
  },

  { -- File Explorer
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  { -- VimBeGood
    "ThePrimeagen/vim-be-good",
    lazy = false,
  },

  { -- lsp-zero v3 
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "VonHeikemen/lsp-zero.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("lsp") -- Load the Language Server configurations (lua/lsp.lua)
    end,
  },
})

-- Load additional settings
require("general") -- (lua/general.lua)

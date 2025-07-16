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
    build = ":TSUpdate",
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
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },    -- enable Luasnip source
        { name = 'buffer' },     -- optional: buffer words
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
      }),
    })
    end,
  },

  { -- Telescope
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
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
    cmd = "NvimTreeToggle",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  { -- VimBeGood
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },

  { -- Mason
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
  },

  { -- Mason LSPConfig
    "williamboman/mason-lspconfig.nvim",
    version = "1.*",
    dependencies = { "williamboman/mason.nvim" },
  },

  { -- LSP-Zero
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    event  = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",  -- reuse the pinned table
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("lsp")                 -- your lua/lsp.lua
    end,
  },
})

-- Load additional settings
require("general") -- (lua/general.lua)

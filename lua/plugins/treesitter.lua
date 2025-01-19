-- lua/plugins/treesitter.lua

local treesitter_configs = require('nvim-treesitter.configs')

treesitter_configs.setup {
  highlight = {
    enable = true, -- Enable syntax highlighting
  },
}

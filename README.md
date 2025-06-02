# neovim
My Neovim Config!

Plugin Manager: [Lazy.nvim](https://github.com/folke/lazy.nvim)
Plugins:
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for highlighting.
- [Fugititve](https://github.com/tpope/vim-fugitive) for Git.
- [Tokyonight](https://github.com/folke/tokyonight.nvim) theme.
- [cmp](https://github.com/hrsh7th/nvim-cmp), [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim), [LuaSnip](L3MON4D3/LuaSnip), and [mason](https://github.com/williamboman/mason.nvim) for autocompletion in Python (Pyright), Nix ([nil_ls](https://github.com/oxalica/nil)), Lua ([lua_ls](https://github.com/LuaLS/lua-language-server), CSS ([cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#cssls), [HTML](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#html), JavaScript/TypeScript ([ts](https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls), and [Docker Compose](https://github.com/microsoft/compose-language-service))
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) for searching.
- [Nvim-Tree](https://github.com/nvim-tree/nvim-tree.lua) file explorer.
- [vim-be-good](https://github.com/ThePrimeagen/vim-be-good) for practicing vim.

Other relevant settings:
- Relative line numbers
- Tab indentation set to two spaces
- Most keymaps are default, besides a couple for Nvim-Tree and Telescope (see /lua/general.lua)
- Removed arrow keys for movement in all modes

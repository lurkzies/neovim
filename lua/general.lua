-- Set the colorscheme
vim.o.background = "dark" -- Use "light" if you prefer a lighter theme
vim.cmd([[colorscheme tokyonight]])

-- General editor settings
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Enable relative numbers
vim.opt.syntax = 'on'            -- Enable syntax highlighting
vim.opt.background = "dark"       -- Set background preference for themes

-- Keybindings
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

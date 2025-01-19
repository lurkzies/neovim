-- Set the colorscheme
vim.o.background = "dark" -- Use "light" if you prefer a lighter theme
vim.cmd([[colorscheme tokyonight]])

-- General editor settings
vim.opt.number = true             -- Show line numbers
vim.opt.relativenumber = true     -- Enable relative numbers
vim.opt.syntax = 'on'            -- Enable syntax highlighting
vim.opt.background = "dark"       -- Set background preference for themes

-- Keybindings:

-- Nvim-Tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Nvim-Telescope
vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope find_files<CR>', { noremap = true, silent = true})

-- Tab indenting
vim.opt.tabstop = 2       -- Number of spaces that a tab character represents
vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true  -- Convert tabs to spaces

local lspconfig = require('lspconfig')

-- Configure servers
lspconfig.pyright.setup({}) -- For Python
lspconfig.gopls.setup({}) -- For Golang
-- require.tailwindcss.setup{} -- For CSS
-- require.html.setup{} -- For HTML (npm install -g vscode-langservers-extracted)
-- require'lspconfig'.rls.setup{} -- For Rust (https://github.com/rust-lang/rls)


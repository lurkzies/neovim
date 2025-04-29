local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'pyright',
  'lua_ls',
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end)

lsp.setup()

local nil_path = vim.fn.exepath("nil")
if nil_path ~= "" then
  require('lspconfig').nil_ls.setup({
    cmd = { nil_path },
    filetypes = { "nix" },
    root_dir = require('lspconfig.util').root_pattern(".git", "flake.nix"),
  })
else
  vim.notify("nil language server not found in PATH.", vim.log.levels.WARN)
end


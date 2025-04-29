-- Lanaguage Server Configuration
-- lsp-zero v3

local lsp = require('lsp-zero')

-- Setup mason and mason-lspconfig
require('mason').setup()
require('mason-lspconfig').setup()

-- Setup keymaps and attach logic
lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end)

-- Setup LSP capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Configure each LSP manually
local lspconfig = require('lspconfig')

lspconfig.cssls.setup({ -- Configuration for the CSS language server
  capabilities = capabilities,
  on_attach = lsp.on_attach,
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
})

lspconfig.html.setup({ -- Configuration for the HTML language server
  capabilities = capabilities,
  on_attach = lsp.on_attach,
  settings = {
    html = {
      format = { wrapLineLength = 120 },
      hover = { documentation = true, references = true },
    },
  },
})

lspconfig.ts_ls.setup({ -- Configuration for the Typescript/Javascript language server
  capabilities = capabilities,
  on_attach = lsp.on_attach,
  settings = {
    typescript = { format = { indentSize = 2, tabSize = 2 } },
    javascript = { format = { indentSize = 2, tabSize = 2 } },
  },
})

-- Configuration for the Docker Compose language server
lspconfig.docker_compose_language_service.setup({
  capabilities = capabilities,
  on_attach = lsp.on_attach,
  settings = {
    dockerCompose = { validate = true },
  },
})

lspconfig.lua_ls.setup({ -- Configuration for the Lua language server
  capabilities = capabilities,
  on_attach = lsp.on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
})

lspconfig.pyright.setup({ -- Configuration for the Python language server
  capabilities = capabilities,
  on_attach = lsp.on_attach,
})

-- Manual configuration for the nil_ls if Nix is available 
local nil_path = vim.fn.exepath("nil")
if nil_path ~= "" then
  lspconfig.nil_ls.setup({
    cmd = { nil_path },
    capabilities = capabilities,
    on_attach = lsp.on_attach,
    filetypes = { "nix" },
    root_dir = require('lspconfig.util').root_pattern(".git", "flake.nix"),
  })
else
end

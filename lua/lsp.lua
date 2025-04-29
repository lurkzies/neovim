-- Basic LSP configuration file

local lsp = require('lsp-zero')

-- Use recommended preset
lsp.preset('recommended')

-- Setup default keymaps when an LSP attaches
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  -- Useful keymaps
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
end)

-- Setup mason and mason-lspconfig
require('mason').setup()
require('mason-lspconfig').setup()

-- Setup basic manual configurations
local lspconfig = require('lspconfig')

lspconfig.cssls.setup({
  settings = {
    css = {
      validate = true,
    },
    scss = {
      validate = true,
    },
    less = {
      validate = true,
    },
  },
})

lspconfig.html.setup({
  settings = {
    html = {
      format = {
        wrapLineLength = 120,
        unformatted = "pre,code,textarea",
      },
      hover = {
        documentation = true,
        references = true,
      },
    },
  },
})

lspconfig.tsserver.setup({
  settings = {
    typescript = {
      format = {
        indentSize = 2,
        tabSize = 2,
      },
    },
    javascript = {
      format = {
        indentSize = 2,
        tabSize = 2,
      },
    },
  },
})

lspconfig.docker_compose_language_service.setup({
  settings = {
    dockerCompose = {
      validate = true,
    },
  },
})

-- Finish lsp-zero setup
lsp.setup()

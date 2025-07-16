-- lsp-zero v3  ✦  mason-lspconfig 1.x  ✦  Neovim 0.9+
local lsp         = require("lsp-zero")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",                       -- <- new TypeScript name
    "clangd",
    "pyright",
    "html",
    "cssls",
    "docker_compose_language_service",
  },
  automatic_installation = true,   -- ← works in v1, harmless in 1.*
  handlers = {
    function(server)
      require("lspconfig")[server].setup({
        on_attach    = lsp.on_attach,
        capabilities = capabilities,
      })
    end,

    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup({
        on_attach    = lsp.on_attach,
        capabilities = capabilities,
        settings     = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
    end,

    ["ts_ls"] = function()
      require("lspconfig").ts_ls.setup({
        on_attach    = lsp.on_attach,
        capabilities = capabilities,
        settings = {
          typescript = { format = { indentSize = 2, tabSize = 2 } },
          javascript = { format = { indentSize = 2, tabSize = 2 } },
        },
      })
    end,
  },
})

-- common key-maps + on-save formatting
lsp.on_attach(function(client, bufnr)
  local o = { buffer = bufnr }
  vim.keymap.set("n", "gd",         vim.lsp.buf.definition,    o)
  vim.keymap.set("n", "K",          vim.lsp.buf.hover,         o)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,   o)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,        o)
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references,    o)
  vim.keymap.set("n", "<leader>d",  vim.diagnostic.open_float, o)
  vim.keymap.set("n", "<leader>f",  function() vim.lsp.buf.format({ async = true }) end, o)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group   = vim.api.nvim_create_augroup("LspFormat." .. bufnr, { clear = true }),
      buffer  = bufnr,
      callback = function() vim.lsp.buf.format({ async = false }) end,
    })
  end
end)

-- Optional Nix LSP
local nil_path = vim.fn.exepath("nil")
if nil_path ~= "" then
  require("lspconfig").nil_ls.setup({
    cmd         = { nil_path },
    on_attach   = lsp.on_attach,
    capabilities = capabilities,
    filetypes   = { "nix" },
    root_dir    = require("lspconfig.util").root_pattern(".git", "flake.nix"),
  })
end

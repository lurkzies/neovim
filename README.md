# [] lurkzies' neovim config ⌨️
> *My Neovim Configuration!*

## [] Features ✨

- Syntax highlighting
- Version control (Git integration)
- Autocompletion for multiple languages
- Dark, but colourful theme
- Fuzzy file finding
- File explorer tree
- Relative line numbers
- Tab indentation set to two spaces
- Most keymaps are default, besides a couple for Nvim-Tree and Telescope (see /lua/general.lua)
- Removed arrow keys for movement in all modes

## [] Installation ⚙️

1. 1. Install [Neovim](https://neovim.io/) (version 0.9+ recommended).
2. Clone this repository into your Neovim config directory:

    ```bash
    git clone https://github.com/lurkzies/neovim ~/.config/nvim
    ```

3. Open Neovim (`nvim`). Plugins will automatically install via Lazy.nvim on first launch.

## [] Plugins 🔌

**Plugin Manager:** [Lazy.nvim](https://github.com/folke/lazy.nvim)
**Theme:** [TokyoNight](https://github.com/folke/tokyonight.nvim)

**Plugins:**
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) – For enhanced code parsing and syntax highlighting
- [vim-fugitive](https://github.com/tpope/vim-fugitive) – A Git integration plugin (allows Git commands and status inside Neovim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) – An autocompletion engine for Neovim, providing intelligent code completion suggestions. This is used in tandem with LuaSnip (snippet engine) and additional completion sources.
- [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) – A convenient framework for configuring Neovim’s built-in LSP (Language Server Protocol) support. It works with nvim-lspconfig and mason.nvim to set up language servers easily
- [Mason.nvim](https://github.com/williamboman/mason.nvim) – Tool manager that installs LSP servers, linters, and formatters. The config uses Mason to automatically install language servers for the languages of interest.
- [nvim-telescope](https://github.com/nvim-telescope/telescope.nvim) – Fuzzy finder plugin for quick file searching, text grep, and other finder UI functionality
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) – File explorer tree plugin, providing a file browsing side panel
- [vim-be-good](https://github.com/ThePrimeagen/vim-be-good) – A game plugin to practice Vim motions and improve editing speed

## [] LSP 🔡

The configuration integrates multiple language servers to provide IDE features (like autocompletion, go-to-definition, linting) for various languages. Out-of-the-box, it ensures support for:

- C/C++ ([Clangd](https://github.com/clangd/clangd))
- Python ([Pyright](https://github.com/microsoft/pyright))
- Lua ([Lua Language Server](https://github.com/LuaLS/lua-language-server))
- JavaScript/TypeScript ([TypeScript Language Server](https://github.com/typescript-language-server/typescript-language-server))
- HTML ([VSCode HTML Language Service](https://github.com/microsoft/vscode-html-languageservice))
- CSS ([VSCode CSS Language Service](https://github.com/microsoft/vscode-css-languageservice))
- Nix ([nil](https://github.com/oxalica/nil))
- Docker Compose ([Docker Compose Language Service](https://github.com/microsoft/compose-language-service))

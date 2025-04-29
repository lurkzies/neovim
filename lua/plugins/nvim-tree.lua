require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 30,
    side = "left",
    preserve_window_proportions = true,
  },
  filters = {
    dotfiles = false,
  },
})


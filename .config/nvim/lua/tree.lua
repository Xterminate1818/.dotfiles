function tree_setup()
  require("nvim-tree").setup({
    hijack_cursor = true,
    git = {
      enable = false,
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "H",
        info = "I",
        warning = "W",
        error = "E",
      },
    },
    renderer = {
      highlight_opened_files = "name",
      indent_width = 1,
    },
    tab = {
      sync = {
        open = true,
        close = true,
      }
    }
  })
end

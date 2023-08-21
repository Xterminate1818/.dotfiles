require('telescope').setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor()
    },
  }
}

require("telescope").load_extension("ui-select")

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- OR setup with some options
require("nvim-tree").setup {
  sort_by = "case_sensitive",
  hijack_cursor = true,
  view = {
    adaptive_size = true,
    hide_root_folder = true,
    float = {
      enable = true,
    },
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

-- Autoclose
vim.api.nvim_create_autocmd("BufEnter", {
  command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
  nested = true,
})

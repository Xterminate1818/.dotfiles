local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.wgsl = {
  install_info = {
    url = "https://github.com/szebniok/tree-sitter-wgsl",
    files = { "src/parser.c" }
  },
}

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "wgsl" },
  highlight = {
    enable = true
  },
}

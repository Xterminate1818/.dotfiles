require("impatient").enable_profile()
require "logan.binds"
require "logan.plugins"
require "logan.rust"
require "logan.nvim-tree"
require "logan.cmp"
require "logan.dap"
require "logan.lsp"
require "logan.telescope"
require "logan.treesitter"
require "logan.gitsigns"
require "logan.etc"
require "logan.colorshceme"
require "logan.toggleterm"
require "logan.options"
pcall(dofile, "./local.lua")
--pcall(dofile, "../local.lua")

require("impatient").enable_profile()
require "logan.options"
require "logan.binds"
require "logan.plugins"
require "logan.rust"
require "logan.nvim-tree"
require "logan.cmp"
require "logan.lsp"
require "logan.telescope"
require "logan.treesitter"
require "logan.gitsigns"
require "logan.etc"
require "logan.colorshceme"
require "logan.toggleterm"
pcall(dofile, "./local.lua")
pcall(dofile, "../local.lua")

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require("neodev").setup {
  library = { plugins = { "nvim-dap-ui" }, types = true },
}

require "logan.lsp.mason"
require("logan.lsp.handlers").setup()
require "logan.lsp.null-ls"
local signature_cfg = {
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  handler_opts = {
    border = "rounded",
  },
  close_timeout = 1000,
  hint_prefix = "󰫧 ",
}

require("lsp_signature").setup(signature_cfg)

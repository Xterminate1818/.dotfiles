local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "logan.lsp.mason"
require("logan.lsp.handlers").setup()
require "logan.lsp.null-ls"


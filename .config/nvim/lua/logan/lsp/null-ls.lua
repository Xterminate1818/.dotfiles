local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("plenary.curl")

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.diagnostics.eslint,
    require("null-ls").builtins.completion.spell,
    --require("null-ls").builtins.diagnostics.clang_check,
    --require("null-ls").builtins.diagnostics.cpplint,
    require("null-ls").builtins.formatting.clang_format.with({
      command = "clang-format --style=Google --Werror"
    }),
    require("null-ls").builtins.diagnostics.gdlint,
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.hover.dictionary.with({
      filetypes = {}
    }),
    require("null-ls").builtins.hover.printenv,

  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- vim.lsp.buf.formatting_sync()
          --pcall(vim.lsp.buf.format({ bufnr = bufnr }))
          pcall(vim.lsp.buf.format, { bufnr = bufnr })
        end,
      })
    end
  end,

})

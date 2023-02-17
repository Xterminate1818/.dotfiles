local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require "plenary.curl"

require("null-ls").setup {
  sources = {
    -- General
    require("null-ls").builtins.formatting.stylua,
    -- require("null-ls").builtins.diagnostics.eslint,
    --require("null-ls").builtins.completion.spell,
    --require("null-ls").builtins.hover.dictionary.with {
    -- filetypes = {},
    -- },
    -- C/C++
    require("null-ls").builtins.diagnostics.clang_check,
    require("null-ls").builtins.formatting.clang_format,
    -- GD Script
    --require("null-ls").builtins.diagnostics.gdlint,
    -- Python
    --require("null-ls").builtins.diagnostics.pylint,
    -- require("null-ls").builtins.formatting.isort,
    require("null-ls").builtins.formatting.black,
    --require("null-ls").builtins.formatting.autopep8,
    --require("null-ls").builtins.diagnostics.flake8,
    --require("null-ls").builtins.diagnostics.pycodestyle,
    -- Shell
    require("null-ls").builtins.hover.printenv,
    require("null-ls").builtins.diagnostics.fish,
    --require("null-ls").builtins.formatting.fish_indent,
    -- Javascript
    --require("null-ls").builtins.formatting.tidy,
    --require("null-ls").builtins.formatting.prettierd,
    -- Rust
    --require("null-ls").builtins.formatting.rustfmt,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
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
}

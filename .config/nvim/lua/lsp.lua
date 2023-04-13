local sev = vim.diagnostic.severity

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  underline = { severity = { sev.WARN, sev.ERROR } },
})

local lsp_group = vim.api.nvim_create_augroup('my-lsp', { clear = true })

local function setup_lsp(filetype, lsp_cmd)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = filetype,
    group = lsp_group,
    callback = function()
      vim.lsp.start({
        name = lsp_cmd[1],
        cmd = lsp_cmd,
      })
    end
  })
end

setup_lsp({ "rust" }, { "rust-analyzer" })
setup_lsp({ "lua" }, { "lua-language-server", "--configpath=~/.config/lua-ls/config.lua" })
setup_lsp({ "c", "cpp" }, { "clangd" })

-- Format on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.lsp.buf.format()
  end
})

-- Highlight symbol
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.lsp.buf.document_highlight()
  end
})

vim.api.nvim_create_autocmd({ "CursorMoved" }, {
  callback = function()
    vim.lsp.buf.clear_references()
  end
})
-- local sev = vim.diagnostic.severity

-- vim.diagnostic.config({
--   virtual_text = false,
--   severity_sort = true,
--   underline = { severity = { sev.WARN, sev.ERROR } },
-- })

-- Format on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.lsp.buf.format()
  end
})



-- lspconfig.tailwindcss.setup {
--   settings = {
--     init_options = {
--       userLanguages = {
--         rust = "rs",
--       },
--     },
--     includeLanguages = {
--       ["rust"] = "html",
--     }
--   },
--   filetypes = {
--     "css",
--     "html",
--     "rust",
--   },
-- }
-- lspconfig.html.setup {
--   filetypes = {
--     "html",
--     "rust",
--   },
-- }

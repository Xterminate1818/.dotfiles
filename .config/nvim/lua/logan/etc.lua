require("bufferline").setup {}

-- Force clang to use utf-8
local lspconfig = require "lspconfig.configs"

-- snips
require("luasnip.loaders.from_vscode").lazy_load()

-- Lualine
require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "gruvbox_dark",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = { "diagnostics", "diff" },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = { "documentation", "detail", "additionalTextEdits" },
}

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local clangd_capabilities = cmp_capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"

lspconfig.clangd.setup {
  capabilities = clangd_capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--clang-tidy-checks=detailed",
    "--header-insertion=iwyu",
    "--offset-encoding=utf-8",
    "--fallback-style=Google",
    "--pch-storage=memory",
    "--suggest-missing-includes",
    "--cross-file-rename",
    "--completion-style=detailed",
    "--pretty",
  },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
    semanticHighlighting = true,
  },
}

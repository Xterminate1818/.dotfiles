require("bufferline").setup{}


-- Force clang to use utf-8
local lspconfig = require("lspconfig.configs")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local clangd_capabilities = cmp_capabilities
clangd_capabilities.textDocument.semanticHighlighting = true
clangd_capabilities.offsetEncoding = "utf-8"

lspconfig.clangd.setup{
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
      "--pretty"
    },
    init_options = {
    	clangdFileStatus = true,
    	usePlaceholders = true,
    	completeUnimported = true,
    	semanticHighlighting = true,
    }
}




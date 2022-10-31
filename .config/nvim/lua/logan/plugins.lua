local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

plugin_list = {
  "wbthomason/packer.nvim",
  -- Used by others
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  -- Color schemes
  "lunarvim/colorschemes",
  "lunarvim/darkplus.nvim",
  -- Completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  -- Snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",
  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "williamboman/nvim-lsp-installer",
  -- Telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  -- Treesitter
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  "p00f/nvim-ts-rainbow",
  -- Autopairs
  { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
  -- Gitsigns
  "lewis6991/gitsigns.nvim",
  -- NvimTree
  { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }, tag = "nightly" },
  -- Bufferline
  { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'kyazdani42/nvim-web-devicons' },
  -- null-ls
  "jose-elias-alvarez/null-ls.nvim",
  -- Theme
  "luisiacc/gruvbox-baby"
}

-- Install your plugins here
return packer.startup(function(use)
  for i, x in pairs(plugin_list) do
    use(x)
  end
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

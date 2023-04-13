-- Bootstrapping
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Setups
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  -- rust
  use { 'saecki/crates.nvim', config = require('crates').setup(), }
  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'
  -- file tree
  use {
    'nvim-tree/nvim-tree.lua',
  }
  use 'nvim-tree/nvim-web-devicons'
  -- colorscheme
  use { "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({})
      vim.cmd("colorscheme kanagawa-wave")
    end
  }
  -- completion
  use { 'hrsh7th/nvim-cmp' }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'smolck/command-completion.nvim'
  use { 'windwp/nvim-autopairs' }
  use { "ray-x/lsp_signature.nvim", config = require("lsp_signature").setup({
    floating_window = false,
    hint_prefix = "",
  }) }
  -- telescope
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }
  use 'nvim-telescope/telescope-ui-select.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run =
  'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  -- commenting
  use { "terrortylor/nvim-comment", config = require('nvim_comment').setup() }
  -- bufferline
  use({
    'willothy/nvim-cokeline',
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)

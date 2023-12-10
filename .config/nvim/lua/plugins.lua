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
  -- lsp
  use { 'neovim/nvim-lspconfig',
    config = function()
      local cfg = require("lspconfig")
      -- cfg.tailwindcss.setup {
      --   filetypes = {
      --     "css",
      --     "html",
      --     "rust",
      --   },
      --   init_options = {
      --     userLanguages = {
      --       rust = "html"
      --     }
      --   },
      -- }
      cfg.rust_analyzer.setup {
        -- Other Configs ...
        settings = {
          ["rust-analyzer"] = {
            -- Other Settings ...
            procMacro = {
              ignored = {
                leptos_macro = {
                  "server",
                  "component",
                },
              },
            },
          },
        }
      }
      cfg.lua_ls.setup {}
      cfg.html.setup {}
      cfg.wgsl_analyzer.setup {}
      cfg.clangd.setup {}
    end
  }
  use { 'mfussenegger/nvim-lint' }
  -- use 'williamboman/mason-lspconfig'
  -- use { 'williamboman/mason.nvim',
  --   config = function()
  --     require("mason").setup()
  --     require("mason-lspconfig").setup {
  --       automatic_installation = true,
  --     }
  --     require("lspconfig").rust_analyzer.setup {}
  --   end
  -- }
  -- rust
  use { 'saecki/crates.nvim',
    requires = { { 'nvim-lua/plenary.nvim', opt = false } },
    config = function()
      require('crates').setup()
    end
  }
  use { 'ron-rs/ron.vim' }
  -- toggleterm
  use { "akinsho/toggleterm.nvim", tag = '*',
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = 'tab',
      })
    end
  }
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }
  -- file tree
  use { 'nvim-tree/nvim-tree.lua',
    config = function()
      require("nvim-tree").setup({
        hijack_cursor = true,
        git = {
          enable = false,
        },
        diagnostics = {
          enable = true,
          icons = {
            hint = "H",
            info = "I",
            warning = "W",
            error = "E",
          },
        },
        renderer = {
          highlight_opened_files = "name",
          indent_width = 1,
        },
        tab = {
          sync = {
            open = true,
            close = true,
          }
        }
      })
    end
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
  use { 'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup {}
    end
  }
  use { "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup({
        floating_window = false,
        hint_prefix = "",
      })
    end
  }
  -- telescope
  use { 'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'nvim-telescope/telescope-ui-select.nvim'
  -- commenting
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- bufferline
  use { 'willothy/nvim-cokeline',
    requires = { { 'nvim-lua/plenary.nvim' } },
    config = function()
      require("cokeline").setup({
        show_if_buffers_are_at_least = 1,
        buffers = {
          new_buffers_position = "number",
        },
        sidebar = {
          filetype = { 'NvimTree', 'neo-tree' },
          components = {
            {
              text = function(buf)
                return 'Files'
              end
            }
          }
        },
        components = {
          {
            text = function(buffer) return ' ' .. buffer.filename .. ' ' end,
          },
        }
      })
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

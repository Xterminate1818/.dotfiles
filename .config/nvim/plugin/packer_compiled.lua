-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/logan/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?.lua;/home/logan/.cache/nvim/packer_hererocks/2.1.1702233742/share/lua/5.1/?/init.lua;/home/logan/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?.lua;/home/logan/.cache/nvim/packer_hererocks/2.1.1702233742/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/logan/.cache/nvim/packer_hererocks/2.1.1702233742/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["command-completion.nvim"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/command-completion.nvim",
    url = "https://github.com/smolck/command-completion.nvim"
  },
  ["crates.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["kanagawa.nvim"] = {
    config = { "\27LJ\2\nl\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\30colorscheme kanagawa-wave\bcmd\bvim\nsetup\rkanagawa\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\16hint_prefix\5\20floating_window\1\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-cokeline"] = {
    config = { "\27LJ\2\n\21\0\1\2\0\1\0\2'\1\0\0L\1\2\0\nFiles&\0\1\4\0\2\0\5'\1\0\0009\2\1\0'\3\0\0&\1\3\1L\1\2\0\rfilename\6 \2\1\0\a\0\16\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0034\4\3\0005\5\n\0003\6\t\0=\6\v\5>\5\1\4=\4\f\3=\3\r\0024\3\3\0005\4\15\0003\5\14\0=\5\v\4>\4\1\3=\3\f\2B\0\2\1K\0\1\0\1\0\0\0\fsidebar\15components\ttext\1\0\0\0\rfiletype\1\0\0\1\3\0\0\rNvimTree\rneo-tree\fbuffers\1\0\1\25new_buffers_position\vnumber\1\0\1!show_if_buffers_are_at_least\3\1\nsetup\rcokeline\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/nvim-cokeline",
    url = "https://github.com/willothy/nvim-cokeline"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nø\4\0\0\t\0\28\00026\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0014\3\0\0B\1\2\0019\1\4\0009\1\3\0015\3\14\0005\4\f\0005\5\n\0005\6\b\0005\a\6\0005\b\5\0=\b\a\a=\a\t\6=\6\v\5=\5\r\4=\4\15\3B\1\2\0019\1\16\0009\1\3\0014\3\0\0B\1\2\0019\1\17\0009\1\3\0014\3\0\0B\1\2\0019\1\18\0009\1\3\0015\3\20\0005\4\19\0=\4\21\3B\1\2\0019\1\22\0009\1\3\0014\3\0\0B\1\2\0019\1\23\0009\1\3\0015\3\25\0005\4\24\0=\4\26\3B\1\2\0019\1\27\0009\1\3\0014\3\0\0B\1\2\1K\0\1\0\25jedi_language_server\bcmd\1\0\0\1\v\0\0\vclangd\29--offset-encoding=utf-16\28--all-scopes-completion\31--suggest-missing-includes\23--background-index\23--pch-storage=disk\24--cross-file-rename\15--log=info --completion-style=detailed\17--clang-tidy\vclangd\vtexlab\14filetypes\1\0\0\1\2\0\0\twgsl\18wgsl_analyzer\thtml\vlua_ls\rsettings\1\0\0\18rust-analyzer\1\0\0\14procMacro\1\0\0\fignored\1\0\0\17leptos_macro\1\0\0\1\3\0\0\vserver\14component\18rust_analyzer\nsetup\14typos_lsp\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nŸ\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\r\0005\4\f\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\btab\tsync\1\0\0\1\0\2\nclose\2\topen\2\rrenderer\1\0\2\27highlight_opened_files\tname\17indent_width\3\1\16diagnostics\nicons\1\0\4\tinfo\6I\fwarning\6W\thint\6H\nerror\6E\1\0\1\venable\2\bgit\1\0\1\venable\1\1\0\1\18hijack_cursor\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["ron.vim"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/ron.vim",
    url = "https://github.com/ron-rs/ron.vim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14direction\btab\17open_mapping\n<c-\\>\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/logan/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nŸ\2\0\0\5\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\r\0005\4\f\0=\4\14\3=\3\15\2B\0\2\1K\0\1\0\btab\tsync\1\0\0\1\0\2\nclose\2\topen\2\rrenderer\1\0\2\27highlight_opened_files\tname\17indent_width\3\1\16diagnostics\nicons\1\0\4\tinfo\6I\fwarning\6W\thint\6H\nerror\6E\1\0\1\venable\2\bgit\1\0\1\venable\1\1\0\1\18hijack_cursor\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\14direction\btab\17open_mapping\n<c-\\>\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: kanagawa.nvim
time([[Config for kanagawa.nvim]], true)
try_loadstring("\27LJ\2\nl\0\0\3\0\6\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\30colorscheme kanagawa-wave\bcmd\bvim\nsetup\rkanagawa\frequire\0", "config", "kanagawa.nvim")
time([[Config for kanagawa.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n`\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\16hint_prefix\5\20floating_window\1\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nø\4\0\0\t\0\28\00026\0\0\0'\2\1\0B\0\2\0029\1\2\0009\1\3\0014\3\0\0B\1\2\0019\1\4\0009\1\3\0015\3\14\0005\4\f\0005\5\n\0005\6\b\0005\a\6\0005\b\5\0=\b\a\a=\a\t\6=\6\v\5=\5\r\4=\4\15\3B\1\2\0019\1\16\0009\1\3\0014\3\0\0B\1\2\0019\1\17\0009\1\3\0014\3\0\0B\1\2\0019\1\18\0009\1\3\0015\3\20\0005\4\19\0=\4\21\3B\1\2\0019\1\22\0009\1\3\0014\3\0\0B\1\2\0019\1\23\0009\1\3\0015\3\25\0005\4\24\0=\4\26\3B\1\2\0019\1\27\0009\1\3\0014\3\0\0B\1\2\1K\0\1\0\25jedi_language_server\bcmd\1\0\0\1\v\0\0\vclangd\29--offset-encoding=utf-16\28--all-scopes-completion\31--suggest-missing-includes\23--background-index\23--pch-storage=disk\24--cross-file-rename\15--log=info --completion-style=detailed\17--clang-tidy\vclangd\vtexlab\14filetypes\1\0\0\1\2\0\0\twgsl\18wgsl_analyzer\thtml\vlua_ls\rsettings\1\0\0\18rust-analyzer\1\0\0\14procMacro\1\0\0\fignored\1\0\0\17leptos_macro\1\0\0\1\3\0\0\vserver\14component\18rust_analyzer\nsetup\14typos_lsp\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-cokeline
time([[Config for nvim-cokeline]], true)
try_loadstring("\27LJ\2\n\21\0\1\2\0\1\0\2'\1\0\0L\1\2\0\nFiles&\0\1\4\0\2\0\5'\1\0\0009\2\1\0'\3\0\0&\1\3\1L\1\2\0\rfilename\6 \2\1\0\a\0\16\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0034\4\3\0005\5\n\0003\6\t\0=\6\v\5>\5\1\4=\4\f\3=\3\r\0024\3\3\0005\4\15\0003\5\14\0=\5\v\4>\4\1\3=\3\f\2B\0\2\1K\0\1\0\1\0\0\0\fsidebar\15components\ttext\1\0\0\0\rfiletype\1\0\0\1\3\0\0\rNvimTree\rneo-tree\fbuffers\1\0\1\25new_buffers_position\vnumber\1\0\1!show_if_buffers_are_at_least\3\1\nsetup\rcokeline\frequire\0", "config", "nvim-cokeline")
time([[Config for nvim-cokeline]], false)
-- Config for: crates.nvim
time([[Config for crates.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vcrates\frequire\0", "config", "crates.nvim")
time([[Config for crates.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

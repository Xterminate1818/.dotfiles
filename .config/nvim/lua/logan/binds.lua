local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

function map(mode, input, output)
  keymap(mode, input, output, opts)
end

function amap(input, output)
  keymap("n", input, output, opts)
  keymap("i", input, output, opts)
  keymap("v", input, output, opts)
end

-- Disable f keys
amap("<F1>", "<Nop>")
amap("<F2>", "<Nop>")
amap("<F3>", "<Nop>")
amap("<F4>", "<Nop>")
amap("<F5>", "<Nop>")
amap("<F6>", "<Nop>")
amap("<F7>", "<Nop>")
amap("<F8>", "<Nop>")
amap("<F9>", "<Nop>")
amap("<F10>", "<Nop>")
amap("<F11>", "<Nop>")
amap("<F12>", "<Nop>")



-- Leader key
map("", "<space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---- Normal

function nmap(input, output)
  map('n', input, output)
end

-- Resize with arrows
nmap("<C-Up>", ":resize +2<CR>")
nmap("<C-Down>", ":resize -2<CR>")
nmap("<C-Left>", ":vertical resize -2<CR>")
nmap("<C-Right>", ":vertical resize +2<CR>")

-- Navigate windows
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

-- Navigate buffers
nmap("<S-j>", ":bnext<CR>")
nmap("<S-k>", ":bprevious<CR>")

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown())<cr>"
  , opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)

-- NvimTree
nmap("<leader>e", ":NvimTreeToggle<cr>")

-- Lsp stuff
nmap("gl", ':lua vim.diagnostic.open_float({scope="line", border="none", prefix="", header="", source=false})<cr>')
nmap("<leader>lD",
  ':lua vim.diagnostic.open_float({scope="buffer", border="none", prefix="", header="", source=false})<cr>')
nmap("<leader>la", ":lua vim.lsp.buf.code_action()<cr>")
nmap("<leader>lh", ":lua vim.lsp.buf.signature_help()<cr>")
nmap("<leader>lr", ":lua vim.lsp.buf.rename()<cr>")
nmap("gD", ":lua vim.lsp.buf.declaration()<cr>")
nmap("gT", ":lua vim.lsp.buf.type_definition()<cr>")
nmap("gd", ":lua vim.lsp.buf.definition()<cr>")
nmap("gI", ":lua vim.lsp.buf.implementation()<cr>")
nmap("<leader>w", ":lua vim.lsp.buf.hover()<cr>")



---- Insert
-- Escape sequence
keymap("i", "jk", "<ESC>", opts)

---- Visual
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')

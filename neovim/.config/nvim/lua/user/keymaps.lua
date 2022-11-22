local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Registers
keymap("n", ";", '"', opts)
keymap("v", ";", '"', opts)


-- Bufferline
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
--[[ keymap("n", "<leader>bc", ":bprevious<CR>", opts) ]]

-- move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- single press indent
keymap("n", ">", ">>", opts)
keymap("n", "<", "<<", opts)

-- THE BEES KNEES (backslash commands)
keymap("n", "\\b", ":BufferLinePick<CR>", opts)
keymap("n", "\\c", ":Bwipeout<CR>", opts)
keymap("n", "\\f", ":Telescope live_grep theme=ivy<cr>", opts)
keymap("n", "\\s", ":w<CR>", opts)
keymap("n", "\\1", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "\\2", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "\\3", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "\\4", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "\\5", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "\\6", ":BufferLineGoToBuffer 6<CR>", opts)
keymap("n", "\\7", ":BufferLineGoToBuffer 7<CR>", opts)
keymap("n", "\\8", ":BufferLineGoToBuffer 8<CR>", opts)
keymap("n", "\\9", ":BufferLineGoToBuffer 9<CR>", opts)
--[[ keymap("n", "\\$", ":BufferLineGoToBuffer -1<CR>", opts) ]]
keymap("n", "\\t", ":tabnew %<CR>", opts)

-- Insert
-- Press jk fast to enter
-- keymap("i", "jk", "<ESC>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Set transparent background
-- keymap("n", "<space>t", ":hi Normal guibg=NONE ctermbg=NONE<CR>", opts)
-- keymap("n", "\\t", ":hi Normal guibg=NONE ctermbg=NONE<CR>", opts)

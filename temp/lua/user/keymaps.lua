-- yank in visual mode 

-- \ y

-- leader key 

-- spc

-- switch to window
-- ctrl h / j / k / l

--  save current file 
-- spc w

-- resize current window 

-- ctrl left / down / up / right 

-- switch buffer 

-- shift h / l

-- show / close error info
    
-- g l

-- toggle floating terminal 

-- spc t f
-- ctrl \ = toggle terminal

-- toggle node terminal

-- spc t n

-- misc 

-- g d = go to definition (where a binding was declared)
-- spc l f = format document
-- spc f = find and go to file
-- spc F = find certain text inside of project
-- spc t p = toggle python terminal

local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

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

-- Buffers


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
keymap('n', '<A-,>', ':BufferPrevious<CR>', opts)
keymap('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<A-1>', ':BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', ':BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', ':BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', ':BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', ':BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', ':BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', ':BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', ':BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', ':BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
keymap('n', '<A-c>', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
keymap('n', '<C-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
keymap('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

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

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- New tab
keymap("n", "<S-t><S-n>", ":tabnew<CR>", opts)

-- Delete Buffer
keymap("n", "<S-b><S-d>", ":Bdelete<CR>", opts)

-- Correct spelling error
keymap("n", "<A-z>", "1z=", opts)

-- Single press indent
keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)

-- Use proper movement keys
keymap("n","<Up>","<Nop>",opts)
keymap("n","<Down>","<Nop>",opts)
keymap("n","<Left>","<Nop>",opts)
keymap("n","<Right>","<Nop>",opts)

-- Insert --

-- use jk / kj instead of esc
-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)
-- keymap("i", "<ESC>", "<Nop>", opts)

-- Use proper movement keys
keymap("i","<Up>","<Nop>",opts)
keymap("i","<Down>","<Nop>",opts)
keymap("i","<Left>","<Nop>",opts)
keymap("i","<Right>","<Nop>",opts)


-- Stay in indent mode
-- Visual --
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

-- Use proper movement keys
keymap("v","<Up>","<Nop>",opts)
keymap("v","<Down>","<Nop>",opts)
keymap("v","<Left>","<Nop>",opts)
keymap("v","<Right>","<Nop>",opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


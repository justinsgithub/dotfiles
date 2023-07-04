-- KEYMAPS
-- local keymap = vim.api.nvim_set_keymap
local keymap = vim.keymap.set
local keyopts = { remap = false, silent = true }
vim.g.maplocalleader = '\\'

-- Normal --
keymap("n", "<LocalLeader>b", ":BiPolar<CR>", keyopts)
keymap("n", "<LocalLeader>z", ":ZenMode<CR>", keyopts)
keymap("n", "<LocalLeader>o", ":OpenLine below<CR>", keyopts)
keymap("n", "<LocalLeader>O", ":OpenLine above<CR>", keyopts)
keymap("n", "<LocalLeader>p", ":BufferLinePick<CR>", keyopts)
keymap("n", "<LocalLeader>w", ":w<CR>", keyopts)
keymap("n", "<LocalLeader>c", ":BufferKill<cr>", keyopts)
keymap("n", "<LocalLeader>s", ":%s///g", keyopts)
keymap("n", "<LocalLeader>j", ":lua require('trevj').format_at_cursor()<CR>", keyopts)
keymap("n", "<S-h>", ":bprev<CR>", keyopts)
keymap("n", "<S-l>", ":bnext<CR>", keyopts)
-- pipe operator accesses system clipboard
keymap({ "v", "n" }, "|", '"+', keyopts)
-- single press indent
keymap("n", ">", ">>", keyopts)
keymap("n", "<", "<<", keyopts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", keyopts)
keymap("v", ">", ">gv", keyopts)
-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", keyopts)
keymap("x", "K", ":move '<-2<CR>gv-gv", keyopts)

-- WHICH_KEY
local which_key = lvim.builtin.which_key

which_key.setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true,    -- adds help for operators like d, y, ...
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  }
}
which_key.mappings["w"] = {
  name = "Window",
  h = { "<cmd>split<CR>", "Split Horizontal" },
  v = { "<cmd>vsplit<CR>", "Split Vertical" },
  c = { "<cmd>close<CR>", "Close Window" },
}

which_key.mappings["t"] = {
  name = "Tabs",
  n = { "<cmd>tabnew<CR>", "New Tab" },
  c = { "<cmd>tabclose<CR>", "Close Tab" },
}

which_key.mappings.s.name = 'Find'

which_key.mappings["f"] = which_key.mappings["s"]

which_key.mappings["s"] = {}

which_key.mappings["c"] = {
  name = "My Commands",
  o = { "<cmd>MkOpenSrc<CR>", "Open Src File" },
}

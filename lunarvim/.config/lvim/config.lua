-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--[[ 
   TODO: 
        vim-surround
        harpoon
        trevj
        marksman
        markdown preview
--]]

-- PLUGINS
lvim.plugins = {
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  { dir = "/home/justin/github/justinsgithub/oh-my-monokai.nvim" },
  "tiagovla/scope.nvim"
}

-- OPTIONS
vim.opt.relativenumber = true -- relative line numbers
vim.opt.timeoutlen = 500
vim.opt.clipboard = ""
vim.opt.showcmd = true
vim.opt_global.clipboard = ""

-- KEYMAPS
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.maplocalleader = '\\'



-- Normal --
keymap("n", "<LocalLeader>b", ":BufferLinePick<CR>", opts)
keymap("n", "<LocalLeader>w", ":w<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

-- pipe operator accesses system clipboard
keymap("n", "|", '"+', opts)

-- move text up and down
-- Alt key reserved for wezterm
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- single press indent
keymap("n", ">", ">>", opts)
keymap("n", "<", "<<", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- pipe operator accesses system clipboard
keymap("v", "|", '"+', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- Alt key reserved for wezterm
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


lvim.builtin.treesitter.ensure_installed = "all" -- automatically install syntax highlighting for all languages

lvim.colorscheme = "oh-my-monokai"
lvim.transparent_window = true

pcall(function()
  require("oh-my-monokai").setup({
    transparent_background = true,
    palette = "justinsgithub",
  })
end)

pcall(function()
  require("scope").setup({
    restore_state = true,   -- false, -- experimental
  })
end)

pcall(function()
  require("Comment").setup()
end)

-- FORMATTING
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { {
  name = "black",
  args = { "--print-width", "120" },
} }
lvim.format_on_save.enabled = false
-- lvim.format_on_save.pattern = { "*.py" }

-- LINTING
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup { { command = "flake8", filetypes = { "python" } } }

-- WHICH_KEY
local which_key = lvim.builtin.which_key
which_key.setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
  }
}

which_key.mappings["w"] = {
  name = "Window",
  c = { "<cmd>close<cr>", "Close Window" },
}
which_key.mappings["t"] = {
  name = "Tabs",
  n = { "<cmd>tabnew<cr>", "New Tab" },
  c = { "<cmd>tabclose<cr>", "Close Tab" },
}
which_key.mappings["bc"] = { "<cmd>BufferKill<cr>", "Close Buffer" }

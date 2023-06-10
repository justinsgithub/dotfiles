-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- OPTIONS  
vim.opt.relativenumber = true -- relative line numbers
vim.opt.timeoutlen = 0


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
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- single press indent
keymap("n", ">", ">>", opts)
keymap("n", "<", "<<", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- Alt key reserved for wezterm
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- pipe operator accesses system clipboard
keymap("v", "|", '"+', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- Alt key reserved for wezterm
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- PLUGINS
lvim.plugins = {
  "ChristianChiarulli/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  "justinsgithub/oh-my-monokai.nvim",
  "tiagovla/scope.nvim"
}


lvim.builtin.treesitter.ensure_installed = "all" -- automatically install syntax highlighting for all languages

lvim.colorscheme = "oh-my-monokai"

pcall(function()
  require("oh-my-monokai").setup({
    transparent_background = true,
    palette = "justinsgithub",
  })
end)

pcall(function()
  require("scope").setup({
      restore_state = true,-- false, -- experimental
  })
end)


-- FORMATTING
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { name = "black" }, }
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.py" }

-- LINTING
local linters = require "lvim.lsp.null-ls.linters"
linters.setup { { command = "flake8", filetypes = { "python" } } }

-- DEBUGGING
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- TESTING
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
      },
      args = { "--log-level", "DEBUG", "--quiet" },
      runner = "pytest",
    })
  }
})

-- WHICH_KEY
local which_key = lvim.builtin.which_key

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

which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" }
which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
which_key.mappings["df"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
which_key.mappings["dF"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }



which_key.mappings["P"] = { -- python bindings
  name = "Python",
  c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

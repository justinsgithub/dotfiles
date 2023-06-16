-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--
--[[
   TODO:
        harpoon ? no use case yet
--]]
-- MasonInstall marksman

require("lvim.lsp.manager").setup("marksman")

-- PLUGINS
lvim.plugins = {
  "ChristianChiarulli/swenv.nvim",
  "norcalli/nvim-colorizer.lua",
  "AckslD/nvim-trevJ.lua",
  "stevearc/dressing.nvim",
  "tpope/vim-surround",
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  'iamcco/markdown-preview.nvim',
  { dir = "/home/justin/github/justinsgithub/oh-my-monokai.nvim" },
  "tiagovla/scope.nvim",
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
keymap("n", "<LocalLeader>c", ":BufferKill<cr>", opts)
keymap("n", "<LocalLeader>s", ":%s///g", opts)
keymap("n", "<LocalLeader>j", ":lua require('trevj').format_at_cursor()<CR>", opts)
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
  require("colorizer").setup({
      "css",
      "scss",
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "lua",
      "json",
      "toml",
      "yaml",
    },
    {
      RGB = true,  -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn = true, -- CSS rgb() and rgba() functions
      hsl_fn = true, -- CSS hsl() and hsla() functions
      css = true,  -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    }
  )
end)

pcall(function()
  require("scope").setup({
    restore_state = true, -- false, -- experimental
  })
end)

pcall(function()
  require('trevj').setup({
    containers = {
      lua = {
        -- default lua setup
        table_constructor = { final_separator = ',', final_end_line = true },
        arguments = { final_separator = false, final_end_line = true },
        parameters = { final_separator = false, final_end_line = true },
      },
      ---   ... other filetypes
    },
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
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
  }
}

which_key.mappings["w"] = {
  name = "Window",
  c = { "<cmd>close<CR>", "Close Window" },
}
which_key.mappings["t"] = {
  name = "Tabs",
  n = { "<cmd>tabnew<CR>", "New Tab" },
  c = { "<cmd>tabclose<cr>", "Close Tab" },
}

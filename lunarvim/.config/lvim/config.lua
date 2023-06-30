-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

require("lvim.lsp.manager").setup("marksman")

-- PLUGINS
lvim.plugins = {
  "ChristianChiarulli/swenv.nvim",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  "stevearc/dressing.nvim",
  "norcalli/nvim-colorizer.lua",
  "AckslD/nvim-trevJ.lua",
  "tpope/vim-surround",
  "panozzaj/vim-autocorrect",
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function() vim.g.mkdp_auto_start = 1 end,
  },
  { dir = "/home/justin/github/justinsgithub/oh-my-monokai.nvim", lazy = false },
  "tiagovla/scope.nvim",
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump(
            {
              search = {
                mode = function(str)
                  return "\\<" .. str
                end,
              },
              jump = {
                autojump = true,
              },
            }
          )
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote({
            search = {
              mode = function(str)
                return "\\<" .. str
              end,
            },
            jump = {
              autojump = true,
            },
          })
        end,
        desc = "Remote Flash",
      },
    },
  }
}

-- OPTIONS
vim.opt.relativenumber = true -- relative line numbers
vim.opt.showmode = true -- relative line numbers
vim.opt.timeoutlen = 500
vim.opt.guicursor = "i-n-v-c-sm-ci-ve-r-cr-o:block"
vim.opt.clipboard = ""
vim.opt_global.clipboard = ""
vim.opt.showcmd = true
lvim.builtin.treesitter.ensure_installed = "all" -- automatically install syntax highlighting for all languages
lvim.colorscheme = "oh-my-monokai"
lvim.transparent_window = true

-- KEYMAPS
local keymap = vim.api.nvim_set_keymap
local keyopts = { noremap = true, silent = true }
vim.g.maplocalleader = '\\'

-- Normal --
keymap("n", "<LocalLeader>b", ":BufferLinePick<CR>", keyopts)
keymap("n", "<LocalLeader>w", ":w<CR>", keyopts)
keymap("n", "<LocalLeader>c", ":BufferKill<cr>", keyopts)
keymap("n", "<LocalLeader>s", ":%s///g", keyopts)
keymap("n", "<LocalLeader>j", ":lua require('trevj').format_at_cursor()<CR>", keyopts)
keymap("n", "<S-h>", ":bprev<CR>", keyopts)
keymap("n", "<S-l>", ":bnext<CR>", keyopts)
-- pipe operator accesses system clipboard
keymap("n", "|", '"+', keyopts)
-- single press indent
keymap("n", ">", ">>", keyopts)
keymap("n", "<", "<<", keyopts)
-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", keyopts)
keymap("v", ">", ">gv", keyopts)
-- pipe operator accesses system clipboard
keymap("v", "|", '"+', keyopts)
-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", keyopts)
keymap("x", "K", ":move '<-2<CR>gv-gv", keyopts)

-- AUTOCOMMANDS
lvim.autocommands = {
  {
    "BufEnter", -- see `:h autocmd-events`
    {
      -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*.md", "*.txt", "[^.]\\+" }, -- see `:h autocmd-events`
      command = "call AutoCorrect()",
    }
  },
}
-- SETUP
pcall(function()
  require("oh-my-monokai").setup({
    transparent_background = true,
    palette = "justinsgithub",
  })
end)

pcall(function()
  require("colorizer").setup(
    { "css", "scss", "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "lua", "json", "toml",
      "yaml", },
    {
      RGB = true,      -- #RGB hex codes
      RRGGBB = true,   -- #RRGGBB hex codes
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn = true,   -- CSS rgb() and rgba() functions
      hsl_fn = true,   -- CSS hsl() and hsla() functions
      css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
      css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
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
formatters.setup {
  { name = "black",   args = { "--print-width", "120" }, },
  { name = "yamlfmt", filetypes = { "yaml" } }
}

-- COMMANDS

vim.api.nvim_create_user_command('MkOpenSrc', function (args)
  local srcpath = "src/" .. vim.api.nvim_eval("expand('<cWORD>')")
  -- vim.cmd.execute('normal "cyiW')
  -- vim.cmd("let @m=:e ")
  vim.cmd("e " .. srcpath)
end, {desc = "Open code block source file",force = true})


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

which_key.mappings["f"] = which_key.mappings["s"]
which_key.mappings["f"].name = "Find"
which_key.mappings["s"] = nil

which_key.mappings["c"] = {
  name = "My Commands",
  o = { "<cmd>MkOpenSrc<CR>", "Open Src File" },
}

-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
require("lvim.lsp.manager").setup("marksman")
require("user.commands")
require("user.plugins")
require("user.keymaps")

-- OPTIONS
lvim.reload_config_on_save = true
vim.opt.relativenumber = true -- relative line numbers
vim.opt.showmode = true       -- relative line numbers
vim.opt.timeoutlen = 500
vim.opt.guicursor = "i-n-v-c-sm-ci-ve-r-cr-o:block,a:blinkon50"
vim.opt.clipboard = ""
vim.opt_global.clipboard = ""
vim.opt.showcmd = true
lvim.builtin.treesitter.ensure_installed = "all" -- automatically install syntax highlighting for all languages
lvim.colorscheme = "oh-my-monokai"
lvim.transparent_window = true
lvim.builtin.nvimtree.setup.open_on_tab = true
lvim.builtin.nvimtree.setup.trash = {
  cmd = "gio trash",
  require_confirm = true,
}
lvim.builtin.nvimtree.setup.view.relativenumber = true
lvim.builtin.nvimtree.setup.view.float.enable = false
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
-- require('delaytrain').setup {
--   delay_ms = 1000,  -- How long repeated usage of a key should be prevented
--   grace_period = 3, -- How many repeated keypresses are allowed
--   keys = {
--     -- Which keys (in which modes) should be delayed
--     ['nv'] = { 'h', 'j', 'k', 'l' },
--     -- ['nvi'] = { '<Lekt>', '<Down>', '<Up>', '<Right>' },
--   },
--   ignore_filetypes = {}, -- Example: set to {"help", "NvimTr*"} to disable the plugin for help and NvimTree
-- }

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

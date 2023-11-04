return {
  {
    "Wansmer/treesj",
    keys = {
      -- { "<localleader>t", "<cmd>TSJToggle<cr>", desc = "Toggle Lines" },
      -- { "<localleader>J", "<cmd>TSJJoin<cr>", desc = "Join Lines" },
      {
        "<localleader>j",
        "<cmd>TSJSplit<cr>",
        desc = "Toggle TreeSJ",
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        -- Use default keymaps
        -- (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = false,
        -- Node with syntax error will not be formatted
        check_syntax_error = true,
        -- If line after join will be longer than max value,
        -- node will not be formatted
        max_join_length = 120,
        -- hold|start|end:
        -- hold - cursor follows the node/place on which it was called
        -- start - cursor jumps to the first symbol of the node being formatted
        -- end - cursor jumps to the last symbol of the node being formatted
        cursor_behavior = "hold",
        -- Notify about possible problems or not
        notify = true,
        -- Use `dot` for repeat action
        dot_repeat = true,
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    -- build = "cd app && npm install",
    build = ":call mkdp#util#install()", -- USE THIS INSTEAD OF ABOVE LINE FOR LAZY
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {
    "tiagovla/scope.nvim",
    opts = {
      restore_state = true, -- false, -- experimental
    },
  },
  {
    "wakatime/vim-wakatime",
  },
  {
    "panozzaj/vim-autocorrect",
  },
  {
    "norcalli/nvim-colorizer.lua",
    opts = {
      ["*"] = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = true, -- disables the command in the last line of the screen
        },
        wezterm = {
          enabled = true,
          font = "+1", -- (10% increase per step) can be either an absolute font size or the number of incremental step
        },
      },
    },
  },
}

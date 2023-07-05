-- PLUGINS
lvim.plugins = {
  "ChristianChiarulli/swenv.nvim",
  "ja-ford/delaytrain.nvim",
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
      }
    }
  },
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
  {
    dir = "/home/justin/github/justinsgithub/oh-my-monokai.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("oh-my-monokai").setup({
        transparent_background = true,
        palette = "justinsgithub",
      })
      vim.cmd([[colorscheme oh-my-monokai]])
      lvim.colorscheme = "oh-my-monokai"
    end,
  },
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
  },
  "wakatime/vim-wakatime"
}

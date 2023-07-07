local Util = require("lazyvim.util")

return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = {
          {
            filetype = "undotree",
            text = "Undotree",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "NvimTree",
            text = "Explorer",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "DiffviewFiles",
            text = "Diff View",
            highlight = "PanelHeading",
            padding = 1,
          },
          {
            filetype = "flutterToolsOutline",
            text = "Flutter Outline",
            highlight = "PanelHeading",
          },
          {
            filetype = "lazy",
            text = "Lazy",
            highlight = "PanelHeading",
            padding = 1,
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
    },
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>dx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
      { "<leader>dX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
      { "<leader>dL", "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
      { "<leader>dQ", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
    },
  },
  {
    "folke/todo-comments.nvim",
    keys = {
      { "<leader>dt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>dT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "<localleader>sa",
        delete = "<localleader>sd",
        find = "<localleader>sf",
        find_left = "<localleader>sF",
        highlight = "<localleader>sh",
        replace = "<localleader>sr",
        update_n_lines = "<localleader>sn",
      },
    },
  },
  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- disable all keys
    -- keys = function()
    --   return {}
    -- end,
    -- stylua: ignore
    keys = function()
      return {
        { "<leader>bc", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
        { "<localleader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
        { "<leader>bC", function() require("mini.bufremove").delete(0, true) end, desc = "Close Buffer (Force)" },
      }
    end,
    -- stylua: ignore
    -- keys = {
    --   { "<leader>bc", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
    --   { "<localleader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
    --   { "<leader>bC", function() require("mini.bufremove").delete(0, true) end, desc = "Close Buffer (Force)" },
    --   { "<leader>bd", false },
    --   { "<leader>bD", false },
    -- },
  },
  {
    "nvim-telescope/telescope.nvim",
    commit = vim.fn.has("nvim-0.9.0") == 0 and "057ee0f8783" or nil,
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>,", false },
      { "<leader>/", false },
      { "<leader>:", false },
      { "<leader><space>", false },
      -- find
      { "<leader>fc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>ft", Util.telescope("live_grep"), desc = "Text" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fB", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "All Buffers" },
      { "<leader>fw", Util.telescope("grep_string"), desc = "Word (root dir)" },
      { "<leader>fW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      },
    },
    config = function(_, opts)
      local defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        -- ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<localleader>s"] = { name = "+Surround" },
        ["<leader>t"] = { name = "+Tabs" },
        ["<leader>b"] = { name = "+Buffer" },
        ["<leader>c"] = { name = "+Code" },
        ["<leader>d"] = { name = "+Diagnostics" },
        ["<leader>f"] = { name = "+Find" },
        ["<leader>g"] = { name = "+Git" },
        ["<leader>gh"] = { name = "+Hunks" },
        ["<leader>q"] = { name = "+Session" },
        ["<leader>s"] = { name = "+Search" },
        ["<leader>p"] = { name = "+Plugins" },
        ["<leader>u"] = { name = "+UI" },
        ["<leader>w"] = { name = "+Windows" },
      }
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(defaults)
    end,
  },
  -- fix notify background_colour
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
    },
  },
  -- add custom colorscheme
  {
    "justinsgithub/oh-my-monokai.nvim",
    opts = {
      transparent_background = true,
      palette = "justinsgithub",
    },
  },
  -- Configure LazyVim to load custom colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "oh-my-monokai",
    },
  },
}

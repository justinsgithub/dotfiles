local Util = require("lazyvim.util")

return {
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
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
        end,
        desc = "Explorer",
      },
      {
        "<leader>E",
        false, -- function() require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() }) end, desc = "Explorer (cwd)", },
        { "<leader>fe", false },
        { "<leader>fE", false },
      },
    },
  },
  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bc", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
      { "<localleader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Close Buffer" },
      { "<leader>bC", function() require("mini.bufremove").delete(0, true) end, desc = "Close Buffer (Force)" },
      { "<leader>bd", false },
      { "<leader>bD", false },
    },
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
        ["gz"] = { name = "+surround" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>t"] = { name = "+Tabs" },
        ["<leader>b"] = { name = "+Buffer" },
        ["<leader>c"] = { name = "+Code" },
        ["<leader>f"] = { name = "+Find" },
        ["<leader>g"] = { name = "+Git" },
        ["<leader>gh"] = { name = "+Hunks" },
        ["<leader>q"] = { name = "+Session" },
        ["<leader>s"] = { name = "+Search" },
        ["<leader>p"] = { name = "+Plugins" },
        ["<leader>u"] = { name = "+UI" },
        ["<leader>w"] = { name = "+Windows" },
        ["<leader>x"] = { name = "+Diagnostics" },
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
      checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = true, -- get a notification when new updates are found
        frequency = 604800, -- check for updates once a week
      },
      colorscheme = "oh-my-monokai",
    },
  },
}

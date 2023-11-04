---@class BF :LazyPlugin
local plugin_spec = {
  "akinsho/bufferline.nvim",
  enabled = true,
  opts = {
    options = {
      -- groups = {
      --   options = {
      --     toggle_hidden_on_enter = true, -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      --   },
      --   items = {
      --     {
      --       auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
      --       highlight = { undercurl = true, sp = "green" },
      --       -- icon = "", -- Optional
      --       matcher = function(buf)
      --         return buf.name:match("%.md") -- or buf.name:match("%.txt")
      --       end,
      --       name = "MD",
      --       priority = 1, -- determines where it will appear relative to other groups (Optional)
      --       -- separator = { -- Optional
      --       --   style = require("bufferline.groups").separator.tab,
      --       -- },
      --     },
      --     {
      --       auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
      --       highlight = { underline = true, sp = "blue" }, -- Optional
      --       -- icon = "", -- Optional
      --       matcher = function(buf) -- Mandatory
      --         return buf.name:match("%.lua") -- or buf.name:match("%_spec")
      --       end,
      --       name = "Lua", -- Mandatory
      --       priority = 2, -- determines where it will appear relative to other groups (Optional)
      --     },
      --     {
      --       auto_close = false, -- whether or not close this group if it doesn't contain the current buffer
      --       highlight = { underline = true, sp = "orange" }, -- Optional
      --       -- icon = "", -- Optional
      --       matcher = function(buf) -- Mandatory
      --         return buf.name:match("%.rs") --or buf.name:match("%_spec")
      --       end,
      --       name = "Rust", -- Mandatory
      --       priority = 3, -- determines where it will appear relative to other groups (Optional)
      --     },
      --   },
      -- },
      mode = "buffers",
      -- separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
      separator_style = "slant",
      hover = {
        enabled = true,
        delay = 200,
        reveal = { "close" },
      },
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
  keys = {
    { "<leader>bm", "<cmd>BufferLineGroupToggle MD<cr>", desc = "Toggle MD" },
    { "<leader>bM", "<cmd>BufferLineGroupClose MD<cr>", desc = "Close MD" },
    { "<leader>bl", "<cmd>BufferLineGroupToggle Lua<cr>", desc = "Toggle Lua" },
    { "<leader>bL", "<cmd>BufferLineGroupClose Lua<cr>", desc = "Close Lua" },
    { "<leader>br", "<cmd>BufferLineGroupToggle Rust<cr>", desc = "Toggle Rust" },
    { "<leader>bR", "<cmd>BufferLineGroupClose Rust<cr>", desc = "Close Rust" },
  },
}
return plugin_spec

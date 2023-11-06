local M = {}

---@class Config
---@field override fun(colors: Colorscheme)
local default = {
  transparent_background = true,
  theme = "default",
  terminal_colors = true,
  inc_search = "background", -- underline | background
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    "which-key",
    "renamer",
    -- "neo-tree",
  },
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
      bold = true,
    },
    indent_blankline = {
      context_start_underline = false,
    },
  },
  ---@param colors Colorscheme
  override = function(colors) end,
}

-- TODO: remove
---@type Config
M.options = default

-- TODO: remove
---@param options Config|nil
M.setup = function(options) end

return M

local utils = require("theme-daddy.utils")
local theme = require("theme-daddy.theme")

local M = {}

M.load = function()
  utils.load(theme.hl_groups)
end

M.get_base_color = function()
  local base_color = require("theme-daddy.colorscheme").colors.base
  return base_color
end

return M

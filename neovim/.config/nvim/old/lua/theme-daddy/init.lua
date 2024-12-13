local utils = require("theme-daddy.utils")
local theme = require("theme-daddy.theme")

local draw = utils.draw

local M = {}

local hl_groups = theme.hl_groups

M.load = function()
  -- if vim.g.colors_name then
  --   vim.cmd([[hi clear]])
  -- end

  vim.o.termguicolors = true
  vim.g.colors_name = "theme-daddy"

  draw(hl_groups)

  local bufferline_icon_group = require("theme-daddy.theme.plugins.bufferline").setup_bufferline_icon()
  draw(bufferline_icon_group)
  -- draw bufferline icons
  vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufWinEnter", "BufRead" }, {
    pattern = "*",
    callback = function()
      if vim.g.colors_name ~= "theme-daddy" then
        return true
      end
      bufferline_icon_group = require("theme-daddy.theme.plugins.bufferline").setup_bufferline_icon()
      draw(bufferline_icon_group)
    end,
  })
end

M.get_base_color = function()
  local base_color = require("theme-daddy.colorscheme").base
  return base_color
end

return M

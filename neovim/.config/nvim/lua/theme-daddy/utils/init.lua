local hp = require("theme-daddy.utils.color_helper")

local M = {}

local function get_real_color(hex_color, base)
  if hex_color == nil or string.len(hex_color) ~= 9 then
    return hex_color
  end

  ---@module "theme-daddy.colorscheme.colors"
  local c = require("theme-daddy.colorscheme.colors")
  if base == nil then
    base = c.background
  end
  if string.len(base) == 9 then
    base = hp.extend_hex(base, c.background)
  end
  return hp.extend_hex(hex_color, base)
end

local gen_hl_value = function(value)
  local bg_value = get_real_color(value.bg, value.bg_base)
  local fg_value = get_real_color(value.fg, value.fg_base)
  local sp_value = get_real_color(value.sp, bg_value)
  value.bg = bg_value
  value.fg = fg_value
  value.sp = sp_value
  value.bg_base = nil
  value.fg_base = nil
  value.style = nil
  return value
end

local highlight = function(group, value)
  local link = value.link
  if link ~= nil then
    local cmd = "hi! link " .. group .. " " .. link
    vim.api.nvim_command(cmd)
    return
  end
  local generatedHlValue = gen_hl_value(value)
  vim.api.nvim_set_hl(0, group, generatedHlValue)
end

M.draw = function(groups)
  if groups == nil then
    return
  end
  for group, value in pairs(groups) do
    highlight(group, value)
  end
end

M.notify = function(msg, level, opts)
  opts = opts or {}
  level = vim.log.levels[level:upper()]
  if type(msg) == "table" then
    msg = table.concat(msg, "\n")
  end
  local nopts = { title = "Theme Daddy" }
  if opts.once then
    return vim.schedule(function()
      vim.notify_once(msg, level, nopts)
    end)
  end
  vim.schedule(function()
    vim.notify(msg, level, nopts)
  end)
end

---@param colors Colorscheme
M.terminal = function(colors)
  -- dark
  vim.g.terminal_color_0 = colors.base.black
  vim.g.terminal_color_8 = colors.base.dimmed3

  -- light
  vim.g.terminal_color_7 = colors.base.white
  vim.g.terminal_color_15 = colors.base.white

  -- colors
  vim.g.terminal_color_1 = colors.base.red
  vim.g.terminal_color_9 = colors.base.red

  vim.g.terminal_color_2 = colors.base.green
  vim.g.terminal_color_10 = colors.base.green

  vim.g.terminal_color_3 = colors.base.yellow
  vim.g.terminal_color_11 = colors.base.yellow

  vim.g.terminal_color_4 = colors.base.blue
  vim.g.terminal_color_12 = colors.base.blue

  vim.g.terminal_color_5 = colors.base.magenta
  vim.g.terminal_color_13 = colors.base.magenta

  vim.g.terminal_color_6 = colors.base.cyan
  vim.g.terminal_color_14 = colors.base.cyan
end

return M

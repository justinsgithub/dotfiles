---@class Opts
---@field name string: a string with the command name
---@field fargs table: containing the command arguments split by whitespace (see |<f-args>|)
---@field bang boolean: `true` if the command was executed with a `!` modifier (see |<bang>|)
---@field line1 number: starting line number of the command range (see |<line1>|)
---@field line2 number: final line number of the command range (see |<line2>|)
---@field range number: number of items in the command range: 0, 1, or 2 (see |<range>|)
---@field count number: any count supplied (see |<count>|)
---@field smods table: a table containing the command modifiers (see |<mods>|)

---@param opts Opts
vim.api.nvim_create_user_command("OpenLine", function(opts)
  local where = opts.fargs[1]
  if where == "below" then
    vim.cmd("normal mzo`z")
  else
    vim.cmd("normal mzO`z")
  end
end, {
  desc = "Better open line",
  force = true,
  nargs = 1,
})

vim.api.nvim_create_user_command("MkOpenSrc", function(_)
  local srcpath = "src/" .. vim.api.nvim_eval("expand('<cWORD>')")
  vim.cmd("e " .. srcpath)
end, {
  desc = "Open code block source file",
  force = true,
  nargs = "?",
})

vim.api.nvim_create_user_command("BiPolar", function(_)
  local moods_table = {
    ["true"] = "false",
    ["false"] = "true",
    ["True"] = "False",
    ["False"] = "True",
    ["on"] = "off",
    ["off"] = "on",
    ["On"] = "Off",
    ["Off"] = "On",
    ["Up"] = "Down",
    ["Down"] = "Up",
    ["up"] = "down",
    ["down"] = "up",
    ["cold"] = "hot",
    ["hot"] = "cold",
    ["Cold"] = "Hot",
    ["Hot"] = "Cold",
    ["open"] = "close",
    ["close"] = "open",
    ["Open"] = "Close",
    ["Close"] = "Open",
    ["opened"] = "closed",
    ["closed"] = "opened",
    ["Opened"] = "Closed",
    ["Closed"] = "Opened",
    ["sun"] = "moon",
    ["moon"] = "sun",
    ["Sun"] = "Moon",
    ["Moon"] = "Sun",
    ["water"] = "fire",
    ["fire"] = "water",
    ["Water"] = "Fire",
    ["Fire"] = "Water",
    ["good"] = "bad",
    ["Good"] = "Bad",
    ["bad"] = "good",
    ["Bad"] = "Good",
  }
  local cursor_word = vim.api.nvim_eval("expand('<cword>')")
  if moods_table[cursor_word] then
    vim.cmd("normal ciw" .. moods_table[cursor_word] .. "")
  end
end, { desc = "Switch Moody Words", force = true })

local wezterm = require("wezterm")

local act = wezterm.action
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


-- CTRL + SHIFT + ARROW = switch panes
local mykeys = {}
for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(mykeys, {
    key = tostring(i),
    mods = "ALT",
    action = act({ ActivateTab = i - 1 }),
  })
end

table.insert(mykeys, { key = "[", mods = "ALT", action = act.MoveTabRelative(-1) })
table.insert(mykeys, { key = "]", mods = "ALT", action = act.MoveTabRelative(1) })
table.insert(mykeys, { key = "m", mods = "ALT", action = act({ SendString = "Hello" }) })
table.insert(mykeys, { key = "f", mods = "ALT", action = "ToggleFullScreen" })
table.insert(mykeys, { key = "H", mods = "ALT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) })
table.insert(mykeys, { key = "V", mods = "ALT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) })
table.insert(mykeys, { key = "h", mods = "ALT", action = act({ ActivatePaneDirection = "Left" }) })
table.insert(mykeys, { key = "j", mods = "ALT", action = act({ ActivatePaneDirection = "Down" }) })
table.insert(mykeys, { key = "k", mods = "ALT", action = act({ ActivatePaneDirection = "Up" }) })
table.insert(mykeys, { key = "l", mods = "ALT", action = act({ ActivatePaneDirection = "Right" }) })
table.insert(mykeys, { key = "n", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDomain" }) })
table.insert(mykeys, { key = "h", mods = "CTRL|ALT", action = act.AdjustPaneSize { 'Left', 1 } })
table.insert(mykeys, { key = "j", mods = "CTRL|ALT", action = act.AdjustPaneSize { 'Down', 1 } })
table.insert(mykeys, { key = "k", mods = "CTRL|ALT", action = act.AdjustPaneSize { 'Up', 1 } })
table.insert(mykeys, { key = "l", mods = "CTRL|ALT", action = act.AdjustPaneSize { 'Right', 1 } })

-- TODO: look into other features for fonts https://docs.microsoft.com/en-us/typography/opentype/spec/featurelist
config.font = wezterm.font 'Fira Code'
-- config.font = wezterm.font('Fira Code', { italic = true })
config.harfbuzz_features = {
  'calt=1',
  'clig=1',
  'liga=1',
  'zero',
  'onum',
  'ss1',
  'ss2',
  'ss3',
  'ss4',
  'ss5',
  'ss6',
  'ss7',
  'ss8',
  'ss9',
  'ss10',
  'cv01',
  'cv02',
  'cv03',
  'cv04',
  'cv05',
  'cv06',
  'cv07',
  'cv08',
  'cv09',
  'cv10',
  'cv11',
  'cv12',
  'cv13',
  'cv14',
  'cv15',
  'cv16',
  'cv17',
  'cv18',
  'cv19',
  'cv20',
  'cv21',
  'cv22',
  'cv23',
  'cv24',
  'cv25',
  'cv26',
  'cv27',
  'cv28',
  'cv29',
  'cv30',
  'cv31',
}
config.audible_bell = "Disabled"
config.window_background_opacity = 0.90
config.scrollback_lines = 10000
config.color_scheme = "Monokai Vivid"
config.exit_behavior = "Close"
config.keys = mykeys

return config

-- The filled in variant of the < symbol
--[[ local SOLID_LEFT_ARROW = utf8.char(0xe0b2) ]]

-- The filled in variant of the > symbol
--[[ local SOLID_RIGHT_ARROW = utf8.char(0xe0b0) ]]

--[[ wezterm.on( ]]
--[[   'format-tab-title', ]]
--[[   function(tab, tabs, panes, config, hover, max_width) ]]
--[[     local edge_background = '#0b0022' ]]
--[[     local background = '#1b1032' ]]
--[[     local foreground = '#808080' ]]
--[[]]
--[[     if tab.is_active then ]]
--[[       background = '#2b2042' ]]
--[[       foreground = '#c0c0c0' ]]
--[[     elseif hover then ]]
--[[       background = '#3b3052' ]]
--[[       foreground = '#909090' ]]
--[[     end ]]
--[[]]
--[[     local edge_foreground = background ]]
--[[]]
-- ensure that the titles fit in the available space,
-- and that we have room for the edges.
--[[ local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2) ]]
--[[ local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2) ]]
--[[ local t = wezterm.truncate_right(tab.active_pane.pane_id, max_width - 2) ]]

--[[     return { ]]
--[[       { Background = { Color = edge_background } }, ]]
--[[       { Foreground = { Color = edge_foreground } }, ]]
--[[       --[[ { Text = SOLID_LEFT_ARROW }, ]]
--[[       { Background = { Color = background } }, ]]
--[[       { Foreground = { Color = foreground } }, ]]
--[[       { Text = title }, ]]
--[[       { Background = { Color = edge_background } }, ]]
--[[       { Foreground = { Color = edge_foreground } }, ]]
--[[       --[[ { Text = SOLID_RIGHT_ARROW }, ]]
--[[     } ]]
--[[   end ]]
--[[ ) ]]

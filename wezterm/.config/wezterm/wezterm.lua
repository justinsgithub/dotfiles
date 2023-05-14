local wezterm = require("wezterm")

local act = wezterm.action

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
table.insert( mykeys, { key = "H", mods = "ALT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) })
table.insert( mykeys, { key = "V", mods = "ALT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) })
table.insert( mykeys, { key = "h", mods = "ALT", action = act({ ActivatePaneDirection =  "Left" }) })
table.insert( mykeys, { key = "j", mods = "ALT", action = act({ ActivatePaneDirection =  "Down" }) })
table.insert( mykeys, { key = "k", mods = "ALT", action = act({ ActivatePaneDirection =  "Up" }) })
table.insert( mykeys, { key = "l", mods = "ALT", action = act({ ActivatePaneDirection =  "Right" }) })
table.insert(mykeys, { key = "n", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDomain" }) })
table.insert(mykeys, { key = "h", mods = "CTRL|ALT", action = act.AdjustPaneSize{'Left', 1} })
table.insert(mykeys, { key = "j", mods = "CTRL|ALT", action = act.AdjustPaneSize{'Down', 1} })
table.insert(mykeys, { key = "k", mods = "CTRL|ALT", action = act.AdjustPaneSize{'Up', 1} })
table.insert(mykeys, { key = "l", mods = "CTRL|ALT", action = act.AdjustPaneSize{'Right', 1} })

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

return {
  audible_bell = "Disabled",
	window_background_opacity = 0.90,
	scrollback_lines = 10000,
	color_scheme = "Monokai Vivid",
	exit_behavior = "Close",
	keys = mykeys,
}

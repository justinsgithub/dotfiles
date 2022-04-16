local wezterm = require("wezterm")

local mykeys = {}
for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(mykeys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action({ ActivateTab = i - 1 }),
	})
end

table.insert(mykeys, { key = "m", mods = "ALT", action = wezterm.action({ SendString = "Hello" }) })
table.insert(mykeys, { key = "f", mods = "ALT", action = "ToggleFullScreen" })
table.insert(
	mykeys,
	{ key = "v", mods = "ALT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) }
)
table.insert(
	mykeys,
	{ key = "h", mods = "ALT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) }
)

return {
	window_background_opacity = 0.95,
	scrollback_lines = 10000,
	color_scheme = "Monokai Vivid",
	exit_behavior = "Close",
	keys = mykeys,
}

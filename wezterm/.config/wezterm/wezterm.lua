local wezterm = require("wezterm")

return {
	window_background_opacity = 0.95,
  scrollback_lines = 10000,
	--color_scheme = "Batman",
	-- color_scheme = "Monokai Remastered",
	color_scheme = "Monokai Vivid",
	exit_behavior = "Close",
	keys = {
		{ key = "m", mods = "ALT", action = wezterm.action({ SendString = "Hello" }) },
    {key="f", mods="ALT", action="ToggleFullScreen"},
		{ key = "v", mods = "ALT", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
		{ key = "h", mods = "ALT", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	},
}

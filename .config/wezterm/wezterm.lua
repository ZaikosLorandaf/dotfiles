-- Pull in the wezterm API
--
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("Vulf Mono")
config.font_size = 16

config.enable_tab_bar = false

config.colors = {

	-- background = "#111a1f",

	brights = {
		"#111a1f",
		"#8d7856",
		"#798362",
		"#9b9257",
		"#63768a",
		"#b7416e",
		"#6998b3",
		"#c5c8c6",
	},

	ansi = {
		-- Instead of the second red."#c0c7ca",
		"#111a1f",
		"#8d7856",
		"#798362",
		"#9b9257",
		"#63768a",
		"#b7416e",
		"#6998b3",
		"#c5c8c6",
	},
}

config.window_background_opacity = 0.7

return config

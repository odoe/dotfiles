-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.font = wezterm.font("Hack Nerd Font")
-- config.font_size = 14.0
config.font_size = 16.0

-- For example, changing the color scheme:
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Catppuccin Latte"

config.enable_tab_bar = false

wezterm.on("toggle-opacity", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.90
	else
		overrides.window_background_opacity = nil
	end
	window:set_config_overrides(overrides)
end)

-- config.window_background_opacity = 0.95

config.keys = {
	{
		key = "B",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
}

-- and finally, return the configuration to wezterm
return config

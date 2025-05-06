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

-- Fonts

-- config.font = wezterm.font("Hack Nerd Font Mono")
config.font = wezterm.font("DankMono Nerd Font Mono")
-- config.font_size = 14.0
config.font_size = 16.0
config.line_height = 1.2

-- Colors

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Catppuccin Latte"

-- Appearance

config.enable_tab_bar = false
-- config.use_fancy_tab_bar = false

wezterm.on("toggle-opacity", function(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.window_background_opacity then
		overrides.window_background_opacity = 0.80
		overrides.macos_window_background_blur = 40
	else
		overrides.window_background_opacity = nil
		overrides.macos_window_background_blur = nil
	end
	window:set_config_overrides(overrides)
end)

config.window_decorations = "RESIZE"
-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- Miscellaneous

config.max_fps = 120
config.prefer_egl = true

config.keys = {
	{
		key = "B",
		mods = "CTRL",
		action = wezterm.action.EmitEvent("toggle-opacity"),
	},
}

-- and finally, return the configuration to wezterm
return config

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
config.font_size = 12.0

-- For example, changing the color scheme:
config.color_scheme = "Hardcore"

config.window_background_opacity = 0.95

config.enable_tab_bar = false

-- and finally, return the configuration to wezterm
return config

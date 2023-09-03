-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- Use config_builder, help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- Settings
config.color_scheme = "nightfox"
--config.color_scheme = "Tokyo Night"
config.font_size = 18
config.font = wezterm.font_with_fallback({
	{
		family = "Liga SFMono Nerd Font",
		weight = "Regular",
	},
	{
		family = "Hack Nerd Font",
		weight = "Regular",
	},
})
config.use_fancy_tab_bar = false
config.force_reverse_video_cursor = true
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = true
config.max_fps = 120
config.tab_max_width = 32
config.window_close_confirmation = "AlwaysPrompt"
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.window_padding = {
	left = "1.2cell",
	right = "1.2cell",
	top = "0.6cell",
	bottom = "0.6cell",
}
config.scrollback_lines = 3000

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.5,
}

config.keys = {
	-- CMD-Escape, will switch back to the last active tab
	{
		key = "Escape",
		mods = "CMD",
		action = wezterm.action.ActivateLastTab,
	},
}

-- and finally, return the configuration to wezterm
return config

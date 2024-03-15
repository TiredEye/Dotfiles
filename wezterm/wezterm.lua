-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

--test
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

function detect_host_os()
	-- package.config:sub(1,1) returns '\' for windows and '/' for *nix.
	if package.config:sub(1, 1) == "\\" then
		return "windows"
	else
		-- uname should be available on *nix systems.
		local check = io.popen("uname -s")
		local result = check:read("*l")
		check:close()

		if result == "Darwin" then
			return "macos"
		else
			return "linux"
		end
	end
end

local host_os = detect_host_os()

if host_os == "macos" then
	-- check homebrew binary symlinks on startup.
	config.set_environment_variables = {
		PATH = "/opt/homebrew/bin/:" .. os.getenv("PATH"),
	}
end

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
config.adjust_window_size_when_changing_font_size = false
--config.macos_window_background_blur = 20
config.max_fps = 120
config.tab_max_width = 32
config.window_close_confirmation = "AlwaysPrompt"
config.window_background_opacity = 0.75
config.window_decorations = "RESIZE"
config.window_padding = {
	left = "1.4cell",
	right = "1.4cell",
	top = "0.8cell",
	bottom = "0.8cell",
}
config.scrollback_lines = 3000
--config.tab_bar_at_bottom = true
--config.freetype_load_target = "HorizontalLcd"
-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.3,
	brightness = 0.5,
}

local act = wezterm.action
config.keys = {
	-- CMD-Escape, will switch back to the last active tab
	{ key = "Escape", mods = "CMD", action = act.ActivateLastTab },

	-- Close current Pane
	{ key = "w", mods = "CMD|SHIFT", action = act.CloseCurrentPane({ confirm = true }) },

	--TMUX Keys
	--{ key = "T", mods = "CMD", action = wezterm.action.SendString("\x02c") },

	-- Create Splits
	{ key = "Enter", mods = "CMD|SHIFT", action = act.SplitVertical },
	{ key = "Enter", mods = "CMD|", action = act.SplitHorizontal },

	-- Move to Pane
	{ key = "UpArrow", mods = "CMD", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "CMD", action = act.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "CMD", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "CMD", action = act.ActivatePaneDirection("Right") },
}

-- and finally, return the configuration to wezterm
return config

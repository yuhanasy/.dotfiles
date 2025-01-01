-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 12

config.color_scheme = "Catppuccin Macchiato"
config.window_background_opacity = 0.95
config.macos_window_background_blur = 10

-- tab bar
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- tmux status
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	if window:leader_is_active() then
		prefix = " " .. utf8.char(0x1f30a) -- ocean wave
		SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end -- arrow color based on if tab is first pane

	window:set_left_status(wezterm.format({
		{ Background = { Color = "#b7bdf8" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))

	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end

	window:set_right_status(wezterm.format({
		-- { Background = { Color = "#b7bdf8" } },
		{ Foreground = { Color = "#c6a0f6" } },
		{ Text = name or "" },
	}))
end)

config.leader = { mods = "CTRL", key = "l", timeout_milliseconds = 2000 }
config.keys = {
	{
		mods = "LEADER",
		key = "r",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	{
		mods = "LEADER",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		mods = "LEADER",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "|",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "LEADER",
		key = "\\",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "CTRL|SHIFT",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "CTRL|SHIFT",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "CTRL|SHIFT",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
}

config.key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 5 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 5 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 5 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },

		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

-- and finally, return the configuration to wezterm
return config

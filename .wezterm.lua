local wezterm = require("wezterm")
local act = wezterm.action

return {
  color_scheme_dirs = { "~/.config/wezterm/colors" },
	color_scheme = "Everforest Dark (Medium)",
	font = wezterm.font("CaskaydiaCove NF"),
	font_size = 13,
	keys = {
		{ key = "x", mods = "ALT|CTRL", action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "d", mods = "ALT|CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "SHIFT|ALT|CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "b", mods = "ALT|SHIFT", action = act.ScrollByPage(-1) },
		{ key = "f", mods = "ALT|SHIFT", action = act.ScrollByPage(1) },
	},
}

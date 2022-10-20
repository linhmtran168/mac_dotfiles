local wezterm = require 'wezterm'
local act = wezterm.action

return {
  color_scheme = "Tomorrow Night Eighties",
  font = wezterm.font 'CaskaydiaCove Nerd Font',
  font_size = 12.5,
    keys = {
      { key = 'x', mods = 'ALT|CTRL', action = act.CloseCurrentPane { confirm = true } },
      { key = 'd', mods = 'ALT|CTRL', action = act.SplitHorizontal { domain =  'CurrentPaneDomain' } },
      { key = 'd', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical { domain =  'CurrentPaneDomain' } },
      { key = 'b', mods = 'ALT|SHIFT', action = act.ScrollByPage(-1) },
      { key = 'f', mods = 'ALT|SHIFT', action = act.ScrollByPage(1) },
  },
}

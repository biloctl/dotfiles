local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Dracula'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 14.0
config.window_decorations = "RESIZE"
config.max_fps = 120
config.window_background_opacity = 1.0
config.macos_window_background_blur = 20
config.window_padding = { left = 12, right = 12, top = 12, bottom = 8 }
config.scrollback_lines = 10000
config.default_cursor_style = 'BlinkingBar'

-- tab bar
config.hide_tab_bar_if_only_one_tab = true   -- no tab bar until you have 2+ tabs
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false              -- set true to move tabs to the bottom
config.tab_max_width = 20
config.show_new_tab_button_in_tab_bar = false
wezterm.on('format-tab-title', function(tab)
  return ' ' .. tab.active_pane.title:gsub('.*[/\\]', '') .. ' '
end)
config.colors = {
  tab_bar = {
    background = 'none',

    active_tab = {
      bg_color = '#bd93f9',
      fg_color = '#282a36',
      intensity = 'Bold',
    },

    inactive_tab = {
      bg_color = 'none',
      fg_color = '#6272a4',
    },

    inactive_tab_hover = { bg_color = '#44475a',
      fg_color = '#f8f8f2',
    },

    new_tab = {
      bg_color = '#21222c',
      fg_color = '#6272a4',
    },

    new_tab_hover = {
      bg_color = '#44475a',
      fg_color = '#f8f8f2',
    },
  },
}

-- inactive pane 
config.inactive_pane_hsb = {
  saturation = 0.2,
  brightness = 0.2,
}

-- splits
config.keys = {
  -- Split the current pane.
  -- CMD+D       -> split into LEFT/RIGHT
  { key = 'd', mods = 'CMD',        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  -- CMD+SHIFT+D -> split into TOP/BOTTOM
  { key = 'd', mods = 'CMD|SHIFT',  action = wezterm.action.SplitVertical   { domain = 'CurrentPaneDomain' } },

  -- Move between panes with CMD + arrow keys.
  { key = 'LeftArrow',  mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Left'  },
  { key = 'RightArrow', mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Up'    },
  { key = 'DownArrow',  mods = 'CMD', action = wezterm.action.ActivatePaneDirection 'Down'  },

  -- CMD+W closes the current pane (asks first).
  { key = 'w', mods = 'CMD', action = wezterm.action.CloseCurrentPane { confirm = true } },

  -- CMD+Enter zooms the current pane to fullscreen (toggle).
  { key = 'Enter', mods = 'CMD', action = wezterm.action.TogglePaneZoomState },
}

return config

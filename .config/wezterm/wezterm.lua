local wezterm = require 'wezterm';
-- Ligature examples: => !=  >=

return {
  font = wezterm.font_with_fallback({
    "VictorMono Nerd Font",
    "CaskaydiaCove Nerd Font",
    "SauceCodePro Nerd Font",
    "FiraCode Nerd Font"
  }),
  cursor_blink_rate = 420,
  default_cursor_style = "BlinkingBlock",
  hide_tab_bar_if_only_one_tab = true,
  font_size = 16,
  window_close_confirmation = "NeverPrompt",
  window_background_opacity = 0.95,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  color_scheme = "Dracula",
  colors = {
    foreground = "#f7f1ff",
    background = "#221f22",
    -- cursor_bg = "#52ad70",
    -- cursor_fg = "black",
    -- cursor_border = "#52ad70",
  },
  hyperlink_rules = {
    -- Linkify things that look like URLs
    -- This is actually the default if you don't specify any hyperlink_rules
    {
      regex = "\\b\\w+://(?:[\\w.-]+)\\.[a-z]{2,15}\\S*\\b",
      format = "$0",
    },

    -- linkify email addresses
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },

    -- file:// URI
    {
      regex = "\\bfile://\\S*\\b",
      format = "$0",
    },

    -- Make task numbers clickable
    --[[
    {
      regex = "\\b[tT](\\d+)\\b"
      format = "https://example.com/tasks/?t=$1"
    }
    ]]
  },

}

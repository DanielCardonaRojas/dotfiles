local wezterm = require 'wezterm';

return {
  font = wezterm.font("FiraCode Nerd Font"),
  cursor_blink_rate = 420,
  default_cursor_style = "BlinkingBlock",
  hide_tab_bar_if_only_one_tab = true,
  font_size = 16.5,
  window_close_confirmation = "NeverPrompt",
  color_scheme = "Dracula",
  colors = {
    foreground = "#f7f1ff",
    background = "#221f22",
    cursor_bg = "#52ad70",
    cursor_fg = "black",
    cursor_border = "#52ad70",
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
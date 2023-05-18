return {
  "goolord/alpha-nvim",
  opts = function()
    local logo = [[






    ]]

    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = vim.split(logo, "\n")

    local noteOpenButton = dashboard.button("m", " " .. " Open note", ":ObsidianQuickSwitch <CR>")
    noteOpenButton.opts.hl = "AlphaButtons"
    noteOpenButton.opts.hl_shortcut = "AlphaShortcut"

    local newNoteButton = dashboard.button("e", "󰏫 " .. " Create note", ":ObsidianNew ", { silent = false })
    newNoteButton.opts.hl = "AlphaButtons"
    newNoteButton.opts.hl_shortcut = "AlphaShortcut"
    table.insert(dashboard.section.buttons.val, 4, noteOpenButton)
    table.insert(dashboard.section.buttons.val, 5, newNoteButton)
    return dashboard
  end,
}

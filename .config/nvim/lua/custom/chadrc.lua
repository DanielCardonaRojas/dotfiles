-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

-- M.options = {
--    relativenumber = true,
-- }

-- M.ui = {
--   theme = "nord"
-- }

M.mappings = {
   update_nvchad = "<leader>cu",
}

-- NvChad included plugin options & overrides
M.plugins = {
   options = {
        lspconfig = {
         -- path of file containing setups of different lsps (ex : "custom.plugins.lspconfig"), read the docs for more info
         setup_lspconf = "custom.lspconfig",
        },
   },
   default_plugin_config_replace = {
     telescope = "custom.telescope"
   },
   status = {
    esc_insertmode = false,
    dashboard = true
   }
}

M.mappings.plugins = {
   nvimtree = {
      toggle = "<leader>e",
      focus = "<leader>Z",
   },
   telescope = {
      buffers = "<leader>fb",
      find_files = "<leader>ff",
      find_hiddenfiles = "<leader>fa",
      git_commits = "<leader>gc",
      git_status = "<leader>gs",
      help_tags = "<leader>fh",
      live_grep = "<leader>fs",
      oldfiles = "<leader>fm",
      themes = "<leader>th", -- NvChad theme picker
      -- media previews within telescope finders
      telescope_media = {
         media_files = "<leader>fp",
      },
   },
   dashboard = {
      bookmarks = "<leader>bm",
      new_file = "<leader>fn", -- basically create a new buffer
      open = "<leader>db", -- open dashboard
      session_load = "<leader>ll", -- load a saved session
      session_save = "<leader>sl", -- save a session
   },

}


return M
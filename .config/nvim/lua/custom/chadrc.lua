-- IMPORTANT NOTE : This is the user config, can be edited. Will be preserved if updated with internal updater
-- This file is for NvChad options & tools, custom settings are split between here and 'lua/custom/init.lua'

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}


-- NOTE: To use this, make a copy with `cp example_chadrc.lua chadrc.lua`

--------------------------------------------------------------------

-- To use this file, copy the structure of `core/default_config.lua`,
-- examples of setting relative number & changing theme:

M.options = {
   updatetime = 1700,
   relativenumber = false,
   nvChad = {
      insert_nav = false, -- navigation in insertmode
   },
}

M.ui = {
  theme = "penokai",
  italic_comments = true,
}


M.mappings = {
   new_tab = "<C-T>", -- open a new vim tab
   update_nvchad = "<leader>cu",
   insert_nav = {
      next_line = "<Down>",
      prev_line = "<Up>",
   },
   terminal = {
      esc_termmode = {'<Esc><space>', '<c-space>', '<c-\\>'}, -- multiple mappings allowed
      esc_hide_termmode = { '<c-t>'}, -- multiple mappings allowed
   },
}

-- NvChad included plugin options & overrides
M.plugins = {
   options = {
        luasnip = {
          snippet_path = {'~/development/friendly-snippets', '~/.config/my-snippets' }
        },
        lspconfig = {
         -- path of file containing setups of different lsps (ex : "custom.plugins.lspconfig"), read the docs for more info
         setup_lspconf = "custom.lspconfig",
        },
        nvimtree = {
           enable_git = 1,
        },
   },
   default_plugin_config_replace = {
     telescope = "custom.telescope",
     nvim_cmp = "custom.cmp",
     gitsigns= "custom.gitsigns"
   },
   status = {
    esc_insertmode = false,
    dashboard = true
   }
}

M.mappings.plugins = {
   nvimtree = {
      toggle = "<leader>e",
      focus = "<leader>E",
   },
   telescope = {
      buffers = "<leader>o",
      find_files = "<leader>ff",
      find_hiddenfiles = "<leader>fa",
      git_commits = "<leader>gc",
      git_status = "<leader>gs",
      help_tags = "<leader>fh",
      live_grep = "<leader>fs",
      oldfiles = "<leader>fo",
      themes = "<leader>ct", -- NvChad theme picker
      -- media previews within telescope finders
      telescope_media = {
         media_files = "<leader>fp",
      },
   },
   dashboard = {
      bookmarks = "<leader>bm",
      new_file = "<leader>fn", -- basically create a new buffer
      open = "<leader>db", -- open dashboard
      session_load = "<leader>sl", -- load a saved session
      session_save = "<leader>ss", -- save a session
   },

}


return M

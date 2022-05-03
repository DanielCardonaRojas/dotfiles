-- Just an example, supposed to be placed in /lua/custom/

local cmp = require('cmp')

local M = {}

M.ui = {
   theme = "catppuccin",
   theme_toggle = { "catppuccin", "onedark" },
}

local userPlugins = require "custom.plugins"

M.mappings = {
  nvimtree = {
     mode_opts = { silent = false }, -- this is completely optional
     n = {
        ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "?   toggle nvimtree" },
     },
  },

  ["nvim-telescope/telescope.nvim"] = {
    n = {
            ["<leader>t"] = { "<cmd> Telescope <CR>",  "  help page" },
            ["z="] = { "<cmd> Telescope spell_suggest <CR>", "   Spell suggest"},
            ["<leader>ls"] = { "<cmd> Telescope lsp_document_symbols <CR>", "  lsp symbols"},
            -- find
            ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
            ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
            ["<leader>fs"] = { "<cmd> Telescope live_grep <CR>", "  live grep" },
            ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
            ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
            ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
            ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },

            -- git
            ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
            ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "  git status" },

            -- pick a hidden term
            ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },

            -- theme switcher
            ["<leader>ct"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },
         },
  }
}

M.plugins = {
   user = userPlugins,
   remove = {
      "NvChad/nvterm",
      "max397574/better-escape.nvim",
   },
   override = {
      ["nvim-treesitter/nvim-treesitter"] = {
          ensure_installed = {
            "dart",
            "swift",
            "rust",
            "go",
         },
      },
      ["kyazdani42/nvim-tree.lua"] = {
         git = {
            enable = true,
         },
         view = {
            side = "left",
            width = 40,
            auto_resize  = true,
            allow_resize = true,
         },
      },
      ["akinsho/bufferline.nvim"] = {
         options = {
            max_name_length = 25,
            max_prefix_length = 25,
            tab_size = 30,
         },
      },

     ["hrsh7th/nvim-cmp"] = {
         mapping = {
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
          }
     }
      --------------
   },

}

return M

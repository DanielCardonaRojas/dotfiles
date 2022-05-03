local plugin_settings = require("core.utils").load_config().plugins
local present, packer = pcall(require, plugin_settings.options.packer.init_file)

if not present then
   return false
end

local plugins = {
   ["nvim-lua/plenary.nvim"] = {},
   ["lewis6991/impatient.nvim"] = {},

   ["wbthomason/packer.nvim"] = {
      event = "VimEnter",
   },

   ------------------- CUSTOM PLUGINS START ------------------
    ["rcarriga/vim-ultest"] = {
      requires = {"vim-test/vim-test"}, 
      run = ":UpdateRemotePlugins",
      config = function()
       require('plugins.configs.ultest').configure()
      end,
    },

    ["folke/trouble.nvim"] = {
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          auto_open = false, -- automatically open the list when you have diagnostics
          auto_close = true, -- automatically close the list when you have no diagnostics
          mode = "workspace_diagnostics",
        }
      end,
      setup = function()
        vim.keymap.set("n", "<leader>ll", ":TroubleToggle <CR>", {})
      end
     },

    ["akinsho/toggleterm.nvim"] = {
      event = "VimEnter",
      config = function()
        require("toggleterm").setup{
          start_in_insert = true,
          shade_terminals = false,
        }
      end,
      setup = function()
         require("core.mappings").toggleterm()
      end
    },

    ["beauwilliams/focus.nvim"] = {
      cmd = { 'FocusDisable'},
      config = function()
        require("focus").setup({
          excluded_filetypes = {'toggleterm', 'Trouble', 'NvimTree', 'dapui_scopes', 'dapui_breakpoints', 'dapui_stacks'},
          signcolumn = false
        })
      end,
      setup = function()
        vim.keymap.set("n", '<c-w>t', ':FocusMaxOrEqual <CR>')
      end
    },

    ["kwkarlwang/bufjump.nvim"] = {
      config = function()
          require("bufjump").setup({
              forward = "]f",
              backward = "[f",
              on_success = nil
          })
      end,
    },

    ['phaazon/hop.nvim'] = {
        as = 'hop',
        config = function()
          require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
        end,
        setup = function()
         require("core.mappings").hop()
        end,
   },

    ['stevearc/dressing.nvim'] = {
        requires = {"MunifTanjim/nui.nvim"},
        config = function()
          require('dressing').setup({
            select = {
              backend = { "nui", "telescope", "fzf", "builtin", },
              nui = {
                position = "50%",
                size = nil,
                relative = "editor",
                border = {
                  style = "rounded",
                },
                max_width = 80,
                max_height = 40,
              },
            },
          })
        end
    },

   ['akinsho/flutter-tools.nvim'] = {
     requires = 'nvim-lua/plenary.nvim',
     config = function()
       require("flutter-tools").setup{
        debugger = { -- integrate with nvim dap + install dart code debugger
            enabled = true,
            run_via_dap = true,
            -- register_configurations = function(paths)
            --   require("dap").configurations.dart = {
            --     name = "Launch Flutter",
            --     request = "launch",
            --     type = "dart",
            --   }
            --
            --   require("dap.ext.vscode").load_launchjs()
            -- end,
        },
       } -- use defaults
       -- lsp_attach()
     end,
     setup = function()
       vim.api.nvim_set_keymap('n', '<leader>r', ':FlutterReload <CR>', {})
       vim.api.nvim_set_keymap('n', '<leader>R', ':FlutterRestart <CR>', {})
     end
  },

   ['vim-test/vim-test'] = {},

   ["petertriho/nvim-scrollbar"] = {
     config = function() 
      require("scrollbar").setup({
          excluded_filetypes = {
            'toggleterm', 
            'Trouble', 
            'NvimTree', 
            'dapui_scopes',
            'dapui_breakpoints',
            'dapui_stacks',
            'prompt',
            'TelescopePrompt',
          },
      })
     end,
   },

  ['mfussenegger/nvim-dap'] = {
    config = function()
       require('plugins.configs.dap').configure()
    end,
    setup = function()
       require("core.mappings").dap()
    end
  },

  ["rcarriga/nvim-dap-ui"] = { 
    requires = {"mfussenegger/nvim-dap"},
    config = function() 
      require('dapui').setup({
        sidebar = {
          size = 60,
        }
      })

      local dap = require('dap')

      dap.listeners.before['event_stopped']['rcarriga/nvim-dap-ui'] = function(session, body)
        print('Stopped at breakpoint')
        require("dapui").open()
      end

      dap.listeners.before['event_terminated']['rcarriga/nvim-dap-ui'] = function(session, body)
        require("dapui").close()
      end

    end,
    setup = function()
       require("core.mappings").dapui()
    end,
  },


   ------------------- CUSTOM PLUGINS END  ------------------

   ["NvChad/extensions"] = {},

   ["NvChad/nvim-base16.lua"] = {
      after = "packer.nvim",
      config = function()
         local ok, base16 = pcall(require, "base16")

         if ok then
            base16.load_theme()
         end
      end,
   },

   ["kyazdani42/nvim-web-devicons"] = {
      after = "nvim-base16.lua",
      config = function()
         require "plugins.configs.icons"
      end,
   },

   ["feline-nvim/feline.nvim"] = {
      after = "nvim-web-devicons",
      config = function()
         require "plugins.configs.statusline"
      end,
   },

   ["akinsho/bufferline.nvim"] = {
      after = "nvim-web-devicons",

      setup = function()
         require("core.mappings").bufferline()
      end,

      config = function()
         require "plugins.configs.bufferline"
      end,
   },

   ["lukas-reineke/indent-blankline.nvim"] = {
      event = "BufRead",
      config = function()
         require("plugins.configs.others").blankline()
      end,
   },

   ["NvChad/nvim-colorizer.lua"] = {
      event = "BufRead",
      config = function()
         require("plugins.configs.others").colorizer()
      end,
   },

   ["nvim-treesitter/nvim-treesitter"] = {
      event = { "BufRead", "BufNewFile" },
      run = ":TSUpdate",
      config = function()
         require "plugins.configs.treesitter"
      end,
   },

   -- git stuff
   ["lewis6991/gitsigns.nvim"] = {
      opt = true,
      config = function()
         require("plugins.configs.others").gitsigns()
      end,
      setup = function()
         require("core.utils").packer_lazy_load "gitsigns.nvim"
      end,
   },

   -- lsp stuff

   ["neovim/nvim-lspconfig"] = {
      module = "lspconfig",
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "nvim-lspconfig"
         -- reload the current file so lsp actually starts for it
         vim.defer_fn(function()
            vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
         end, 0)
      end,
      config = function()
         require "plugins.configs.lspconfig"
      end,
   },

   ["ray-x/lsp_signature.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("plugins.configs.others").signature()
      end,
   },

   ["andymass/vim-matchup"] = {
      opt = true,
      setup = function()
         require("core.utils").packer_lazy_load "vim-matchup"
      end,
   },

   ["max397574/better-escape.nvim"] = {
      event = "InsertCharPre",
      config = function()
         require("plugins.configs.others").better_escape()
      end,
   },

   -- load luasnips + cmp related in insert mode only

   ["rafamadriz/friendly-snippets"] = {
      module = "cmp_nvim_lsp",
      event = "InsertEnter",
   },

   ["hrsh7th/nvim-cmp"] = {
      after = "friendly-snippets",
      config = function()
         require "plugins.configs.cmp"
      end,
   },

   ["L3MON4D3/LuaSnip"] = {
      wants = "friendly-snippets",
      after = "nvim-cmp",
      config = function()
         require("plugins.configs.others").luasnip()
      end,
   },

   ["saadparwaiz1/cmp_luasnip"] = {
      after = "LuaSnip",
   },

   ["hrsh7th/cmp-nvim-lua"] = {
      after = "cmp_luasnip",
   },

   ["hrsh7th/cmp-nvim-lsp"] = {
      after = "cmp-nvim-lua",
   },

   ["hrsh7th/cmp-buffer"] = {
      after = "cmp-nvim-lsp",
   },

   ["hrsh7th/cmp-path"] = {
      after = "cmp-buffer",
   },

   -- misc plugins
   ["windwp/nvim-autopairs"] = {
      after = "nvim-cmp",
      config = function()
         require("plugins.configs.others").autopairs()
      end,
   },

   ["goolord/alpha-nvim"] = {
      disable = true,
      config = function()
         require "plugins.configs.alpha"
      end,
   },

   ["numToStr/Comment.nvim"] = {
      module = "Comment",
      keys = { "gc", "gb" },

      setup = function()
         require("core.mappings").comment()
      end,

      config = function()
         require("plugins.configs.others").comment()
      end,
   },

   -- file managing , picker etc
   ["kyazdani42/nvim-tree.lua"] = {
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },

      setup = function()
         require("core.mappings").nvimtree()
      end,

      config = function()
         require "plugins.configs.nvimtree"
      end,
   },

   ["nvim-telescope/telescope.nvim"] = {
      cmd = "Telescope",

      setup = function()
         require("core.mappings").telescope()
      end,

      config = function()
         require "plugins.configs.telescope"
      end,
   },
}

plugins = require("core.utils").remove_default_plugins(plugins)
-- merge user plugin table & default plugin table
plugins = require("core.utils").plugin_list(plugins)

return packer.startup(function(use)
   for _, v in pairs(plugins) do
      use(v)
   end
end)

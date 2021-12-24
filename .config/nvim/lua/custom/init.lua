local hooks = require "core.hooks"
require('custom.autocmds')

function lsp_attach()
   -- Mappings.
   local opts = { noremap = true, silent = true }

   -- See `:help vim.lsp.*` for documentation on any of the below functions
   vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
   vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
   vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
   vim.api.nvim_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<space>la", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<space>lr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<space>lw", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
   vim.api.nvim_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
   vim.api.nvim_set_keymap("n", "ge", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
   vim.api.nvim_set_keymap("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
   vim.api.nvim_set_keymap("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
   vim.api.nvim_set_keymap("n", "<space>lm", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

hooks.add("setup_mappings", function(map)
    vim.o.swapfile=false
    vim.o.pumheight=11
    vim.api.nvim_set_keymap("n", "<leader>w", "<c-w>", {})

    vim.api.nvim_set_keymap('n', '<CR>', ':nohl<CR>', {noremap = true}) -- remove highlight on enter

    -- Window navigation in terminal mode
    vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]], {noremap = true})
    vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]], {noremap = true})
    vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]], {noremap = true})
    vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-W>l]], {noremap = true})

    -- Wildmenu mappings

    vim.api.nvim_set_keymap('c', '<c-j>', '<c-n>', {noremap = true})
    vim.api.nvim_set_keymap('c', '<c-k>', '<c-p>', {noremap = true})

    -- Window resizing
    vim.api.nvim_set_keymap('n', '<c-s-right>', '<c-w>>', {})
    vim.api.nvim_set_keymap('n', '<c-s-left>', '<c-w><', {})
    vim.api.nvim_set_keymap('n', '<c-s-up>', '<c-w>+', {})
    vim.api.nvim_set_keymap('n', '<c-s-down>', '<c-w>-', {})


    -- Misc
    vim.api.nvim_set_keymap('n', 'vil', 'g_v^', {})
    vim.api.nvim_set_keymap("n", "<leader>t", ":Telescope <CR>", {})
    vim.api.nvim_set_keymap("n", "z=", ":Telescope spell_suggest <CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>ls", ":Telescope lsp_document_symbols <CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>f.", ":lua require('custom.telescope').find_configs() <CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<leader>f,", ":lua require('custom.telescope').search_configs() <CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<leader>.", ":lua require('telescope.builtin').lsp_code_actions({ layout_strategy='vertical', layout_config={width=0.4, height=14}}) <CR>", {silent = true})
    -- Tabs
    vim.api.nvim_set_keymap("n", "<leader><tab>", ":tabnext<cr>", {silent  = true})
    vim.api.nvim_set_keymap("n", "<leader><S-tab>", ":tabprev<cr>", {silent  = true})

    vim.cmd [[ :command NvChadTransparent :lua require('custom.misc').toggleTransparent()<CR>]]

end)

hooks.add("install_plugins", function(use)

  -- use { 'dosimple/workspace.vim' }
  -- use 'marko-cerovac/material.nvim'
  -- use 'folke/tokyonight.nvim'

  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })

  use {
    "kwkarlwang/bufjump.nvim",
    config = function()
        require("bufjump").setup({
            forward = "<C-n>",
            backward = "<C-p>",
            on_success = nil
        })
    end,
  }


  use {'wakatime/vim-wakatime'}
  use {'glepnir/lspsaga.nvim'}

  use { 'dstein64/nvim-scrollview', 
    config = function() 
      vim.g.scrollview_excluded_filetypes = { 'NvimTree', 'toggleterm', 'dashboard'}
    end,
    setup = function()
      vim.cmd('highlight ScrollView ctermbg=159 guibg=LightCyan')
    end
  }

  use { "rcarriga/nvim-dap-ui", 
    requires = {"mfussenegger/nvim-dap"}, 
    config = function() 
      require('dapui').setup()
    end,
    setup = function() 
      vim.api.nvim_set_keymap('n', '<leader>dd', ':lua require("dapui").toggle() <CR>', {silent = true})
    end,
  }

  use {'mfussenegger/nvim-dap', 
    config = function() 
      require('custom.dap').configure()
    end,
    setup = function()
      vim.api.nvim_set_keymap("n", "<leader>dh", ':lua require"dap".toggle_breakpoint() <CR>', {})
      vim.api.nvim_set_keymap("n", "<F5>", ':lua require"dap".continue() <CR>', {})
      vim.api.nvim_set_keymap("n", "<leader>dc", ':lua require"dap".continue() <CR>', {})
      vim.api.nvim_set_keymap("n", "<leader>dj", ':lua require"dap".step_over() <CR>', {})
      vim.api.nvim_set_keymap('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l', {})
      vim.api.nvim_set_keymap('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>',  {})
      vim.api.nvim_set_keymap('n', '<leader>da', ':lua require"debugHelper".attach()<CR>', {})
      vim.api.nvim_set_keymap('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>', {})
      vim.api.nvim_set_keymap('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>', {})

      -- vim.api.nvim_set_keymap('n', '<leader>db', ':Telescope dap list_breakpoints<CR>')
    end
  }


  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim',
   config = function()
     require("flutter-tools").setup{
      debugger = { -- integrate with nvim dap + install dart code debugger
          enabled = true,
          run_via_dap = true, -- use dap instead of a plenary job to run flutter apps 
--           register_configurations = function(paths)
--             require("dap").configurations.dart = {
--               name = "Launch Flutter",
--               request = "launch",
--               type = "dart",
--             } 
-- 
--             require("dap.ext.vscode").load_launchjs()
--           end,
      },
     } -- use defaults
     lsp_attach()
   end,
   setup = function()
     vim.api.nvim_set_keymap('n', '<leader>r', ':FlutterReload <CR>', {})
     vim.api.nvim_set_keymap('n', '<leader>R', ':FlutterRestart <CR>', {})
   end
  }

  use { 'vim-test/vim-test' }


  -- HOP
  use {
      'phaazon/hop.nvim',
      as = 'hop',
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
      end,
      setup = function()
        local hop_trigger = "<leader><leader>"
        vim.api.nvim_set_keymap("n", hop_trigger .. "w" , ":HopWordAC <CR>", {})
        vim.api.nvim_set_keymap("n", hop_trigger .. "b" , ":HopWordBC <CR>", {})
        vim.api.nvim_set_keymap("n", hop_trigger .. "f" , ":HopChar1AC <CR>", {})
        vim.api.nvim_set_keymap("n", hop_trigger .. "F" , ":HopChar1BC <CR>", {})
        vim.api.nvim_set_keymap("n", hop_trigger .. "j" , ":HopLineAC <CR>", {})
        vim.api.nvim_set_keymap("n", hop_trigger .. "k" , ":HopLineBC <CR>", {})
      end,
  }


  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        auto_open = false, -- automatically open the list when you have diagnostics
        auto_close = true, -- automatically close the list when you have no diagnostics
        mode = "workspace_diagnostics",
      }
    end,
    setup = function()
      vim.api.nvim_set_keymap("n", "<leader>ll", ":TroubleToggle <CR>", {})
    end
  }

  use { "beauwilliams/focus.nvim",
    cmd = { 'FocuseDisable'},
    config = function()
      require("focus").setup({
        excluded_filetypes = {'toggleterm', 'Trouble', 'NvimTree', 'dapui_scopes', 'dapui_breakpoints', 'dapui_stacks'},
        signcolumn = false
      })
    end,
    setup = function()
      vim.api.nvim_set_keymap("n", '<c-w>=', ':FocusMaxOrEqual <CR>', {})
    end
  }

  use {
      "akinsho/toggleterm.nvim",
      event = "VimEnter",
      config = function()
        require("toggleterm").setup{
          start_in_insert = true,
        }
      end,
      setup = function()
        vim.api.nvim_set_keymap('n', "<leader>gg", "<cmd>lua require('custom.toggleterm').lzg()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', "<leader>gG", "<cmd>lua require('custom.toggleterm').lzgc()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', "<c-x>", "<cmd>lua require('custom.toggleterm').devterm()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap('t', "<c-x>", [[ <c-\><c-n><cmd>lua require('custom.toggleterm').devterm()<CR> ]], {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', "<c-_>", "<cmd>lua require('custom.toggleterm').devterm()<CR>", {noremap = true, silent = true})
        vim.api.nvim_set_keymap('t', "<c-_>", [[ <c-\><c-n><cmd>lua require('custom.toggleterm').devterm()<CR> ]], {noremap = true, silent = true})
      end
  }

end)

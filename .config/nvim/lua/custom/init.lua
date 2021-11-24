local hooks = require "core.hooks"
require "custom.autocmds"

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

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

hooks.add("setup_mappings", function(map)
    vim.o.swapfile=false
    vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})

    vim.api.nvim_set_keymap("n", "<leader>w", "<c-w>", {})

    vim.api.nvim_set_keymap('n', '<CR>', ':nohl<CR>', {noremap = true}) -- remove highlight on enter

    -- Window navigation in terminal mode
    vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]], {noremap = true})
    vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]], {noremap = true})
    vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]], {noremap = true})
    vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-n><C-W>l]], {noremap = true})

    -- Wildmenu mappings
    vim.api.nvim_set_keymap('c', '<down>', 'wildmenumode() ? "\\<C-n>" : "\\<down>"', {expr = true})
    vim.api.nvim_set_keymap('c', '<up>', 'wildmenumode() ? "\\<C-p>" : "\\<up>"', {expr = true})
    vim.api.nvim_set_keymap('c', '<c-j>', 'wildmenumode() ? "\\<C-n>" : "\\<c-j>"', {expr = true})
    vim.api.nvim_set_keymap('c', '<c-k>', 'wildmenumode() ? "\\<C-p>" : "\\<c-k>"', {expr = true})

    -- Pop up menu
    -- vim.api.nvim_set_keymap('i', '<c-j>', 'pumvisible() ? "\\<c-n>" : "\\<c-j>"' , { noremap = true, expr=true })
    -- vim.api.nvim_set_keymap('i', '<c-k>', 'pumvisible() ? "\\<c-p>" : "\\<c-k>"' , { noremap = true, expr=true })

    -- Misc
    vim.api.nvim_set_keymap("n", "z=", ":Telescope spell_suggest <CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>ls", ":Telescope lsp_document_symbols <CR>", {})
    vim.api.nvim_set_keymap("n", "<leader>fc", ":lua require('custom.telescope').find_configs() <CR>", {silent = true})
    vim.api.nvim_set_keymap("n", "<leader>.", ":lua require('telescope.builtin').lsp_code_actions({ layout_strategy='vertical', layout_config={width=0.3}}) <CR>", {silent = true})

end)

hooks.add("install_plugins", function(use)
  use { 'tpope/vim-unimpaired'}
  use {'wakatime/vim-wakatime'}
  use {'glepnir/lspsaga.nvim'}


  use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim',
   config = function()
     require("flutter-tools").setup{
     } -- use defaults

     lsp_attach()

   end,
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
        auto_open = true, -- automatically open the list when you have diagnostics
        auto_close = true, -- automatically close the list when you have no diagnostics
        mode = "lsp_workspace_diagnostics",
      }
    end,
    setup = function()
      vim.api.nvim_set_keymap("n", "<leader>ll", ":TroubleToggle <CR>", {})
    end
  }

  use { "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup({
        excluded_filetypes = {"toggleterm"},
        signcolumn = false
      })
      vim.cmd [[ FocusDisable ]]
    end,
    setup = function()
      vim.api.nvim_set_keymap("n", '<c-w>=', ':FocusMaxOrEqual <CR>', {})
    end
  }

  use {
      "akinsho/toggleterm.nvim",
      config = function()
        require("toggleterm").setup{
          open_mapping = '<leader>;',
          start_in_insert = true,
        }
      end
  }

end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"

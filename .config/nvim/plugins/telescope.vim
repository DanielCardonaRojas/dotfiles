" Telescope settings

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fo <cmd>Telescope file_browser<cr>
nnoremap <leader>fs <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nmap <leader>fm <cmd>Telescope oldfiles<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-n>"] = false,
        ["<C-p>"] = false,

        -- Otherwise, just set the mapping to the function that you want it to be.
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

      },
      n = {
        ["<esc>"] = actions.close,
        ["<C-i>"] = my_cool_custom_action,
      },
    },
  },
  pickers = {
    -- Your special builtin config goes in here
    oldfiles = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
    },
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        i = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
          -- or right hand side can also be a the name of the action as string
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    },
    find_files = {
      theme = "dropdown"
    }
  },
}

require('telescope').load_extension('dap')


--function _G.telescope_search_vimrc() 
--  required("telescope.builtin").find_files({
--    prompt_title = "VIMRC", 
--    cwd = "~/.config/nvim",
--  })
--end

--vim.api.nvim_set_keymap('n', '<space>fv', 'v:lua.telescope_search_vimrc()', {expr = true, noremap = true})
EOF

"nnoremap <silent> <space>fv v:lua.telescope_search_vimrc<cr>


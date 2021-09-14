local config = require("core.utils").load_config()
local maps = config.mappings
local plugin_maps = maps.plugin
local cmd = vim.cmd

local function map(mode, lhs, rhs, opts)
   local options = { noremap = true, silent = true }
   if opts then
      options = vim.tbl_extend("force", options, opts)
   end

   -- if list of keys provided then run set for all of them
   if type(lhs) == "table" then
      for _, key in ipairs(lhs) do
         vim.api.nvim_set_keymap(mode, key, rhs, options)
      end
   else
      vim.api.nvim_set_keymap(mode, lhs, rhs, options)
   end
end

local opt, M = {}, {}

-- these mappings will only be called during initialization
M.misc = function()
   local function non_config_mappings()
      -- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them
      -- map("n", "dd", [=[ "_dd ]=], opt)
      -- map("v", "dd", [=[ "_dd ]=], opt)
      -- map("v", "x", [=[ "_x ]=], opt)
      -- todo: this should be configurable via chadrc

      -- Don't copy the replaced text after pasting in visual mode
      map("v", "p", '"_dP', opt)

      -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
      -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
      -- empty mode is same as using :map
      map("", "j", 'v:count ? "j" : "gj"', { expr = true })
      map("", "k", 'v:count ? "k" : "gk"', { expr = true })
      map("", "<Down>", 'v:count ? "j" : "gj"', { expr = true })
      map("", "<Up>", 'v:count ? "k" : "gk"', { expr = true })

      -- OWN MAPPINGS

      map('n', '<leader>y', '"*y')
      map('n', '<CR>', ':nohl<CR>')


      -- Wildmenu mappings
      vim.api.nvim_set_keymap('c', '<down>', 'wildmenumode() ? "\\<C-n>" : "\\<down>"', {expr = true})
      vim.api.nvim_set_keymap('c', '<up>', 'wildmenumode() ? "\\<C-p>" : "\\<up>"', {expr = true})
      vim.api.nvim_set_keymap('c', '<c-j>', 'wildmenumode() ? "\\<C-n>" : "\\<c-j>"', {expr = true})
      vim.api.nvim_set_keymap('c', '<c-k>', 'wildmenumode() ? "\\<C-p>" : "\\<c-k>"', {expr = true})


      -- Window navigation
      map('n', '<c-j>', '<c-w>j')
      map('n', '<c-k>', '<c-w>k')
      map('n', '<c-l>', '<c-w>l')
      map('n', '<c-h>', '<c-w>h')
      map('t', '<Esc>', '<C-\\><C-n>')

      -- Window navigation in terminal mode
      map('t', 'jk', [[<C-\><C-n>]], {noremap = true})
      map('t', '<C-h>', [[<C-\><C-n><C-W>h]], {noremap = true})
      map('t', '<C-j>', [[<C-\><C-n><C-W>j]], {noremap = true})
      map('t', '<C-k>', [[<C-\><C-n><C-W>k]], {noremap = true})
      map('t', '<C-l>', [[<C-\><C-n><C-W>l]], {noremap = true})

-- if you only want these mappings for toggle term use term://*toggleterm#* instead

   end

   local function optional_mappings()
      -- navigation within insert mode
      if config.options.insert_nav then
         local inav = maps.insert_nav

         map("i", inav.backward, "<Left>", opt)
         map("i", inav.end_of_line, "<End>", opt)
         map("i", inav.forward, "<Right>", opt)
         map("i", inav.next_line, "<Up>", opt)
         map("i", inav.prev_line, "<Down>", opt)
         map("i", inav.top_of_line, "<ESC>^i", opt)
      end

      -- check the theme toggler
      if config.ui.theme_toggler then
         map(
            "n",
            maps.theme_toggler,
            ":lua require('nvchad').toggle_theme(require('core.utils').load_config().ui.theme_toggler.fav_themes) <CR>",
            opt
         )
      end
   end

   local function required_mappings()
      map("n", maps.close_buffer, ":lua require('core.utils').close_buffer() <CR>", opt) -- close  buffer
      map("n", maps.copy_whole_file, ":%y+ <CR>", opt) -- copy whole file content
      map("n", maps.new_buffer, ":enew <CR>", opt) -- new buffer
      map("n", maps.new_tab, ":tabnew <CR>", opt) -- new tabs
      map("n", maps.line_number_toggle, ":set nu! <CR>", opt) -- toggle numbers
      map("n", maps.save_file, ":w <CR>", opt) -- ctrl + s to save file
      map("n", maps.window_operations, "<c-w>", opt) -- ctrl + s to save file

      -- terminal mappings --
      local term_maps = maps.terminal
      -- get out of terminal mode
      map("t", term_maps.esc_termmode, "<C-\\><C-n>", opt)
      -- hide a term from within terminal mode
      map("t", term_maps.esc_hide_termmode, "<C-\\><C-n> :lua require('core.utils').close_buffer() <CR>", opt)
      -- pick a hidden term
      map("n", term_maps.pick_term, ":Telescope terms <CR>", opt)
      -- terminal mappings end --

      -- Add Packer commands because we are not loading it at startup
      cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
      cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
      cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
      cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
      cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
      cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

      -- add NvChadUpdate command and mapping
      cmd "silent! command! NvChadUpdate lua require('nvchad').update_nvchad()"
      map("n", maps.update_nvchad, ":NvChadUpdate <CR>", opt)
   end

   non_config_mappings()
   optional_mappings()
   required_mappings()
end

-- below are all plugin related mappinsg
M.nvim_dap = function()
   local m = plugin_maps.nvim_dap
   map("n", m.toggle_breakpoint, ":lua require'dap'.toggle_breakpoint()<CR>", opt)
   map("n", m.continue, ":lua require'dap'.continue()<CR>", opt)
   map("n", '<F5>', ":lua require'dap'.continue()<CR>", opt)
   map("n", m.step_over, ":lua require'dap'.step_over()<CR>", opt)
   map("n", m.step_out, ":lua require'dap'.step_out()<CR>", opt)
   map("n", m.step_into, ":lua require'dap'.step_into()<CR>", opt)
   map("n", m.down, ":lua require'dap'.down()<CR>", opt)
   map("n", m.up, ":lua require'dap'.up()<CR>", opt)
   map("n", m.disconnect, ":lua require'dap'.disconnect();require'dap'.close()<CR>", opt)
   map("n", m.open, ":lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l", opt)
   map("n", m.scopes, ":lua require'dap.ui.variables'.scopes()<CR>", opt)
end

M.focus = function()
  map("n", maps.window_operations .. '=', ':FocusMaxOrEqual <CR>', opt)
end

M.hop = function()
  local m = plugin_maps.hop;
  map("n", m.hop_trigger .. "w" , ":HopWordAC <CR>")
  map("n", m.hop_trigger .. "b" , ":HopWordBC <CR>")
  map("n", m.hop_trigger .. "f" , ":HopChar1AC <CR>")
  map("n", m.hop_trigger .. "F" , ":HopChar1BC <CR>")
  map("n", m.hop_trigger .. "j" , ":HopLineAC <CR>")
  map("n", m.hop_trigger .. "k" , ":HopLineBC <CR>")
end

M.trouble = function()
  map("n", "<leader>ll", ":TroubleToggle <CR>")
end

M.better_escape = function()
   vim.g.better_escape_shortcut = plugin_maps.better_escape.esc_insertmode or { "" }
end

M.bufferline = function()
   local m = plugin_maps.bufferline

   map("n", m.next_buffer, ":BufferLineCycleNext <CR>", opt)
   map("n", m.prev_buffer, ":BufferLineCyclePrev <CR>", opt)
end

M.chadsheet = function()
   local m = plugin_maps.chadsheet

   map("n", m.default_keys, ":lua require('cheatsheet').show_cheatsheet_telescope() <CR>", opt)
   map(
      "n",
      m.user_keys,
      ":lua require('cheatsheet').show_cheatsheet_telescope{bundled_cheatsheets = false, bundled_plugin_cheatsheets = false } <CR>",
      opt
   )
end

M.comment = function()
   local m = plugin_maps.comment.toggle
   map("n", m, ":CommentToggle <CR>", opt)
   map("v", m, ":CommentToggle <CR>", opt)
end

M.dashboard = function()
   local m = plugin_maps.dashboard

   map("n", m.bookmarks, ":DashboardJumpMarks <CR>", opt)
   map("n", m.new_file, ":DashboardNewFile <CR>", opt)
   map("n", m.open, ":Dashboard <CR>", opt)
   map("n", m.session_load, ":SessionLoad <CR>", opt)
   map("n", m.session_save, ":SessionSave <CR>", opt)
end

M.nvimtree = function()
   map("n", plugin_maps.nvimtree.toggle, ":NvimTreeToggle <CR>", opt)
end

M.neoformat = function()
   map("n", plugin_maps.neoformat.format, ":Neoformat <CR>", opt)
end

M.telescope = function()
   local m = plugin_maps.telescope

   map("n", m.buffers, ":Telescope buffers <CR>", opt)
   map("n", m.find_files, ":Telescope find_files <CR>", opt)
   map("n", m.git_commits, ":Telescope git_commits <CR>", opt)
   map("n", m.git_status, ":Telescope git_status <CR>", opt)
   map("n", m.help_tags, ":Telescope help_tags <CR>", opt)
   map("n", m.live_grep, ":Telescope live_grep <CR>", opt)
   map("n", m.oldfiles, ":Telescope oldfiles <CR>", opt)
   map("n", m.themes, ":Telescope themes <CR>", opt)
   map("n", m.lsp_document_symbols, ":Telescope lsp_document_symbols <CR>", opt)
end

M.telescope_media = function()
   local m = plugin_maps.telescope_media

   map("n", m.media_files, ":Telescope media_files <CR>", opt)
end

M.truezen = function()
   local m = plugin_maps.truezen

   map("n", m.ataraxis_mode, ":TZAtaraxis <CR>", opt)
   map("n", m.focus_mode, ":TZFocus <CR>", opt)
   map("n", m.minimalistic_mode, ":TZMinimalist <CR>", opt)
end

return M
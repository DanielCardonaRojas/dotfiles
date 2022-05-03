local utils = require "core.utils"

local map = utils.map
local cmd = vim.cmd
local user_cmd = vim.api.nvim_create_user_command

-- CUSTOM MAPPINGS

map("n", "<leader>w", "<c-w>")
map('n', '<CR>', ':nohl<CR>')
map('n', 'vil', 'g_v^')
map("n", "<leader>t", ":Telescope <CR>")
map("n", "z=", ":Telescope spell_suggest <CR>")
map("n", "<leader>ls", ":Telescope lsp_document_symbols <CR>")
map("n", "<leader>f.", ":lua require('plugins.configs.telescope').find_configs() <CR>")
map("n", "<leader>f,", ":lua require('plugins.configs.telescope').search_configs() <CR>")
map('c', '<c-j>', '<c-n>')
map('c', '<c-k>', '<c-p>')

-- This is a wrapper function made to disable a plugin mapping from chadrc
-- If keys are nil, false or empty string, then the mapping will be not applied
-- Useful when one wants to use that keymap for any other purpose

-- Don't copy the replaced text after pasting in visual mode
map("v", "p", "p:let @+=@0<CR>")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http<cmd> ://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour

map({ "n", "x", "o" }, "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map({ "n", "x", "o" }, "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })

-- use ESC to turn off search highlighting
map("n", "<Esc>", "<cmd> :noh <CR>")

-- move cursor within insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-e>", "<End>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-a>", "<ESC>^i")

-- navigation between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

map("n", "<leader>x", function()
   require("core.utils").close_buffer()
end)

map("n", "<C-c>", "<cmd> :%y+ <CR>") -- copy whole file content
map("n", "<S-t>", "<cmd> :enew <CR>") -- new buffer
map("n", "<C-t>b", "<cmd> :tabnew <CR>") -- new tabs
map("n", "<leader>n", "<cmd> :set nu! <CR>")
map("n", "<leader>rn", "<cmd> :set rnu! <CR>") -- relative line numbers
map("n", "<C-s>", "<cmd> :w <CR>") -- ctrl + s to save file

-- terminal mappings

-- get out of terminal mode
map("t", { "jk" }, "<C-\\><C-n>")

-- Add Packer commands because we are not loading it at startup

local packer_cmd = function(callback)
   return function()
      require "plugins"
      require("packer")[callback]()
   end
end

-- snapshot stuff
user_cmd("PackerSnapshot", function(info)
   require "plugins"
   require("packer").snapshot(info.args)
end, { nargs = "+" })

user_cmd("PackerSnapshotDelete", function(info)
   require "plugins"
   require("packer.snapshot").delete(info.args)
end, { nargs = "+" })

user_cmd("PackerSnapshotRollback", function(info)
   require "plugins"
   require("packer").rollback(info.args)
end, { nargs = "+" })

user_cmd("PackerClean", packer_cmd "clean", {})
user_cmd("PackerCompile", packer_cmd "compile", {})
user_cmd("PackerInstall", packer_cmd "install", {})
user_cmd("PackerStatus", packer_cmd "status", {})
user_cmd("PackerSync", packer_cmd "sync", {})
user_cmd("PackerUpdate", packer_cmd "update", {})

-- add NvChadUpdate command and mapping
cmd "silent! command! NvChadUpdate lua require('nvchad').update_nvchad()"
map("n", "<leader>uu", "<cmd> :NvChadUpdate <CR>")

-- load overriden misc mappings
require("core.utils").load_config().mappings.misc()

local M = {}

-- below are all plugin related mappings

M.bufferline = function()
   map("n", "<TAB>", "<cmd> :BufferLineCycleNext <CR>")
   map("n", "<S-Tab>", "<cmd> :BufferLineCyclePrev <CR>")
end

M.comment = function()
   map("n", "<leader>/", "<cmd> :lua require('Comment.api').toggle_current_linewise()<CR>")
   map("v", "<leader>/", "<esc><cmd> :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
end

M.lspconfig = function()
   -- See `<cmd> :help vim.lsp.*` for documentation on any of the below functions
   map("n", "gD", function()
      vim.lsp.buf.declaration()
   end)

   map("n", "gd", function()
      vim.lsp.buf.definition()
   end)

   map("n", "K", function()
      vim.lsp.buf.hover()
   end)

   map("n", "gi", function()
      vim.lsp.buf.implementation()
   end)

   map("n", "gk", function()
      vim.lsp.buf.signature_help()
   end)

   map("n", "gD", function()
      vim.lsp.buf.type_definition()
   end)

   map("n", "<F2>", function()
      vim.lsp.buf.rename()
   end)

   map("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
   end)

   map("n", "gr", function()
      vim.lsp.buf.references()
   end)

   map("n", "<leader>f", function()
      vim.diagnostic.open_float()
   end)

   map("n", "[e", function()
      vim.diagnostic.goto_prev()
   end)

   map("n", "e]", function()
      vim.diagnostic.goto_next()
   end)

   map("n", "<leader>q", function()
      vim.diagnostic.setloclist()
   end)

   map("n", "<leader>lm", function()
      vim.lsp.buf.formatting()
   end)

   map("n", "<leader>wa", function()
      vim.lsp.buf.add_workspace_folder()
   end)

   map("n", "<leader>wr", function()
      vim.lsp.buf.remove_workspace_folder()
   end)

   map("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end)
end

M.nvimtree = function()
   map("n", "<leader>E", "<cmd> :NvimTreeFocus <CR>")
   map("n", "<leader>e", "<cmd> :NvimTreeToggle <CR>")
end

M.telescope = function()
   map("n", "<leader>o", "<cmd> :Telescope buffers <CR>")
   map("n", "<leader>ff", "<cmd> :Telescope find_files <CR>")
   map("n", "<leader>fa", "<cmd> :Telescope find_files follow=true no_ignore=true hidden=true <CR>")
   map("n", "<leader>gc", "<cmd> :Telescope git_commits <CR>")
   map("n", "<leader>gs", "<cmd> :Telescope git_status <CR>")
   map("n", "<leader>fh", "<cmd> :Telescope help_tags <CR>")
   map("n", "<leader>fs", "<cmd> :Telescope live_grep <CR>")
   map("n", "<leader>fo", "<cmd> :Telescope oldfiles <CR>")
   map("n", "<leader>ct", "<cmd> :Telescope themes <CR>")

   -- pick a hidden term
   map("n", "<leader>W", "<cmd> :Telescope terms <CR>")
end

M.toggleterm = function()
  map('n', "<leader>gg", "<cmd>lua require('plugins.configs.toggleterm').lzg()<CR>")
  map('n', "<leader>gG", "<cmd>lua require('plugins.configs.toggleterm').lzgc()<CR>")
  map('n', "<c-x>", "<cmd>lua require('plugins.configs.toggleterm').devterm()<CR>")
  map('t', "<c-x>", [[ <c-\><c-n><cmd>lua require('plugins.configs.toggleterm').devterm()<CR> ]])
  map('n', "<c-_>", "<cmd>lua require('custom.toggleterm').devterm()<CR>")
  map('t', "<c-_>", [[ <c-\><c-n><cmd>lua require('plugins.configs.toggleterm').devterm()<CR> ]])
end

M.hop = function()
  local hop_trigger = "<leader><leader>"
  map("n", hop_trigger .. "w" , ":HopWordAC <CR>")
  map("n", hop_trigger .. "b" , ":HopWordBC <CR>")
  map("n", hop_trigger .. "f" , ":HopChar1AC <CR>")
  map("n", hop_trigger .. "F" , ":HopChar1BC <CR>")
  map("n", hop_trigger .. "j" , ":HopLineAC <CR>")
  map("n", hop_trigger .. "k" , ":HopLineBC <CR>")
end

M.dap = function()
  map("n", "<leader>dh", ':lua require"dap".toggle_breakpoint() <CR>')
  map("n", "<F5>", ':lua require"dap".continue() <CR>')
  map("n", "<leader>dc", ':lua require"dap".continue() <CR>')
  map("n", "<leader>dj", ':lua require"dap".step_over() <CR>')
  map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
  map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
  map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
  map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
  map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>', {})
end

M.dapui = function()
  map('n', '<leader>dd', ':lua require("dapui").toggle() <CR>')
  map('n', '<leader>dD', ':lua require("dapui").float_element("scopes") <CR>')
  map('n', '<leader>dS', ':lua require("dapui").float_element("stacks") <CR>')
  map('n', '<leader>dB', ':lua require("dapui").float_element("breakpoints") <CR>')
end


return M

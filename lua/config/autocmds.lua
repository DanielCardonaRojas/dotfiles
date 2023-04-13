-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[ autocmd CursorHold * :lua vim.diagnostic.open_float() ]])
vim.cmd([[ autocmd BufEnter *.dart :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s") ]])

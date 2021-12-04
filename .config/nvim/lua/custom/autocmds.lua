vim.cmd [[ autocmd BufEnter *.dart :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s") ]]
vim.cmd [[ autocmd CursorHold * :lua vim.lsp.diagnostic.show_line_diagnostics() ]]
-- vim.cmd [[ autocmd CursorHold * :lua require"gitsigns".blame_line() ]]
-- vim.cmd [[ autocmd BufEnter,FileType *.dart set colorcolumn=81]]


-- uncomment this if you want to open nvim with a dir
-- vim.cmd [[ autocmd BufEnter * if &buftype != "terminal" | lcd %:p:h | endif ]]

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
-- vim.cmd[[ au InsertEnter * set norelativenumber ]]
-- vim.cmd[[ au InsertLeave * set relativenumber ]]

-- Open a file from its last left off position
-- vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
-- File extension specific tabbing
-- vim.cmd [[ autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]




-- CUSTOM AUTOCMD
vim.cmd [[ autocmd BufEnter *.dart :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s") ]]
vim.cmd [[ autocmd BufEnter NvimTree :NvimTreeRefresh ]]
vim.cmd [[ autocmd CursorHold * :lua vim.diagnostic.open_float() ]]
vim.cmd [[ autocmd BufWritePre *.dart lua vim.lsp.buf.formatting() ]]
-- vim.cmd [[ autocmd BufEnter,FileType *.dart set colorcolumn=81]]
-- vim.cmd [[ autocmd UIEnter * :hi Normal guibg=NONE ctermbg=NONE ]]
vim.cmd [[ autocmd BufEnter log :set nonumber nowrap ]]

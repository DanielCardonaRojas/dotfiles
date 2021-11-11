vim.cmd [[ autocmd BufEnter *.dart :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s") ]]



return {
  "akinsho/toggleterm.nvim",
  event = "VimEnter",
  config = function()
    require("toggleterm").setup({
      start_in_insert = true,
      shade_terminals = false,
    })
  end,
  init = function()
    --vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua require('custom.plugins.toggleterm').lzg()<CR>")
    --vim.api.nvim_set_keymap("n", "<leader>gG", "<cmd>lua require('custom.plugins.toggleterm').lzgc()<CR>")
    vim.api.nvim_set_keymap("n", "<c-x>", "<cmd>lua require('custom.toggleterm').devterm()<CR>", {})
    vim.api.nvim_set_keymap("t", "<c-x>", [[ <c-\><c-n><cmd>lua require('custom.toggleterm').devterm()<CR> ]], {})
    vim.api.nvim_set_keymap("n", "<c-_>", "<cmd>lua require('custom.toggleterm').devterm()<CR>", {})
    vim.api.nvim_set_keymap("t", "<c-_>", [[ <c-\><c-n><cmd>lua require('custom.toggleterm').devterm()<CR> ]], {})
  end,
}

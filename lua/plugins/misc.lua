return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      excluded_filetypes = {
        "toggleterm",
        "Trouble",
        "NvimTree",
        "dapui_scopes",
        "dapui_breakpoints",
        "dapui_stacks",
        "neo-tree",
        "alpha",
        "prompt",
        "TelescopePrompt",
        "lazy",
      },
    })
  end,
}

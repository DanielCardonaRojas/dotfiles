return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "vim-test/vim-test",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-vim-test",
    "nvim-neotest/neotest-plenary",
    "sidlatau/neotest-dart",
  },
  init = function()
    vim.api.nvim_set_keymap("n", "<leader>dT", ':lua require("neotest").run.run(vim.fn.expand("%")) <CR>', {})
    vim.api.nvim_set_keymap("n", "<leader>dt", ':lua require("neotest").run.run() <CR>', {})
    vim.api.nvim_set_keymap("n", "<leader>ds", ':lua require("neotest").summary.toggle() <CR>', {})
  end,
  config = function()
    require("neotest").setup({
      icons = {
        running = "喇",
        passed = "",
        unknown = "",
        failed = "",
        skipped = "ﰸ",
      },
      adapters = {
        require("neotest-plenary"),
        require("neotest-vim-test")({
          ignore_file_types = { "python", "vim", "lua" },
        }),
        require("neotest-dart")({
          command = "flutter",
        }),
      },
    })
  end,
}

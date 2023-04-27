return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] =
      { "<leader>.", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
  end,
  opts = {
    diagnostics = {
      underline = true,
      virtual_text = false,
    },
    servers = {
      dartls = {},
    },
  },
}

local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config

  local servers = { "html", "cssls", "pyright", "rust_analyzer" }

  for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
  end
   
   -- typescript

  lspconfig.tsserver.setup {
    on_attach = function(client, bufnr)
       client.resolved_capabilities.document_formatting = false
       vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
    end,
  }

  -- elm
  lspconfig.elmls.setup {
    on_attach = function(client, bufnr)
       client.resolved_capabilities.document_formatting = false
       vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
    end,
  }

end

return M


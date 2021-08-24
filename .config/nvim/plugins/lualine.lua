require'lualine'.setup {
  options = {
    lower = false, 
    theme = 'everforest',
    section_separators = {'', ''},
    section_separators = '',
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff"},
    lualine_c = {"filename"},
    lualine_x = {
      {"diagnostics", sources = {"nvim_lsp"}},
      "encoding",
      "fileformat",
      "filetype"
    },
    lualine_y = {"progress"},
    --lualine_z = {"location"}
  }
}

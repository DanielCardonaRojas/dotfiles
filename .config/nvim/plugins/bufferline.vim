lua << EOF
require('gitsigns').setup()
EOF
nnoremap <silent>Kg :Gitsigns preview_hunk<cr>

lua << EOF
require("bufferline").setup{
  options = {
   separator_style = "thin",
   offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory", text_align = "left"}},
  }
}

EOF

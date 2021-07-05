source $HOME/.config/nvim/general.vim
source $HOME/.config/nvim/keys.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/abbreviations.vim
source $HOME/.config/nvim/lsp.vim

lua << EOF
  require'lspconfig'.rust_analyzer.setup{}
  require'lspconfig'.bashls.setup{}
  require'lspconfig'.dartls.setup{}
EOF

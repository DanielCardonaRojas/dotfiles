" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


" Miscelanious
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-test/vim-test'


Plug 'yggdroot/indentline'

"SYNTAX AND FRAMEWORKS
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'

" CODE COMPLETION 
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'neovim/nvim-lspconfig'

" GREETER HOME UI
Plug 'glepnir/dashboard-nvim'


" COLOR THEMES AND AESTHETICS
Plug 'morhetz/gruvbox'
Plug 'navarasu/onedark.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'onsails/lspkind-nvim'

" STATUS LINE
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
"Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

Plug 'troydm/zoomwintab.vim'


" CODE NAVIGATING
Plug 'easymotion/vim-easymotion'

" LSP
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'

" DAP

Plug 'mfussenegger/nvim-dap'
Plug 'nvim-telescope/telescope-dap.nvim'

" EXPLORER
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" LANGUAGE / FRAMEWORK SPECFIC
"Plug 'thosakwe/vim-flutter'
Plug 'akinsho/flutter-tools.nvim'


" GIT
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" PLUGIN SPECFIC CONFIGURATIONS


lua << EOF
require("flutter-tools").setup{
  debugger = { -- integrate with nvim dap + install dart code debugger
    enabled = true,
  }
} -- use defaults
EOF


luafile ~/.config/nvim/plugins/lualine.lua
"luafile ~/.config/nvim/plugins/statusline.lua
source ~/.config/nvim/plugins/dashboard.vim
source ~/.config/nvim/plugins/nvim-dap.vim
source ~/.config/nvim/plugins/bufferline.vim
source ~/.config/nvim/plugins/lsp-kind.vim
source ~/.config/nvim/plugins/compe.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/indentline.vim
source ~/.config/nvim/plugins/rainbowparentheses.vim
source ~/.config/nvim/plugins/theme.vim
source ~/.config/nvim/plugins/lspsaga.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/monkeyterminal.vim
source ~/.config/nvim/plugins/zoomwintab.vim

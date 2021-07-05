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
Plug 'dart-lang/dart-vim-plugin'

" CODE COMPLETION 
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'neovim/nvim-lspconfig'

" GREETER HOME UI
Plug 'mhinz/vim-startify'

" COLOR THEMES AND AESTHETICS
Plug 'morhetz/gruvbox'
Plug 'navarasu/onedark.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" STATUS LINE
Plug 'hoob3rt/lualine.nvim'

Plug 'troydm/zoomwintab.vim'


" CODE NAVIGATING
Plug 'easymotion/vim-easymotion'

" LSP
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'

" EXPLORER
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" GIT
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" PLUGIN CONFIGURATIONS

lua << EOF
require('gitsigns').setup()
EOF
nnoremap <silent>Kg :Gitsigns preview_hunk<cr>


luafile ~/.config/nvim/plugins/lualine.lua
source ~/.config/nvim/plugins/compe.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/indentline.vim
source ~/.config/nvim/plugins/rainbowparentheses.vim
source ~/.config/nvim/plugins/startify.vim
source ~/.config/nvim/plugins/theme.vim
source ~/.config/nvim/plugins/lspsaga.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/monkeyterminal.vim
source ~/.config/nvim/plugins/zoomwintab.vim

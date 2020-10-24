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


Plug 'yggdroot/indentline'

"Syntax and frameworks
Plug 'sheerun/vim-polyglot'
"Plug 'kien/rainbow_parentheses.vim'
Plug 'dart-lang/dart-vim-plugin'

" Code completion 
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'


" Greeter
Plug 'mhinz/vim-startify'

" Color Schemes
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Status line
Plug 'itchyny/lightline.vim'

" Tabline
Plug 'mengelbrecht/lightline-bufferline'


" Code Navigating
Plug 'easymotion/vim-easymotion'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 


Plug 'ryanoasis/vim-devicons'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" PLUGIN CONFIGURATIONS

source ~/.config/nvim/plugins/lightline.vimrc
"source ~/.config/nvim/plugins/nerdtree.vimrc
source ~/.config/nvim/plugins/indentline.vimrc
"source ~/.config/nvim/plugins/rainbowparentheses.vimrc
source ~/.config/nvim/plugins/startify.vimrc
source ~/.config/nvim/plugins/ctrlp.vimrc
source ~/.config/nvim/plugins/coc.vimrc
source ~/.config/nvim/plugins/theme.vimrc


call plug#begin('~/.vim/plugged')

" Miscelanious
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'


Plug 'yggdroot/indentline'

"Syntax and frameworks
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'
Plug 'dart-lang/dart-vim-plugin'

" Code completion 
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'

" Color Schemes, GUI, Code Display
Plug 'morhetz/gruvbox'
Plug 'trevordmiller/nova-vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Status line
Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Navigating, searching and code completion
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 

call plug#end()


" source ~/.config/nvim/plugins/airline.vimrc
source ~/.config/nvim/plugins/lightline.vimrc
source ~/.config/nvim/plugins/dart.vimrc
source ~/.config/nvim/plugins/nerdtree.vimrc
source ~/.config/nvim/plugins/rainbowparentheses.vimrc
source ~/.config/nvim/plugins/startify.vimrc
source ~/.config/nvim/plugins/ctrlp.vimrc
source ~/.config/nvim/plugins/coc.vimrc
source ~/.config/nvim/plugins/theme.vimrc

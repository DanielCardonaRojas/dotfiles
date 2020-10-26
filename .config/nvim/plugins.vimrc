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

"Syntax and frameworks
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'
Plug 'dart-lang/dart-vim-plugin'

" Code completion 
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'

" Greeter
Plug 'mhinz/vim-startify'

" Color Schemes and Aesthetics
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ryanoasis/vim-devicons'

" Status line
Plug 'itchyny/lightline.vim'

" Tabline
Plug 'mengelbrecht/lightline-bufferline'


" Code Navigating
Plug 'easymotion/vim-easymotion'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" PLUGIN CONFIGURATIONS

source ~/.config/nvim/plugins/lightline.vim
source ~/.config/nvim/plugins/indentline.vim
source ~/.config/nvim/plugins/rainbowparentheses.vim
source ~/.config/nvim/plugins/startify.vim
source ~/.config/nvim/plugins/ctrlp.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/theme.vim
source ~/.config/nvim/plugins/monkeyterminal.vim
source ~/.config/nvim/plugins/fzf.vim



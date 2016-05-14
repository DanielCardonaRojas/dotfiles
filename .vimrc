" Basic Settings {{{
set foldmethod=marker
set number
set cursorline
let mapleader = ","
set tabstop=2
" Generic Configurations
set noswapfile
set encoding=utf-8
" }}}
" Normal Mode Key bindings/maps {{{
" This is the Ctrl-space mapping
nnoremap <NUL> :! 
" Easy access to vimrc (this file)
nnoremap <leader>ev :vsplit $MYVIMRC<CR> 


" Key maps for Normal Mode

nnoremap <leader>w :w<CR>
nnoremap <leader>c :close<CR>
" Copy/Paste from/to OS Clipboard
nnoremap <leader>p "*p
nnoremap <leader>y "*y
" Delete into blackhole register
nnoremap <leader>d "_d

" Move Cursor around window splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k


" Open window splits in various places
nmap <silent> <leader>sh :leftabove  vnew<CR>
nmap <silent> <leader>sl :rightbelow vnew<CR>
nmap <silent> <leader>sk :leftabove  new<CR>
nmap <silent> <leader>sj :rightbelow new<CR>
" }}}
" Plug plugins {{{
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'altercation/vim-colors-solarized'
Plug 'danielmiessler/VimBlog'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Twinside/vim-hoogle'

call plug#end()
" }}}
" Plugin Configurations {{{
" Ultisnips Configuration
" Trigger configuration. Do not use <tab> if you use Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

 " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
 " Nerdtree file navigation
 map <leader>f :NERDTreeToggle<CR>

 " Theme Color Scheme Setup (Solarized)
syntax enable
set background=dark
colorscheme solarized
 
" Airline Cofiguration
set laststatus=2 
let g:airline_powerline_fonts = 1 "Very important to get the right look.

" Hoogle Configuration
nnoremap <leader>hs :Hoogle 
nnoremap <leader>hi :HoogleInfo 
nnoremap <leader>hc :HoogleClose<CR>
" }}}

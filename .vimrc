" Basic Settings {{{
set foldmethod=marker
set number
set cursorline

let mapleader = ","
" With expandtab a tab is replaced with softtabstop value of spaces
" Tabstop = Width of tab char, expandtab replace tabs with spaces
" shiftwidth = number of columns when indenting in normal mode
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
" Set tabs/indentation by filetype
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=8 sw=4 sts=8 noexpandtab

" Generic Configurations
set noswapfile
set encoding=utf-8

" Cursor
let g:loaded_matchparen=1


" Toggle highlight.
let hlstate=0
nnoremap <F4> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

 " }}}
" Normal Mode Key bindings/maps {{{
" This is the Ctrl-space mapping
"nnoremap <NUL> :! 
" Easy access to vimrc (this file)
nnoremap <leader>ev :vsplit $MYVIMRC<CR> 

" Open file prompt with current path
nmap <leader>E :e <C-R>=expand("%:p:h") . '/'<CR>

nnoremap <leader>w :w<CR>

" Close split window
nnoremap <leader>cw :close<CR>

" Copy/Paste from/to OS Clipboard
nnoremap <leader>p "*p
nnoremap <leader>y "*y
vnoremap <leader>y "*y
" Delete into blackhole register
nnoremap <leader>d "_d

" Paste a register into vim command (0-yanked,"-default)                               
nnoremap <leader>r :<space><c-r>
nnoremap <leader>R :!<space><c-r>

" Move Cursor around window splits
nnoremap <leader>l <c-w>l
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k

" Swaping lines, words etc
nnoremap <c-s-j> :move +1<CR>
nnoremap <c-s-k> :move -2<CR>

"Move around tabs 
nnoremap tn :tabnew<space>
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nmap <leader>T :tabedit <C-R>=expand("%:p:h") . '/'<CR>

" Open window splits in various places
nmap <silent> <leader>sh :leftabove  vnew<CR>
nmap <silent> <leader>sl :rightbelow vnew<CR>
nmap <silent> <leader>sk :leftabove  new<CR>
nmap <silent> <leader>sj :rightbelow new<CR>

" Increase vertical windows sizes
nnoremap <leader>> 10<c-w>>
nnoremap <leader>< 10<c-w><

nnoremap <leader>K 5<c-w>+
nnoremap <leader>J 5<c-w>-

" Inner line movement so (yil will yank from first to last nonblank char.
vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!^vg_<cr>
onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>
"Defatul to case insensitive search
nnoremap / /\c

" Toggle Spell Checking [s and ]s to jum to mispelled words 
nnoremap <leader>ss :setlocal spell!<cr>
nnoremap <leader>sc :setlocal spell spelllang=

" Replace word under cursor
noremap <Leader>S :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
" }}}
" Plug plugins {{{
call plug#begin()

" Miscelanious
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'

" Color schemes and GUI
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdcommenter'
Plug 'Twinside/vim-hoogle'

" Code completion and snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'raimondi/delimitmate'

" Navigating, searching and code completion
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
call plug#end()

" }}}
" Plugin Configurations {{{

" ULTISNIPS CONFIGURATION
" Trigger configuration. Do not use <tab> if you use Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-s-j>"

 " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir        = $HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" NERDTREE FILE NAVIGATION
" If nerd tree is closed, find current file, if open, close it
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>F <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>f <ESC>:NERDTreeToggle<CR>

" THEME COLOR SCHEME SETUP (SOLARIZED)
syntax enable
set background=dark
colorscheme solarized
set t_Co=256
" let g:solarized_termcolors=256
 
" AIRLINE COFIGURATION
set laststatus=2 
let g:airline_powerline_fonts = 1 "Very important to get the right look.
let g:airline#extensions#tabline#enabled = 1
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" HOOGLE CONFIGURATION
nnoremap <silent> <leader>Hi :HoogleInfo<CR>
nnoremap <silent> <leader>HI :HoogleInfo 
nnoremap <silent> <leader>HH :Hoogle<CR>
nnoremap <silent> <leader>HC :HoogleClose<CR>

" FUGITIVE CONFIGURATION
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>

"SYNTASTIC CONFIGURATION
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" CtrlP CONFIGURATION
nnoremap <silent> <leader>m :CtrlPMRUFiles<CR>
" TAGBAR CONFIGURATION
nmap <leader>tt :TagbarToggle<CR>
" }}}
" Interaction with external Programs {{{

" Generate Html from markdown with pandoc
command! -nargs=1 PandocMD execute "!pandoc % -f markdown -t " <q-args> " -s -o %.html"

" }}}
" {{{ Overrides

"Change number line colors" 
hi CursorLineNr term=bold ctermfg=154 gui=bold"
hi LineNr ctermfg=196 guifg=#2b506e guibg=#000000"

" Get highlighting of .md as markdown not modula 2
autocmd BufNewFile,BufRead *.md set filetype=markdown

" }}}

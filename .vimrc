" Basic Settings {{{
" To source this file do :source % while focused on it.
set number
set cursorline

let mapleader = ","
" With expandtab a tab is replaced with softtabstop value of spaces
" Tabstop = Width of tab char, expandtab replace tabs with spaces
" shiftwidth = number of columns when indenting in normal mode

set shiftwidth=4
set tabstop=4
"set softtabstop=4
set noexpandtab

" Generic Configurations
set noswapfile
set encoding=utf-8

" Cursor/Mouse
let g:loaded_matchparen=1
set mouse=n

" Toggle highlight.
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>

" Show hidden characters  (:set list!)
set listchars=nbsp:␣,tab:▸\ ,eol:¬
inoremap <expr> j pumvisible() ? "\<C-N>" : "j"
inoremap <expr> k pumvisible() ? "\<C-P>" : "k"

" Code Folding
"set foldmethod=marker

"let javaScript_fold=1         " JavaScript
"let perl_fold=1               " Perl
"let php_folding=1             " PHP
"let vimsyn_folding='af'       " Vim script
"
" }}}
" Auto Commands {{{{

" Set tabs/indentation/foldmethod by filetype
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 foldmethod=syntax foldlevelstart=1 expandtab
"autocmd Filetype python setlocal ts=4 sw=4 sts=4 foldmethod=indent foldlevel=99 cursorcolumn expandtab
" Used in for mixed indentation files
autocmd Filetype python setlocal ts=4 sw=4 foldmethod=indent foldlevel=99 cursorcolumn noexpandtab
autocmd Filetype vim setlocal foldmethod=marker

" Get highlighting of .md as markdown not modula 2
autocmd BufNewFile,BufRead *.md set filetype=markdown

" }}}
" Normal Mode Key bindings/maps {{{
" This is the Ctrl-space mapping
nnoremap <NUL> :! 
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
set pastetoggle=<F2>

" Paste a register into vim command (0-yanked,"-default)                               
nnoremap <leader>r :<space><c-r>
nnoremap <leader>R :!<space><c-r>

" Move Cursor around window splits
nnoremap <leader>l <c-w>l
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k

" Swaping lines, words etc
nnoremap J :move +1<CR>
nnoremap K :move -2<CR>
nnoremap K DO<C-r>"<ESC>_

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
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-unimpaired'
Plug 'kshenoy/vim-signature'

" Color Schemes, GUI, Code Display
Plug 'morhetz/gruvbox'
Plug 'trevordmiller/nova-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'kien/rainbow_parentheses.vim'
Plug 'yggdroot/indentline'

"Syntax
Plug 'sheerun/vim-polyglot'
Plug 'kien/rainbow_parentheses.vim'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdcommenter'
Plug 'Twinside/vim-hoogle'

" Code completion and snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'rstacruz/sparkup'
Plug 'raimondi/delimitmate'

" Navigating, searching and code completion
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'

" Framework dependent
Plug 'elmcast/elm-vim'

" Linting formatting
Plug 'w0rp/ale'

" DEOPLETE
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

"Plug 'pbogut/deoplete-elm'

call plug#end()

" }}}
" Plugin Configurations {{{

" ULTISNIPS CONFIGURATION
" Trigger configuration. Do not use <tab> if you use Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

if (has("termguicolors"))
  set termguicolors
endif

syntax enable
set background=dark
colorscheme dracula
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "soft"
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


" DEOPLETE CONFIGURATION
let g:polyglot_disabled = ['elm']
let g:deoplete#enable_at_startup = 1

" CtrlP CONFIGURATION
nnoremap <silent> <leader>m :CtrlPMRUFiles<CR>
nnoremap <silent> <leader><Space> :CtrlPCurFile<CR>
let g:ctrlp_max_depth = 5

" TAGBAR CONFIGURATION
nmap <leader>tt :TagbarToggle<CR>

"GUNDO CONFIGURATION
nnoremap <F5> :GundoToggle<CR>

" STARTIFY CONFIGURATION
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
let g:startify_custom_header = s:filter_header(map(startify#fortune#cowsay(), '"   ".v:val'))

" RAINBOW PARENTHESES CONFIGURATION
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

"au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesActivate
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ELM Configurations

let g:elm_setup_keybindings = 0

" }}}
" Interaction with external Programs {{{

" Generate Html from markdown with pandoc
command! -nargs=1 PandocMD execute "!pandoc % -f markdown -t " <q-args> " -s -o %.html"

" }}}
" {{{ Overrides

"Change number line colors" 
"hi CursorLineNr term=bold ctermfg=154 gui=bold"
"hi LineNr ctermfg=196 guifg=#2b506e guibg=#000000"


" }}}
" 

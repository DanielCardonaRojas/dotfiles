" :h index  - Get a list of native bindings
" nmap - Display normal mode maps
" imap - Display insert mode maps
" vmap - Display visual and select mode maps
" smap - Display select mode maps
" xmap - Display visual mode maps
" cmap - Display command-line mode maps
" omap - Display operator pending mode maps

" Open file prompt with current path
nnoremap <leader>E :e <C-R>=expand("%:p:h") . '/'<CR>

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

"  ================ WINDOW RELATED ==============

" Split windows vertically by default (Only working in vim)
noremap <C-w>] :vert rightbelow wincmd ]<CR>
noremap <C-w><C-]> :vert rightbelow wincmd ]<CR>
noremap <C-w>^ :vert rightbelow wincmd ^<CR>
noremap <C-w>f :vert rightbelow wincmd f<CR>
noremap <C-w>^ :vert rightbelow wincmd ^<CR>

" Workaround for nvim
noremap <C-w>^ :rightbelow vs #<CR>
"noremap <silent> gd] :vsplit<CR>gd
"nmap <silent> gf] :vsplit<CR>gf

" Jump between splits

nmap <leader>w <c-w>
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Swaping lines, words etc
" nnoremap K DO<C-r>"<ESC>_

" ============= POPUP MENU ===============
inoremap <expr> <C-J> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-K> pumvisible() ? "\<C-P>" : "k"
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"


cnoremap <expr> <c-j> pumvisible() ? "\<C-N>" : "j"
cnoremap <expr> <c-k> pumvisible() ? "\<C-P>" : "k"
"cnoremap <C-J> <Down>
"cnoremap <C-K> <Up>

nmap <leader>T :tabedit <C-R>=expand("%:p:h") . '/'<CR>



nnoremap <F4> :source $MYVIMRC<cr>
nnoremap <F3> :vsplit $MYVIMRC<cr>

" Marks
nnoremap <leader>M :marks<CR>

" Inner line movement so (yil will yank from first to last nonblank char.
vnoremap <silent> al :<c-u>norm!0v$h<cr>
vnoremap <silent> il :<c-u>norm!^vg_<cr>
vnoremap <silent> @ :normal @

onoremap <silent> al :norm val<cr>
onoremap <silent> il :norm vil<cr>
"Defatul to case insensitive search
nnoremap / /\c

" Toggle Spell Checking [s and ]s to jum to mispelled words 
nnoremap <leader>ss :setlocal spell!<cr>
nnoremap <leader>sc :setlocal spell spelllang=

" Replace word under cursor
noremap <Leader>S :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

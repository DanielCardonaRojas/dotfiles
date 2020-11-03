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

nnoremap <leader>w :w<CR>

" Close split window
nnoremap <leader>cw :close<CR>
nnoremap <leader>db :bdelete<CR>

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
"nnoremap <leader>l <c-w>l
"nnoremap <leader>h <c-w>h
"nnoremap <leader>j <c-w>j
"nnoremap <leader>k <c-w>k

nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Swaping lines, words etc
" nnoremap K DO<C-r>"<ESC>_

inoremap <expr> <C-J> pumvisible() ? "\<C-N>" : "j"
inoremap <expr> <C-K> pumvisible() ? "\<C-P>" : "k"

cnoremap <expr> <C-J> pumvisible() ? "\<C-N>" : "j"
cnoremap <expr> <C-K> pumvisible() ? "\<C-P>" : "k"
cnoremap <C-J> <C-N>
cnoremap <C-K> <C-P>

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
nnoremap <space>L <c-w>|
nnoremap <space>k <c-w>_
nnoremap <space>= <c-w>=

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Marks
nnoremap <leader>M :marks<CR>

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
nmap <silent> gd] :vert winc ]<CR>

" Replace word under cursor
noremap <Leader>S :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

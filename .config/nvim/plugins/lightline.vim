set showtabline=2  " Show tabline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

let g:lightline.tab_component_function = {
    \   'tabnum': 'LightlineWebDevIcons'
    \ }

let g:lightline.tabline = {
  \   'left': [ ['buffers'] ],
  \   'right': [ ['close'] ]
  \ }
let g:lightline.component_function = {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
     \ }

let g:lightline#bufferline#enable_devicons=1


function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction




nnoremap <silent> <leader>m :CtrlPMRUFiles<CR>
nnoremap <silent> <space>m :CtrlPMRUFiles<CR>
nnoremap <silent> <space>b :CtrlPBuffer<CR>
nnoremap <silent> <leader><Space> :CtrlPCurFile<CR>
let g:ctrlp_max_depth = 5
let g:webdevicons_enable_ctrlp = 1

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

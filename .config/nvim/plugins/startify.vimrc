Plug 'mhinz/vim-startify'

" STARTIFY CONFIGURATION
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction
" let g:startify_custom_header = s:filter_header(map(startify#fortune#cowsay(), '"   ".v:val'))

                                                                                                       
let g:startify_custom_header = [
	  \ '   _  __     _         __  ___         __     ___ ',
	  \]

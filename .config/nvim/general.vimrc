let mapleader = ","

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set whichwrap+=<,>,[,],h,l
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
"set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
"set guifont=FiraCode\ Nerd\ Font:h15
set guifont=DroidSansMono\ Nerd\ Font:h11

" Show hidden characters  (:set list!)
set listchars=nbsp:␣,tab:▸\ ,eol:¬

" AUTO COMMANDS

" Set tabs/indentation/foldmethod by filetype
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 foldmethod=syntax foldlevelstart=1 expandtab
"autocmd Filetype python setlocal ts=4 sw=4 sts=4 foldmethod=indent foldlevel=99 cursorcolumn expandtab
" Used in for mixed indentation files
autocmd Filetype python setlocal ts=4 sw=4 foldmethod=indent foldlevel=99 cursorcolumn noexpandtab
autocmd Filetype vim setlocal foldmethod=marker

" Get highlighting of .md as markdown not modula 2
autocmd BufNewFile,BufRead *.md set filetype=markdown
au TermOpen * setlocal listchars= nonumber norelativenumber


if (has("termguicolors"))
  set termguicolors
endif

" TERMINAL
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

"if (empty($TMUX))
  "if (has("nvim"))
  ""For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  "endif
  "if (has("termguicolors"))
    "set termguicolors
  "endif
"endif

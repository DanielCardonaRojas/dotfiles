## Setup

nvim

## Requirements

- Coc configuration [requirements](https://github.com/neoclide/coc.nvim/wiki)

## Vim [Plugins](http://vimawesome.com/)

- [Lightline](https://github.com/vim-airline/vim-airline): Gives a nice look to the status bar in vim. Its a replacement of an
  older plugin called Powerline, take a look at the repository [here] (https://github.com/vim-airline/vim-airline)
- [Sparkup](https://github.com/rstacruz/sparkup): Lets you write html code faster.
- [NerdTree](https://github.com/scrooloose/nerdtree): Power Vim with directory navigation.
- [EasyMotion](https://github.com/easymotion/vim-easymotion): Easy motion lets you move fast to any word on screen. Very cool
- [Ctrlp](https://kien.github.io/ctrlp.vim/): Is a fuzzy file finder, lets you quickly search for files open them in split windows,tabs etc.
- [Rainbow Parentheses](http://vimawesome.com/plugin/rainbow-parentheses-vim): Colors parentheses, braces, brackets based on indentation.
- [Vim-surround](https://github.com/tpope/vim-surround): Is a plugin for ease of wrapping words in parentheses, brackets, quotes.
- [vim-unimpaired](https://github.com/tpope/vim-unimpaired): Some useful command starting by `[` or `]`, like move through tabs and buffers.
- [vim-signature](https://github.com/kshenoy/vim-signature): Visualize, create and navigate through marks easily.

## Colorschemes

There are two available colorschemes solarized and monokai, to switch between the two do:

> :colorscheme gruvbox
> :colorscheme dracula
> :colorscheme onedark

## Plugin Configuration

### Key bindings for this vimrc

|                   Action                    |  Command  |
| :-----------------------------------------: | :-------: |
|                 Write file                  |    ,w     |
|                 Edit vimrc                  |    ,ev    |
|                Source vimrc                 |    ,sv    |
|                 Close Split                 |    ,cw    |
|               Show directory                |    ,f     |
|             Move to right split             |    ,h     |
|             Move to left split              |    ,l     |
|             Move to upper split             |    ,k     |
|             Move to lower split             |    ,j     |
|             Create right split              |    ,sh    |
|              Create left split              |    ,sl    |
|             Create upper split              |    ,sk    |
|             Create lower split              |    ,sj    |
|        Increment vertical split size        |    ,>     |
|        Decrement vertical split size        |    ,<     |
|       Increment horizontal split size       |    ,K     |
|       Decrement horizontal split size       |    ,J     |
|        Swap current line with upper         |     K     |
|        Swap current line with lower         |     J     |
|            Toggle spell checking            |    ,ss    |
|            Choose spell language            |    ,sc    |
|           Paste from OS clipboard           |    ,p     |
|           Copy into OS clipboard            |    ,y     |
|           Run a terminal command            | ctr-space |
| Replace all ocurrances of word under cursor |    ,S     |
|      Paste yank buffer to vim command       |    ,r0    |
|    Paste yank buffer to terminal command    |    ,R0    |

### Other mappings

|              Action               | Command |
| :-------------------------------: | :-----: |
|         yank inside line          |   yil   |
|        select inside line         |   vil   |
|  yank line without new line char  |   yal   |
| select line without new line char |   val   |
|    Show/Hide highlight matches    |   F3    |
|         Toggle paste mode         |   F2    |

### Plugin Key Bindings

|                           Action                           |     Command     |
| :--------------------------------------------------------: | :-------------: |
|                        Comment line                        |    ,c<space>    |
|                       Open Terminal                        |    <space>t     |
|                    Change comment style                    |       ,ca       |
|                       Tagbar Toggle                        |       ,tt       |
|                 Delete surrounding quotes                  |       ds'       |
|                Delete surrounding html tag                 |       dst       |
|                    Surround word with '                    |      ysiw'      |
|            Surround visual selection in quotes             |   v<motion>S'   |
|                     Ctrlp fuzzy search                     |     ctrl+p      |
|               CtrlP Most recently used files               |       ,m        |
|            CtrlP on the current files directory            |    ,<space>     |
|              EasyMotion Jump to any word with              |       ,,w       |
|             Gundo Show/Hide undo tree (Gundo)              |       F5        |
|                       Sparkup expand                       |     ctrl+e      |
|       Sparkup jump to next edit point in insert mode       |     ctrl+n      |
|                  Ultisnip expand snippet                   |     ctrl+j      |
|              Ultisnip jump to next edit point              |     ctrl+b      |
|            Ultisnip jump to previous edit point            |     ctrl+z      |
|  EasyMotion jump to firt letter of any word after cursor   |       ,,w       |
|  EasyMotion jump to firt letter of any word before cursor  |       ,,b       |
|   EasyMotion jump to any letter of any word after cursor   | ,,f<someLetter> |
|            Unimpaired move left through buffers            |       [b        |
|           Unimpaired move right through buffers            |       ]b        |
|          Unimpaired swap lines (with line above)           |       [e        |
|          Unimpaired swap lines (with line below)           |       ]e        |
| Vim-Signature mark current line with next available marker |       m,        |
|           Vim-Signature navigate through markers           |  \]\` OR \[\`   |

### Context sensitive Key bindings

|    Context    |          Action          |                Command                |
| :-----------: | :----------------------: | :-----------------------------------: |
|  CtrlP open   |          ctrl-f          | Toggle files, most recently used, etc |
| NERDTree open |            t             |         opens file in new tab         |
|  CtrlP open   |     file in new tab      |                ctrl+t                 |
|  CtrlP open   |      file in vsplit      |                ctrl+v                 |
|  CtrlP open   | file in horizontal split |             ctrl+s ctrl+x             |
|  CtrlP open   |     move up and down     |             ctrl+k ctrl+j             |

### Native Vim key bindings

|           Action            |      Command      |
| :-------------------------: | :---------------: |
|       Autocompletion        |       ctr-n       |
|          Uppercase          |    gU[motion]     |
|   Jump between paragraphs   |        {}         |
|      Spell correction       |        z=         |
|       Close code fold       |        zc         |
|       Open code fold        |        zo         |
|    Open/close all folds     |      zR , zM      |
|    Open file in new tab     | :tabe <file_name> |
|      Jump to next tab       |        gt         |
|      Jump to prev tab       |        gT         |
| Repeat last f or t command  |         ;         |
|    Repeat last : command    |        @:         |
|       command history       |        q:         |
|    jump to previous file    |      Ctrl-^       |
|      Go to definition       |        gd         |
| Open file path under cursor |        gf         |

### Window Splits

Vim can do window splits to any order. So having key bindings to do this fase is very important.

> nmap <silent> <leader>sh :leftabove vnew<CR>

Leader is a custom defined key that is mapped to the ',' key so basically typing ,sh is the same as typing the :leafabove vnew command and hiting enter (CR) which creates a new vertical split to the left.

## Basic Settings

### Useful external commands and tools

Some of the features I've loved most learning Vim:

Executing external commands from withing Vim. This is done typing **:!**someProgram
this lets you compile programs easily, or do anything else. For example convert markdown to html with pandoc.

# Vim Learning progress/recap

Here I will write an overview of the features I've learned about in vim and recap on the most useful tips and tricks learned so far.

I will also cover some configurations of my simple vimrc although I am trying to have it as organized as possible. So it should be self documented.

# Installation

Do the following: 

1. Move to home directory 
> cd ~

2. initialize a git repository and point it to the remote repository 
git init && git remote add origin https://github.com/DanielCardonaRojas/dotfiles

3. Sync with master
> git pull origin master

4. Ignore other files and make adding files only available with the force flag
> echo "\*" > .gitignore

5. Now to add a file git add -f <fileName>

To fully use this vimrc we have to do the following: 

- Install Plug (a minimalistic vim plugin manager) running the shell command. paste the curl command from [here](https://github.com/junegunn/vim-plug)
- Install Mac terminal solarized profile, downloading the solazirized.zip from [here](http://ethanschoonover.com/solarized). There should be a osx-terminal.app-colors-solarized folder. Import this to osx terminal profiles.
- Install powerline fonts by downloading zip from [here](https://github.com/powerline/fonts) and running ./install.sh on inside the downloaded folder containing the fonts.
- Check to have at least an old version of ctags 

After this has been done then typing: :PlugInstall

## Plugins
Plugins used in this vimrc are: 

- Ultisnips: Lets you create snippets for different file formats.
Look at the repository [here] (https://github.com/SirVer/ultisnips)

- Solarized theme: Seems to be one of the most popular themes.

- [Airline](https://github.com/vim-airline/vim-airline): Gives a nice look to the status bar in vim. Its a replacement of an
older plugin called Powerline, take a look at the repository [here] (https://github.com/vim-airline/vim-airline)

- [Emmet](http://mattn.github.io/emmet-vim/): To do HTML templating very fast.

- [NerdTree](https://github.com/scrooloose/nerdtree): Power Vim with directory navigation.

- Hoogle: Lets you use the Hoogle search engine to lookup Haskell functions and types.

- Fugitive: Lets you call git commands, from within vim. 

- TagBar/ctags: *ctags* indexes files to extract locations of functions, class variable definitions. Tagbar lets you navigate through these breakpoints.

- [Ctrlp](https://kien.github.io/ctrlp.vim/): Is a fuzzy file finder, lets you quickly search for files open them in split windows,tabs etc.

- [Vim-surround](https://github.com/tpope/vim-surround): Is a plugin for ease of wrapping words in parentheses, brackets, quotes.
## Plugin Configuration

### Key bindings for this vimrc
| Action | Command|
|:------:|:------:|
|Write file | ,w |
|Edit vimrc | ,ev |
|Close Split | ,cw |
|Show directory | ,f|
|Move to right split | ,h|
|Move to left split | ,l|
|Move to upper split | ,k|
|Move to lower split | ,j|
|Create right split | ,sh|
|Create left split | ,sl|
|Create upper split | ,sk|
|Create lower split | ,sj|
|Increment vertical split size | ,> |
|Decrement vertical split size | ,< |
|Increment horizontal split size | ,K |
|Decrement horizontal split size | ,J |
|Toggle spell checking | ,ss|
|Choose spell language | ,sc|
|Paste from OS clipboard |,p|
|Copy into OS clipboard |,y|
|Run a terminal command  | ctr-space |

### Other mappings

| Action | Command|
|:------:|:------:|
| new tab | tn |
| move to next tab | tl |
| move to prev tab | th |

### Plugin Key Bindings
| Action | Command|
|:------:|:------:|
|Comment line | ,cc|
|Toggle TagBar| ,tt |
|Replace all ocurrances of word under cursor | ,S |
|Ctrlp fuzzy search | ctrl+p |
|Surround word with ' | ysiw' |
|Delete surrounding quotes | ds' |
|Delete surrounding html tag | dst |
|Most recently used files CtrlP | ,m |

### Native Vim key bindings

| Action | Command|
|:------:|:------:|
|Autocompletion | ctr-n |
|Uppercase | gU[motion] |
|Jump between paragraphs | {} |
|Spell correction | z= |
|Close code fold | zc |
|Open code fold | zo |
|Open file in new tab | :tabe <file_name> |
|Jump to next tab | gt |
|Jump to prev tab | gT |

### Context sensitive Key bindings
| Context | Action | Command|
|:------:|:------:|:------:|
| CtrlP open | ctrl-f | Toggle files, most recently used, etc |
|NERDTree open | t | opens file in new tab
| CtrlP open | file in new tab | ctrl+t |
| CtrlP open | file in vsplit | ctrl+v |
| CtrlP open | file in horizontal split | ctrl+s |

### Window Splits
Vim can do window splits to any order. So having key bindings to do this fase is very important.

> nmap <silent> <leader>sh :leftabove  vnew<CR>

Leader is a custom defined key that is mapped to the ',' key so basically typing ,sh is the same as typing the :leafabove vnew command and hiting enter (CR) which creates a new vertical split to the left.

## Basic Settings

### Useful external commands and tools

Some of the features I've loved most learning Vim:

Executing external commands from withing Vim. This is done typing **:!**someProgram
this lets you compile programs easily, or do anything else. For example convert markdown to html with pandoc.

**Pandoc Integration**

To create html from markdown run :PandocMD html, the first argument to :PandocMD is the value for the -t flag witch you would 
normally pass to the command line program. This is just so different type of documents can be rendered.

To create revealjs deck of slides

1. Download revealjs and put in the same directory where the markdown file is.
2. Maybe the downloaded revealjs folder comes with a version number.
Remove so its named reveal.js only.
3. Run this command from terminal in the corresponding directory: 
```$
pandoc -s -S -t revealjs -o test.html revealjsPandoc.md -V theme=blood
```

Theme can be chosen from one of [revealjs themes](). I liked these themes:

- solarized
- blood
- moon
- beige

To create html from markdown

```
pandoc input.md -s -o output.html
```

# Other settings

To install Vim 7.4 update xcode command line tools. Then run `brew install vim`

# TMUX 
If working with tmux its important to make these changes, for key bindings to work.
[link](http://superuser.com/questions/660013/resizing-pane-is-not-working-for-tmux-on-mac)

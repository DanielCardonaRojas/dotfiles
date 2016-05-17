# Vim Learning progress/recap

Here I will write an overview of the features I've learned about in vim and recap on the most useful tips and tricks learned so far.

I will also cover some configurations of my simple vimrc although I am trying to have it as organized as possible. So it should be self documented.

# Installation

To fully use this vimrc we have to do the following: 

- Install Plug (a minimalistic vim plugin manager) running the shell command.
- Install Mac terminal solarized [profile][solarizedTerminal].
- Install Pandoc to do markdown conversions.

After this has been done then typing: :PlugInstall



## Plugins
Plugins used in this vimrc are: 

- Ultisnips: Lets you create snippets for different file formats.
Look at the repository [here] (https://github.com/SirVer/ultisnips)

- Solarized theme: Seems to be one of the most popular themes.

- Airline: Gives a nice look to the status bar in vim. Its a replacement of an
older plugin called Powerline, take a look at the repository [here] (https://github.com/vim-airline/vim-airline)

- Emmet: To do HTML templating very fast.

- NerdTree: Power Vim with directory navigation.

- Hoogle: Lets you use the Hoogle search engine to lookup Haskell functions and types.

- Fugitive: Lets you call git commands, from within vim. 

## Key bindings 
### Window Splits
Vim can do window splits to any order. So having key bindings to do this fase is very important.

> nmap <silent> <leader>sh :leftabove  vnew<CR>

Leader is a custom defined key that is mapped to the ',' key so basically typing ,sh is the same as typing the :leafabove vnew command and hiting enter (CR) which creates a new vertical split to the left.

## Basic Settings

### Vim useful commands

Some of the features I've loved most learning Vim:

Executing external commands from withing Vim. This is done typing **:!**someProgram
this lets you compile programs easily, or do anything else. For example convert markdown to html with pandoc.

**Pandoc Integration**

To create html from markdown run 

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

# Other settings

To install Vim 7.4 update xcode command line tools. Then run `brew install vim`

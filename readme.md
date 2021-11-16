# Dotfiles

This setup consists of

- Alacritty
- Tmux
- NeoVim
- Oh-my-zsh

## Kmonad setup



- Give input monitoring permission to kmonad

```
sudo cp ~/.config/com.decaroj.startup.plist /Library/LaunchAgents/
sudo chown root:wheel /Library/LaunchAgents/com.decaroj.startup.plist
sudo launchctl load /Library/LaunchDaemons/com.decaroj.startup.plist
```

> Check if running: `sudo launchctl list | grep kmonad`


## Installation

Most binaries are installed with [nix package manager](https://nixos.org/download.html) through [home-manager](https://github.com/nix-community/home-manager)

```shell
# Install nix package manager
sudo curl -L https://nixos.org/nix/install | sh

# Install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

```

Install FiraCode Nerd Font from [here](https://www.nerdfonts.com/font-downloads)

```shell
git clone --bare https://github.com/DanielCardonaRojas/dotfiles $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
```

Install yabai and skhd services:

```shell
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd

# start yabai
brew services start yabai
brew services start skhd
```

skhd will try to use hyper key for most operations
this is enabled by installing karabiner elements.


Automated install (WIP):

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/DanielCardonaRojas/dotfiles/master/dotFilesConfig.sh)"
```


# Dotfiles management

config is a git alias used to work with these dotfiles [reference](https://www.atlassian.com/git/tutorials/dotfiles)

```shell
config add -f <filename>
```

### TMUX Keybindings and Commands

List all sessions

```shell
tmux ls
```

Start a new session with a name

```shell
tmux new -s myname
```

Attach to an existing session

```shell
tmux a -t myname
```

Kill a session

```shell
tmux kill-session -t myname
```

Prefix = Ctrl + b

|          Action          |     Command     |
| :----------------------: | :-------------: |
|   Tmux resurrect save    | prefix + Ctrl-s |
|  Tmux resurrect restore  | prefix + Ctrl-r |
| Tmux tpm install plugins |   prefix + I    |
|    Tmux source config    |   prefix + r    |

**Sessions**

- d detach from session

**Windows**

- c create window
- w list windows
- n next window
- p previous window
- f find window
- , name window
- & kill window
- ] paste
- N move window/tab to the right
- P move window/tab to the left
- q kill current window

**Panes**

- % vertical split
- " horizontal split
- x kill pane

**Moving between splits**

- h move to left pane
- l move to right pane
- k move to top pane
- j move to bottom pane

- J move horizontal split line down
- K move horizontal split line up
- H move vertical split line left
- L move vertical split line right

## Extras

**zsh plugins**

```
git clone https://github.com/jeffreytse/zsh-vi-mode \
  $HOME/.oh-my-zsh/custom/plugins/zsh-vi-mode
```

# Resources

- [Tmux thoughtbot course](https://thoughtbot.com/upcase/tmux)
- [Vim pretty docs](https://vim.help/)
- [Waylon Walker tmux videos](https://www.youtube.com/c/WaylonWalker/videos)

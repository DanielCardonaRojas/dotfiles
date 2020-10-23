# Dotfiles

This setup consists of 

- Alacritty
- Tmux
- NeoVim
- Oh-my-zsh

## Setup

Do the following: 

1. Move to home directory 

```shell
cd ~
```

2. initialize a git repository and point it to the remote repository 

```shell
git init && git remote add origin https://github.com/DanielCardonaRojas/dotfiles
```

3. Sync with master

```shell
git pull origin master
```


# Notes

To add other files to the repository:
```shell
git add -f <fileName>
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

| Action | Command|
|:------:|:------:|
| Tmux resurrect save | prefix + Ctrl-s |
| Tmux resurrect restore | prefix + Ctrl-r |
| Tmux tpm install plugins | prefix + I |
| Tmux source config | prefix + r |

**Sessions** 

- d detach from session

**Windows**

- c  create window
- w  list windows
- n  next window
- p  previous window
- f  find window
- ,  name window
- &  kill window
- ]  paste
- N move window/tab to the right
- P move window/tab to the left
- q kill current window

**Panes**

- %  vertical split
- "  horizontal split
- x  kill pane


**Moving between splits**

- h move to left pane
- l move to right pane
- k move to top pane
- j move to bottom pane

- J move horizontal split line down
- K move horizontal split line up
- H move vertical split line left
- L move vertical split line right


## Oh-my-zsh

Remove some git repo from prompt, this is useful since this repo is located at ~ , and makes a git master
show on any folder.

```shell
git config oh-my-zsh.hide-status 1
```

# TODO

- Fix: Add tmux mouse on depending on version
- Make copy and paste to systems clipboard work on other platforms besides mac
- Maybe add a installation script

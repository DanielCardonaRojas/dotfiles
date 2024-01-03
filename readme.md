# Dotfiles

Setup:

- Alacritty (or wezterm)
- Tmux
- neovim (0.6)
- Oh-my-zsh
- Starship prompt
- yabai (tiling manager for macOS)
- kmonad (wip keyboard remapping)


## Installation

```shell
git clone --bare git@github.com:DanielCardonaRojas/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config config --local remote.fetch "+refs/heads/*:refs/remotes/origin/*"
config for-each-ref --format='%(refname:short)' refs/heads | xargs -n1 -I{} git branch --set-upstream-to=origin/{} {}
config checkout
```

## Other installations steps

```
ln -s /Applications/Alacritty.app/Contents/MacOS/alacritty /usr/local/bin
```

## Install binaries

Most binaries are installed with [nix package manager](https://nixos.org/download.html) through [home-manager](https://github.com/nix-community/home-manager)

```shell
~/.config/scripts/install-home-manager.sh
```

Install VictorMono, FiraCode, and Caskaydia Cove, Nerd Fonts from [here](https://www.nerdfonts.com/font-downloads)

Install yabai :

```shell
brew install koekeishiya/formulae/yabai

# start yabai
brew services start yabai
```

skhd will try to use hyper key for most operations
this is enabled by installing karabiner elements.


Automated install (WIP):

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/DanielCardonaRojas/dotfiles/master/dotFilesConfig.sh)"
```
# Neovim configuration

Latest neovim release is used so install with homebrew if version not available as nix package.

**Language servers**

Documentation as to how to setup most Language servers is available  [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

Here are some of the ones used in this config: 

## Kmonad setup (Incomplete)


- Give input monitoring permission to kmonad

```
sudo cp ~/.config/com.decaroj.startup.plist /Library/LaunchAgents/
sudo chown root:wheel /Library/LaunchAgents/com.decaroj.startup.plist
sudo launchctl load /Library/LaunchDaemons/com.decaroj.startup.plist
```

> Check if running: `sudo launchctl list | grep kmonad`

Restart with

```
sudo launchctl stop local.kmonad # Will leave you with unresponsive keyboard (use keyboard preview)
sudo launchctl start local.kmonad
```



# Dotfiles management

config is a git alias used to work with these dotfiles [reference](https://www.atlassian.com/git/tutorials/dotfiles)

```shell
config add -f <filename>
```

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

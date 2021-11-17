{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "decaroj";
  home.homeDirectory = "/Users/decaroj";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";
  home.packages = [ 
    pkgs.ripgrep 
    pkgs.bat
    pkgs.jq
    pkgs.skim
    pkgs.delta
    pkgs.scrcpy
    pkgs.ffmpeg
    pkgs.fzf
    pkgs.stack
    pkgs.nodePackages.npm
    pkgs.procs
    pkgs.exa
    pkgs.cloc
    pkgs.neovim
    pkgs.nnn
  ];

  programs.tmux.enable = true;
}

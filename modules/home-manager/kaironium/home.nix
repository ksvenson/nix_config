{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./browser.nix
    ./ssh.nix
    ./comms.nix
    ./i3.nix
    ./kitty.nix
    ./neovim.nix
  ];

  home.username = "kaironium";
  home.homeDirectory = "/home/kaironium";

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";  # NEVER change this value.
}

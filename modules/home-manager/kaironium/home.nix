{ config, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./browser.nix
    ./ssh.nix
  ];

  home.username = "kaironium";
  home.homeDirectory = "/home/kaironium";

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";  # NEVER change this value.
}

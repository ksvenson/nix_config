{ config, pkgs, ... }: {
  home.username = "kaironium";
  home.homeDirectory = "/home/kaironium";

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";  # NEVER change this value.
}

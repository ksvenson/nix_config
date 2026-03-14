{ config, pkgs, user, ... }: {
  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";  # NEVER change this value.
}

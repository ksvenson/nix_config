{ config, pkgs, user, ... }: {
  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  home.packages = with pkgs; [
    psmisc
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";  # NEVER change this value.
}

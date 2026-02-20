{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    telegram-desktop
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elm (pkgs.lib.getName pkg) [
    "discord"
    "zoom-us"
  ];
}

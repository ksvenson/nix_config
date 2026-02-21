{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    telegram-desktop
    discord
    zoom-us
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "discord"
    "zoom"
  ];
}

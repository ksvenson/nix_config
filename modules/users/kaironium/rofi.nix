{ config, pkgs, ... }: {
  programs.rofi = {
    enable = true;
    font = "${config.theme.font.name} ${toString config.theme.font.size}";
  };
}

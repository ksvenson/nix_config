{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      target = "sway-session.target";
    };
    style = builtins.readFile ./style.css;
  };
}

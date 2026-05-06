{ config, ...}: {
  programs.waybar.settings = {
    mainBar = {
      layer = "top";
      position = "bottom";
      height = 30;
      modules-left = [
        "sway/workspaces"
      ];
      modules-center = [
        "sway/window"
      ];
      modules-right = [
        "network"
        "clock"
      ];
    };
  };
}

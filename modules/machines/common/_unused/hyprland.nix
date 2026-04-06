{ inputs, config, pkgs, ... }: {
  programs.hyprland = {
    enable = true;
    # hint electron apps to use wayland:
    # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}



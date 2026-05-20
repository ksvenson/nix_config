{ pkgs, config, ... }: {
  home.packages = with pkgs; [
    xwayland-satellite
  ];
}

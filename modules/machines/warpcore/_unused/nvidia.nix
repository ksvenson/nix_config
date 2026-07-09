# see https://discourse.nixos.org/t/monitor-mode-switching-at-log-in-out/77454/2
{ config, lib, pkgs, ... }: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
      "nvidia-kernel-modules"
    ];

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    open = false; # open drivers not available for GeForce 1080
  };
}

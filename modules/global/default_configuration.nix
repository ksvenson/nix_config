{ config, lib, pkgs, inputs, ... }: {
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.networkmanager.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "us";

    windowManager.i3.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git
    vim
    inputs.agenix.packages."${stdenv.hostPlatform.system}".default
  ];

  environment.variables = {
    EDITOR = "vim";
  };

  services.openssh.enable = true;
}



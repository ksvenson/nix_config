{ config, lib, pkgs, inputs, ... }: {
  networking.networkmanager.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  environment.variables = {
    EDITOR = "vim";
  };

  services.openssh.enable = true;
  programs.dconf.enable = true;  # needed to make `stylix` work
  programs.sway.enable = true;
  security.polkit.enable = true;  # needed for `sway`
}



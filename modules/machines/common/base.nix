{ config, lib, pkgs, inputs, ... }: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    git
    vim
    home-manager
  ];

  environment.variables = {
    EDITOR = "vim";
  };

  services.openssh.enable = true;
  security.polkit.enable = true;
  programs.dconf.enable = true;  # needed to make `stylix` work
}



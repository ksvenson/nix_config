{ config, lib, pkgs, inputs, ... }:

{
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

    # Keyboard layout
    xkb.layout = "us";

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
  };

  age.secrets = {
    root_user_passwd.file = ../secrets/root_user_passwd.age;
    kaironium_user_passwd.file = ../secrets/kaironium_user_passwd.age;
  };

  users.users.root = {
    hashedPasswordFile = config.age.secrets.root_user_passwd.path;
  };

  users.mutableUsers = false;
  
  users.users.kaironium = {
    isNormalUser = true;
    description = "kaironium";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user
    shell = pkgs.bash;
    home = "/home/kaironium";
    hashedPasswordFile = config.age.secrets.kaironium_user_passwd.path;
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



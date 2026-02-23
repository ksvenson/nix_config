{ config, lib, pkgs, ... }: {
  networking.hostName = "emperor";

  # Set your time zone.
  time.timeZone = "America/Chicago";

  system.stateVersion = "25.11"; # NEVER change this value, even when updating to new version of NixOS

}



{ config, machine, ... }: {
  networking.hostName = machine.hostName;

  time.timeZone = "America/Chicago";

  system.stateVersion = "26.05"; # NEVER change this value, even when updating nixos
}

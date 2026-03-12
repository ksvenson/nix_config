{ config, pkgs, inputs, ... }: {
  security.polkit.enable = true;  # enables all users to suspect, hibernate, shutdown, etc... without sudo

  # locks all users when sleeping
  systemd.services."lock-before-sleep" = {
    before = [ "sleep.target" ];
    wantedBy = [ "sleep.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/loginctl lock-sessions";
    };
  };
}


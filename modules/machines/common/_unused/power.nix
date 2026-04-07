# this config not needed when using sway
{ config, pkgs, inputs, ... }: {
  # lock all users before sleeping
  systemd.services."lock-before-sleep" = {
    before = [ "sleep.target" ];
    wantedBy = [ "sleep.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/loginctl lock-sessions";
    };
  };
}


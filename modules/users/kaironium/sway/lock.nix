{ config, pkgs, ... }: 
  let
    lockCmd = "${pkgs.swaylock}/bin/swaylock -f";
  in {
    programs.swaylock = {
      enable = true;
    };

    services.swayidle = {
      enable = true;
      events = {
        "before-sleep" = lockCmd; 
        "lock" = lockCmd;
      };
      timeouts = [
        { timeout = 600; command = lockCmd; }
      ];
    };
}

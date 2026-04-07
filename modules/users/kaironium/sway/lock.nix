{ config, pkgs, ... }: 
  let
    lockCmd = "${pkgs.swaylock}/bin/swaylock -f";
  in {
    programs.swaylock = {
      enable = true;
    };

    services.swayidle = {
      enable = true;
      events = [
        { event = "before-sleep"; command = lockCmd; }
        { event = "lock"; command = lockCmd; }
      ];
      timeouts = [
        { timeout = 600; command = lockCmd; }
      ];
    };
}

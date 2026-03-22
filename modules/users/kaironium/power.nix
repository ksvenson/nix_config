{ config, pkgs, ... }: {
  # Configure locking
  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock}/bin/i3lock -n -c 000000";
    inactiveInterval = 10;
    xss-lock.extraOptions = [ "--transfer-sleep-lock" ];
  };
}

{ pkgs, config, ... }: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        # turn the monitors off before locking so that the lock screen
        # doesn't flash when powering down. This is purely a cosmetic thing.
        before_sleep_cmd = "niri msg action power-off-monitors; noctalia-shell ipc call lockScreen lock";
        lock_cmd = "noctalia-shell ipc call lockScreen lock";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "noctalia-shell ipc call lockScreen lock";
        }
        {
          timeout = 600;
          on-timeout = "systemctl suspend-then-hibernate";
        }
      ];
    };
  };
}

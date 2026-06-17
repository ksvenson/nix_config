{ pkgs, config, ... }: {
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        # turn the monitors off before locking so that the lock screen
        # doesn't flash when powering down. This is purely a cosmetic thing.
        before_sleep_cmd = "niri msg action power-off-monitors; noctalia msg session lock";
        lock_cmd = "noctalia-shell ipc call lockScreen lock";
      };
    };
  };
}

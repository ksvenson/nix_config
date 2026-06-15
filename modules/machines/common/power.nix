{ config, ... }: {
  # Use acpid to handle lid closing. Sometimes when using logind,
  # `suspend-then-hibernate` doesn't fire if the lid is open-closed
  # in rapid succession.
  services.logind.settings.Login = {
    HandleLidSwitch = "ignore";
    HandlePowerKey = "suspend-then-hibernate";
    HandlePowerKeyLongPress = "poweroff";
  };

  systemd.sleep.settings.Sleep = {
    HibernateDelaySec = "30m";
  };

  services.acpid = {
    enable = true;
    handlers = {
      lid-close = {
        event = "button/lid.*close.*";
        action = "systemctl suspend-then-hibernate";
      };
    };
  };
}

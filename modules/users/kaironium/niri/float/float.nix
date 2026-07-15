{ config, pkgs, ... }: {
  # Niri's window rule to make a window float only fires once when the window is opened.
  # However, some windows, like firefox extensions, open with a genertic title that
  # can't be caught by a window rule. So that's why we have this huge work around. See
  # https://github.com/niri-wm/niri/discussions/1599 for details.
  systemd.user.services.niri-float = {
    Unit = {
      Description = "Float niri windows that set title/app-id late (e.g. Bitwarden)";
      PartOf = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
      Requisite = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.python3}/bin/python3 ${./float.py}";
      Restart = "on-failure";
      RestartSec = 2;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}

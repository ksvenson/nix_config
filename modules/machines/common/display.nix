{ config, ... }: {
  programs.sway.enable = true;
  security.polkit.enable = true;

  programs.uwsm = {
    waylandCompositors = {
      sway = {
        prettyName = "Sway";
        comment = "Sway compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/sway";
      };
    };
  };
}

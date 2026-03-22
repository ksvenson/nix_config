{ config, lib, pkgs, ... }: {
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {
        terminal = "kitty";
        fonts = {
          names = [ config.theme.font.name ];
          size = config.theme.font.size + 0.0;  # needs to be a float
        };
      };
    };
  };

  programs.i3status.enable = true;
}

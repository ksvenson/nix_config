{ config, lib, pkgs, ... }: {
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
  };

  programs.i3status = {
    enable = true;
  };
}

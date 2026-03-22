{ config, lib, pkgs, ... }: {
  xsession.windowManager.i3.config = {
    fonts = {
      names = [ config.theme.font.name ];
      size = config.theme.font.size + 0.0;
    };
  };
}

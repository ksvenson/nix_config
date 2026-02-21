{ config, pkgs, ... }: {
  xsession.windowManager.i3.config.keybindings = {
    "${modifier}+d" = "exec i3 i3-dmenu-desktop";
  };
}

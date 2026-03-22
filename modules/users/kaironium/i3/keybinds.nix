{ config, lib, pkgs, ... }:
  let
    mod = "Mod1";
    u = "k";
    d = "l";
    l = "j";
    r = "semicolon";
  in {
    xsession.windowManager.i3.config = {
      modifier = mod;

      terminal = "kitty";

      keybindings = lib.mkOptionDefault {
        "${mod}+Shift+p" = "exec rofi -show power-menu -modi 'power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu'";
        "${mod}+d" = "exec rofi -show drun";

        "${mod}+${u}" = "focus up";
        "${mod}+${d}" = "focus down";
        "${mod}+${l}" = "focus left";
        "${mod}+${r}" = "focus right";

        "${mod}+Shift+${u}" = "move up";
        "${mod}+Shift+${d}" = "move down";
        "${mod}+Shift+${l}" = "move left";
        "${mod}+Shift+${r}" = "move right";
      };

      modes.resize = {
        "${u}" = "resize grow height 10 px or 10 ppt";
        "${d}" = "resize shrink height 10 px or 10 ppt";
        "${l}" = "resize shrink width 10 px or 10 ppt";
        "${r}" = "resize grow width 10 px or 10 ppt";

        "Escape" = "mode default";
        "Return" = "mode default";
        "${mod}+r" = "mode default";
      };
    };
}

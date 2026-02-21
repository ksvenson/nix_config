{ config, lib, pkgs, ... }: {
  xsession = {
    enable = true;
      windowManager.i3 = {
      enable = true;
      config =
      let
        mod = "Mod1";
        u = "k";
        d = "l";
        l = "j";
        r = "semicolon";
      in {
        modifier = mod;
        keybindings = lib.mkOptionDefault {
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
    };
  };

  programs.i3status = {
    enable = true;
  };
}

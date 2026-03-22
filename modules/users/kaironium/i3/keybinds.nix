{ lib, config, pkgs, ... }:
  let
    mod = "Mod1";
    arrows = {
      "k" = "up";
      "l" = "down";
      "j" = "left";
      "semicolon" = "right";
    };
  in {
    xsession.windowManager.i3.config = {
      modifier = mod;

      terminal = "kitty";

      keybindings = lib.mkOptionDefault {
        "${mod}+Shift+p" = "exec rofi -show power-menu -modi 'power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu'";
        "${mod}+d" = "exec rofi -show drun";

        "${mod}+a" = "focus parent";
        "${mod}+z" = "focus child";
      }
      \\
      (lib.mapAttrs' (key: dir: lib.nameValuePair ("${mod}+${key}") ("focus ${dir}")) arrows)
      \\
      (lib.mapAttrs' (dir: key: lib.nameValuePair ("${mod}+Shift+${key}") ("move ${dir}")) arrows)
      \\
      (lib.mapAttrs' (num: label: lib.nameValuePair ("${mod}+${num}") ("workspace ${label}")) config.i3.workspaces)
      \\
      (lib.mapAttrs' (num: label: lib.nameValuePair ("${mod}+Shift+${num}") ("move container to workspace ${label}")) config.i3.workspaces);

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

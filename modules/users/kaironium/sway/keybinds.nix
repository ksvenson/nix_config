{ lib, config, pkgs, ... }:
  let
    mod = "Mod4";
    arrows = {
      "up" = "k";
      "down" = "j";
      "left" = "h";
      "right" = "l";
    };
  in {
    wayland.windowManager.sway.config = {
      modifier = mod;

      keybindings = lib.mkOptionDefault (
      (lib.mapAttrs' (dir: key: lib.nameValuePair ("${mod}+${key}") ("focus ${dir}")) arrows)
      //
      (lib.mapAttrs' (dir: key: lib.nameValuePair ("${mod}+Shift+${key}") ("move ${dir}")) arrows)
      //
      (lib.mapAttrs' (_: ws: lib.nameValuePair ("${mod}+${ws.num}") ("workspace number ${ws.num}")) config.workspaces)
      //
      (lib.mapAttrs' (_: ws: lib.nameValuePair ("${mod}+Shift+${ws.num}") ("move container to workspace number ${ws.num}; workspace number ${ws.num}")) config.workspaces)
      //
      {
        "${mod}+Shift+p" = "exec rofi -show power-menu -modi 'power-menu:${pkgs.rofi-power-menu}/bin/rofi-power-menu'";
        "${mod}+d" = "exec rofi -show drun";

        "${mod}+a" = "focus parent";
        "${mod}+z" = "focus child";
      }
      );

      modes.resize = {
        "${arrows.up}" = "resize grow height 10 px or 10 ppt";
        "${arrows.down}" = "resize shrink height 10 px or 10 ppt";
        "${arrows.left}" = "resize shrink width 10 px or 10 ppt";
        "${arrows.right}" = "resize grow width 10 px or 10 ppt";

        "Escape" = "mode default";
        "Return" = "mode default";
        "${mod}+r" = "mode default";
      };
    };
}

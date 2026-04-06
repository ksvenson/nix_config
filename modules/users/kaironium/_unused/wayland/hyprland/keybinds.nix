{ lib, config, ... }:
  let
    inherit (lib) mapAttrsToList;

    mod = "ALT";
    arrows = {
      "u" = "k";
      "d" = "j";
      "l" = "h";
      "r" = "l";
    };
    terminal = "kitty";
  in {
    wayland.windowManager.hyprland.settings = {
      "$mod" = mod;

      "$terminal" = terminal;

      bind =    (mapAttrsToList (dir: key: "$mod, ${key}, movefocus, ${dir}") arrows)
             ++ (mapAttrsToList (dir: key: "$mod SHIFT, ${key}, movewindow, ${dir}") arrows)
             ++ (mapAttrsToList (_: ws: "$mod, ${ws.num}, workspace, ${ws.label}") config.workspaces)
             ++ (mapAttrsToList (_: ws: "$mod SHIFT, ${ws.num}, movetoworkspace, ${ws.label}") config.workspaces)
             ++ [
               "$mod, Return, exec, $terminal"
               "$mod SHIFT, Q, killactive,"
             ]
             ;
    };
}

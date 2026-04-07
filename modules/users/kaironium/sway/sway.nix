{ config, lib, pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;  # recommended by the nixos wiki to fix common issue with GTK 3 apps
    config = {
      terminal = "kitty";

      startup = [
        {
          command = "swaymsg workspace '${config.workspaces.ws1.label}'";
          always = false;
        }
      ];

      bars = [];

      focus.newWindow = "focus";

      window.commands = [
        # {
        #   command = "border normal 2";
        #   criteria.class = ".*";
        # }
      ]
      ++ (lib.flatten (
      lib.mapAttrsToList (_: ws:
        builtins.map (assignment: {
          command = "focus";
          criteria = assignment;
        }) ws.assigns
      ) config.workspaces ));

      workspaceAutoBackAndForth = true;
      assigns = (lib.mapAttrs' (_: ws: lib.nameValuePair (ws.label) (ws.assigns)) config.workspaces);
    };
  };
}

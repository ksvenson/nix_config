{ config, lib, pkgs, ... }: {
  wayland.windowManager.sway = {
    enable = true;

    # wrapperFeatures.gtk = true;  # recommended by the nixos wiki to fix common issue with GTK 3 apps

    extraOptions = [
      "--unsupported-gpu"  # since sway doesn't support unfree nvidia drivers
    ];

    config = {
      terminal = "kitty";

      startup = [
        {
          command = "swaymsg workspace number 1";
          always = false;
        }
        { command = "noctalia-shell"; }
      ];

      # output = {
      #   "DP-1" = {
      #     mode = "2560x1440@143.856Hz";
      #   };
      # };

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
      assigns = (lib.mapAttrs' (_: ws: lib.nameValuePair (ws.num) (ws.assigns)) config.workspaces);
    };
  };
}

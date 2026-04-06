{ config, lib, pkgs, ... }: {
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      config = {
        terminal = "kitty";

        # fonts = {
        #   names = [ config.theme.font.name ];
        #   size = config.theme.font.size + 0.0;  # needs to be a float
        # };
        
        startup = [
          {
            command = "i3-msg workspace '${config.workspaces.ws1.label}'";
            notification = false;
            always = false;
          }
        ];

        focus.newWindow = "focus";

        window.commands = [
          {
            command = "border normal 2";
            criteria.class = ".*";
          }
          {  # some quirk with Telegram makes it immune to `focus.newWindow = "focus";`, so we have to do it manually.
            command = "focus";
            criteria.class = "^Telegram";
          }
        ];

        workspaceAutoBackAndForth = true;
        assigns = (lib.mapAttrs' (_: ws: lib.nameValuePair (ws.label) (ws.assigns)) config.workspaces);
      };
    };
  };

  programs.i3status.enable = true;
}

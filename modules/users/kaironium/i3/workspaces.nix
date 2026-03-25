{ lib, config, ... }:
  let
    inherit (lib)
      mkOption
      types
      ;
  in {
  options.i3.workspaces = mkOption {
    type = types.attrsOf types.anything;
    default = {
      ws1 = {
        num = "1";
        label = "1: Terminals";
        assigns = [
          { class = "^kitty"; }
        ];
      };
      ws2 = {
        num = "2";
        label = "2: Browsers";
        assigns = [
          { class = "^firefox"; }
          { class = "^Naviagor"; }
        ];
      };
      ws3 = {
        num = "3";
        label = "3: Comms";
        assigns = [
          { class = "^Telegram"; }
          { class = "^discord"; }
          { class = "^whatsapp-electron"; }
        ];
      };
    };
  };

  config.xsession.windowManager.i3.config.assigns = (lib.mapAttrs' (_: ws: lib.nameValuePair (ws.label) (ws.assigns)) config.i3.workspaces);
}

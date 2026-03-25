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
      ws4 = { num = "4"; label = "4"; assigns = []; };
      ws5 = { num = "5"; label = "5"; assigns = []; };
      ws6 = { num = "6"; label = "6"; assigns = []; };
      ws7 = { num = "7"; label = "7"; assigns = []; };
      ws8 = { num = "8"; label = "8"; assigns = []; };
      ws9 = { num = "9"; label = "9"; assigns = []; };
      ws10 = { num = "10"; label = "10"; assigns = []; };
    };
  };

  config.xsession.windowManager.i3.config.assigns = (lib.mapAttrs' (_: ws: lib.nameValuePair (ws.label) (ws.assigns)) config.i3.workspaces);
}

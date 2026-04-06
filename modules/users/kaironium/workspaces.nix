{ lib, config, ... }:
  let
    inherit (lib)
      mkOption
      types
      ;
  in {
  options.workspaces = mkOption {
    default = {};
    type = types.submodule {
      options = (builtins.listToAttrs (builtins.genList (i: {
        name = "ws${toString (i+1)}";
        value = mkOption {
          default = {};
          type = types.submodule {
            options = {
              num = mkOption { type = types.str; default = toString (i+1); };
              label = mkOption {type = types.str; default = toString (i+1); };
              assigns = mkOption {type = types.listOf (types.attrsOf types.str); default = [ ]; };
            };
          };
        };
      }) 9 ));
    };
  };

  config.workspaces = {
    ws1 = {
      label = "1: Terminals";
      assigns = [
        { app_id = "(?i)^kitty"; }
      ];
    };
    ws2 = {
      label = "2: Browsers";
      assigns = [
        { app_id = "(?i)^firefox"; }
      ];
    };
    ws3 = {
      label = "3: Comms";
      assigns = [
        { app_id = "(?i)telegram"; }
        { class = "(?i)^discord"; }
        { app_id = "(?i)^whatsapp-electron"; }
      ];
    };
  };
}
